/* File: ast_expr.cc
 * -----------------
 * Implementation of expression node classes.
 */
#include "ast_expr.h"
#include "ast_type.h"
#include "ast_decl.h"
#include "tac.h"
#include "errors.h"
#include <string.h>


// def We will use GetType() to help finish Check();
// def GetType() should only return errorType and never use ReportError!!
// def However, they are the same level


IntConstant::IntConstant(yyltype loc, int val) : Expr(loc) {
    value = val;
}
DoubleConstant::DoubleConstant(yyltype loc, double val) : Expr(loc) {
    value = val;
}
BoolConstant::BoolConstant(yyltype loc, bool val) : Expr(loc) {
    value = val;
}
StringConstant::StringConstant(yyltype loc, const char *val) : Expr(loc) {
    Assert(val != NULL);
    value = strdup(val);
}
NullConstant::NullConstant(yyltype loc): Expr(loc) {}
Operator::Operator(yyltype loc, const char *tok) : Node(loc) {
    Assert(tok != NULL);
    strncpy(tokenString, tok, sizeof(tokenString));
}
Location* Operator::Emit(CodeGenerator* cg){
    return NULL;
}
int Operator::GetMemBytes(){
    if(!strcmp(this->GetTokenString(),"="))
        return 0;
    if(!strcmp(this->GetTokenString(),"=="))
        return 4;
    if(!strcmp(this->GetTokenString(),"!="))
        return 12;
    if(!strcmp(this->GetTokenString(),">="))
        return 12;
    if(!strcmp(this->GetTokenString(),"<="))
        return 12;
    if(!strcmp(this->GetTokenString(),">"))
        return 4;
    if(!strcmp(this->GetTokenString(),"<"))
        return 4;
    if(!strcmp(this->GetTokenString(),"&&"))
        return 4;
    if(!strcmp(this->GetTokenString(),"+"))
        return 4;
    if(!strcmp(this->GetTokenString(),"-"))
        return 4;
    if(!strcmp(this->GetTokenString(),"*"))
        return 4;
    if(!strcmp(this->GetTokenString(),"/"))
        return 4;
    if(!strcmp(this->GetTokenString(),"%"))
        return 4;
    if(!strcmp(this->GetTokenString(),"!"))
        return 8;
    return 0;
}
ArrayAccess::ArrayAccess(yyltype loc, Expr *b, Expr *s) : LValue(loc) {
    (base=b)->SetParent(this); 
    (subscript=s)->SetParent(this);
}
void ArrayAccess::BuildScope(Scope* father){
    localScope = father;
    if(base)    base->BuildScope(father);
    if(subscript)   subscript->BuildScope(father);
}
Type *ArrayAccess::GetType(Scope *scope) {
    // if (DEBUG_CHECK) printf("#Start ArrayAccess\n");
    Type *baseType = base->GetType(scope);
    Type *subscriptType = subscript->GetType(scope);
    if (!baseType->IsArrayType())
        return Type::errorType;
    //if subscript type
    // if (DEBUG_CHECK) printf("#Finish check IsEquivalentTo() in ArrayAccess\n");
    ArrayType *arrayType = dynamic_cast<ArrayType*>(base->GetType(scope));
    return arrayType->GetElementType();
}
void ArrayAccess::Check(Scope *scope) {
    base->Check(scope);
    subscript->Check(scope);
    // a[b]
    // a,b unknown -> GetType()errorType
    // a[b:double] known, errorType -> errorType
    Type *baseType = base->GetType(scope);
    Type *subscriptType = subscript->GetType(scope);
    if (baseType == Type::errorType || subscriptType == Type::errorType)
        return;
    if (!baseType->IsArrayType()) {
        // * don't return as it may report two errors!
        ReportError::BracketsOnNonArray(base);
    }
    if (!subscriptType->IsEquivalentTo(Type::intType))
        ReportError::SubscriptNotInteger(subscript);
}
Location *ArrayAccess::Emit(CodeGenerator *cg) {
     /*e.g.
     	_tmp12 = subscript ;
    	_tmp13 = 0 ;
    	_tmp14 = _tmp12 < _tmp13 ;
    	_tmp15 = *(arr + -4) ;
    	_tmp16 = _tmp12 < _tmp15 ;
    	_tmp17 = _tmp16 == _tmp13 ;
    	_tmp18 = _tmp14 || _tmp17 ;
    	IfZ _tmp18 Goto _L1 ;
    	_tmp19 = "Decaf runtime error: Array subscript out of bound..." ;
    	PushParam _tmp19 ;
    	LCall _PrintString ;
    	PopParams 4 ;
    	LCall _Halt ;
    _L1:
    	_tmp20 = 4 ;
    	_tmp21 = _tmp20 * _tmp12 ;
    	_tmp22 = arr + _tmp21 ;
    	_tmp23 = *(_tmp22) */
    
    //if base is in the class
    Location* base_loc = base->Emit(cg);
    Location* sub_loc = subscript->Emit(cg);
    return cg->GenLoad(cg->GenSubscript(base_loc, sub_loc));
}
Location *ArrayAccess::GetAddress(CodeGenerator *cg) {
    Location* base_loc= base->Emit(cg);
    Location* sub_loc = subscript->Emit(cg);
    return cg->GenSubscript(base_loc, sub_loc);
}
int ArrayAccess::GetMemBytes(){
    int ret = 0;
    ret += base->GetMemBytes();
    ret += subscript->GetMemBytes();
    ret += 11 * CodeGenerator::VarSize;
    return ret;
}
FieldAccess::FieldAccess(Expr *b, Identifier *f)
  : LValue(b? Join(b->GetLocation(), f->GetLocation()) : *f->GetLocation()) {
    Assert(f != NULL); // b can be be NULL (just means no explicit base)
    base = b; 
    if (base) base->SetParent(this); 
    (field=f)->SetParent(this);
}
void FieldAccess::BuildScope(Scope* father)
{
    if(DEBUG_BS) printf("#we are going to BuildScope on field access\n");
    if(DEBUG_BS&&father==NULL)  printf("#we have a NULL father in FieldAccess\n");
    localScope = new Scope();
    localScope->SetParent(father);
    if(base)    base->BuildScope(localScope);
}
Type *FieldAccess::GetType(Scope* scope){
    // def FieldAccess + base=NULL is the most basic function!
    //if(DEBUG_CHECK) printf("#Start GetType of FieldAccess!\n");
    if (base) {
        Type *baseType = base->GetType(scope);//if type is a NamedType
        if (baseType == Type::errorType)
            return Type::errorType;
        if (DEBUG_CHECK) printf("#Finish errorType in FieldAccess\n");
        // if is class
        if (!baseType->IsPrimitiveType() && !baseType->IsArrayType()) {
            NamedType *baseNamedType = dynamic_cast<NamedType *>(baseType);
            if (DEBUG_CHECK) printf("#In FieldAcess::GetType, Finish convert NamedType, it is %s\n",baseNamedType->GetId()->GetName());
            const char* query = baseNamedType->GetTypeName(); // Person
            // decl1: Person person;
            ClassDecl *decl1 = dynamic_cast<ClassDecl*>(scope->LookupDecl(query)); // Person
            if (DEBUG_CHECK) printf("#Get decl1 in GetType\n");
            // decl2: Person.field
            VarDecl *decl2 = dynamic_cast<VarDecl*>(decl1->GetScope()->GetSymTable()->Lookup(field->GetName())); // name
            if (DEBUG_CHECK) printf("#Get decl2 in GetType\n");
            // if decl2 is not a variable
            if (!decl2)
                return Type::errorType;
            else {
                if(DEBUG_CHECK) printf("#we are going to check this access is inside the same class\n");
                // check it's defined in it's own class or it's subclass
                Node *node = this->parent;
                while (node!=NULL) { // not NULL
                    // * We know it either doesn't extends or extend the correct one
                    // we check if it's in ClassDecl
                    if(DEBUG_CHECK) printf("#we are loop in the level of %s\n",node->GetPrintNameForNode());
                    if (!strcmp(node->GetPrintNameForNode(),"ClassDecl")) {
                        // node is a classDecl decl2 is a classDecl
                        ClassDecl *nodeDecl = dynamic_cast<ClassDecl*>(node);
                        if (nodeDecl->GetId() == decl1->GetId()){
                            if(DEBUG_CHECK)   printf("#so, we return the type\n");
                            return decl2->GetType();
                        } 
                        else{
                            return Type::errorType;
                        }
                    }
                    node = node->GetParent();
                }
                if(DEBUG_CHECK) printf("#so, the call is not inside the class\n");
                //if we cannot find class decl outside
                return Type::errorType;
            }
        }
        else { // if it's not a class, report "has no such field"
           return Type::errorType;
        }
    }
    VarDecl *decl = dynamic_cast<VarDecl *>(scope->LookupDecl(field->GetName()));
    if (!decl)
        return Type::errorType;
    else
        return decl->GetType();
}
void FieldAccess::Check(Scope *scope) {
    if (base) {
        if (DEBUG_CHECK) printf("#Start FieldAccess\n");
        base->Check(scope);
        if (DEBUG_CHECK) printf("#finish base Check\n");
        Type *baseType = base->GetType(scope);//if type is a NamedType
        if (baseType == Type::errorType)
            return;
        if (DEBUG_CHECK) printf("#Base is not errorType in FieldAccess\n");
        // if is class
        if (!baseType->IsPrimitiveType() && !baseType->IsArrayType()) {
            NamedType *baseNamedType = dynamic_cast<NamedType *>(baseType);
            if (DEBUG_CHECK) printf("#In FieldAcess::Check, Finish convert NamedType, it is %s\n",baseNamedType->GetId()->GetName());
            const char* query = baseNamedType->GetTypeName(); // Person
            // decl1: Person person;
            ClassDecl *decl1 = dynamic_cast<ClassDecl*>(scope->LookupDecl(query)); // Person
            if (DEBUG_CHECK) printf("#Get decl1 in FieldAcess::Check\n");
            // decl2: Person.field
            VarDecl *decl2 = dynamic_cast<VarDecl*>(decl1->GetScope()->GetSymTable()->Lookup(field->GetName())); // name
            if (DEBUG_CHECK) printf("#Get decl2 in FieldAcess::Check\n");
            // If decl2 is not a variable
            if (!decl2) {
                if (DEBUG_CHECK) printf("#Field not found in base\n");
                ReportError::FieldNotFoundInBase(field, baseNamedType);
                return;
            }
            else {
                // * Check it's defined in it's own class or it's subclass
                if (DEBUG_CHECK) printf("#Field found in base.\n");
                Node *node = this->parent;
                while (node) { // not NULL
                    // * We know it either doesn't extends or extend the correct one
                    // we check if it's in ClassDecl
                    if (!strcmp(node->GetPrintNameForNode(),"ClassDecl")) {
                       // node is a classDecl decl2 is a classDecl
                       ClassDecl *nodeDecl = dynamic_cast<ClassDecl*>(node);
                       if (nodeDecl->GetId() == decl1->GetId()) return;
                       else{
                           ReportError::InaccessibleField(field, baseNamedType);
                           return;
                       }
                    }
                    node = node->GetParent();
                }
                // if we cannot find class decl outside
                ReportError::InaccessibleField(field, baseNamedType);
                return;
            }
        }
        else { // if it's not a class, report "has no such field"
            ReportError::FieldNotFoundInBase(field, baseType);
            return;
        }
    }
    // no base
    VarDecl *decl = dynamic_cast<VarDecl *>(scope->LookupDecl(field->GetName()));
    if (!decl) {
        if (DEBUG_CHECK) printf("#Identifier Not Declared\n");
        ReportError::IdentifierNotDeclared(field, LookingForVariable);
        return;
    }
    else
        return;
}
bool FieldAccess::IsAccessClass(){
    // * two case: have base, or we need to lookup for a base
    if(base) return true;
    Decl* decl = localScope->LookupDecl(field->GetName());// find the decl
    VarDecl* varDecl = dynamic_cast<VarDecl*>(decl);
    return varDecl->GetUnderClass();
}
int FieldAccess::GetMemBytes(){
    if(base)
        return 4;
    // if we are using decl in classDecl's fnDecl, we need to return 4
    //Try to find the VarDecl
    Assert(localScope);
    Decl* decl = localScope->LookupDecl(field->GetName());
    Assert(decl);
    VarDecl* vardecl = dynamic_cast<VarDecl*>(decl);
    ClassDecl* cls = dynamic_cast<ClassDecl*>(vardecl->GetParent());
    Assert(vardecl);
    if(DEBUG_FieldAccess_GetMemBytes&&vardecl->GetUnderClass()) printf("#We read a value %s from Class\n",vardecl->GetId());
    if(vardecl&&cls)
        return 4;
    else
        return 0;
}
bool FieldAccess::IsThisAccess(){
    if(!base)
        return true;
    This* this_base = dynamic_cast<This*>(base);
    if(this_base)
        return true;
    return false;
}
int FieldAccess::GetOffset(CodeGenerator* cg){
    if(DEBUG_FieldAccess_Emit) printf("#we are going to Emit a FieldAccess\n");
    //Example like:
    //Class-2 : other.x
    if (base) {
        // access member of This class
        //firstly we want to find the location of other
        if(!strcmp(base->GetPrintNameForNode(), "This")){
            Node* node = this->GetParent();
            ClassDecl* classDecl;
            while(node->GetParent()){
                classDecl = dynamic_cast<ClassDecl*>(node);
                if(classDecl!=NULL)
                    break;
                node = node->GetParent();
            }
            //so we get the classDecl
            Decl* decl = classDecl->GetScope()->LookupDecl(field->GetName());
            VarDecl* vr = dynamic_cast<VarDecl*>(decl);
            return vr->GetMemLoc()->GetOffset();
        }
        //first we should find the base location
        Location *base_loc = base->Emit(cg);
        //find the base Class first
        Type* type = base->GetType(localScope);
        NamedType* namedType = dynamic_cast<NamedType*>(type);
        ClassDecl* cls = localScope->LookupClassDecl(namedType);
        VarDecl* field_offset = dynamic_cast<VarDecl*>(cls->GetScope()->LookupDecl(field->GetName()));
        return field_offset->GetMemLoc()->GetOffset();
    }
    else {
        if(DEBUG_FieldAccess_Emit&&localScope==NULL){
            printf("#Local_scope is NULL\n");
            if(field==NULL) printf("#field is NULL\n");
            printf("#we are going to find %s",field->GetName());
        }
        Decl* decl = localScope->LookupDecl(field->GetName());
        while(decl == NULL && localScope->GetParent() != NULL) {
            localScope = localScope->GetParent();
            decl = localScope->LookupDecl(field->GetName());
        }
        Assert(decl != NULL);
        VarDecl* varDecl = dynamic_cast<VarDecl*>(decl);
        Assert(varDecl != NULL);
        if(DEBUG_FieldAccess_Emit&&varDecl==NULL&&DEBUG_EMIT) printf("#we find a undefined value\n");
        Location *loc = varDecl->GetMemLoc(); // e.g. new Location(gpRelative, offset, v->GetName());
        Assert(loc != NULL);
        return loc->GetOffset();
    }
}
Location *FieldAccess::Emit(CodeGenerator *cg) {
    if(DEBUG_FieldAccess_Emit) printf("#we are going to Emit a FieldAccess on %s\n",field->GetName());
    //Example like:
    //Class-2 : other.x
    if (base) {
        // case1: if base is This
        if(!strcmp(base->GetPrintNameForNode(), "This")){
            Node* node = this->GetParent();
            ClassDecl* classDecl;
            while(node->GetParent()){
                classDecl = dynamic_cast<ClassDecl*>(node);
                if(classDecl!=NULL) break;
                node = node->GetParent();
            }
            // then we get the classDecl
            Decl* decl = classDecl->GetScope()->LookupDecl(field->GetName());
            VarDecl* vr = dynamic_cast<VarDecl*>(decl);
            Location* offset = vr->GetMemLoc();
            int VarOffset = offset->GetOffset();
            if(DEBUG_FieldAccess_Emit) printf("#access this. return with offset %d\n",VarOffset);
            Location *thisLoc = classDecl->Getthis();
            Location *reLoc = cg->GenLoad(thisLoc,VarOffset);
            Assert(reLoc!=NULL);
            return reLoc;
        }

        // case2: if base is not This
        Location *base_loc = base->Emit(cg);
        // find the base Class first
        Type* type = base->GetType(localScope);
        NamedType* namedType = dynamic_cast<NamedType*>(type);
        ClassDecl* cls = localScope->LookupClassDecl(namedType);
        VarDecl* field_offset = dynamic_cast<VarDecl*>(cls->GetScope()->LookupDecl(field->GetName()));
        int fd_offset = field_offset->GetMemLoc()->GetOffset();
        if(DEBUG_FieldAccess_Emit) printf("#we got the base and offset %d\n",fd_offset);
        return cg->GenLoad(base_loc,fd_offset);
    }
    else {
        if(DEBUG_FieldAccess_Emit) printf("#we are going to Emit a no_base FieldAccess on %s\n",field->GetName());

        Decl* decl = localScope->LookupDecl(field->GetName());
        VarDecl* varDecl = dynamic_cast<VarDecl*>(decl);
        Assert(varDecl != NULL);
        Location *loc = varDecl->GetMemLoc(); // e.g. new Location(gpRelative, offset, v->GetName());
        Assert(loc!=NULL);
        // if this varDecl is a member of Class
        if(varDecl->GetUnderClass()){
            if(DEBUG_FieldAccess_Emit) printf("#We find a decl under class on %s\n",field->GetName());
            ClassDecl* classDecl = dynamic_cast<ClassDecl*>(varDecl->GetParent());
            Location *thisLoc = classDecl->Getthis();
            Assert(thisLoc!=NULL);
            Location *retLoc = cg->GenLoad(thisLoc,loc->GetOffset());
            Assert(retLoc!=NULL);
            return retLoc;
        }
        Assert(loc != NULL);
        if(DEBUG_FieldAccess_Emit) printf("#We find a decl out of class on %s\n",field->GetName());

        return loc;
    }
}
Location *FieldAccess::GetAddress(CodeGenerator* cg){
    if(DEBUG_FieldAccess_Emit) printf("#we are going to Emit a FieldAccess\n");
    //Example like:
    //Class-2 : other.x
    if (base) {
        // access member of This class
        //firstly we want to find the location of other
        if(!strcmp(base->GetPrintNameForNode(), "This")){
            Node* node = this->GetParent();
            ClassDecl* classDecl;
            while(node->GetParent()){
                classDecl = dynamic_cast<ClassDecl*>(node);
                if(classDecl!=NULL)
                    break;
                node = node->GetParent(); 
            }
            //so we get the classDecl
            Decl* decl = classDecl->GetScope()->LookupDecl(field->GetName());
            VarDecl* vr = dynamic_cast<VarDecl*>(decl);
            return vr->GetMemLoc();
        }
        //first we should find the base location    
        Location *base_loc = base->Emit(cg);
        return base_loc;
    }
    else {
        if(DEBUG_FieldAccess_Emit&&localScope==NULL){
            printf("#Local_scope is NULL\n");
            if(field==NULL) printf("#field is NULL\n");
            printf("#we are going to find %s",field->GetName());
        } 
        Decl* decl = localScope->LookupDecl(field->GetName());
        while(decl == NULL && localScope->GetParent() != NULL) {
            localScope = localScope->GetParent();
            decl = localScope->LookupDecl(field->GetName());
        }
        Assert(decl != NULL);
        VarDecl* varDecl = dynamic_cast<VarDecl*>(decl);
        Assert(varDecl != NULL);
        if(DEBUG_FieldAccess_Emit&&varDecl==NULL&&DEBUG_EMIT) printf("#we find a undefined value\n");
        Location *loc = varDecl->GetMemLoc(); // e.g. new Location(gpRelative, offset, v->GetName());
        Assert(loc != NULL);
        return loc;
    }
}
Call::Call(yyltype loc, Expr *b, Identifier *f, List<Expr*> *a) : Expr(loc)  {
    Assert(f != NULL && a != NULL); // b can be be NULL (just means no explicit base)
    base = b;
    if (base) base->SetParent(this);
    (field=f)->SetParent(this);
    (actuals=a)->SetParentAll(this);
}
void Call::BuildScope(Scope* father){
    localScope = father;
    if(base)  base->BuildScope(father);
    for(int i=0;i<actuals->NumElements();i++){
        actuals->Nth(i)->BuildScope(father);
    }
}
Type *Call::GetType(Scope *scope) {
    if(base){
        Type *baseType = base->GetType(scope);
        if(baseType==Type::errorType)// * will check base here
            return Type::errorType;
        // if base is class
        if (!baseType->IsPrimitiveType() && !baseType->IsArrayType()) {
            NamedType *baseNamedType = dynamic_cast<NamedType*>(baseType); // Person
            if(DEBUG_CHECK)   printf("#In Call, we are going to find the Class %s\n",baseNamedType->GetTypeName());
            ClassDecl* classDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(baseNamedType->GetTypeName())); // class Person {}
            if(!classDecl) {
                if (DEBUG_CHECK) printf("#Can't find classDecl\n");
                return Type::errorType;
            }
            FnDecl* fnDecl = dynamic_cast<FnDecl*>(classDecl->GetScope()->GetSymTable()->Lookup(field->GetName())); // name
            if(!fnDecl) {
                if (DEBUG_CHECK) printf("#Can't find fnDecl\n");
                return Type::errorType;
            }
            if(DEBUG_CHECK) printf("#we return the fn's return\n");
            return fnDecl->GetReturnType();
        }
        else {
            // * Special case for array
            if (baseType->IsArrayType() && !strcmp(field->GetName(),"length")) {
                if (actuals->NumElements() != 0) return Type::errorType;
                return Type::intType;
            }
            return Type::errorType;
        }

    }
    FnDecl* decl = dynamic_cast<FnDecl*>(scope->LookupDecl(field->GetName()));
    if(!decl)
        return Type::errorType;
    else
        return decl->GetReturnType(); // just give the declared type!
}
void Call::Check(Scope *scope) {
    if(base){
        if (DEBUG_CHECK) printf("#Start Call\n");
        base->Check(scope);
        Type *baseType = base->GetType(scope);
        if(baseType==Type::errorType)// * will check base here
            return;
        // if base is class
        if (!baseType->IsPrimitiveType() && !baseType->IsArrayType()) {
            NamedType *baseNamedType = dynamic_cast<NamedType*>(baseType);
            // decl1: Person person;
            ClassDecl* classDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(baseNamedType->GetTypeName()));
            FnDecl* decl2;
            if (!classDecl){// We do not find this class
                // So it can be an interface
                if(DEBUG_CHECK) printf("#we are trying to find Interfac %s\n",baseNamedType->GetTypeName());
                InterfaceDecl* Interdecl = dynamic_cast<InterfaceDecl*>(scope->LookupDecl(baseNamedType->GetTypeName()));
                if(DEBUG_CHECK) printf("#we finish this try\n");
                if(!Interdecl){
                    return;
                }
                else{
                    decl2 = dynamic_cast<FnDecl*>(Interdecl->GetScope()->GetSymTable()->Lookup(field->GetName()));
                }
            }
            else{ // we find class
                decl2 = dynamic_cast<FnDecl*>(classDecl->GetScope()->GetSymTable()->Lookup(field->GetName())); // name
            }
             
            // if decl2 is not a function
            if(!decl2) {
                ReportError::FieldNotFoundInBase(field,baseType);
            }

            //Then decl3: Fn(int a, int b, int c)
            //If Check all the scope

            if(DEBUG_CHECK)   printf("#Start to check all the actuals in Fn\n");
            for(int i=0; i<this->actuals->NumElements();i++) {
                this->actuals->Nth(i)->Check(scope);
            }

            if(!decl2) // should no longer proceed
                return;

            if(this->actuals->NumElements()!= decl2->GetFormals()->NumElements())
                ReportError::NumArgsMismatch(field,
                                             decl2->GetFormals()->NumElements(),
                                             this->actuals->NumElements());

            int actual_cnt=0;
            while(actual_cnt < this->actuals->NumElements()
                  && actual_cnt < decl2->GetFormals()->NumElements()) {
                if(DEBUG_CHECK) printf("#now we check the %d in actual_cnt\n",actual_cnt);
                Type* actual_type = this->actuals->Nth(actual_cnt)->GetType(scope);
                Type* formal_type = decl2->GetFormals()->Nth(actual_cnt)->GetType();

                if(actual_type==Type::errorType){
                    actual_cnt++;
                    continue;
                }
                
                if(formal_type->IsEquivalentTo(actual_type)){
                    actual_cnt++;
                    continue;
                }
                // if both are objects
                if(!formal_type->IsPrimitiveType()&&!actual_type->IsPrimitiveType()
                  &&!formal_type->IsArrayType()&&!actual_type->IsArrayType()){
                    NamedType* NamedFormal = dynamic_cast<NamedType*>(formal_type);
                    NamedType* NamedActual = dynamic_cast<NamedType*>(actual_type);
                    if(scope->IsSuperType(NamedFormal,NamedActual)){
                        actual_cnt++;
                        continue;
                    }
                } 
                ReportError::ArgMismatch(this->actuals->Nth(actual_cnt)
                            ,actual_cnt+1
                            ,actual_type
                            ,formal_type);
                actual_cnt++;
            }
            if (DEBUG_CHECK) printf("#Finish Call.\n");
            return;
        }
        else {
            // * Special case for array
            if (baseType->IsArrayType() && !strcmp(field->GetName(),"length")) {
                if (actuals->NumElements() != 0)
                    ReportError::NumArgsMismatch(field, 0, actuals->NumElements());
                return;
            }
            if (DEBUG_CHECK) printf("#Identifier Not Declared1\n");
            ReportError::FieldNotFoundInBase(field,baseType);
            return;
        }
        return;
    }

    // no base
    FnDecl* decl2 = dynamic_cast<FnDecl*>(scope->LookupDecl(field->GetName()));
    if(DEBUG_CHECK) printf("#we are going to check this function\n");
    if(!decl2) {
        if (DEBUG_CHECK) printf("#Identifier Not Declared2\n");
        ReportError::IdentifierNotDeclared(field,reasonT::LookingForFunction);
    }
    else {
        for(int i=0; i<this->actuals->NumElements();i++) {
            this->actuals->Nth(i)->Check(scope);
        }

        if(this->actuals->NumElements()!= decl2->GetFormals()->NumElements())
            ReportError::NumArgsMismatch(field,
                                         decl2->GetFormals()->NumElements(),
                                         this->actuals->NumElements());

        int actual_cnt=0;
        if(DEBUG_CHECK) printf("#we are goint to check the actuals' type\n");
        while(actual_cnt < this->actuals->NumElements()
              &&actual_cnt < decl2->GetFormals()->NumElements()) {
            if(DEBUG_CHECK) printf("#we are checking %d actual in Fn\n",actual_cnt);
            Type* actual_type = this->actuals->Nth(actual_cnt)->GetType(scope);
            Type* formal_type = decl2->GetFormals()->Nth(actual_cnt)->GetType();
            if(actual_type==Type::errorType){
                actual_cnt++;
                continue;
            }
                
            if(!actual_type->IsEquivalentTo(formal_type)) {
                // special case for subClass
                if (!actual_type->IsPrimitiveType() && !actual_type->IsArrayType()
                    && !formal_type->IsPrimitiveType() && !formal_type->IsArrayType()
                    && scope->IsSuperType(formal_type, actual_type)) return;
                ReportError::ArgMismatch(this->actuals->Nth(actual_cnt)
                        ,actual_cnt+1
                        ,actual_type
                        ,formal_type);

            }

            actual_cnt++;
        }
    }

}
Location *Call::Emit(CodeGenerator *cg) {
    if (DEBUG_Call_Emit) printf("##we are Emit Call of fnc %s\n",field->GetName());
    Location* ret = NULL;
    if (DEBUG_Call_Emit) printf("##Enter Call's Emit()\n");
    This* this_base = dynamic_cast<This*>(base);
    
    //we have real base
    if(base&&!this_base) {
        if (DEBUG_Call_Emit) printf("#Enter Call with base for Call's Emit()\n");
        Type *type = base->GetType(localScope);
        // def special case: for array
        if(type->IsArrayType() && !strcmp(field->GetName(), "length")) {
            // -4 No matter which type
            // *(arr + -4)
            if (DEBUG_Call_Emit) printf("##Finish Call's Emit() for array\n");
            return cg->GenLoad(base->Emit(cg), -CodeGenerator::VarSize); // base is usually a fieldAccess
        }
        // def for an object
        else if (!type->IsArrayType() && !type->IsPrimitiveType()) {
            // e.g.
            // 	_tmp5 = 1 ;
            //	_tmp6 = 2 ;
            //	_tmp7 = *(person) ;
            //	_tmp8 = *(_tmp7) ;
            //	PushParam _tmp6 ;
            //	PushParam _tmp5 ;
            //	PushParam person ;
            //	_tmp9 = ACall _tmp8 ;
            //	PopParams 12
            if (DEBUG_Call_Emit) printf("## Call's Emit() for normal case\n");
            int n = actuals->NumElements();
            List<Location*> *locs = new List<Location*>();
            for(int i = 0; i< n;i++)
                locs->Append(actuals->Nth(i)->Emit(cg));

            Location *classloc = base->Emit(cg);

            Location *baseLoc = cg->GenLoad(classloc);
            // * Then we need to get the offset of function
            NamedType *namedType = dynamic_cast<NamedType*>(type);
            ClassDecl *classDecl = localScope->LookupClassDecl(namedType);
            FnDecl *fnDecl = dynamic_cast<FnDecl*>(classDecl->GetScope()->LookupDecl(field->GetName()));
            // Now we get the offset
            Location *methodLoc = cg->GenLoad(baseLoc,fnDecl->GetLocalOffset());
            
            fnDecl->GetReturnType();
           
            for(int i = n-1; i >= 0; i--) {
                cg->GenPushParam(locs->Nth(i));
            }
            cg->GenPushParam(classloc);
            if(fnDecl->GetReturnType()->IsEquivalentTo(Type::voidType))
                cg->GenACall(methodLoc, !fnDecl->GetReturnType()->IsEquivalentTo(Type::voidType));
            else
                ret=cg->GenACall(methodLoc, !fnDecl->GetReturnType()->IsEquivalentTo(Type::voidType));
            cg->GenPopParams((n+1) * CodeGenerator::VarSize);
            if (DEBUG_Call_Emit) printf("##Finish Call's Emit() for object\n");
            return ret;
        }
        // should not been here!
        Assert(false);
        return NULL;
    }
    else {
        if (DEBUG_Call_Emit) printf("##we are Emit call of no_base fnc %s\n",field->GetName());
        Decl* d = localScope->LookupDecl(field->GetName());
        while (d == NULL && localScope != NULL) {
            localScope = localScope->GetParent();
            if (localScope == NULL) break;
            d = localScope->LookupDecl(field->GetName());
        }
        
        FnDecl* f = dynamic_cast<FnDecl*>(d);
        
        Node* n =this->GetParent();
        FnDecl* out_fn = dynamic_cast<FnDecl*>(localScope->LookupDecl(field->GetName()));
        ClassDecl* out_class = dynamic_cast<ClassDecl*>(out_fn->GetParent());
        bool out_of_class_call = (out_class==NULL);
        // def Case1: called in main()
        if (out_of_class_call) {
            // e.g.
            // 	_tmp2 = 1 ;
            //	_tmp3 = 2 ;
            //	PushParam _tmp3 ;
            //	PushParam _tmp2 ;
            //	_tmp4 = LCall _add ;
            //	PopParams 8 ;
            if(DEBUG_Call_Emit) printf("#we call a function out of class\n");
            int n = actuals->NumElements();
            List<Location*> *locs = new List<Location*>();
            for(int i = 0; i< n;i++)
                locs->Append(actuals->Nth(i)->Emit(cg));
            for(int i = n-1; i >= 0; i--) {
                cg->GenPushParam(locs->Nth(i));
            }
            // if no return value (void type), no _tmp will be generated
            bool hasReturnValue = !f->GetReturnType()->IsEquivalentTo(Type::voidType);
            Location *returnValue = cg->GenLCall(f->GetLabel(), hasReturnValue);
            // pop n * 4 bytes
            cg->GenPopParams(n * CodeGenerator::VarSize);
            return returnValue;
        }
        // def Case2: called in function defined in class
        else {
            // e.g.
            //	_tmp0 = 1 ;
            //	_tmp1 = *(this) ;
            //	_tmp2 = *(_tmp1) ;
            //	PushParam _tmp0 ;
            //	PushParam a ;
            //	PushParam this ;
            //	ACall _tmp2 ;
            //	PopParams 12 ;
            if (DEBUG_Call_Emit) printf("##we are Emit call of no_base in_class_call fnc %s\n",field->GetName());
            int n = actuals->NumElements();
            List<Location*> *locs = new List<Location*>();
            for(int i = 0; i< n;i++)
                locs->Append(actuals->Nth(i)->Emit(cg));

            
            Scope *scope = localScope;
            Decl *decl = scope->LookupDecl(f->GetId());
            while (decl == NULL && scope->GetParent() != NULL) {
                scope = scope->GetParent();
                decl = scope->LookupDecl(f->GetId());
            }
            Assert(decl != NULL);
            FnDecl *fnDecl = dynamic_cast<FnDecl*>(decl);
            ClassDecl* classDecl = dynamic_cast<ClassDecl*>(fnDecl->GetParent());
            Location* loc_this = classDecl->Getthis();
            Location *methodLoc = cg->GenLoad(loc_this);
            methodLoc = cg->GenLoad(methodLoc, fnDecl->GetLocalOffset());

            for(int i = n-1; i >= 0; i--) {
                cg->GenPushParam(locs->Nth(i));
            }
            Location* destloc;
            cg->GenPushParam(loc_this);
            destloc=cg->GenACall(methodLoc, !f->GetReturnType()->IsEquivalentTo(Type::voidType));
            cg->GenPopParams((n+1) * CodeGenerator::VarSize);
            if (DEBUG_Call_Emit) printf("##we finished Emit a call of no_base in_class_call fnc %s\n",field->GetName());
            return destloc;
        }

        if (DEBUG_Call_Emit) printf("#Finish Call's Emit() with no base\n");
    }
}
int Call::GetMemBytes(){
    //fix built fnc:
    // a.length();
   

    int ret_size=0;
    int base_size=0;
    int actuals_size=0;
    for(int i=0; i<actuals->NumElements();i++){
        actuals_size+=actuals->Nth(i)->GetMemBytes();
    }

    if(base){
        Type *type = base->GetType(localScope);
        
        if(type->IsArrayType()){
            if(!strcmp(field->GetName(),"length"))
                return base->GetMemBytes()+4;
        }

        base_size = base->GetMemBytes();
        Type* basetype = base->GetType(localScope);
        //so we will get type in the center
        
        while(basetype->IsArrayType()){
            ArrayType* type =dynamic_cast<ArrayType*>(basetype);
            basetype = type->GetElementType();
        }
        //this is Call on a class
        base_size += 8;
        NamedType* namedtype = dynamic_cast<NamedType*>(basetype);
        ClassDecl* decl = dynamic_cast<ClassDecl*>(localScope->LookupDecl(namedtype->GetTypeName()));
        FnDecl* fnl = dynamic_cast<FnDecl*>(decl->GetScope()->LookupDecl(field->GetName()));
        Type* returnType = fnl->GetReturnType();
        //if we have ret_value then we should give it space
        if(returnType->IsEquivalentTo(Type::voidType))
            ret_size = 0;
        else
            ret_size = 4; 
    }
    //Like: run();  
    else{
        Decl* decl = localScope->LookupDecl(field->GetName());
        FnDecl* vard = dynamic_cast<FnDecl*>(decl);
        
        //even we donot have base, we may use hidden "this."
        ClassDecl* outclass = dynamic_cast<ClassDecl*>(vard->GetParent());
        if(outclass)
            base_size = 8;
        else
            base_size = 0;

        Type* returnType = vard->GetReturnType();
        if(DEBUG_Call_GetMemBytes){
            if(returnType==NULL)
                printf("#we cannot find the returnType in DEBUG_Call_GetMemBytes\n");
            else
                printf("#we find the returnType in DEBUG_Call_GetMemBytes\n");
        }
        //if we have ret_value then we should give it space
        if(returnType->IsEquivalentTo(Type::voidType))
            ret_size = 0;
        else
            ret_size = 4;
    }
        
    return ret_size+base_size+actuals_size;
}
Type *This::GetType(Scope *scope) {
    Node *node = this->parent;
    while (node) { // not NULL
        // we check if it's in ClassDecl
        if (!strcmp(node->GetPrintNameForNode(),"ClassDecl")) {
            ClassDecl* classDecl = dynamic_cast<ClassDecl*>(node);
            return classDecl->GetNamedType();
        }
        node = node->GetParent();
    }
    return Type::errorType;
}
void This::Check(Scope *scope) {
    if(DEBUG_CHECK) printf("#Start to check This\n");
    Node *node = this->parent;
    while (node) {
        if (!strcmp(node->GetPrintNameForNode(),"ClassDecl"))
            return;
        node = node->GetParent();
    }
    ReportError::ThisOutsideClassScope(this);
    return;
}
Location *This::Emit(CodeGenerator *cg) {
    // if(/*internal location of this stmt does not exist*/)
    //  /*internal location*/ = /*new location that is gpRelative with offset 4 and name "this"*/
    //we shoud get out of 
    Node *node = this->GetParent();
                ClassDecl* classDecl = dynamic_cast<ClassDecl*>(node);
                while(node){
                    classDecl = dynamic_cast<ClassDecl*>(node);
                    if(classDecl) break;
                    node = node->GetParent();
                }
    Location*   base_address = classDecl->Getthis();
    return base_address;
}
NewExpr::NewExpr(yyltype loc, NamedType *c) : Expr(loc) {
  Assert(c != NULL);
  (cType=c)->SetParent(this);
}
Type *NewExpr::GetType(Scope *scope) {
    return cType;
}
void NewExpr::Check(Scope *scope) {
    if(cType->IsPrimitiveType())
        return;
    // then cType is a Class
    if(DEBUG_CHECK) printf("#So, we are going to find Type name %s\n",cType->GetTypeName());
    ClassDecl* decl = dynamic_cast<ClassDecl*>(scope->LookupDecl(cType->GetTypeName()));
    if(!decl)
        ReportError::IdentifierNotDeclared(cType->GetId(), LookingForClass);
}
Location *NewExpr::Emit(CodeGenerator *cg) {
    // e.g. for Student class with two fields
    // 	_tmp0 = 4 + 4*field (not including methods) ;
    //	PushParam _tmp0 ;
    //	_tmp1 = LCall _Alloc ;
    //	PopParams 4 ;
    //	_tmp2 = Student ;
    //	*(_tmp1) = _tmp2 ;
    //	student = _tmp1 ;  (not included in this one)
    ClassDecl* decl = dynamic_cast<ClassDecl*>(localScope->LookupDecl(cType->GetTypeName()));

    Location *classSize = cg->GenLoadConstant(decl->GetMemBytes());
    // cg->GenPushParam(classSize);
    Location *object = cg->GenBuiltInCall(Alloc, classSize);
    // cg->GenPopParams(CodeGenerator::VarSize);
    Location *className = cg->GenLoadLabel(cType->GetTypeName()); // _tmp2 = Student
    cg->GenStore(object, className);
    return object;
}
NewArrayExpr::NewArrayExpr(yyltype loc, Expr *sz, Type *et) : Expr(loc) {
    Assert(sz != NULL && et != NULL);
    (size=sz)->SetParent(this);
    (elemType=et)->SetParent(this);
}
void NewArrayExpr::BuildScope(Scope* father){
    localScope = father;
    if(size) size->BuildScope(father);
}
Type *NewArrayExpr::GetType(Scope *scope) {
    Type* size_Type = size->GetType(scope);
    if(size_Type==Type::errorType)
        return Type::errorType;
     return new ArrayType(*this->location, elemType);
}
void NewArrayExpr::Check(Scope *scope) {
    size->Check(scope);
    Type* sizeType = size->GetType(scope);
    //printf("#Finish get SizeType\n");
    if(sizeType->IsEquivalentTo(Type::errorType))
        return;
    //printf("#Finish check SizeType\n");
    if(!sizeType->IsEquivalentTo(Type::intType))
        ReportError::NewArraySizeNotInteger(size);
    //then we need to check whether the type exits.

    Type* neededType = elemType;
    while(neededType->IsArrayType()){
        neededType = dynamic_cast<ArrayType*>(neededType)->GetElementType();
    }
    //then neededType is not a element type now
    if(neededType->IsPrimitiveType())
        return;
    NamedType* ClassType = dynamic_cast<NamedType*>(neededType);
    ClassDecl* decl = dynamic_cast<ClassDecl*>(scope->LookupDecl(ClassType->GetTypeName()));
    if(!decl)
        ReportError::IdentifierNotDeclared(ClassType->GetId(), LookingForType);
    if (DEBUG_CHECK) printf("#Finish NewArrayExpr\n");
}
Location *NewArrayExpr::Emit(CodeGenerator *cg) {
    // Example:
    /*	_tmp0 = size ;
    	_tmp1 = 1 ;
    	_tmp2 = _tmp0 < _tmp1 ;
    	IfZ _tmp2 Goto _L0 ;
    	_tmp3 = "Decaf runtime error: Array size is <= 0\n" ;
    	PushParam _tmp3 ;
    	LCall _PrintString ;
    	PopParams 4 ;
    	LCall _Halt ;
    _L0:
    	_tmp4 = 1 ;
    	_tmp5 = _tmp4 + _tmp0 ;
    	_tmp6 = 4 ;
    	_tmp7 = _tmp5 * _tmp6 ;
    	PushParam _tmp7 ;
    	_tmp8 = LCall _Alloc ;
    	PopParams 4 ;
    	*(_tmp8) = _tmp0 ;
    	_tmp9 = _tmp8 + _tmp6 ;
    	arr = _tmp9 ;
    	EndFunc ; */
    if(DEBUG_EMIT) printf("#Start to Emit NewArray\n");
    // will generate a new label, such as "_L0:"
    return cg->GenNewArray(size->Emit(cg));
    if(DEBUG_EMIT) printf("#Finished Emiting NewArray\n");
}
int NewArrayExpr::GetMemBytes()
{   return size->GetMemBytes() + 9 * CodeGenerator::VarSize;
}
CompoundExpr::CompoundExpr(Expr *l, Operator *o, Expr *r)
        : Expr(Join(l->GetLocation(), r->GetLocation())) {
    Assert(l != NULL && o != NULL && r != NULL);
    (op=o)->SetParent(this);
    (left=l)->SetParent(this);
    (right=r)->SetParent(this);
}
CompoundExpr::CompoundExpr(Operator *o, Expr *r)
        : Expr(Join(o->GetLocation(), r->GetLocation())) {
    Assert(o != NULL && r != NULL);
    left = NULL;
    (op=o)->SetParent(this);
    (right=r)->SetParent(this);
}
Location* CompoundExpr::Emit(CodeGenerator* cg) {
    op->Emit(cg);
    if(left)
        left->Emit(cg);
    if(right)
        right->Emit(cg);
    return NULL;
}
void CompoundExpr::BuildScope(Scope* father){
    localScope = father;
    if(left) left->BuildScope(father);
    if(right) right->BuildScope(father);
}
int CompoundExpr::GetMemBytes(){
    int ret=0;
    int op_size = op->GetMemBytes();
    if(left)    ret+=left->GetMemBytes();
    if(right)   ret+=right->GetMemBytes();
    return ret;
}
Type *ArithmeticExpr::GetType(Scope *scope) {
    // def Two operands must be either both int or both double for binary one,
    // must be int or double for unary one
    if (left) {  // binary
        Type *leftType  = left->GetType(scope);
        Type *rightType = right->GetType(scope);

        if(leftType==Type::errorType)
            return Type::errorType;
        if(rightType==Type::errorType)
            return Type::errorType;

        if (leftType->IsEquivalentTo(rightType))  {
            if (leftType->IsEquivalentTo(Type::intType) ||
                    leftType->IsEquivalentTo(Type::doubleType))  return leftType;
            else return Type::errorType;
        }
        else return Type::errorType;
    }
    // unary
    Type *rightType = right->GetType(scope);

    if(rightType==Type::errorType)
        return Type::errorType;

    if (rightType->IsEquivalentTo(Type::intType) ||
            rightType->IsEquivalentTo(Type::doubleType))  return rightType;
    else return Type::errorType;
}
void ArithmeticExpr::Check(Scope *scope) {
    // printf("#this is ArithmeticExpr\n");

    if (left) { // binary
        // if left/right a single variable, it will be FieldAccess
        left->Check(scope);
        right->Check(scope);
        Type *leftType = left->GetType(scope);
        Type *rightType = right->GetType(scope);
        if(leftType==Type::errorType)
            return;
        if(rightType==Type::errorType)
            return;
        // printf("#left and right have their type\n");
        if (!leftType->IsEquivalentTo(rightType)
            || !(leftType->IsEquivalentTo(Type::intType) || leftType->IsEquivalentTo(Type::doubleType)))
            // pass type instead of expr
            ReportError::IncompatibleOperands(op, leftType, rightType);
    }
    else {
        right->Check(scope);
        Type *rightType = right->GetType(scope);
        if (!(rightType->IsEquivalentTo(Type::intType)
              || rightType->IsEquivalentTo(Type::doubleType)))
            ReportError::IncompatibleOperand(op, rightType);
    }
}
Location *ArithmeticExpr::Emit(CodeGenerator *cg) {
    if (left) { // binary
        // * recursively call subcomponent's Emit(), just like Check()
        Location *op1 = left->Emit(cg);
        if(DEBUG_D3) printf("#we finished left Emit in Arith %s\n",op->GetTokenString());
        Location *op2 = right->Emit(cg);
        if(DEBUG_D3) printf("#we finished right Emit in Arith %s\n",op->GetTokenString());
        Assert(op1!=NULL);
        Assert(op2!=NULL);
        return cg->GenBinaryOp(op->GetTokenString(), op1, op2);
    }
    else { // unary
        // * tac don't support unary operator, so we need to fill 0
        // e.g. for "-b" expression
        //  _tmp0 = 0 ;
        //	_tmp1 = _tmp0 - b ;
        Location *op1 = cg->GenLoadConstant(0);
        Location *op2 = right->Emit(cg);
        return cg->GenBinaryOp(op->GetTokenString(), op1, op2);
    }
}
Type *RelationalExpr::GetType(Scope *scope) {
    // def Two operands must be either both int or both double, the result is bool.
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);

    if(leftType==Type::errorType)
        return Type::errorType;
    if(rightType==Type::errorType)
        return Type::errorType;

    if (leftType->IsEquivalentTo(rightType)) {
        if (leftType->IsEquivalentTo(Type::intType) ||
            leftType->IsEquivalentTo(Type::doubleType))  return Type::boolType;
        else return Type::errorType;
    }
    return Type::errorType;
}
int RelationalExpr::GetMemBytes(){
    //printf("there is a relationExpr's get Membye\n");
    int op_size = op->GetMemBytes();
    //printf("op size is %d\n",op_size);
    if(DEBUG_D2) printf("#we are going to get Memsize in ArithmeticExpr\n");
    int ret=0;
    if(left) ret+=left->GetMemBytes();
    if(right) ret+=right->GetMemBytes();
    if(DEBUG_D2) printf("#we finished geting Memsize in ArithmeticExpr\n");
    //printf("we get ret %d op_size %d\n",ret,op_size);
    return ret+op_size;
}
int ArithmeticExpr::GetMemBytes(){
    int op_size = op->GetMemBytes();
    if(DEBUG_D2) printf("#we are going to get Memsize in ArithmeticExpr\n");
    int ret=0;
    if(left) ret+=left->GetMemBytes();
    if(right) ret+=right->GetMemBytes();
    if(DEBUG_D2) printf("#we finished geting Memsize in ArithmeticExpr\n");
    return ret+op_size;
}
void RelationalExpr::Check(Scope *scope) {
    if (DEBUG_CHECK) printf("#Start RelationalExpr %s\n", this->op->GetTokenString());
    left->Check(scope);
    right->Check(scope);
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);
    if (DEBUG_CHECK) printf("#Get leftType and rightType\n");
    if(leftType==Type::errorType)
        return;
    if(rightType==Type::errorType)
        return;
    if (DEBUG_CHECK) printf("#Start comparing\n");
    // * for objects, they must be of same type
    if (!leftType->IsEquivalentTo(rightType)) {
        if (DEBUG_CHECK) printf("#Not same type\n");
        ReportError::IncompatibleOperands(op, leftType, rightType);
        return;
    }
    if (!leftType->IsEquivalentTo(Type::intType) && !leftType->IsEquivalentTo(Type::doubleType)) {
        if (DEBUG_CHECK) printf("#Not int or double\n");
        ReportError::IncompatibleOperands(op, leftType, rightType);
        return;
    }
}
Location *RelationalExpr::Emit(CodeGenerator *cg) {
    // * >=, <= are not supported, we need to translate into two rules!
    //  _tmp3 = a < b ;
    //  _tmp4 = a == b ;
    //  _tmp5 = _tmp3 || _tmp4 ;
    Location *op1 = left->Emit(cg);
    Location *op2 = right->Emit(cg);
    if (!strcmp(op->GetTokenString(), "<=") || !strcmp(op->GetTokenString(), ">=")) {
        Location *op3;
        if (!strcmp(op->GetTokenString(), "<=")) op3 = cg->GenBinaryOp("<", op1, op2);
        else op3 = cg->GenBinaryOp("<", op2, op1);
        Location *op4 = cg->GenBinaryOp("==", op1, op2);
        return cg->GenBinaryOp("||", op3, op4);
    }
    else {
        if(!strcmp(op->GetTokenString(),">"))
            return cg->GenBinaryOp("<",op2,op1);
        else
            return cg->GenBinaryOp(op->GetTokenString(), op1, op2);
    }
}
Type *EqualityExpr::GetType(Scope *scope) {
    // def Two operands can be of same type (including arrays), or two objects, or an object and null.
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);

    if(leftType==Type::errorType)
        return Type::errorType;
    if(rightType==Type::errorType)
        return Type::errorType;

    // Two primitives/arrays
    if ((leftType->IsPrimitiveType() || leftType->IsArrayType())
        && (rightType->IsPrimitiveType() || rightType->IsArrayType())) {
        if (leftType->IsEquivalentTo(rightType)) return Type::boolType;
        else return Type::errorType;
    }
    // * Two classes: Can be same type or subType&superType
    if ((!leftType->IsPrimitiveType() && !leftType->IsArrayType())
        && (!rightType->IsPrimitiveType() && !rightType->IsArrayType())) {
        // * now leftType and rightType are NamedType and must exist
        NamedType *leftNamedType = dynamic_cast<NamedType*>(leftType);
        NamedType *rightNamedType = dynamic_cast<NamedType*>(rightType);
        // since we need to check subType&superType, we need to get ClassDecl*
        ClassDecl *leftDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(leftNamedType->GetTypeName()));
        ClassDecl *rightDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(rightNamedType->GetTypeName()));
        
        if (leftDecl!=NULL&&rightDecl!=NULL&&scope->IsRelevant(leftDecl, rightDecl)) return Type::boolType;
        return Type::errorType;
    }
    // One class and one null
    if ((!leftType->IsPrimitiveType() && !leftType->IsArrayType() && rightType->IsEquivalentTo(Type::nullType)) ||
            (!rightType->IsPrimitiveType() && !rightType->IsArrayType() && leftType->IsEquivalentTo(Type::nullType)) )
        return Type::boolType;

    return Type::errorType;
}
void EqualityExpr::Check(Scope *scope) {
    if (DEBUG_CHECK) printf("#Start EqualityExpr %s\n", this->op->GetTokenString());
    left->Check(scope);
    right->Check(scope);
    if (DEBUG_CHECK) printf("#finish left and right check in EqualityExpr\n");
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);
    if (DEBUG_CHECK) printf("#finish geting left and right type in EqualityExpr\n");
    if(leftType==Type::errorType)
        return;
    if(rightType==Type::errorType)
        return;
    if (DEBUG_CHECK) printf("#left and right side is not error Type in EqualityExpr\n");
    // Two primitives/arrays
    if ((leftType->IsPrimitiveType() || leftType->IsArrayType())
        && (rightType->IsPrimitiveType() || rightType->IsArrayType())) {
        if (!leftType->IsEquivalentTo(rightType))
            ReportError::IncompatibleOperands(op, leftType, rightType);
        return;
    }
    if (DEBUG_CHECK) printf("#left and right side is Named Type in EqualityExpr\n");
    // * Two classes: Can be same type or subType&superType
    if ((!leftType->IsPrimitiveType() && !leftType->IsArrayType())
        && (!rightType->IsPrimitiveType() && !rightType->IsArrayType())) {
        // * now leftType and rightType are NamedType and must exist
        if (DEBUG_CHECK) printf("#Going to check left NamedType and right NamedType\n");
        NamedType *leftNamedType = dynamic_cast<NamedType*>(leftType);
        NamedType *rightNamedType = dynamic_cast<NamedType*>(rightType);
        // since we need to check subType&superType, we need to get ClassDecl*
        if(DEBUG_CHECK&&leftNamedType!=NULL) printf("#left side is %s\n",leftNamedType->GetTypeName());
        if(DEBUG_CHECK&&rightNamedType!=NULL) printf("#right side is %s\n",rightNamedType->GetTypeName());
        ClassDecl *leftDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(leftNamedType->GetTypeName()));
        ClassDecl *rightDecl = dynamic_cast<ClassDecl*>(scope->LookupDecl(rightNamedType->GetTypeName()));
        if (!scope->IsRelevant(leftDecl, rightDecl))
            ReportError::IncompatibleOperands(op, leftType, rightType);
        return;
    }
    // One class and one null
    if ((!leftType->IsPrimitiveType() && !leftType->IsArrayType() && rightType->IsEquivalentTo(Type::nullType)) ||
        (!rightType->IsPrimitiveType() && !rightType->IsArrayType() && leftType->IsEquivalentTo(Type::nullType)) )
        return;

    ReportError::IncompatibleOperands(op, leftType, rightType);
    return;
}
Location *EqualityExpr::Emit(CodeGenerator *cg) {
    // * != is not supported, we need to translate into two rules!
    //	_tmp0 = a == b ;
    //	_tmp1 = 0 ;
    //	_tmp2 = _tmp0 == _tmp1 ;
    
    //special case of String's EqualityExpr
    Type* type = left->GetType(localScope);
    if(type->IsEquivalentTo(Type::stringType)){
        if(!strcmp(op->GetTokenString(), "!=")){
            Location *op1 = left->Emit(cg);
            Location *op2 = right->Emit(cg);
            Location *op3 = cg->GenBuiltInCall(StringEqual,op1,op2);
            Location *op4 = cg->GenLoadConstant(0);
            return cg->GenBinaryOp("==", op3, op4);
        }
        else{
            Location *op1 = left->Emit(cg);
            Location *op2 = right->Emit(cg);
            return cg->GenBuiltInCall(StringEqual,op1,op2);
        }  
    }

    Location *op1 = left->Emit(cg);
    Location *op2 = right->Emit(cg);
    if (!strcmp(op->GetTokenString(), "!=")) {
        Location *op3 = cg->GenBinaryOp("==", op1, op2);
        Location *op4 = cg->GenLoadConstant(0);
        return cg->GenBinaryOp("==", op3, op4);
    }
    else {
        return cg->GenBinaryOp(op->GetTokenString(), op1, op2);
    }
}
int EqualityExpr::GetMemBytes(){
    int op_size = op->GetMemBytes();
    if(DEBUG_D2) printf("#we are going to GetmemSize in EqualityExpr\n");
    int ret = 0;
    // * special case
    if (!strcmp(left->GetPrintNameForNode(), "ArrayAccess")) {
        ret -= 4;
        ret += left->GetMemBytes();
    }
    else
        ret += left->GetMemBytes();
    if(DEBUG_D3) printf("#We are going to Get right's Size in EqualityExpr\n");
    ret += right->GetMemBytes();
    if(DEBUG_D2) printf("#we finished getting GetmemSize in EqualityExpr\n");
    //printf("we get ret %d op_size %d\n",ret,op_size);
    return ret+op_size;
}
Type *LogicalExpr::GetType(Scope *scope) {
    // def Two/one operands must be of bool type, the result is bool.
    if (left) { // binary
        Type *leftType = left->GetType(scope);
        Type *rightType = right->GetType(scope);
        // * Special case
        if(leftType==Type::errorType)
            return Type::boolType;
        if(rightType==Type::errorType)
            return Type::boolType;

        if (leftType->IsEquivalentTo(rightType) &&
            leftType->IsEquivalentTo(Type::boolType)) return Type::boolType;
        return Type::errorType;
    }
    else { // unary
        Type *rightType = right->GetType(scope);
        if(rightType==Type::errorType)
            return Type::boolType;

        if (rightType->IsEquivalentTo(Type::boolType)) return Type::boolType;
        return Type::errorType;
    }
}
void LogicalExpr::Check(Scope *scope) {
    if (DEBUG_CHECK) printf("#\nStart LogicalExpr %s\n", this->op->GetTokenString());
    if (left) { // binary
        left->Check(scope);
        right->Check(scope);
        Type *leftType = left->GetType(scope);
        Type *rightType = right->GetType(scope);
        if (DEBUG_CHECK) printf("#\nCheck left and right in LogicalExpr\n");
        if(leftType==Type::errorType)
            return;
        if(rightType==Type::errorType)
            return;
        if (DEBUG_CHECK) printf("#\nleft and right hand side is not errorType\n");
        if (leftType->IsEquivalentTo(rightType) &&
            leftType->IsEquivalentTo(Type::boolType)) return;
        ReportError::IncompatibleOperands(op, leftType, rightType);
        return;
    }
    else { // unary
        right->Check(scope);
        Type *rightType = right->GetType(scope);
        if(rightType==Type::errorType)
            return;

        if (rightType->IsEquivalentTo(Type::boolType)) return;
        ReportError::IncompatibleOperand(op, rightType);
        return;
    }
}
Location *LogicalExpr::Emit(CodeGenerator *cg) {
    // * Unary "!" is not supported
    //	_tmp0 = 0 ;
    //	_tmp1 = c == _tmp0 ;
    if(DEBUG_D3) printf("we are going to Emit a LogicalExpr\n");
    Location* loc1;
    if(left)    loc1 = left->Emit(cg);
    Location* loc2 = right->Emit(cg);
    if (!strcmp(op->GetTokenString(), "!")) {
        Location *op1 = cg->GenLoadConstant(0);
        return cg->GenBinaryOp("==", loc2, op1);
    }
    else {
        return cg->GenBinaryOp(op->GetTokenString(), loc1, loc2);
    }
}
int LogicalExpr::GetMemBytes(){
    int op_size = op->GetMemBytes();
    int ret = 0;
    // * special case
    //printf("%s\n",op->GetPrintNameForNode());
    if(left){
        if (!strcmp(left->GetPrintNameForNode(), "ArrayAccess")) {
            ret -= 4;
            ret += left->GetMemBytes();
        }
        else
            ret += left->GetMemBytes();
    }
    if(right)   ret += right->GetMemBytes();
    //printf("we get ret %d op_size %d\n",ret,op_size);
    return ret+op_size;
}
Type *AssignExpr::GetType(Scope *scope) {
    // * supertype = subType will lead to error!
    // * array can be compared!
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);

    if(leftType==Type::errorType)
        return Type::errorType;
    if(rightType==Type::errorType)
        return Type::errorType;
    // for primitive and arrays, or same classes
    if (leftType->IsEquivalentTo(rightType)) return leftType;
    // if leftType is superType(base) of rightType
    if (scope->IsSuperType(leftType, rightType)) return leftType;
    return Type::errorType;
}
void AssignExpr::Check(Scope *scope) {
    if (DEBUG_CHECK) printf("#Start AssignExpr\n");
    left->Check(scope);  
    if (DEBUG_CHECK) printf("#We've checked left in AssignExpr\n");
    Type *leftType = left->GetType(scope);
    Type *rightType = right->GetType(scope);
    if(leftType!=Type::errorType&&rightType!=Type::errorType)
    {
        if (!leftType->IsEquivalentTo(rightType)&&!scope->IsSuperType(leftType, rightType)) 
            ReportError::IncompatibleOperands(op, leftType, rightType);
    }
    if (DEBUG_CHECK) printf("#\tWe've checked the equivalence between left and right\n");
    right->Check(scope);
    if (DEBUG_CHECK) printf("#Finish AssignExpr\n");
    return;
}
Location *AssignExpr::Emit(CodeGenerator *cg) {
    // * We need to consider special cases for assignExpr!
    //  Example: a = b+1;
    // 	_tmp0 = 1 ;
    //	_tmp1 = b + _tmp0 ;
    //	a = _tmp1 ;
    ArrayAccess* arrayAccess = dynamic_cast<ArrayAccess*>(left);
    
    if(arrayAccess){
        Location* left_loc = arrayAccess->GetAddress(cg);
        Location* right_loc = right->Emit(cg);
        cg->GenStore(left_loc, right_loc);
        return right_loc;
    }
    else {
        //so the left-hand side is a field
        FieldAccess* left_fd = dynamic_cast<FieldAccess*>(left);
        if(left_fd->IsAccessClass()){
            Location* left_loc = left_fd->GetAddress(cg);
            Location* base_address;
            int offset;
            if(left_fd->IsThisAccess()){
                //becase now Left_fd is this.xxx;
                Node *node = this->GetParent();
                ClassDecl* classDecl = dynamic_cast<ClassDecl*>(node);
                while(node){
                    classDecl = dynamic_cast<ClassDecl*>(node);
                    if(classDecl) break;
                    node = node->GetParent();
                }
                base_address = classDecl->Getthis();
                offset = left_loc->GetOffset();
            }
            else{
                base_address = left_loc;
                offset = left_fd->GetOffset(cg);
            }
            if(DEBUG_AssignExpr_Emit) printf("AssignExpr: finished left handside\n");
            Location* right_loc = right->Emit(cg);
            cg->GenStore(base_address,right_loc,offset);
            return right_loc;
        }
        else{
            Location* left_loc = left->Emit(cg);
            Location* right_loc = right->Emit(cg);
            cg->GenAssign(left_loc,right_loc);
            return right_loc;
        }
    }
}
int AssignExpr::GetMemBytes(){
    int op_size = op->GetMemBytes();
    int ret = 0;
    // * special case
    if (!strcmp(left->GetPrintNameForNode(), "ArrayAccess")) {
        ret -= 4;
    }
    
    FieldAccess* fd = dynamic_cast<FieldAccess*>(left);
    if(fd&&fd->IsAccessClass())
        ret += 0;
    else
        ret += left->GetMemBytes();
    
    if(DEBUG_AssignExpr_GetM) printf("#We are going to Get right's Size in AssignExpr\n");
    ret += right->GetMemBytes();
    return ret+op_size;
}
Location *ReadIntegerExpr::Emit(CodeGenerator *cg) {
    // _tmp0 = LCall _ReadInteger ;
    return cg->GenBuiltInCall(ReadInteger);
}
Location *ReadLineExpr::Emit(CodeGenerator *cg) {
    // _tmp1 = LCall _ReadLine ;
    return cg->GenBuiltInCall(ReadLine);
}


