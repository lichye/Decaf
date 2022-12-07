/* File: tac.h
 * -----------
 * This module contains the Instruction class (and its various
 * subclasses) that represent Tac instructions and the Location
 * class used for operands to those instructions.
 *
 * Each instruction is mostly just a little struct with a
 * few fields, but each responds polymorphically to the methods
 * Print and Emit, the first is used to print out the TAC form of
 * the instruction (helpful when debugging) and the second to
 * convert to the appropriate MIPS assembly.
 *
 * The operands to each instruction are of Location class.
 * A Location object is a simple representation of where a variable
 * exists at runtime, i.e. whether it is on the stack or global
 * segment and at what offset relative to the current fp or gp.
 *
 * You may need to make changes/extensions to these classes
 * if you are working on IR optimization.

 */

#ifndef _H_tac
#define _H_tac

#include "list.h" // for VTable
#include <cstring>
using namespace std;

// def we can only use v0-t9! spill and removed are for special purpose
//2-25
typedef enum {zero, at, v0, v1, a0, a1, a2, a3,
    t0, t1, t2, t3, t4, t5, t6, t7,
    s0, s1, s2, s3, s4, s5, s6, s7,
    t8, t9, k0, k1, gp, sp, fp, ra,
    spill, removed, unknown,NumRegs } Register;

class Mips;

    // A Location object is used to identify the operands to the
    // various TAC instructions. A Location is either fp or gp
    // relative (depending on whether in stack or global segemnt)
    // and has an offset relative to the base of that segment.
    // For example, a declaration for integer num as the first local
    // variable in a function would be assigned a Location object
    // with name "num", segment fpRelative, and offset -8.
typedef enum {fpRelative, gpRelative} Segment;

//def Identify a variable's runtime memory location, so that we can calculate the frame size
class Location
{
  protected:
    const char *variableName;
    Segment segment;
    int offset;
	  Register rs;
    bool death;
    bool haveFill;
  public:
    Location(Segment seg, int offset, const char *name);

    const char *GetName()           { return variableName; }
    Segment GetSegment()            { return segment; }
    int GetOffset()                 { return offset; }
    Register GetRegister()          { return rs;     }
    void SetRegister(Register r)    { rs = r;        }
    void SetDeath()                 { death = true; }
    bool GetDeath()                 { return death; }
    void SetFill(bool state)        { haveFill=state;}
    bool GetFill()                  { return haveFill;}
    void Print() {
        printf("Name: %s, segment: %s, Offset: %d\n",
               variableName,
               segment==Segment::gpRelative?"gpRelative":"fpRelative",
               offset);
    }


    // Helper to check if two variable locations are one and the same
    // (same name, segment, and offset)
    static bool LocationsAreSame(Location *var1, Location *var2)
    {
        return (var1 == var2 ||
                (var1 && var2
                 && !strcmp(var1->GetName(), var2->GetName())
                 && var1->GetSegment()  == var2->GetSegment()
                 && var1->GetOffset() == var2->GetOffset()));
    }
};

  // base class from which all Tac instructions derived
  // has the interface for the 2 polymorphic messages: Print & Emit
class Instruction {
    protected:
      char printed[128];
	  
    public:
    const char *GetPrinted() const {return printed;}
	virtual void Print();
	virtual void EmitSpecific(Mips *mips) = 0;
	virtual void Emit(Mips *mips);
    virtual List<Location*>* GetGen() { return new List<Location*>();}
    virtual List<Location*>* GetKill() { return new List<Location*>();}
    virtual Location* Getdest() {return NULL;}
};


  // for convenience, the instruction classes are listed here.
  // the interfaces for the classes follows below
  class LoadConstant;
  class LoadStringConstant;
  class LoadLabel;
  class Assign;
  class Load;
  class Store;
  class BinaryOp;
  class Label;
  class Goto;
  class IfZ;
  class BeginFunc;
  class EndFunc;
  class Return;
  class PushParam;
  class RemoveParams;
  class LCall;
  class ACall;
  class VTable;


