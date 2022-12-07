/* File: ast_stmt.h
 * ----------------
 * The Stmt class and its subclasses are used to represent
 * statements in the parse tree.  For each statment in the
 * language (for, if, return, etc.) there is a corresponding
 * node class for that construct. 
 *
 * pp3: You will need to extend the Stmt classes to implement
 * semantic analysis for rules pertaining to statements.
 */


#ifndef _H_ast_stmt
#define _H_ast_stmt

#include "list.h"
#include "ast.h"
#include "ast_decl.h"
#include <cstdio>

class Decl;
class VarDecl;
class Stmt;




class Program : public Node
{
  protected:
     List<Decl*> *decls;
     Scope *globalScope;
     CodeGenerator *codeGenerator; // def It will be used during Emit() to store instructions

  public:
     Program(List<Decl*> *declList);
     const char *GetPrintNameForNode() { return "Program"; }
     Scope* GetGlobalScope() { return globalScope;}
     void BuildScope();
     void Check();
     void Emit();
     void Sort();//make baseClass first
};

class Stmt : public Node
{
  public:
    Scope* localScope;
    Stmt() : Node() {localScope = NULL;}
    Stmt(yyltype loc) : Node(loc) {localScope = NULL;}
    const char *GetPrintNameForNode() { return "Stmt"; }
    virtual void BuildScope(Scope*)=0;
    virtual void Check(Scope*)=0;

    // * non-pure virtual function must have it's definition!
    virtual Location* Emit(CodeGenerator* cg) {return NULL;}
    virtual int GetMemBytes() {return CodeGenerator::VarSize;}

};

class Expr : public Stmt
{
    // * notice that it inherits scope from stmt!
public:
    Expr(yyltype loc) : Stmt(loc) {}
    Expr() : Stmt() {}

    virtual Type *GetType(Scope *scope)=0; // true virtual function as this class will be derived
    virtual void BuildScope(Scope* scope){ localScope = scope;}
    virtual void Check(Scope *scope) {;}

    // def MemBytes are needed when begin a function (such as main function)
    virtual int GetMemBytes() {return CodeGenerator::VarSize;}
    virtual Location *Emit(CodeGenerator *cg) { return NULL; }
};

class StmtBlock : public Stmt
{
  public:
    List<VarDecl*> *decls;
    List<Stmt*> *stmts;
    StmtBlock(List<VarDecl*> *variableDeclarations, List<Stmt*> *statements);
    const char *GetPrintNameForNode() { return "StmtBlock"; }

    void BuildScope(Scope *parent);
    void Check(Scope *);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes();
    void PreEmit(CodeGenerator* cg);
};

class ConditionalStmt : public Stmt
{
  protected:
    Expr *test;
    Stmt *body;
  
  public:
    ConditionalStmt(Expr *testExpr, Stmt *body);
    void BuildScope(Scope* parent) {}
    Location* Emit(CodeGenerator* cg);

    int GetMemBytes() {
       return test->GetMemBytes() + body->GetMemBytes();
    }
};

class LoopStmt : public ConditionalStmt 
{
  private:
    const char* break_label;

  public:
    LoopStmt(Expr *testExpr, Stmt *body)
            : ConditionalStmt(testExpr, body) {}
    void BuildScope(Scope* parent) {}
    void SetBreak(const char* b) { break_label = b; }
    const char* GetBreak() { return break_label; }

    int GetMemBytes() {
        int memBytes = CodeGenerator::VarSize;
        memBytes += test->GetMemBytes();
        memBytes += body->GetMemBytes();
        return memBytes;
    };
};

class ForStmt : public LoopStmt 
{
  protected:
    Expr *init, *step;
  
  public:
    ForStmt(Expr *init, Expr *test, Expr *step, Stmt *body);
    const char *GetPrintNameForNode() { return "ForStmt"; }

    void BuildScope(Scope* parent);
    void Check(Scope*);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes();
};

class WhileStmt : public LoopStmt 
{
  public:
    WhileStmt(Expr *test, Stmt *body) : LoopStmt(test, body) {}
    const char *GetPrintNameForNode() { return "WhileStmt"; }

    void BuildScope(Scope* parent);
    void Check(Scope* );
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes() {
        int memBytes = CodeGenerator::VarSize;
        memBytes += test->GetMemBytes();
        memBytes += body->GetMemBytes();
        return memBytes;
    };
};

class IfStmt : public ConditionalStmt 
{
  protected:
    Stmt *elseBody;
  
  public:
    IfStmt(Expr *test, Stmt *thenBody, Stmt *elseBody);
    const char *GetPrintNameForNode() { return "IfStmt"; }

    void BuildScope(Scope* parent);
    void Check(Scope*);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes();
};

class BreakStmt : public Stmt 
{
  public:
    BreakStmt(yyltype loc) : Stmt(loc) {}
    const char *GetPrintNameForNode() { return "BreakStmt"; }
    void BuildScope(Scope*) {}
    void Check(Scope*);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes() {return 0;}
};

class ReturnStmt : public Stmt  
{
  protected:
    Expr *expr;
  
  public:
    ReturnStmt(yyltype loc, Expr *expr);
    const char *GetPrintNameForNode() { return "ReturnStmt"; }
    void BuildScope(Scope*);
    void Check(Scope*);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes() {return expr->GetMemBytes();}
};

class PrintStmt : public Stmt
{
  protected:
    List<Expr*> *args;
    
  public:
    PrintStmt(List<Expr*> *arguments);
    const char *GetPrintNameForNode() { return "PrintStmt"; }

    void BuildScope(Scope* father);
    void Check(Scope*);
    Location* Emit(CodeGenerator* cg);
    int GetMemBytes();
};


#endif
