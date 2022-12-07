/* File: ast_expr.h
 * ----------------
 * The Expr class and its subclasses are used to represent
 * expressions in the parse tree.  For each expression in the
 * language (add, call, New, etc.) there is a corresponding
 * node class for that construct. 
 *
 * pp3: You will need to extend the Expr classes to implement 
 * semantic analysis for rules pertaining to expressions.
 */


#ifndef _H_ast_expr
#define _H_ast_expr

#include "ast.h"
#include "ast_stmt.h"
#include "ast_type.h"
#include "list.h"
#include "codegen.h"

class NamedType; // for new
class Type; // for NewArray

// * Expr is now in stmt.h, as we must call it's GetMemBytes() method.

/* This node type is used for those places where an expression is optional.
 * We could use a NULL pointer, but then it adds a lot of checking for
 * NULL. By using a valid, but no-op, node, we save that trouble */
class EmptyExpr : public Expr
{
  public:
    const char *GetPrintNameForNode() { return "Empty"; }
    Type *GetType() { return Type::voidType; }  // we already have null below
    Type *GetType(Scope *scope){return Type::voidType;} // true virtual function as this class will be derived
    void Check(Scope *scope){;}
    int GetMemBytes(){ return 0; }
    Location *Emit(CodeGenerator *cg) { return NULL; }
};

class IntConstant : public Expr 
{
  protected:
    int value;
  
  public:
    IntConstant(yyltype loc, int val);
    const char *GetPrintNameForNode() { return "IntConstant"; }
    Type *GetType() { return Type::intType; } // so that we can check things like 1 + "a"
    Type *GetType(Scope *scope) { return Type::intType; }
    int GetMemBytes(){ return 4; }
    Location *Emit(CodeGenerator *cg) {
        // generate a temp value, then assign the value to it (temp value)
        // the string will be stored in the printed() vector in Instruction Class
        // finally, it will be appended to the code List in CodeGenerator class
        return cg->GenLoadConstant(value);
    }
};

class DoubleConstant : public Expr 
{
  protected:
    double value;
    
  public:
    DoubleConstant(yyltype loc, double val);
    const char *GetPrintNameForNode() { return "DoubleConstant"; }
    Type *GetType() { return Type::doubleType; }
    Type *GetType(Scope *scope) { return Type::doubleType; }
    int GetMemBytes(){ return 8; }
    Location *Emit(CodeGenerator *cg) {
        // def We have removed doubles for this project
        Assert(false);
        return NULL;
    }
};

class BoolConstant : public Expr 
{
  protected:
    bool value;
    
  public:
    BoolConstant(yyltype loc, bool val);
    const char *GetPrintNameForNode() { return "BoolConstant"; }
    Type *GetType() { return Type::boolType; }
    Type *GetType(Scope *scope) { return Type::boolType; }
    int GetMemBytes(){ return 4; }
    Location *Emit(CodeGenerator *cg) {
        return cg->GenLoadConstant(value?1:0);
    }
};

class StringConstant : public Expr 
{ 
  protected:
    char *value;
    
  public:
    StringConstant(yyltype loc, const char *val);
    const char *GetPrintNameForNode() { return "StringConstant"; }
    Type *GetType() { return Type::stringType; }
    Type *GetType(Scope *scope) { return Type::stringType; }
    int GetMemBytes(){ return 4; }
    Location *Emit(CodeGenerator *cg) {
        return cg->GenLoadConstant(value);
    }
};

class NullConstant: public Expr 
{
  public: 
    NullConstant(yyltype loc);
    const char *GetPrintNameForNode() { return "NullConstant"; }
    Type *GetType() { return Type::nullType; }
    Type *GetType(Scope *scope) { return Type::nullType; }
    int GetMemBytes(){ return 4; }
    Location *Emit(CodeGenerator *cg) {
        // just print 0
        return  cg->GenLoadConstant(0);
    }
};

class Operator : public Node 
{
  protected:
    char tokenString[4];
    
  public:
    Operator(yyltype loc, const char *tok);
    friend std::ostream& operator<<(std::ostream& out, Operator *o) { return out << o->tokenString; }
    const char *GetPrintNameForNode() { return "Operator"; }
    char *GetTokenString() { return tokenString; }
    int GetMemBytes();
    Location* Emit(CodeGenerator*);
 };
 
class CompoundExpr : public Expr
{
  protected:
    Operator *op;
    Expr *left, *right; // left will be NULL if unary
    
  public:
    virtual void BuildScope(Scope*);
    CompoundExpr(Expr *lhs, Operator *op, Expr *rhs); // for binary
    CompoundExpr(Operator *op, Expr *rhs);
    Location* Emit(CodeGenerator* cg);             // for unary
    virtual int GetMemBytes();
};

class ArithmeticExpr : public CompoundExpr 
{
  public:
    ArithmeticExpr(Expr *lhs, Operator *op, Expr *rhs) : CompoundExpr(lhs,op,rhs) {}
    ArithmeticExpr(Operator *op, Expr *rhs) : CompoundExpr(op,rhs) {}
    const char *GetPrintNameForNode() { return "ArithmeticExpr"; }
    // since it's derived class, no need to add keyword "virtual"
    Type *GetType(Scope * scope);
    int GetMemBytes();
    void Check(Scope* scope);
    Location *Emit(CodeGenerator *cg);
};

class RelationalExpr : public CompoundExpr 
{
  public:
    RelationalExpr(Expr *lhs, Operator *op, Expr *rhs) : CompoundExpr(lhs,op,rhs) {}
    const char *GetPrintNameForNode() { return "RelationalExpr"; }
    Type *GetType(Scope*);
    int GetMemBytes();
    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
};

