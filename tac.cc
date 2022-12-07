/* File: tac.cc
 * ------------
 * Implementation of Location class and Instruction class/subclasses.
 */
#include "debug.h"
#include "tac.h"
#include "mips.h"
#include <string.h>
#include <string>
using namespace std;
string printRegister(Register rs){
    string ret;
    switch(rs){
        case zero: ret="zero";
            break;
        case at: ret="at";
            break;
        case v0: ret="v0";
            break;
        case v1: ret="v1";
            break;
        case a0: ret="a0";
            break;
        case a1: ret="a1";
            break;
        case a2: ret="a2";
            break;
        case a3: ret="a3";
            break;
        case t0: ret="t0";
            break;
        case t1: ret="t1";
            break;
        case t2: ret="t2";
            break;
        case t3: ret="t3";
            break;
        case t4: ret="t4";
            break;
        case t5: ret="t5";
            break;
        case t6: ret="t6";
            break;
        case t7: ret="t7";
            break;
        case s0: ret="s0";
            break;
        case s1: ret="s1";
            break;
        case s2: ret="s2";
            break;
        case s3: ret="s3";
            break;
        case s4: ret="s4";
            break;
        case s5: ret="s5";
            break;
        case s6: ret="s6";
            break;
        case s7: ret="s7";
            break;
        case t8: ret="t8";
            break;
        case t9: ret="t9";
            break;
        case k0: ret="k0";
            break;
        case k1: ret="k1";
            break;
        case gp: ret="gp";
            break;
        case fp: ret="fp";
            break;
        case sp: ret="sp";
            break;
        case ra: ret="ra";
            break;
        case NumRegs: ret="NumRegs";
            break;
        case spill: ret="spill";
            break;
        case removed: ret="removed";
            break;
        case unknown: ret="unknown";
            break;
        defaults: ret="Error!!";
            break; 
    }
    return ret;
}

Location::Location(Segment s, int o, const char *name) :
  variableName(strdup(name)), segment(s), offset(o),rs(unknown),death(false),haveFill(false){}

 
void Instruction::Print() {
  printf("\t%s ;\n", printed);
}

void Instruction::Emit(Mips *mips) {
  if (*printed)
    mips->Emit("# %s", printed);   // emit TAC as comment into assembly
  EmitSpecific(mips);
} 

LoadConstant::LoadConstant(Location *d, int v)
  : dst(d), val(v) {
  Assert(dst != NULL);
  // def sprintf() store into a string instead of display on the screen
  sprintf(printed, "%s = %d", dst->GetName(), val);
}
void LoadConstant::EmitSpecific(Mips *mips) {
  mips->EmitLoadConstant(dst, val);
}


LoadStringConstant::LoadStringConstant(Location *d, const char *s)
  : dst(d) {
  Assert(dst != NULL && s != NULL);
  const char *quote = (*s == '"') ? "" : "\"";
  str = new char[strlen(s) + 2*strlen(quote) + 1];
  sprintf(str, "%s%s%s", quote, s, quote);
  quote = (strlen(str) > 50) ? "...\"" : "";
  sprintf(printed, "%s = %.50s%s", dst->GetName(), str, quote);
}
void LoadStringConstant::EmitSpecific(Mips *mips) {
  mips->EmitLoadStringConstant(dst, str);
}
     

LoadLabel::LoadLabel(Location *d, const char *l)
  : dst(d), label(strdup(l)) {
  Assert(dst != NULL && label != NULL);
  sprintf(printed, "%s = %s", dst->GetName(), label);
}
void LoadLabel::EmitSpecific(Mips *mips) {
  mips->EmitLoadLabel(dst, label);
}


Assign::Assign(Location *d, Location *s)
  : dst(d), src(s) {
  Assert(dst != NULL);
  Assert(src != NULL);
  sprintf(printed, "%s = %s", dst->GetName(), src->GetName());
}
void Assign::EmitSpecific(Mips *mips) {
  mips->EmitCopy(dst, src);
}


Load::Load(Location *d, Location *s, int off)
  : dst(d), src(s), offset(off) {
  Assert(dst != NULL && src != NULL);
  if (offset) 
    sprintf(printed, "%s = *(%s + %d)", dst->GetName(), src->GetName(), offset);
  else
    sprintf(printed, "%s = *(%s)", dst->GetName(), src->GetName());
}
void Load::EmitSpecific(Mips *mips) {
  mips->EmitLoad(dst, src, offset);
}


Store::Store(Location *d, Location *s, int off)
  : dst(d), src(s), offset(off) {
  Assert(dst != NULL && src != NULL);
  if (offset)
    sprintf(printed, "*(%s + %d) = %s", dst->GetName(), offset, src->GetName());
  else
    sprintf(printed, "*(%s) = %s", dst->GetName(), src->GetName());
}
void Store::EmitSpecific(Mips *mips) {
  mips->EmitStore(dst, src, offset);
}
 
const char * const BinaryOp::opName[BinaryOp::NumOps]  = {"+", "-", "*", "/", "%", "==", "<", "&&", "||"};;

BinaryOp::OpCode BinaryOp::OpCodeForName(const char *name) {
  for (int i = 0; i < NumOps; i++) 
    if (opName[i] && !strcmp(opName[i], name))
	return (OpCode)i;
  Failure("Unrecognized Tac operator: '%s'\n", name);
  return Add; // can't get here, but compiler doesn't know that
}

