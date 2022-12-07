/* File: mips.cc
 * -------------
 * Implementation of Mips class, which is responsible for TAC->MIPS
 * translation, register allocation, etc.
 *
 * Julie Zelenski academic year 2001-02 for CS143
 * Loosely based on some earlier work by Steve Freund
 *
 * A simple final code generator to translate Tac to MIPS.
 * It uses simplistic algorithms, in particular, its register handling
 * and spilling strategy is inefficient to the point of begin mocked
 * by elementary school children.
 *
 * Dan Bentley, April 2002
 * A simpler final code generator to translate Tac to MIPS.
 * It uses algorithms without loops or conditionals, to make there be a
 * very clear and obvious translation between one and the other.
 * Specifically, it always loads operands off stacks, and stores the
 * result back.  This breaks bad code immediately, theoretically helping
 * students.
 */

#include "mips.h"
#include <stdarg.h>
#include <string.h>


/* Method: SpillRegister
 * ---------------------
 * Used to spill a register from reg to dst.  All it does is emit a store
 * from that register to its location on the stack.
 */
void Mips::SpillRegister(Location *dst, Register reg)
{
  Assert(dst);
  const char *offsetFromWhere = dst->GetSegment() == fpRelative? regs[fp].name : regs[gp].name;
  Assert(dst->GetOffset() % 4 == 0); // all variables are 4 bytes in size
  Emit("sw %s, %d(%s)\t# spill %s from %s to %s%+d", regs[reg].name,
       dst->GetOffset(), offsetFromWhere, dst->GetName(), regs[reg].name,
       offsetFromWhere,dst->GetOffset());
  
  //Write MEM with Register
  dst->SetFill(true);
  regs[reg].var = dst;
  regs[reg].isDirty = false;
}

/* Method: FillRegister
 * --------------------
 * Fill a register from location src into reg.
 * Simply load a word into a register.
 */
void Mips::FillRegister(Location *src, Register reg)
{
  //before write register, we should make the register clean
  CleanRegister(reg);
  
  Assert(src);
  const char *offsetFromWhere = src->GetSegment() == fpRelative? regs[fp].name : regs[gp].name;
  Assert(src->GetOffset() % 4 == 0); // all variables are 4 bytes in size
  Emit("lw %s, %d(%s)\t# fill %s to %s from %s%+d", regs[reg].name,
       src->GetOffset(), offsetFromWhere, src->GetName(), regs[reg].name,
       offsetFromWhere,src->GetOffset());
  regs[reg].var = src;
  regs[reg].isDirty = false;
  src->SetFill(true);
}


//before we write a register, we should clean this register
void Mips::CleanRegister(Register reg){
  Location* lastloc = regs[reg].var;
  if(lastloc){
    if(regs[reg].isDirty)
      SpillRegister(lastloc,reg);
    lastloc->SetFill(false);
  }
}

//before we call a function, we should clean all the register
//**this can be modified to increase speed
void Mips::CleanAllRegister(){
    //before we call, we need to clean all the register
  if(DEBUG_MIPS)  printf("\t# we clean all the regiser\n");
  for(int i=0;i<NumRegs;i++){
    if(regs[i].var){
      if(regs[i].isDirty){
      SpillRegister(regs[i].var,Register(i));
      regs[i].var->SetFill(false);
      regs[i].var=NULL;
      }
      else{
      regs[i].var->SetFill(false);
      regs[i].var=NULL; 
      }
    }
  }
}



//Sovle situation:
//IfZ r1 L0
//code1
//L0:
//code2

//before we jump or beqz, we should record the register status
void Mips::RecordAllRegister(const char* label){
  //we should gather the Register status
  if(DEBUG_MIPS)  printf("\t# we record the Registers before %s\n",label);
  Labellist->Append(label);
  RegContents* regs_copy = new RegContents[NumRegs];
  for(int i=0;i<NumRegs;i++){
    regs_copy[i]=regs[i];
  }
  if(DEBUG_RS){
     printf("\t# We record such a Rsfile\n");
     for(int i=0;i<NumRegs;i++){
       if(regs_copy[i].var){
         printf("\t# %s is setted to %s\n",regs_copy[i].name,regs_copy[i].var->GetName());
       }
     }
   }
  Registerlist->Append(regs_copy);
}

