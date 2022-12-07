/* File: ast_decl.h
 * ----------------
 * In our parse tree, Decl nodes are used to represent and
 * manage declarations. There are 4 subclasses of the base class,
 * specialized for declarations of variables, functions, classes,
 * and interfaces.
 *
 * pp3: You will need to extend the Decl classes to implement 
 * semantic processing including detection of declaration conflicts 
 * and managing scoping issues.
 */

#ifndef _H_ast_decl
#define _H_ast_decl

#include "ast.h"
#include "ast_type.h"
#include "list.h"
#include "errors.h"
#include "hashtable.h"
#include "tac.h"
#include "codegen.h"
#include "debug.h"

enum class DeclType{
    VarDecl,
    ClassDecl,
    FnDecl,
    InterfaceDecl
};
class Identifier;
class Stmt;
class Decl;  // put declaration at top to avoid compiler error
class ClassDecl;
class Scope;

class Decl : public Node
{
  protected:
    // def e.g. a in "int a"; b in "class b{}" ...
    Identifier *id;
    Scope *localScope;

  public:
    Decl(Identifier *name);
    friend std::ostream& operator<<(std::ostream& out, Decl *d) { return out << d->id; }
    char *GetId()  { return id->GetName(); }
    Scope * GetScope() { return localScope; }
    virtual const char *GetPrintNameForNode() = 0;
    virtual void BuildScope(Scope *parent);
    virtual void Check(Scope* scope) = 0;
    virtual bool IsEquivalentTo (Decl* other) { return true; }

    virtual Location* Emit(CodeGenerator*) = 0;

};

class VarDecl : public Decl
{
  protected:
    Type *type;
    Location * memLocation;
    bool underClass;
  public:
    VarDecl(Identifier *name, Type *type);
    Type *GetType() { return type; }
    const char *GetPrintNameForNode() { return "VarDecl"; }
    void Check(Scope* scope);
    char* GetName() { return id->GetName(); }

    // set varDecl as in a class
    void SetUnderClass(bool in){ underClass = in;}
    // return whether the varDecl is in a class
    bool GetUnderClass() { return underClass; }
    void SetMemLoc(Location* l) { memLocation = l;}
    // memLocation will be set by SetMemLoc().
    Location* GetMemLoc() { return memLocation;}
    int GetMemBytes() {return CodeGenerator::VarSize;}
    Location* Emit(CodeGenerator*);

};

class FnDecl : public Decl
{
protected:
    List<VarDecl*> *formals;
    Type *returnType;
    Stmt *body;
    Scope *parameterScope;
    std::string *label;
    int localOffset;
    bool rewrite;
public:
    FnDecl(Identifier *name, Type *returnType, List<VarDecl*> *formals);
    void SetFunctionBody(Stmt *b);
    List<VarDecl*> *GetFormals() { return formals; }
    Type *GetReturnType() { return returnType; }
    Stmt *GetBody() { return body; }
    const char *GetPrintNameForNode() { return "FnDecl"; }
    void BuildScope(Scope *parent);
    void Check(Scope* scope);

    void SetLocalOffset(int newOffset) {localOffset = newOffset;}
    int GetLocalOffset() {return localOffset;}
    void SetLabel(std::string *newLabel) {label = newLabel;}
    const char* GetLabel();
    int GetMemBytes() { return 0;} // will not add to main function's BeginFunc
    Location* Emit(CodeGenerator*);
    void Setrewrite(bool i) { rewrite = true;}
    bool Isrewrite() { return rewrite;}
};

class ClassDecl : public Decl
{
  private:
    // def we need this list as misMatch should be report with their Check()
    List<FnDecl*> *overrideMismatches;
    bool isEmitted;
    Location *classthis;
  protected:
    List<Decl*> *Field;
    NamedType *extends;
    List<NamedType*> *implements;
    void CheckExtends(); // def the base class into scoping
    void CheckImplements();
public:
    List<FnDecl*> *Vt;
    ClassDecl(Identifier *name, NamedType *extends, 
              List<NamedType*> *implements, List<Decl*> *members);
    List<Decl*> *GetField() { return Field; }
    NamedType *GetExtends() { return extends; }
    List<NamedType*> *GetImplements() { return implements; }
    const char *GetPrintNameForNode() { return "ClassDecl"; }
    Type *GetNamedType() { return new NamedType(id);}
    void BuildScope(Scope *parent);
    void Check(Scope* scope);
    int GetMemBytes();

    // mark the class as already emitted
    void SetEmit() { isEmitted = true;}
    // return whether the class is emitted
    bool IsEmit() { return isEmitted;}
    Location* Emit(CodeGenerator*);
    Location* Getthis() { return classthis;}
};