BinaryOp::BinaryOp(OpCode c, Location *d, Location *o1, Location *o2)
  : code(c), dst(d), op1(o1), op2(o2) {
  Assert(dst != NULL && op1 != NULL && op2 != NULL);
  Assert(code >= 0 && code < NumOps);
  sprintf(printed, "%s = %s %s %s", dst->GetName(), op1->GetName(), opName[code], op2->GetName());
}
void BinaryOp::EmitSpecific(Mips *mips) {	  
  mips->EmitBinaryOp(code, dst, op1, op2);
}


Label::Label(const char *l) : label(strdup(l)) {
  Assert(label != NULL);
  *printed = '\0';
}
void Label::Print() {
  printf("%s:\n", label);
}
void Label::EmitSpecific(Mips *mips) {
  mips->EmitLabel(label);
}

 
Goto::Goto(const char *l) : label(strdup(l)) {
  Assert(label != NULL);
  sprintf(printed, "Goto %s", label);
}
void Goto::EmitSpecific(Mips *mips) {	  
  mips->EmitGoto(label);
}

IfZ::IfZ(Location *te, const char *l)
   : test(te), label(strdup(l)) {
  Assert(test != NULL && label != NULL);
  sprintf(printed, "IfZ %s Goto %s", test->GetName(), label);
}
void IfZ::EmitSpecific(Mips *mips) {	  
  mips->EmitIfZ(test, label);
}

List<Location*>* IfZ::GetKill(){
  List<Location*>* ret;
  ret = new List<Location*>();
  ret->Append(test);
  return ret;
}

BeginFunc::BeginFunc() {
  sprintf(printed,"BeginFunc (unassigned)");
  frameSize = -555; // used as sentinel to recognized unassigned value
}
void BeginFunc::SetFrameSize(int numBytesForAllLocalsAndTemps) {
  frameSize = numBytesForAllLocalsAndTemps; 
  sprintf(printed,"BeginFunc %d", frameSize);
}
void BeginFunc::EmitSpecific(Mips *mips) {
  mips->EmitBeginFunction(frameSize);
}

EndFunc::EndFunc() : Instruction() {
  sprintf(printed, "EndFunc");
}
void EndFunc::EmitSpecific(Mips *mips) {
  mips->EmitEndFunction();
}

 
Return::Return(Location *v) : val(v) {
  sprintf(printed, "Return %s", val? val->GetName() : "");
}
void Return::EmitSpecific(Mips *mips) {	  
  mips->EmitReturn(val);
}

List<Location*>* Return::GetKill(){
  List<Location*>* ret = new List<Location*>();
  if(val) ret->Append(val);
  return ret;
}

PushParam::PushParam(Location *p)
  :  param(p) {
  Assert(param != NULL);
  sprintf(printed, "PushParam %s", param->GetName());
}
void PushParam::EmitSpecific(Mips *mips) {
  mips->EmitParam(param);
} 

List<Location*>* PushParam::GetKill(){
  List<Location*>* ret;
  ret = new List<Location*>();
  ret->Append(param);
  return ret;
}

PopParams::PopParams(int nb)
  :  numBytes(nb) {
  sprintf(printed, "PopParams %d", numBytes);
}
void PopParams::EmitSpecific(Mips *mips) {
  mips->EmitPopParams(numBytes);
} 



LCall::LCall(const char *l, Location *d)
  :  label(strdup(l)), dst(d) {
  sprintf(printed, "%s%sLCall %s", dst? dst->GetName(): "", dst?" = ":"", label);
}
void LCall::EmitSpecific(Mips *mips) {
  mips->EmitLCall(dst, label);
}

List<Location*>* LCall::GetGen(){
  List<Location*>* ret;
  ret = new List<Location*>();
  if(dst) ret->Append(dst);
  return ret;
}

ACall::ACall(Location *ma, Location *d)
  : dst(d), methodAddr(ma) {
  Assert(methodAddr != NULL);
  sprintf(printed, "%s%sACall %s", dst? dst->GetName(): "", dst?" = ":"",
	    methodAddr->GetName());
}
void ACall::EmitSpecific(Mips *mips) {
  mips->EmitACall(dst, methodAddr);
} 

List<Location*>* ACall::GetGen(){
  List<Location*>* ret;
  ret = new List<Location*>();
  if(dst) ret->Append(dst);
  return ret;
}


VTable::VTable(const char *l, List<const char *> *m)
  : methodLabels(m), label(strdup(l)) {
  if(DEBUG_EMIT){
    printf("Try to create Vtable\n");
  } 
  Assert(methodLabels != NULL && label != NULL);
  sprintf(printed, "VTable for class %s", l);
}

void VTable::Print() {
  printf("VTable %s =\n", label);
  for (int i = 0; i < methodLabels->NumElements(); i++) 
    printf("\t%s,\n", methodLabels->Nth(i));
  printf("; \n"); 
}
void VTable::EmitSpecific(Mips *mips) {
  mips->EmitVTable(label, methodLabels);
}


List<Location *> *LoadConstant::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *LoadStringConstant::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *LoadLabel::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *Assign::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *Assign::GetKill() {
    List<Location*> *list = new List<Location*>();
    list->Append(src);
    return list;
}

List<Location *> *Load::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *Load::GetKill() {
    List<Location*> *list = new List<Location*>();
    list->Append(src);
    return list;
}

List<Location *> *Store::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *Store::GetKill() {
    List<Location*> *list = new List<Location*>();
    list->Append(src);
    //list->Append(dst);
    //list->Append(reference);
    return list;
}

List<Location *> *BinaryOp::GetGen() {
    List<Location*> *list = new List<Location*>();
    list->Append(dst);
    return list;
}

List<Location *> *BinaryOp::GetKill() {
    List<Location*> *list = new List<Location*>();
    list->Append(op1);
    list->Append(op2);
    return list;
}