class LoadConstant: public Instruction {
    Location *dst;
    int val;
  public:
    LoadConstant(Location *dst, int val);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    Location* Getdest() {return dst;}
};

class LoadStringConstant: public Instruction {
    Location *dst;
    char *str;
  public:
    LoadStringConstant(Location *dst, const char *s);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    Location* Getdest() {return dst;}
};
    
class LoadLabel: public Instruction {
    Location *dst;
    const char *label;
  public:
    LoadLabel(Location *dst, const char *label);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    Location* Getdest() {return dst;}
};

class Assign: public Instruction {
    Location *dst, *src;
  public:
    Assign(Location *dst, Location *src);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    List<Location*>* GetKill();
    Location* Getdest() {return dst;}
};

class Load: public Instruction {
    Location *dst, *src;
    int offset;
  public:
    Load(Location *dst, Location *src, int offset = 0);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    List<Location*>* GetKill();
    Location* Getdest() {return dst;}
};

class Store: public Instruction {
    Location *dst, *src;
    int offset;
  public:
    Store(Location *d, Location *s, int offset = 0);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    List<Location*>* GetKill();
    Location* Getdest() {return dst;}
};

class BinaryOp: public Instruction {

  public:
    typedef enum {Add, Sub, Mul, Div, Mod, Eq, Less, And, Or, NumOps} OpCode;
    static const char * const opName[NumOps];
    static OpCode OpCodeForName(const char *name);
    
  protected:
    OpCode code;
    Location *dst, *op1, *op2;
  public:
    BinaryOp(OpCode c, Location *dst, Location *op1, Location *op2);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetGen();
    List<Location*>* GetKill();
    Location* Getdest() {return dst;}
};

class Label: public Instruction {
    const char *label;
  public:
    Label(const char *label);
    const char *GetLabel() const { return label;}
    void Print();
    void EmitSpecific(Mips *mips);
    
};

class Goto: public Instruction {
    const char *label;
  public:
    Goto(const char *label);
    const char *GetLabel() const { return label;}
    void EmitSpecific(Mips *mips);
};

class IfZ: public Instruction {
    Location *test;
    const char *label;
  public:
    IfZ(Location *test, const char *label);
    const char *GetLabel() const { return label;}
    void EmitSpecific(Mips *mips);
    Location* Getdest() {return test;}
    List<Location*>* GetKill();
};

class BeginFunc: public Instruction {
    int frameSize;
  public:
    BeginFunc();
    // used to backpatch the instruction with frame size once known
    void SetFrameSize(int numBytesForAllLocalsAndTemps);
    void EmitSpecific(Mips *mips);
};

class EndFunc: public Instruction {
  public:
    EndFunc();
    void EmitSpecific(Mips *mips);
};

class Return: public Instruction {
    Location *val;
  public:
    Return(Location *val);
    void EmitSpecific(Mips *mips);
    List<Location*>* GetKill();
};   

class PushParam: public Instruction {
    Location *param;
  public:
    PushParam(Location *param);
    void EmitSpecific(Mips *mips);
    Location* Getdest() {return param;}
    List<Location*>* GetKill();
}; 

class PopParams: public Instruction {
    int numBytes;
  public:
    PopParams(int numBytesOfParamsToRemove);
    void EmitSpecific(Mips *mips);
}; 

class LCall: public Instruction {
    const char *label;
    Location *dst;
  public:
    LCall(const char *label, Location *result);
    void EmitSpecific(Mips *mips);
    Location* Getdest() {return dst;}
    List<Location*>* GetGen();
//    List<Location*>* GetKill();
};

class ACall: public Instruction {
    Location *dst, *methodAddr;
  public:
    ACall(Location *meth, Location *result);
    void EmitSpecific(Mips *mips);
    Location* Getdest() {return dst;}
    List<Location*>* GetGen();
//    List<Location*>* GetKill();
};

class VTable: public Instruction {
    List<const char *> *methodLabels;
    const char *label;
 public:
    VTable(const char *labelForTable, List<const char *> *methodLabels);
    void Print();
    void EmitSpecific(Mips *mips);
};


#endif
