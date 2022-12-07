/* File: ast_type.h
 * ----------------
 * In our parse tree, Type nodes are used to represent and
 * store type information. The base Type class is used
 * for built-in types, the NamedType for classes and interfaces,
 * and the ArrayType for arrays of other types.  
 *
 * pp3: You will need to extend the Type classes to implement
 * the type system and rules for type equivalency and compatibility.
 */
 
#ifndef _H_ast_type
#define _H_ast_type

#include "ast.h"
#include "list.h"
#include "codegen.h"
#include <iostream>
#include <cstring>

class Type : public Node 
{
  protected:
    // def such as "int", ...
    char *typeName;

  public :
    static Type *intType, *doubleType, *boolType, *voidType,
                *nullType, *stringType, *errorType;

    Type(yyltype loc) : Node(loc) {}
    Type(const char *str);
    virtual const char *GetPrintNameForNode() { return "Type"; }
    virtual void PrintToStream(std::ostream& out) { out << typeName; }
    friend std::ostream& operator<<(std::ostream& out, Type *t) { t->PrintToStream(out); return out; }
    virtual bool IsPrimitiveType() { return true; }
    virtual bool IsArrayType() { return false; }
    // def will only return true if same type; return false if superType and subType)
    bool IsEquivalentTo(Type *other);
    BuiltIn GetBuild();
    virtual int GetMemBytes() { return CodeGenerator::VarSize; }
};

class NamedType : public Type 
{
  protected:
    Identifier *id;
    
  public:
    NamedType(Identifier *i);
    void PrintToStream(std::ostream& out) { out << id; }
    const char *GetPrintNameForNode() { return "NamedType"; }

    bool IsPrimitiveType() { return false; }
    // actually, typeName == id->GetName()
    const char *GetTypeName() { return id->GetName(); }
    Identifier * GetId() { return id; }
};

class ArrayType : public Type 
{
  protected:
    Type *elemType;

  public:
    ArrayType(yyltype loc, Type *elemType);
    void PrintToStream(std::ostream& out) { out << elemType << "[]"; }
    // def we use GetPrintNameForNode() to check whether it's ArrayType
    const char *GetPrintNameForNode() { return "ArrayType"; }

    bool IsArrayType() { return true; }
    bool IsPrimitiveType() { return false; }
    Type *GetElementType() { return elemType; }
};


#endif
