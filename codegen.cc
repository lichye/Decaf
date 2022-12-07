/* File: codegen.cc
 * ----------------
 * Implementation for the CodeGenerator class. The methods don't do anything
 * too fancy, mostly just create objects of the various Tac instruction
 * classes and append them to the list.
 */

#include "codegen.h"
#include <string.h>
#include "tac.h"
#include "errors.h"
#include "mips.h"
#include "debug.h"
#include <stack>
using namespace std;


int findIndex(List<Location*>*graphKey,Location*key){
  for(int i=0;i<graphKey->NumElements();i++){
    if(Location::LocationsAreSame(graphKey->Nth(i),key))
      return i;
  }
  return -1;
}

CodeGenerator::CodeGenerator()
{
  code = new List<Instruction*>();
  // def 0 is fp, -4 is ra, first local is -8
  offset = OffsetToFirstLocal;
  isMainDefined = false;
}

char *CodeGenerator::NewLabel()
{
  static int nextLabelNum = 0;
  char temp[10];
  sprintf(temp, "_L%d", nextLabelNum++);
  return strdup(temp); // used to duplicate a string, return a pointer
}

Location *CodeGenerator::GenTempVar()
{
  static int nextTempNum;
  // def the temp variable name is defined here
  char temp[10];
  Location *result = NULL;
  sprintf(temp, "_tmp%d", nextTempNum++);
  // * We will only create temp variables inside functions
  result = new Location(fpRelative, offset, temp);
  offset -= VarSize; // VarSize is 4
  //Assert(result==NULL);
  return result;
}

 
Location *CodeGenerator::GenLoadConstant(int value)
{
  Location *result = GenTempVar();
  code->Append(new LoadConstant(result, value));
//  Assert(result==NULL);
  return result;
}

Location *CodeGenerator::GenLoadConstant(const char *s)
{
  Location *result = GenTempVar();
  code->Append(new LoadStringConstant(result, s));
  return result;
} 

Location *CodeGenerator::GenLoadLabel(const char *label)
{
  Location *result = GenTempVar();
  code->Append(new LoadLabel(result, label));
  return result;
} 


void CodeGenerator::GenAssign(Location *dst, Location *src)
{
  code->Append(new Assign(dst, src));
}


Location *CodeGenerator::GenLoad(Location *ref, int offset)
{
  Location *result = GenTempVar();
  code->Append(new Load(result, ref, offset));
//  Assert(result==NULL);
  return result;
}

void CodeGenerator::GenStore(Location *dst,Location *src, int offset)
{
  code->Append(new Store(dst, src, offset));
}


Location *CodeGenerator::GenBinaryOp(const char *opName, Location *op1,
						     Location *op2)
{
  Location *result = GenTempVar();
  code->Append(new BinaryOp(BinaryOp::OpCodeForName(opName), result, op1, op2));
  return result;
}


void CodeGenerator::GenLabel(const char *label)
{
  code->Append(new Label(label));
}

void CodeGenerator::GenIfZ(Location *test, const char *label)
{
  code->Append(new IfZ(test, label));
}

void CodeGenerator::GenGoto(const char *label)
{
  code->Append(new Goto(label));
}

void CodeGenerator::GenReturn(Location *val)
{
  code->Append(new Return(val));
}


BeginFunc *CodeGenerator::GenBeginFunc()
{
  BeginFunc *result = new BeginFunc;
  code->Append(result);
  return result;
}

void CodeGenerator::GenEndFunc()
{
  code->Append(new EndFunc());
}

void CodeGenerator::GenPushParam(Location *param)
{
  code->Append(new PushParam(param));
}

void CodeGenerator::GenPopParams(int numBytesOfParams)
{
  Assert(numBytesOfParams >= 0 && numBytesOfParams % VarSize == 0); // sanity check
  if (numBytesOfParams > 0)
    code->Append(new PopParams(numBytesOfParams));
}

Location *CodeGenerator::GenLCall(const char *label, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new LCall(label, result));
  return result;
}

Location *CodeGenerator::GenACall(Location *fnAddr, bool fnHasReturnValue)
{
  Location *result = fnHasReturnValue ? GenTempVar() : NULL;
  code->Append(new ACall(fnAddr, result));
  return result;
}
 
 
static struct _builtin {
  const char *label;
  int numArgs;
  bool hasReturn;
} builtins[] =
 {{"_Alloc", 1, true},
  {"_ReadLine", 0, true},
  {"_ReadInteger", 0, true},
  {"_StringEqual", 2, true},
  {"_PrintInt", 1, false},
  {"_PrintString", 1, false},
  {"_PrintBool", 1, false},
  {"_Halt", 0, false}};

