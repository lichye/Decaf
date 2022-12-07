/* File: ast_type.cc
 * -----------------
 * Implementation of type node classes.
 */
#include "ast_type.h"
#include "ast_decl.h"
#include <string.h>
 
/* Class constants
 * ---------------
 * These are public constants for the built-in base types (int, double, etc.)
 * They can be accessed with the syntax Type::intType. This allows you to
 * directly access them and share the built-in types where needed rather that
 * creates lots of copies.
 */

Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    // def strdup:  return a char* that points to const char*, must be freed
    typeName = strdup(n);
}

NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 

ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}

bool Type::IsEquivalentTo(Type *other) {
    if (this->IsArrayType() != other->IsArrayType()) return false;
    // if (DEBUG) printf("Start check Same Type\n");
    if (this->IsPrimitiveType() && other->IsPrimitiveType()) {
        if (DEBUG_CHECK) printf("Check equivalence of primitive type:\n");
        if (DEBUG_CHECK) printf("this has typeName %s,  ", this->typeName);
        if (DEBUG_CHECK) printf("other has typeName %s\n", other->typeName);
        if (!strcmp(this->typeName, other->typeName)) return true;
    }
    if (this->IsArrayType() && other->IsArrayType()) {
        ArrayType *thisArray = dynamic_cast<ArrayType*>(this);
        ArrayType *otherArray = dynamic_cast<ArrayType*>(other);
        if (DEBUG_CHECK) printf("Check equivalence of array type:\n");
        if (DEBUG_CHECK) printf("this has typeName %s,  ", thisArray->GetElementType()->typeName);
        if (DEBUG_CHECK) printf("other has typeName %s\n", otherArray->GetElementType()->typeName);
        if (thisArray->GetElementType()->IsEquivalentTo(otherArray->GetElementType())) return true;
    }
    if(!this->IsPrimitiveType()&&other->IsPrimitiveType()){
        //this is an object
        if(DEBUG_CHECK)   printf("Check equivalence of named Type with NULL\n");
        if(other->IsEquivalentTo(Type::nullType))
            return true;
        else
            return false;
    }
    if(this->IsPrimitiveType()&&!other->IsPrimitiveType()){
        if(this->IsEquivalentTo(Type::nullType))
            return true;
        else
            return false;
    }
    if(!this->IsArrayType()&&!this->IsPrimitiveType()&&
        !other->IsArrayType()&&!other->IsPrimitiveType())
    { // both class or interface
        NamedType *thisName = dynamic_cast<NamedType*>(this);
        NamedType *otherName = dynamic_cast<NamedType*>(other);
        if (DEBUG_CHECK) printf("Check equivalence of named type:\n");
        if (DEBUG_CHECK&&thisName!=NULL) printf("this has typeName %s,  ", thisName->GetId()->GetName());
        if (DEBUG_CHECK&&otherName!=NULL) printf("other has typeName %s\n", otherName->GetId()->GetName());
        if (!strcmp(thisName->GetId()->GetName(),otherName->GetId()->GetName())){
            if(DEBUG_CHECK) printf("\tWe know they are the same type!\n");
            return true;
        }
        
    }
   // printf("Lack out in compare type\n");
    return false;
}

BuiltIn Type::GetBuild(){
    if(this->IsEquivalentTo(Type::intType)){
        if(DEBUG_GetBuild) printf("#we want to printInt\n");
        return PrintInt;
    }
        
    if(this->IsEquivalentTo(Type::stringType)){
        if(DEBUG_GetBuild) printf("#we want to printString\n");
        return PrintString;
    }
        
    if(this->IsEquivalentTo(Type::boolType)){
        if(DEBUG_GetBuild) printf("#we want to printBool\n");
        return PrintBool;
    }

    if(DEBUG_GetBuild) printf("#we want to print something invalid\n");
    return NumBuiltIns;
}