//when we reach the code2, we should write back the register status
void Mips::ReWriteAllRegiser(const char* label){
  int index;
  bool find=false;

  //before writeback, we should clean all the register
  //CleanAllRegister();
  
  for(int i=0;i<Labellist->NumElements();i++){
    if(!strcmp(Labellist->Nth(i),label)){
      index=i;
      find=true;
    }
  }
  if(find){
    RegContents *reg_copy = Registerlist->Nth(index);
    for(int i=0;i<NumRegs;i++){
      regs[i]=reg_copy[i];
    }
  }
  for(int i=0;i<NumRegs;i++){
    if(regs[i].var) regs[i].var->SetFill(true);
  }
   if(DEBUG_RS){
     printf("\t# We rewrite such a Rsfile\n");
     for(int i=0;i<NumRegs;i++){
       if(regs[i].var){
         printf("\t# %s is setted to %s\n",regs[i].name,regs[i].var->GetName());
       }
     }
   }
}

/* Method: Emit
 * ------------
 * General purpose helper used to emit assembly instructions in
 * a reasonable tidy manner.  Takes printf-style formatting strings
 * and variable arguments.
 */
void Mips::Emit(const char *fmt, ...)
{
  va_list args;
  char buf[1024];
  
  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);
  if (buf[strlen(buf) - 1] != ':') printf("\t"); // don't tab in labels
  if (buf[0] != '#') printf("  ");   // outdent comments a little
  printf("%s", buf);
  if (buf[strlen(buf)-1] != '\n') printf("\n"); // end with a newline
}



/* Method: EmitLoadConstant
 * ------------------------
 * Used to assign variable an integer constant value.  Slaves dst into
 * a register (using GetRegister above) and then emits an li (load
 * immediate) instruction with the constant value.
 */

//done
void Mips::EmitLoadConstant(Location *dst, int val)
{
  if(DEBUG_MIPS){
    printf("\t# We are in the LoadConstant\n");
    printf("\t# so, the dst register is given %s\n",regs[dst->GetRegister()].name);
    printf("\t# the constant is %d\n",val);
  }
  //we get the register  
  Register reg = dst->GetRegister();
  if(reg==spill){
    reg=rd;
  }

  CleanRegister(reg);

  Emit("li %s, %d\t\t# load constant value %d into %s", regs[reg].name,
	  val, val, regs[reg].name);

  reg = dst->GetRegister();
  if(reg==spill)  
    SpillRegister(dst, rd);
  else{
    regs[reg].isDirty = true;
    regs[reg].var = dst;
    dst->SetFill(true);
  }
}



/* Method: EmitLoadStringConstant
 * ------------------------------
 * Used to assign a variable a pointer to string constant. Emits
 * assembly directives to create a new null-terminated string in the
 * data segment and assigns it a unique label. Slaves dst into a register
 * and loads that label address into the register.
 */
//done
void Mips::EmitLoadStringConstant(Location *dst, const char *str)
{
  if(DEBUG_MIPS){
    printf("\t# We are in the LoadString\n");
    printf("\t# so, the dst register is given %s\n",regs[dst->GetRegister()].name);
    printf("\t# the String is %s\n",str);
  }  
  static int strNum = 1;
  char label[16];
  sprintf(label, "_string%d", strNum++);
  Emit(".data\t\t\t# create string constant marked with label");
  Emit("%s: .asciiz %s", label, str);
  Emit(".text");
  EmitLoadLabel(dst, label);
}


/* Method: EmitLoadLabel
 * ---------------------
 * Used to load a label (ie address in text/data segment) into a variable.
 * Slaves dst into a register and emits an la (load address) instruction
 */

void Mips::EmitLoadLabel(Location *dst, const char *label)
{
  if(DEBUG_MIPS){
    printf("\t# We are in the LoadLabel\n");
    printf("\t# so, the dst register is given %s\n",regs[dst->GetRegister()].name);
    printf("\t# the label is %s\n",label);
  }  
  Register reg = dst->GetRegister();

  if(reg==spill){
    reg = rd;
  }

  //before write register, we should make the register clean
  CleanRegister(reg);

  reg = dst->GetRegister();
  if(reg==spill){
    reg=rd;
    Emit("la %s, %s\t# load label", regs[reg].name, label);
    SpillRegister(dst, reg);
  }else{
    Emit("la %s, %s\t# load label", regs[reg].name, label);
    regs[reg].isDirty = true;
    regs[reg].var = dst;
    dst->SetFill(true);
  } 
}