Location *CodeGenerator::GenBuiltInCall(BuiltIn bn,Location *arg1, Location *arg2)
{
  Assert(bn >= 0 && bn < NumBuiltIns);
  struct _builtin *b = &builtins[bn];
  Location *result = NULL;

  if (b->hasReturn) result = GenTempVar();
  // verify appropriate number of non-NULL arguments given
  Assert((b->numArgs == 0 && !arg1 && !arg2)
	|| (b->numArgs == 1 && arg1 && !arg2)
	|| (b->numArgs == 2 && arg1 && arg2));
  if (arg2) code->Append(new PushParam(arg2));
  if (arg1) code->Append(new PushParam(arg1));
  code->Append(new LCall(b->label, result));
  GenPopParams(VarSize*b->numArgs);
  return result;
}

void CodeGenerator::GenVTable(const char *className, List<const char *> *methodLabels)
{
  VTable* vt = new VTable(className, methodLabels);
  if(DEBUG_EMIT) printf("Try to append GenVaTable\n");
  code->Append(vt);
  if(DEBUG_EMIT) printf("Finish GenVaTable\n");
}

// helper function for GenNewArray() and GenSubscript()
void CodeGenerator::GenHaltWithMessage(const char *message)
{
    // e.g.
    //	_tmp3 = "Decaf runtime error: Array size is <= 0\n" ;
    //	PushParam _tmp3 ;
    //	LCall _PrintString ;
    //	PopParams 4 ;
    //	LCall _Halt ;
    Location *msg = GenLoadConstant(message);
    GenBuiltInCall(PrintString, msg);
    GenBuiltInCall(Halt, NULL);
}

Location *CodeGenerator::GenNewArray(Location *numElems)
{
    Location *one = GenLoadConstant(1);
    Location *isNonpositive = GenBinaryOp("<", numElems, one);
    const char *pastError = NewLabel();
    GenIfZ(isNonpositive, pastError);
    GenHaltWithMessage(err_arr_bad_size); // Decaf runtime error: Array size is <= 0\n
    GenLabel(pastError);

    Location *arraySize = GenLoadConstant(1);
    Location *num = GenBinaryOp("+", arraySize, numElems);
    Location *four = GenLoadConstant(VarSize);
    Location *bytes = GenBinaryOp("*", num, four);
    Location *result = GenBuiltInCall(Alloc, bytes);
    GenStore(result, numElems);
    return GenBinaryOp("+", result, four);
}

Location *CodeGenerator::GenSubscript(Location *array, Location *index)
{
    // 	_tmp1 = 0 ;
    //	_tmp2 = _tmp0 < _tmp1 ;
    //	_tmp3 = *(arr + -4) ;
    //	_tmp4 = _tmp0 < _tmp3 ;
    //	_tmp5 = _tmp4 == _tmp1 ;
    //	_tmp6 = _tmp2 || _tmp5 ;
    //	IfZ _tmp6 Goto _L0 ;
    //	_tmp7 = "Decaf runtime error: Array subscript out of bound..." ;
    //	PushParam _tmp7 ;
    //	LCall _PrintString ;
    //	PopParams 4 ;
    //	LCall _Halt ;
    //_L0:
    // _tmp8 = 4 ;
    // _tmp9 = _tmp8 * _tmp0 ;
    // _tmp10 = arr + _tmp9 ;
    // _tmp11 = *(_tmp10) ;
    Location *zero = GenLoadConstant(0);
    Location *isNegative = GenBinaryOp("<", index, zero);
    Location *count = GenLoad(array, -4);
    Location *isWithinRange = GenBinaryOp("<", index, count);
    Location *pastEnd = GenBinaryOp("==", isWithinRange, zero);
    Location *outOfRange = GenBinaryOp("||", isNegative, pastEnd);
    const char *pastError = NewLabel();
    GenIfZ(outOfRange, pastError);
    GenHaltWithMessage(err_arr_out_of_bounds);
    GenLabel(pastError);
    Location *four = GenLoadConstant(VarSize);
    Location *offset = GenBinaryOp("*", four, index);
    Location *elem = GenBinaryOp("+", array, offset);
    return elem;
}

