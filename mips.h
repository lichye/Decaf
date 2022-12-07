/* File: mips.h
 * ------------
 * The Mips class defines an object capable of emitting MIPS
 * instructions and managing the allocation and use of registers.
 * It is used by the Tac instruction classes to convert each
 * instruction to the appropriate MIPS equivalent.
 *
 * You can scan this code to see it works and get a sense of what
 * it does.  You will not need to modify this class unless
 * you're attempting some machine-specific optimizations. 
 *
 * It comments the emitted assembly but the commenting for the code
 * in the class itself is pretty sparse. The SPIM manual (see link
 * from other materials on our website) has more detailed documentation
 * on the MIPS architecture, instruction set, calling conventions, etc.
 */

#ifndef _H_mips
#define _H_mips

#include "tac.h"
#include "list.h"
class Location;

class Mips {
private:
    struct RegContents {
	    bool isDirty;
	    Location *var;
	    const char *name;
	    bool isGeneralPurpose;
    } regs[NumRegs];
    List<const char*> *Labellist;
    List<RegContents*> *Registerlist;
    // rs = v0; rt = v1; rd = v0;
    // the only case use these three at same time is EmitBinaryOp(), they won't collide
    Register rs, rt, rd;
    typedef enum { ForRead, ForWrite } Reason;
    // Fill a register from location src into reg.
    void CleanRegister(Register reg);
    void CleanAllRegister();
    void RecordAllRegister(const char*);
    void ReWriteAllRegiser(const char*);
    void FillRegister(Location *src, Register reg);
    // Spill a register from reg to dst (on stack)
    void SpillRegister(Location *dst, Register reg);

    void EmitCallInstr(Location *dst, const char *fn, bool isL);
    
    static const char *mipsName[BinaryOp::NumOps];
    static const char *NameForTac(BinaryOp::OpCode code);

 public:
    // * only use a0~k0 for register allocation!

    Mips();

    static void Emit(const char *fmt, ...);
    
    void EmitLoadConstant(Location *dst, int val);
    // new
    void EmitLoadConstantOptimized(Location *dst, int val, Register r);

    void EmitLoadStringConstant(Location *dst, const char *str);

    void EmitLoadLabel(Location *dst, const char *label);
    // new
    void EmitLoadLabelOptimized(Location *dst, const char *label, Register r);

    void EmitLoad(Location *dst, Location *reference, int offset);
    // new
    void EmitLoadOptimized(Location *dst, Location *reference, int offset, Register r);
    // todo: not sure just add a register is correct
    void EmitStore(Location *reference, Location *value, int offset);

    void EmitCopy(Location *dst, Location *src);

    void EmitBinaryOp(BinaryOp::OpCode code, Location *dst, 
			    Location *op1, Location *op2);

    void EmitLabel(const char *label);

    void EmitGoto(const char *label);

    void EmitIfZ(Location *test, const char*label);

    void EmitReturn(Location *returnVal);

    void EmitBeginFunction(int frameSize);

    void EmitEndFunction();

    void EmitParam(Location *arg);

    void EmitLCall(Location *result, const char* label);

    void EmitACall(Location *result, Location *fnAddr);

    void EmitPopParams(int bytes);

    void EmitVTable(const char *label, List<const char*> *methodLabels);

    // starting code placed at the top of program
    void EmitPreamble();

};


#endif
 