class InterfaceDecl : public Decl 
{
  protected:
    List<Decl*> *Prototype;

  public:
    InterfaceDecl(Identifier *name, List<Decl*> *Prototype);
    List<Decl*> *GetPrototype() { return Prototype; }
    const char *GetPrintNameForNode() { return "InterfaceDecl"; }
    void Check(Scope* scope);
    void BuildScope(Scope *parent);

    int GetMemBytes() { return 0;}
    Location* Emit(CodeGenerator*);
};

class Scope  // def symbol table
{
private:
    Scope *parent;
    Hashtable<Decl*> *symTable;  // * only decls are top-levels
public:
    Scope(): parent(NULL), symTable(new Hashtable<Decl*>) {} // list initialization
    void SetParent(Scope* s) { parent = s; }
    Scope *GetParent() { return parent; }
    Hashtable<Decl*> * GetSymTable(){ return symTable;}
    void InsertDecl(Decl* decl) {
        Decl* find = symTable->Lookup(decl->GetId());
        if(find!=NULL){
            ReportError::DeclConflict(decl, find);
            return;
        }
        else {
            symTable->Enter(decl->GetId(),decl);
        }
    }
    Decl* LookupDecl(const char *key) {
        // * Check if key exists
        // * If key doesn't exist, report error and create key with declType
        Decl* local = symTable->Lookup(key);
        if(local)
            return local;
        if(!local&&parent)
            return parent->LookupDecl(key);
        //Decl* error = new FixDecl(key);
        //symTable->Enter(error);
        return NULL;
    }
    // will return the classDecl from the given namedTpe
    ClassDecl* LookupClassDecl(NamedType* namedType) {
        const char *name = namedType->GetTypeName();
        Decl* decl = this->LookupDecl(name);
        Scope *scope = this;
        while (decl == NULL && scope->GetParent() != NULL) {
            scope = scope->GetParent();
            decl = scope->LookupDecl(name);
        }
        Assert(decl != NULL);
        ClassDecl *classDecl = dynamic_cast<ClassDecl*>(decl);
        Assert(classDecl != NULL);
        return classDecl;
    }
    // will return true if derived type extends base type
    bool IsSuperType(Type *base,Type *derived) {
        if(DEBUG_CHECK) printf("we are going to check IsSuperType\n");
        Type* base_copy = base;
        Type* derived_copy = derived;
        while(base_copy->IsArrayType()){
            base_copy = dynamic_cast<ArrayType*> (base_copy)->GetElementType();
        }
        while(derived_copy->IsArrayType()){
            derived_copy = dynamic_cast<ArrayType*> (derived_copy)->GetElementType();
        }
        if (base_copy->IsPrimitiveType()|| derived_copy->IsPrimitiveType())
            return false;
        // now base and derived are NamedType*
        // go to the global scope
        if(this->parent)
            return this->parent->IsSuperType(base_copy,derived_copy);
        //so we come to the
        NamedType* a = dynamic_cast<NamedType*> (base_copy);

        NamedType* b = dynamic_cast<NamedType*> (derived_copy);
        if (DEBUG_CHECK) printf("Get NamedType* a and b\n");
        ClassDecl* declB = dynamic_cast<ClassDecl*>(this->LookupDecl(b->GetTypeName()));
        if(!declB) return false;
        while(declB->GetExtends()){
            //       printf("we are goint to check %s",declB->GetId());
            if(!strcmp(a->GetTypeName(),declB->GetExtends()->GetTypeName()))
                return true;
            for(int i=0;i<declB->GetImplements()->NumElements();i++) {
                if(!strcmp(a->GetTypeName(),declB->GetImplements()->Nth(i)->GetId()->GetName()))
                    return true;
            }
            declB = dynamic_cast<ClassDecl*>(this->LookupDecl(declB->GetExtends()->GetTypeName()));
        }
        for(int i=0;i<declB->GetImplements()->NumElements();i++) {
            if(!strcmp(a->GetTypeName(),declB->GetImplements()->Nth(i)->GetId()->GetName()))
                return true;
        }
        return false;
    }
    // will return true if : a and b are same type; a is superType of b; b is superType of a
    bool IsRelevant(ClassDecl *a , ClassDecl *b){
        if(!strcmp(a->GetId(),b->GetId()))
            return true;
        if(a->GetExtends())
            if(!strcmp(a->GetExtends()->GetTypeName(),b->GetId()))
                return true;
        if(b->GetExtends())
            if(!strcmp(a->GetId(),b->GetExtends()->GetTypeName()))
                return true;
        return false;
    }
};
#endif