//todo: index should be based on the main
void CodeGenerator::DoFinalCodeGen()
{
  if (IsDebugOn("tac")) { // if debug don't translate to mips, just print Tac
    for (int i = 0; i < code->NumElements(); i++)
	    code->Nth(i)->Print();
  }  
  else {
     Mips mips;
     mips.EmitPreamble();
     for (int i = 0; i < code->NumElements(); i++)
         // * for project 5
         if (dynamic_cast<Label*>(code->Nth(i))) {
            if(DEBUG_P5) printf("we start to Optimize %s\n",dynamic_cast<Label*>(code->Nth(i))->GetLabel());
            if(DEBUG_MIPS) printf("\t# we are going to Generate another function\n");
            CFG* cfg = new CFG();
            while (!dynamic_cast<EndFunc*>(code->Nth(i)) || !cfg->AllLabels()) {
              if(DEBUG_P5) printf("we check %d code: %s\n",i,code->Nth(i)->GetPrinted());
                Label *labelInstruction = dynamic_cast<Label*>(code->Nth(i));
                if (labelInstruction) {
                    cfg->AppendLabel(strdup(labelInstruction->GetLabel()), cfg->GetCurrentIndex());
                }
                cfg->AppendInstruction(code->Nth(i));
                // Goto *gotoInstruction = dynamic_cast<Goto*>(code->Nth(i));
                // IfZ *ifZInstruction = dynamic_cast<IfZ*>(code->Nth(i));
                // if (gotoInstruction) {
                //     cfg->AppendLabel(strdup(gotoInstruction->GetLabel()));
                // }
                // else if (ifZInstruction) {
                //     cfg->AppendLabel(strdup(ifZInstruction->GetLabel()));
                // }
                i++;
              if(dynamic_cast<EndFunc*>(code->Nth(i))) break;
            }
            if(DEBUG_P5) 
              printf("#we get out of the loop\n");
            cfg->AppendInstruction(code->Nth(i)); // tail case for EndFunc
            if(DEBUG_P5) 
              printf("#we are going to do LiveAnalysis in CFG\n");
            cfg->LiveAnalysis();
            if(DEBUG_P5) 
              printf("#we are going to do InterfereGraph in CFG\n");
            cfg->InterfereGraph();
            if(DEBUG_P5) 
              printf("#we are going to do Chaitin in CFG\n");
            cfg->Chaitin();
            if(DEBUG_P5) 
              printf("#we are going to do Emit in CFG\n");
            cfg->Emit(&mips);
            if(DEBUG_P5) printf("#we finish a function\n");
         }
         else {
             code->Nth(i)->Emit(&mips);
         }
  }
}

CFG::CFG() {
    code = new List<Instruction*>();
    successors = new Hashtable<List<Instruction*>*>();
    labels = new Hashtable<int*>();
    gen = new Hashtable<List<Location*>*>();
    kill = new Hashtable<List<Location*>*>();
    in = new Hashtable<List<Location*>*>();
    out = new Hashtable<List<Location*>*>();
    graphKey = new List<Location*>();
    graphMap = new List<List<Location*>*>();
    variables = new List<Location*>();
    chaitinVariables = new List<Location*>();
}



bool CFG::IsIn(List<Location *> *list,Location *loc) {
    for (int i = 0; i < list->NumElements(); i++) {
        if (Location::LocationsAreSame(list->Nth(i), loc)) return true;
    }
    return false;
}

bool CFG::IsIn(List<Register> *list,Register reg) {
    for (int i = 0; i < list->NumElements(); i++) {
        if (list->Nth(i) == reg) return true;
    }
    return false;
}

bool CFG::IsSame(List<Location *> *a,List<Location *> *b) {
    if (a->NumElements() != b->NumElements()) return false;
    for (int i = 0; i < a->NumElements(); i++) {
        bool match = false;
        for (int j = 0; j < a->NumElements(); j++) {
           if (Location::LocationsAreSame(a->Nth(i), b->Nth(j))) {
               match = true;
               break;
           }
        }
        if (!match) return false;
    }
    return true;
}

void CFG::AppendLabel(const char *label, int index) {
    int *p = new int;
    *p = index;
    labels->Enter(label, p, true);
}