/* Method: EmitLoad
 * ----------------
 * Used to assign dst the contents of memory at the address in reference,
 * potentially with some positive/negative offset (defaults to 0).
 * Slaves both ref and dst to registers, then emits a lw instruction
 * using constant-offset addressing mode y(rx) which accesses the address
 * at an offset of y bytes from the address currently contained in rx.
 */
void Mips::EmitLoad(Location *dst, Location *reference, int offset)
{
  if(DEBUG_MIPS){
    printf("\t# We are in the EmitLoad\n");
    printf("\t# so, the dst: %s register is given %s\n",dst->GetName(),regs[dst->GetRegister()].name);
    printf("\t# the reference: %s is given %s\n",reference->GetName(),regs[reference->GetRegister()].name);
  }
  
  
  //fill refreg with correct value
  Register refreg = reference->GetRegister();
  if(refreg==spill){
    refreg=rs;
    FillRegister(reference, refreg);
  }
      
  if(!reference->GetFill()){
    FillRegister(reference, refreg);
  }

  Register dstReg = dst->GetRegister();
  if(dstReg==spill)
    dstReg = rd;

  CleanRegister(dstReg);
  //Load the base value to dstReg
  Emit("lw %s, %d(%s) \t# load with offset", regs[dstReg].name,
	  offset, regs[refreg].name);
  //dst have the value in register
 

  //if dst is spill,then put value back to MEM
  dstReg = dst->GetRegister();
  if(dstReg==spill)
    SpillRegister(dst, rd);
  else{
    dst->SetFill(true);
    regs[dstReg].isDirty=true;
    regs[dstReg].var = dst;
  }
}

void Mips::EmitStore(Location* reference, Location* value, int offset){
   if(DEBUG_MIPS){
    printf("\t# We are in the EmitStore\n");
    printf("\t# so, the reference: %s register is given %s\n",reference->GetName(),regs[reference->GetRegister()].name);
    printf("\t# the value: %s is given %s\n",value->GetName(),regs[value->GetRegister()].name);
  } 

  //fill valuereg with value
  Register valuereg =value->GetRegister();
  if(valuereg==spill){
    valuereg = rs;
    FillRegister(value, valuereg);
  }
      
  if(!value->GetFill()){
    FillRegister(value, valuereg);
  }
    
  Register regref = reference->GetRegister();
  if(regref==spill){
    regref = rt;
    FillRegister(reference, regref);
  } 
  if(!reference->GetFill())
    FillRegister(reference, regref);
  Emit("sw %s, %d(%s) \t# store with offset",regs[valuereg].name, offset, regs[regref].name);
}



/* Method: EmitCopy
 * ----------------
 * Used to copy the value of one variable to another.  Slaves both
 * src and dst into registers and then emits a move instruction to
 * copy the contents from src to dst.
 */
void Mips::EmitCopy(Location *dst, Location *src)
{   
    if(DEBUG_MIPS){
    printf("\t# We are in the EmitCopy\n");
    printf("\t# so, the dst register is given %s\n",regs[dst->GetRegister()].name);
    printf("\t# the src is %s\n",regs[src->GetRegister()].name);
    }
    Register dstReg = dst->GetRegister();
    Register srcReg = src->GetRegister();
    
    //if src did not prepared
    if(srcReg==spill){
        srcReg = rs;
        FillRegister(src,srcReg);
    }
    if(!src->GetFill()){ 
      FillRegister(src,srcReg);
    }



    if(dstReg==spill)
      dstReg = rd;

    CleanRegister(dstReg);

    //move dstReg = srcReg
    Emit("move %s, %s\t\t# copy value from %s to %s",
    regs[dstReg].name, regs[srcReg].name,regs[srcReg].name,regs[dstReg].name);

    //first prepare well the src
    if(dst->GetRegister()==spill){
      SpillRegister(dst, rd);
    }else{
      regs[dstReg].isDirty=true;
      regs[dstReg].var = dst;
      dst->SetFill(true);
    }  
}
/* Method: EmitBinaryOp
 * --------------------
 * Used to perform a binary operation on 2 operands and store result
 * in dst. All binary forms for arithmetic, logical, relational, equality
 * use this method. Slaves both operands and dst to registers, then
 * emits the appropriate instruction by looking up the mips name
 * for the particular op code.
 */