class EqualityExpr : public CompoundExpr 
{
  public:
    EqualityExpr(Expr *lhs, Operator *op, Expr *rhs) : CompoundExpr(lhs,op,rhs) {}
    const char *GetPrintNameForNode() { return "EqualityExpr"; }
    Type *GetType(Scope *);

    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
    int GetMemBytes();
};

class LogicalExpr : public CompoundExpr 
{
  public:
    LogicalExpr(Expr *lhs, Operator *op, Expr *rhs) : CompoundExpr(lhs,op,rhs) {}
    LogicalExpr(Operator *op, Expr *rhs) : CompoundExpr(op,rhs) {}
    const char *GetPrintNameForNode() { return "LogicalExpr"; }
    Type *GetType(Scope *);
    void Check(Scope *scope);
    int GetMemBytes();
    Location *Emit(CodeGenerator *cg);
};

class AssignExpr : public CompoundExpr 
{
  public:
    AssignExpr(Expr *lhs, Operator *op, Expr *rhs) : CompoundExpr(lhs,op,rhs) {}
    const char *GetPrintNameForNode() { return "AssignExpr"; }
    Type *GetType(Scope *);
    int GetMemBytes();
    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
};

class LValue : public Expr 
{
  public:
    LValue(yyltype loc) : Expr(loc) {}
};

class This : public Expr 
{
  public:
    This(yyltype loc) : Expr(loc) {}
    const char *GetPrintNameForNode() { return "This"; }
    Type *GetType(Scope *scope);

    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
    int GetMemBytes() {return 0;}
};

class ArrayAccess : public LValue 
{
  protected:
    Expr *base, *subscript; // base should not be NULL
    
  public:
    ArrayAccess(yyltype loc, Expr *base, Expr *subscript);
    const char *GetPrintNameForNode() { return "ArrayAccess"; }
    Type *GetType(Scope *scope);
    void BuildScope(Scope*);
    void Check(Scope *scope);
    // will generate subscript code and load it
    Location *Emit(CodeGenerator *cg);
    // will only generate subscript code
    Location *GetAddress(CodeGenerator *cg);
    int GetMemBytes();
};

/* Note that field access is used both for qualified names
 * base.field and just field without qualification. We don't
 * know for sure whether there is an implicit "this." in
 * front until later on, so we use one node type for either
 * and sort it out later. */
class FieldAccess : public LValue 
{
  protected:
    Expr *base;	// will be NULL if no explicit base
    Identifier *field;
    
  public:
    FieldAccess(Expr *base, Identifier *field); // ok to pass NULL base
    const char *GetPrintNameForNode() { return "FieldAccess"; }
    Type *GetType(Scope* scope);
    void BuildScope(Scope*);
    void Check(Scope *scope);
    int GetMemBytes();
    // return whether the field has associated class
    bool IsAccessClass();
    // return whether the field is called using this
    bool IsThisAccess();
    Location *Emit(CodeGenerator *cg);
    Location *GetAddress(CodeGenerator* cg);
    int GetOffset(CodeGenerator* cg);
};

/* Like field access, call is used both for qualified base.field()
 * and unqualified field().  We won't figure out until later
 * whether we need implicit "this." so we use one node type for either
 * and sort it out later. */
class Call : public Expr 
{
  protected:
    Expr *base;	// will be NULL if no explicit base
    Identifier *field;
    List<Expr*> *actuals;
    
  public:
    Call(yyltype loc, Expr *base, Identifier *field, List<Expr*> *args);
    const char *GetPrintNameForNode() { return "Call"; }
    Type *GetType(Scope *scope);
    void BuildScope(Scope*);
    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
    int GetMemBytes();
};

class NewExpr : public Expr
{
  protected:
    NamedType *cType;
    
  public:
    NewExpr(yyltype loc, NamedType *clsType);
    const char *GetPrintNameForNode() { return "NewExpr"; }
    Type *GetType(Scope *scope);

    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
    int GetMemBytes() {return CodeGenerator::VarSize*3;}
};

class NewArrayExpr : public Expr
{
  protected:
    Expr *size;
    Type *elemType;
    
  public:
    NewArrayExpr(yyltype loc, Expr *sizeExpr, Type *elemType);
    const char *GetPrintNameForNode() { return "NewArrayExpr"; }
    Type *GetType(Scope *scope);
    void BuildScope(Scope*);
    void Check(Scope *scope);
    Location *Emit(CodeGenerator *cg);
    int GetMemBytes();
};

class ReadIntegerExpr : public Expr
{
  public:
    ReadIntegerExpr(yyltype loc) : Expr(loc) {}
    const char *GetPrintNameForNode() { return "ReadIntegerExpr"; }
    Type *GetType() { return Type::intType; }
    Type *GetType(Scope*) { return Type::intType; }

    Location *Emit(CodeGenerator *cg);
    int GetMemBytes(){return CodeGenerator::VarSize;}
};

class ReadLineExpr : public Expr
{
  public:
    ReadLineExpr(yyltype loc) : Expr (loc) {}
    const char *GetPrintNameForNode() { return "ReadLineExpr"; }
    Type *GetType() { return Type::stringType; }
    Type *GetType(Scope*) { return Type::stringType; }

    Location *Emit(CodeGenerator *cg);
    int GetMemBytes(){return CodeGenerator::VarSize;}
};

    
#endif