bool CFG::AllLabels() const  {
    Iterator<int*> iter = labels->GetIterator();
    int* index;
    while ((index=iter.GetNextValue())!=NULL) {
       if (*index == -1) return false;
    }
    return true;
}

void CFG::AppendInstruction(Instruction *instruction) {
    code->Append(instruction);
}

void CFG::GetSets() {
    for (int i = 0; i < code->NumElements(); i++) {
      const char *key = strdup(code->Nth(i)->GetPrinted());
      List<Location*> *genVariables = code->Nth(i)->GetGen();
      List<Location*> *killVariables = code->Nth(i)->GetKill();
      gen->Enter(key, genVariables);
      kill->Enter(key, killVariables);
      in->Enter(key, new List<Location*>());
      out->Enter(key, new List<Location*>());
    }
}

void CFG::GetSuccessors() {
  //Next instruction is the successor
  if(DEBUG_P5) printf("we are going to check the Sucocssor of %d\n",code->NumElements());
  for (int i = 0; i < code->NumElements(); i++) {
    List<Instruction*> *instructions = new List<Instruction*>();
    if(i==code->NumElements()-1){
      successors->Enter(strdup(code->Nth(i)->GetPrinted()), instructions);
      return;
    }
    if (!dynamic_cast<Goto*>(code->Nth(i))) {
      instructions->Append(code->Nth(i+1));
      if (dynamic_cast<IfZ*>(code->Nth(i))) {
        IfZ *ifZInstruction = dynamic_cast<IfZ*>(code->Nth(i));
        int index = *labels->Lookup(strdup(ifZInstruction->GetLabel()));
        instructions->Append(code->Nth(index));
      }
    }//if goto, then successor is the place we goto
    else{
      Goto *gotoInstruction = dynamic_cast<Goto*>(code->Nth(i));
      int index = *labels->Lookup(strdup(gotoInstruction->GetLabel()));
      instructions->Append(code->Nth(index));
    }
    if(DEBUG_P5){
      printf("we are checking %d %s in GetSuccessor\n",i,code->Nth(i)->GetPrinted());
      printf("its successor is: ");
      for(int i=0; i<instructions->NumElements();i++){
        printf("%i: %s\t",i,instructions->Nth(i)->GetPrinted());
      }
      printf("\n\n");
    } 
    successors->Enter(strdup(code->Nth(i)->GetPrinted()), instructions);
  }
  
  return;
}

void CFG::LiveAnalysis() {
    if(DEBUG_P5) printf("we are going to make Sets\n");
    GetSets();
    if(DEBUG_P5) printf("we are going to caculate the successors\n");
    GetSuccessors();
    bool changed = true;
    int cnt =0;
    if(DEBUG_P5) printf("we are going to caculate the in and out\n");
    while (changed) {
      //if(cnt++>100&&DEBUG_P5) break;
      if(DEBUG_P5) printf("There is changed so we have to rebuild the in out map\n");
        changed = false;
        // for each tac in CFG
        for (int i = 0; i < code->NumElements(); i++) {
            Instruction *instruction = code->Nth(i);
            const char *key = strdup(instruction->GetPrinted());
            // out[TAC] = Union(In[Succ(tac)])
            List<Location*> *outVariables = new List<Location*>();
            List<Instruction*> *successorInstructions = successors->Lookup(key);
            for (int j = 0; j < successorInstructions->NumElements(); j++) {
                List<Location*> *inVariables = in->Lookup(strdup(successorInstructions->Nth(j)->GetPrinted()));
                for (int k = 0; k < inVariables->NumElements(); k++) {
                    outVariables->Append(inVariables->Nth(k));
                }
            }
            
            out->Enter(key,outVariables,true);
            // In'[tac] = out[tac] - kill(tac) + gen(tac)
            List<Location*> *oldInVariables = in->Lookup(key);
            List<Location*> *newInVariables = new List<Location*>();
            for (int j = 0; j < outVariables->NumElements(); j++) {
              Location* app = outVariables->Nth(j);
              int index = findIndex(newInVariables,app);
              if(index==-1) newInVariables->Append(app);
            }
            List<Location*> *genVariables = gen->Lookup(key);
            for (int j = 0; j < genVariables->NumElements(); j++) {
              Location* app = genVariables->Nth(j);
              int index = findIndex(newInVariables,app);
              if(index==-1) newInVariables->Append(app);
            }
            //there is delete on Kill
            List<Location*> *killVariables = kill->Lookup(key);
            for (int j = 0; j < killVariables->NumElements(); j++) {
              for(int i = 0; i<newInVariables->NumElements();i++){
                if(newInVariables->Nth(i)==killVariables->Nth(j)){
                  newInVariables->RemoveAt(i);
                  i--;
                  //if(DEBUG_P5) printf("We remove KillVaribale LiveAnalysis\n");
                }
              }
            }
            // if In'[tac] != In[tac]
            if (!IsSame(oldInVariables, newInVariables)) {
                in->Enter(key, newInVariables, true);
                changed = true;
            }
            if(DEBUG_P5&&!changed){
              printf("\n\nIn %d codes\n",i);
              printf("In(TAC) have size: %d\n",newInVariables->NumElements());
              for(int i=0;i<newInVariables->NumElements();i++){
                printf("%s\t",newInVariables->Nth(i)->GetName());
              }
              printf("\n");
              printf("Out(TAC) have size: %d\n",outVariables->NumElements());
              for(int i=0;i<outVariables->NumElements();i++){
                printf("%s\t",outVariables->Nth(i)->GetName());
              }
              printf("\n");
            }
        }
    }
    if(DEBUG_P5) printf("#We finish LiveAnalysis\n");
}