void Mips::EmitBinaryOp(BinaryOp::OpCode code, Location *dst, 
				 Location *op1, Location *op2)
{ 
  if(DEBUG_MIPS){
    printf("\t# We are in the EmitBinaryOp\n");
    printf("\t# so, the dst register is given %s\n",regs[dst->GetRegister()].name);
    printf("\t# the op1 is %s\n",regs[op1->GetRegister()].name);
    if(op2) printf("\t# the op2 is %s\n",regs[op2->GetRegister()].name);
    } 
  Register dstreg = dst->GetRegister();
  if(dstreg==spill)
    dstreg=rd;
  
  Register reg1 = op1->GetRegister();
  
  if(reg1==spill){
    reg1= rs;
    FillRegister(op1,reg1);
  }

  if(!op1->GetFill()){
    FillRegister(op1,reg1);
  }
  
  Register reg2 = op2->GetRegister();
  if(reg2==spill){
      reg2 = rt;
      FillRegister(op2,reg2);
  }
  
  if(!op2->GetFill()){  
    FillRegister(op2,reg2);
  }

  CleanRegister(dstreg);

  Emit("%s %s, %s, %s\t", NameForTac(code), regs[dstreg].name,
	 regs[reg1].name, regs[reg2].name);

  dstreg = dst->GetRegister();
  if(dstreg==spill)
    SpillRegister(dst, rd);
  else{
    regs[dstreg].isDirty=true;
    regs[dstreg].var = dst;
    dst->SetFill(true);
  }
}


/* Method: EmitLabel
 * -----------------
 * Used to emit label marker. Before a label, we spill all registers since
 * we can't be sure what the situation upon arriving at this label (ie
 * starts new basic block), and rather than try to be clever, we just
 * wipe the slate clean.
 */
//so, we meet a label, we should gather Register status
void Mips::EmitLabel(const char *label)
{ 
  //ReWriteAllRegiser(label);
  CleanAllRegister();
  Emit("%s:", label);
}


/* Method: EmitGoto
 * ----------------
 * Used for an unconditional transfer to a named label. Before a goto,
 * we spill all registers, since we don't know what the situation is
 * we are heading to (ie this ends current basic block) and rather than
 * try to be clever, we just wipe slate clean.
 */
void Mips::EmitGoto(const char *label)
{
  //RecordAllRegister(label);
  CleanAllRegister();
  Emit("b %s\t\t# unconditional branch", label);
}


/* Method: EmitIfZ
 * ---------------
 * Used for a conditional branch based on value of test variable.
 * We slave test var to register and use in the emitted test instruction,
 * either beqz. See comments above on Goto for why we spill
 * all registers here.
 */
void Mips::EmitIfZ(Location *test, const char *label)
{ 
  CleanAllRegister();
  Register reg = test->GetRegister();
  if(reg==spill){
    reg= rs;
    FillRegister(test,reg);
  }
  if(!test->GetFill()){
    FillRegister(test, reg);
  }
  //RecordAllRegister(label);

  Emit("beqz %s, %s\t# branch if %s is zero ", regs[reg].name, label,
	 test->GetName());
}


/* Method: EmitParam
 * -----------------
 * Used to push a parameter on the stack in anticipation of upcoming
 * function call. Decrements the stack pointer by 4. Slaves argument into
 * register and then stores contents to location just made at end of
 * stack.
 */
void Mips::EmitParam(Location *arg)
{
  if(DEBUG_MIPS){
    printf("\t# we are in a EmitParam\n");
    printf("\t# so, the arg register is given %s\n",regs[arg->GetRegister()].name);
  }
  Register reg = arg->GetRegister();
  if(reg==spill)
    reg=rd;
  CleanRegister(reg);
  FillRegister(arg,reg);  
  Emit("subu $sp, $sp, 4\t# decrement sp to make space for param");
  Emit("sw %s, 4($sp)\t# copy param value to stack", regs[reg].name);
}


/* Method: EmitCallInstr
 * ---------------------
 * Used to effect a function call. All necessary arguments should have
 * already been pushed on the stack, this is the last step that
 * transfers control from caller to callee.  See comments on Goto method
 * above for why we spill all registers before making the jump. We issue
 * jal for a label, a jalr if address in register. Both will save the
 * return address in $ra. If there is an expected result passed, we slave
 * the var to a register and copy function return value from $v0 into that
 * register.  
 */
void Mips::EmitCallInstr(Location *result, const char *fn, bool isLabel)
{
  Emit("%s %-15s\t# jump to function", isLabel? "jal": "jalr", fn);
  //when we come back, we should remove all except in v0;
  for(int i=0;i<NumRegs;i++){
    if(result!=NULL&&i==v0) continue;
    regs[i].var=NULL;
    regs[i].isDirty=false;
  }
  if (result != NULL) {
    Register reg = result->GetRegister();
    if(reg==spill||reg==unknown){
      reg = rd;
    }
      
    Emit("move %s, %s\t\t# copy function return value from $v0",
    regs[reg].name, regs[v0].name);
    SpillRegister(result, reg);
  }
}


// Two covers for the above method for specific LCall/ACall variants
void Mips::EmitLCall(Location *dst, const char *label)
{ 
  //before call a function, we should Emit all the Register
  CleanAllRegister();
  EmitCallInstr(dst, label, true);
}

void Mips::EmitACall(Location *dst, Location *fn)
{
  CleanAllRegister();
  Register reg = rs;
  FillRegister(fn, reg);
  EmitCallInstr(dst, regs[reg].name, false);
}

/*
 * We remove all parameters from the stack after a completed call
 * by adjusting the stack pointer upwards.
 */
void Mips::EmitPopParams(int bytes)
{
  if (bytes != 0)
    Emit("add $sp, $sp, %d\t# pop params off stack", bytes);
}


/* Method: EmitReturn
 * ------------------
 * Used to emit code for returning from a function (either from an
 * explicit return or falling off the end of the function body).
 * If there is an expression to return, we slave that variable into
 * a register and move its contents to $v0 (the standard register for
 * function result).  Before exiting, we spill dirty registers (to
 * commit contents of slaved registers to memory, necessary for
 * consistency, see comments at SpillForEndFunction above). We also
 * do the last part of the callee's job in function call protocol,
 * which is to remove our locals/temps from the stack, remove
 * saved registers ($fp and $ra) and restore previous values of
 * $fp and $ra so everything is returned to the state we entered.
 * We then emit jr to jump to the saved $ra.
 */
 void Mips::EmitReturn(Location *returnVal)
{ 
  if (returnVal != NULL) 
    {
      Register reg = returnVal->GetRegister();
      if(reg==spill){
        reg = rd;
        FillRegister(returnVal,reg);
      }
          
      if(!returnVal->GetFill()){ 
        FillRegister(returnVal, reg);
      } 
      Emit("move $v0, %s\t\t# assign return value into $v0",
	   regs[reg].name);
    }
  Emit("move $sp, $fp\t\t# pop callee frame off stack");
  Emit("lw $ra, -4($fp)\t# restore saved ra");
  Emit("lw $fp, 0($fp)\t# restore saved fp");
  Emit("jr $ra\t\t# return from function");
}


/* Method: EmitBeginFunction
 * -------------------------
 * Used to handle the callee's part of the function call protocol
 * upon entering a new function. We decrement the $sp to make space
 * and then save the current values of $fp and $ra (since we are
 * going to change them), then set up the $fp and bump the $sp down
 * to make space for all our locals/temps.
 */
void Mips::EmitBeginFunction(int stackFrameSize)
{
  CleanAllRegister();
  Assert(stackFrameSize >= 0);
  Emit("subu $sp, $sp, 8\t# decrement sp to make space to save ra, fp");
  Emit("sw $fp, 8($sp)\t# save fp");
  Emit("sw $ra, 4($sp)\t# save ra");
  Emit("addiu $fp, $sp, 8\t# set up new fp");

  if (stackFrameSize != 0)
    Emit("subu $sp, $sp, %d\t# decrement sp to make space for locals/temps",
	   stackFrameSize);
}


/* Method: EmitEndFunction
 * -----------------------
 * Used to end the body of a function. Does an implicit return in fall off
 * case to clean up stack frame, return to caller etc. See comments on
 * EmitReturn above.
 */
void Mips::EmitEndFunction()
{ 
  //we can clean all the registers
  for(int i=0;i<NumRegs;i++){
    regs[i].isDirty=false;
    if(regs[i].var)
      regs[i].var->SetFill(false);
    regs[i].var = NULL;
  }
  Emit("# (below handles reaching end of fn body with no explicit return)");
  EmitReturn(NULL);
}



/* Method: EmitVTable
 * ------------------
 * Used to layout a vtable. Uses assembly directives to set up new
 * entry in data segment, emits label, and lays out the function
 * labels one after another.
 */
void Mips::EmitVTable(const char *label, List<const char*> *methodLabels)
{
  Emit(".data");
  Emit(".align 2");
  Emit("%s:\t\t# label for class %s vtable", label, label);
  for (int i = 0; i < methodLabels->NumElements(); i++)
    Emit(".word %s\n", methodLabels->Nth(i));
  Emit(".text");
}