void CFG::InterfereGraph() {
    for (int i = 0; i < code->NumElements(); i++) {
        const char *key = strdup(code->Nth(i)->GetPrinted());
        List<Location*> *killVariables = kill->Lookup(key);
        List<Location*> *outVariables = out->Lookup(key);
        List<Location*> *inVaribales = in->Lookup(key);
        Assert(killVariables!=NULL);
        Assert(inVaribales!=NULL);
        Assert(outVariables!=NULL);
        if(DEBUG_P5){
          printf("\n\nwe are going to check %d code in InterfereGraph\n",i);
          printf("so, the killvariable's size is %d\n",killVariables->NumElements());
          for(int i=0;i<killVariables->NumElements();i++)
            printf("so, kill: %s\n",killVariables->Nth(i)->GetName());
          printf("so, the out varibale's size is %d\n",outVariables->NumElements());
          for(int i=0;i<outVariables->NumElements();i++)
            printf("so, Out: %s\n",outVariables->Nth(i)->GetName());
        }
        //add edge on the killlist
        for(int i=0;i<killVariables->NumElements();i++){
          for(int j=0;j<killVariables->NumElements();j++){
              Location* loc1 = killVariables->Nth(i);
              Location* loc2 = killVariables->Nth(j);
              int index1 = findIndex(graphKey,loc1);
              int index2 = findIndex(graphKey,loc2);
              if(index1!=-1){
                  int find = findIndex(graphMap->Nth(index1),loc2);
                  if(find==-1)
                    graphMap->Nth(index1)->Append(loc2);
                }else{
                  graphKey->Append(loc1);
                  index1 = findIndex(graphKey,loc1);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index1)->Append(loc2);
                }
                if(index2!=-1){
                  int find = findIndex(graphMap->Nth(index2),loc1);
                  if(find==-1)
                    graphMap->Nth(index2)->Append(loc1);
                }
                else{
                  graphKey->Append(loc2);
                  index2 = findIndex(graphKey,loc2);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index2)->Append(loc1);
                }
          }
        }
        //add edge on the outList
        for(int i=0;i<outVariables->NumElements();i++){
          for(int j=0;j<outVariables->NumElements();j++){
              Location* loc1 = outVariables->Nth(i);
              Location* loc2 = outVariables->Nth(j);
              int index1 = findIndex(graphKey,loc1);
              int index2 = findIndex(graphKey,loc2);
              if(index1!=-1){
                  //check loc2 is already in loc1
                  int find = findIndex(graphMap->Nth(index1),loc2);
                  if(find==-1)
                    graphMap->Nth(index1)->Append(loc2);
                }else{
                  graphKey->Append(loc1);
                  index1 = findIndex(graphKey,loc1);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index1)->Append(loc2);
                }

                if(index2!=-1){
                  int find = findIndex(graphMap->Nth(index2),loc1);
                  if(find==-1)
                    graphMap->Nth(index2)->Append(loc1);
                }
                else{
                  graphKey->Append(loc2);
                  index2 = findIndex(graphKey,loc2);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index2)->Append(loc1);
                }
            }
          }
        //add edge on the twoside
        for (int j = 0; j < killVariables->NumElements(); j++) {
            // todo: not sure whether name is sufficient
            Location *loc1 = killVariables->Nth(j);
            for (int k = 0; k < outVariables->NumElements(); k++) {
                Location *loc2 = outVariables->Nth(k);
                // initialize graph for each variable
                int index1 = findIndex(graphKey,loc1);
                int index2 = findIndex(graphKey,loc2);
                //we have loc1 as key already
                if(index1!=-1){
                  int find = findIndex(graphMap->Nth(index1),loc2);
                  if(find==-1)
                  graphMap->Nth(index1)->Append(loc2);
                }else{
                  graphKey->Append(loc1);
                  index1 = findIndex(graphKey,loc1);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index1)->Append(loc2);
                }

                if(index2!=-1){
                  int find = findIndex(graphMap->Nth(index2),loc1);
                  if(find==-1)
                    graphMap->Nth(index2)->Append(loc1);
                }
                else{
                  graphKey->Append(loc2);
                  index2 = findIndex(graphKey,loc2);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index2)->Append(loc1);
                }
            }
        }
        //add edge on the input and killist
        for(int i=0;i<killVariables->NumElements();i++){
          for(int j=0;j<inVaribales->NumElements();j++){
              Location* loc1 = killVariables->Nth(i);
              Location* loc2 = inVaribales->Nth(j);
              int index1 = findIndex(graphKey,loc1);
              int index2 = findIndex(graphKey,loc2);
              if(index1!=-1){
                  int find = findIndex(graphMap->Nth(index1),loc2);
                  if(find==-1)
                    graphMap->Nth(index1)->Append(loc2);
                }else{
                  graphKey->Append(loc1);
                  index1 = findIndex(graphKey,loc1);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index1)->Append(loc2);
                }
                if(index2!=-1){
                  int find = findIndex(graphMap->Nth(index2),loc1);
                  if(find==-1)
                    graphMap->Nth(index2)->Append(loc1);
                }
                else{
                  graphKey->Append(loc2);
                  index2 = findIndex(graphKey,loc2);
                  graphMap->Append(new List<Location*>());
                  graphMap->Nth(index2)->Append(loc1);
                }
          }
        }
    }
    if(DEBUG_P5) printf("#We finish InterfereGraph, size is %d\n",graphKey->NumElements());
    if(DEBUG_P5){
      for(int i=0;i<graphKey->NumElements();i++){
        printf("%s:",graphKey->Nth(i)->GetName());
        for(int j=0;j<graphMap->Nth(i)->NumElements();j++){
          printf("%s ",graphMap->Nth(i)->Nth(j)->GetName());
        }
        printf("\n");
      } 
    }
}