/* Method: EmitPreamble
 * --------------------
 * Used to emit the starting sequence needed for a program. Not much
 * here, but need to indicate what follows is in text segment and
 * needs to be aligned on word boundary. main is our only global symbol.
 */
void Mips::EmitPreamble()
{
  Emit("# standard Decaf preamble ");
  Emit(".text");
  Emit(".align 2");
  Emit(".globl main");
}


/* Method: NameForTac
 * ------------------
 * Returns the appropriate MIPS instruction (add, seq, etc.) for
 * a given BinaryOp:OpCode (BinaryOp::Add, BinaryOp:Equals, etc.). 
 * Asserts if asked for name of an unset/out of bounds code.
 */
const char *Mips::NameForTac(BinaryOp::OpCode code)
{
  Assert(code >=0 && code < BinaryOp::NumOps);
  const char *name = mipsName[code];
  Assert(name != NULL);
  return name;
}

/* Constructor
 * ----------
 * Constructor sets up the mips names and register descriptors to
 * the initial starting state.
 */
Mips::Mips() {
  mipsName[BinaryOp::Add] = "add";
  mipsName[BinaryOp::Sub] = "sub";
  mipsName[BinaryOp::Mul] = "mul";
  mipsName[BinaryOp::Div] = "div";
  mipsName[BinaryOp::Mod] = "rem";
  mipsName[BinaryOp::Eq] = "seq";
  mipsName[BinaryOp::Less] = "slt";
  mipsName[BinaryOp::And] = "and";
  mipsName[BinaryOp::Or] = "or";
  regs[zero] = (RegContents){false, NULL, "$zero", false};
  regs[at] = (RegContents){false, NULL, "$at", false};
  regs[v0] = (RegContents){false, NULL, "$v0", false};
  regs[v1] = (RegContents){false, NULL, "$v1", false};
  regs[a0] = (RegContents){false, NULL, "$a0", false};
  regs[a1] = (RegContents){false, NULL, "$a1", false};
  regs[a2] = (RegContents){false, NULL, "$a2", false};
  regs[a3] = (RegContents){false, NULL, "$a3", false};
  regs[k0] = (RegContents){false, NULL, "$k0", false};
  regs[k1] = (RegContents){false, NULL, "$k1", false};
  regs[gp] = (RegContents){false, NULL, "$gp", false};
  regs[sp] = (RegContents){false, NULL, "$sp", false};
  regs[fp] = (RegContents){false, NULL, "$fp", false};
  regs[ra] = (RegContents){false, NULL, "$ra", false};
  regs[t0] = (RegContents){false, NULL, "$t0", true};
  regs[t1] = (RegContents){false, NULL, "$t1", true};
  regs[t2] = (RegContents){false, NULL, "$t2", true};
  regs[t3] = (RegContents){false, NULL, "$t3", true};
  regs[t4] = (RegContents){false, NULL, "$t4", true};
  regs[t5] = (RegContents){false, NULL, "$t5", true};
  regs[t6] = (RegContents){false, NULL, "$t6", true};
  regs[t7] = (RegContents){false, NULL, "$t7", true};
  regs[t8] = (RegContents){false, NULL, "$t8", true};
  regs[t9] = (RegContents){false, NULL, "$t9", true};
  regs[s0] = (RegContents){false, NULL, "$s0", true};
  regs[s1] = (RegContents){false, NULL, "$s1", true};
  regs[s2] = (RegContents){false, NULL, "$s2", true};
  regs[s3] = (RegContents){false, NULL, "$s3", true};
  regs[s4] = (RegContents){false, NULL, "$s4", true};
  regs[s5] = (RegContents){false, NULL, "$s5", true};
  regs[s6] = (RegContents){false, NULL, "$s6", true};
  regs[s7] = (RegContents){false, NULL, "$s7", true};
  regs[NumRegs] = (RegContents){false, NULL, "$NumRegs", false};
  regs[spill] = (RegContents){false, NULL, "$spill", false};
  regs[removed] = (RegContents){false, NULL, "$removed", false};
  regs[unknown] = (RegContents){false, NULL, "$unknown", false};
  rs = v0; rt = v1; rd = v0;
  Labellist = new List<const char*>();
  Registerlist= new List<RegContents*>();
}
const char *Mips::mipsName[BinaryOp::NumOps];