inline int GetDegree(List<Location*>* node){
  int cnt=0;
  for(int i=0;i<node->NumElements();i++)
    if(!node->Nth(i)->GetDeath())
      cnt++;
  return cnt;
}

void CFG::Chaitin() {
  // the final process is analysis the graph
  int k = s7-t0;
  stack<Location*> s;
  //graphKey
  //graphMap
  //printf("we gather graphKey %d",graphKey->NumElements());
  for(int i=0;i<graphKey->NumElements();i++){
    if(!graphKey->Nth(i)->GetDeath()){
      int degree = GetDegree(graphMap->Nth(i));
      if(degree<k){
        graphKey->Nth(i)->SetDeath();
        s.push(graphKey->Nth(i));
      }else{
        graphKey->Nth(i)->SetDeath();
        graphKey->Nth(i)->SetRegister(spill);
      }
    }
  }
  //then we set index to Location in s
  while(!s.empty()){
    Location* work = s.top();
    s.pop();
    //getover 
    int index = findIndex(graphKey,work);
    List<Location*>* list = graphMap->Nth(index);
    Register rs_try = t0;
    bool conflict = true;
    while(conflict){
      conflict = false;
      for(int i=0;i<list->NumElements();i++){
        if(list->Nth(i)->GetRegister()==rs_try){
          rs_try = Register(rs_try+1);
          conflict = true;
        }
      }
    }
    //then we find a posible rs_try
    work->SetRegister(rs_try);
  }
}

void CFG::Emit(Mips *mips) {
  for(int i=0;i<code->NumElements();i++){
    if(DEBUG_P5) printf("\n\n\n\t# we are going to Emit %d in CFG\n",i);
    code->Nth(i)->Emit(mips);
  }
}





