/* File: ast_decl.cc
 * -----------------
 * Implementation of Decl node classes.
 */
#include "ast_decl.h"
#include "ast_type.h"
#include "ast_stmt.h"
#include "errors.h"

Decl::Decl(Identifier *n) : Node(*n->GetLocation()) {
    Assert(n != NULL);
    (id=n)->SetParent(this); 
}

void Decl::BuildScope(Scope *parent) {
    // although we don't set scope here, we need scope from parent
    localScope = new Scope();
    localScope->SetParent(parent);
}

VarDecl::VarDecl(Identifier *n, Type *t) : Decl(n) {
    Assert(n != NULL && t != NULL);
    (type=t)->SetParent(this);
    underClass = false;
}

Location* VarDecl::Emit(CodeGenerator* cg){
    NamedType* namedType = dynamic_cast<NamedType*>(type);
    if(namedType&&DEBUG_D2) printf("#we are check %s\n",namedType->GetId()->GetName());
     if(!namedType)
        return NULL;
    Assert(localScope);
     ClassDecl* cls = localScope->LookupClassDecl(namedType);
     if(cls&&!cls->IsEmit()){
         cls->Emit(cg);
         cls->SetEmit();
     }   
     // no need to emit
    if(DEBUG_EMIT) printf("finish Vardecl's Emit\n");
    return NULL;
}

void VarDecl::Check(Scope *scope) { // def Error1, Error
    Type* neededType = type;
    ArrayType* temp;
    while(neededType->IsArrayType()){
        temp = dynamic_cast<ArrayType*>(neededType);
        neededType = temp->GetElementType();
    }
    if (neededType->IsPrimitiveType()) return;
    NamedType *namedType = dynamic_cast<NamedType*>(neededType);
    ClassDecl* decl = dynamic_cast<ClassDecl*>(scope->LookupDecl(namedType->GetTypeName()));
    InterfaceDecl* decl2 = dynamic_cast<InterfaceDecl*>(scope->LookupDecl(namedType->GetTypeName()));
    if(!decl&!decl2)
        ReportError::IdentifierNotDeclared(namedType->GetId(),reasonT::LookingForType);
}


ClassDecl::ClassDecl(Identifier *n, NamedType *ex, List<NamedType*> *imp, List<Decl*> *m) : Decl(n) {
    // extends can be NULL, impl & mem may be empty lists but cannot be NULL
    Assert(n != NULL && imp != NULL && m != NULL);
    // initialization
    isEmitted = false;
    extends = ex;
    if (extends) extends->SetParent(this);
    (implements=imp)->SetParentAll(this);
    (Field=m)->SetParentAll(this);
    overrideMismatches = new List<FnDecl*>();
    for (int i=0; i<Field->NumElements(); i++) {
        overrideMismatches->Append(NULL);
    }
    Vt = new List<FnDecl*>;
    classthis = new Location(fpRelative,4,"this");
}

void ClassDecl::BuildScope(Scope *parent) {
    // * The offset will be explicitly set and is independent of its location in scope
    localScope = new Scope();
      // we add subClass's functions at the end
    for (int i = 0; i < Field->NumElements(); i++) {
        // add all fields to localScope
        localScope->InsertDecl(Field->Nth(i));
    }

    // let all DeclList to BuildScope
    for (int i = 0; i < Field->NumElements(); i++) {
        Field->Nth(i)->BuildScope(localScope);
    }
    // we try to find extend scope in parent
    NamedType* ex = extends;
    while(ex){ //if extend exists
        ClassDecl* decl = dynamic_cast<ClassDecl*> (parent->LookupDecl(ex->GetTypeName()));
        if(decl) {
            for(int i=0; i<decl->Field->NumElements();i++) {
                // * add all parent class to localScope
                localScope->GetSymTable()->Enter(decl->Field->Nth(i)->GetId(),
                                                 decl->Field->Nth(i),
                                                 false);
            }
            ex = decl->GetExtends();
            continue; 
            // //loop over all the decl of father
            // for(int i=0;i<decl->Field->NumElements();i++){
            //     Decl* checkdecl = decl->Field->Nth(i);
            //     bool find = false;
            //     for(int j=0;j<Field->NumElements();j++){
            //         if(!strcmp(checkdecl->GetId(),Field->Nth(j)->GetId()))
            //         {
            //             find = true;
            //             break;
            //         }
            //     }
            // }
        }
        else break;
    }
  
    localScope->SetParent(parent);
}

void ClassDecl::CheckExtends() { // def Error 2
   Scope* out = localScope->GetParent();
   if (DEBUG_CHECK) printf("Start LookupDecl in CheckExtends()\n");
   //we try out find the class define outside
   if(extends)  {
       if(DEBUG_CHECK) printf("The class to be extended is %s\n",extends->GetTypeName());
       Decl* find = out->LookupDecl(extends->GetTypeName());
       if(DEBUG_CHECK) printf("Try to find the extended classDecl\n");
       //if we cannot find the superClass
       if(find==NULL){
           ReportError::IdentifierNotDeclared(extends->GetId(),reasonT::LookingForClass);
       }
       else {
           //if this is not a class, then not correct
           ClassDecl *superClass = dynamic_cast<ClassDecl*>(find);
           if(superClass==NULL){
               ReportError::IdentifierNotDeclared(extends->GetId(),reasonT::LookingForClass);
           }
           // * now we need to check overrideMismatch (only functions)
           else {
               while(superClass){
                   
                // If both are fnDecl
                for(int i=0; i < superClass->Field->NumElements(); i++){
                   // * Check every function in superClass
                   if (DEBUG_CHECK) printf("Find %d's function in superClass\n", i);
                   // check one function
                   FnDecl* superClassFn = dynamic_cast<FnDecl*>(superClass->GetField()->Nth(i));
                   if (superClassFn == NULL) {
                       // We will check this case later
                      continue;
                   }
                   for(int j = 0; j < Field->NumElements(); j++){
                       // * Check every function in class
                       if (DEBUG_CHECK) printf("Get %d's function in subClass, start comparing: \n", j);
                       FnDecl* subClassFn = dynamic_cast<FnDecl*>(Field->Nth(j));
                       if(subClassFn == NULL) continue;
                       if(!strcmp(superClassFn->GetId(), subClassFn->GetId())) // same id
                       {
                           if (DEBUG_CHECK) printf("Found two functions with same ID %s, check return type\n", superClassFn->GetId());
                           // * We need to check whether they have the same number of parameters and return type
                           if (!subClassFn->GetReturnType()->IsEquivalentTo(superClassFn->GetReturnType())) {
                               // if there are two mismatched functions, the first will report this error
                               // and the second one should report conflicts
                               if (DEBUG_CHECK) printf("Override Mismatch1\n");
                               ReportError::OverrideMismatch(subClassFn);
                               continue;
                           }
                           if (DEBUG_CHECK) printf("Check number of formals\n");
                           if(subClassFn->GetFormals()->NumElements()!=superClassFn->GetFormals()->NumElements()){
                               if (DEBUG_CHECK) printf("Override Mismatch2\n");
                               ReportError::OverrideMismatch(subClassFn);
                               continue;
                           }
                           // * We need to check they have the same type of parameters
                           if (DEBUG_CHECK) printf("Check parameters are of same type\n");
                           for(int k=0; k < superClassFn->GetFormals()->NumElements(); k++){
                               if (DEBUG_CHECK) printf("It's the %d parameter\n", k);
                               Type *superClassParaType = superClassFn->GetFormals()->Nth(k)->GetType();
                               Type *subClassParaType = subClassFn->GetFormals()->Nth(k)->GetType();
                               if(!superClassParaType->IsEquivalentTo(subClassParaType)){
                                   if (DEBUG_CHECK) printf("Override Mismatch3\n");
                                   ReportError::OverrideMismatch(subClassFn);
                                   break;
                               }
                           }
                       }
                   }
                }

                // If both are varDecl
                // for(int i=0; i<superClass->Field->NumElements();i++){
                //     VarDecl* var1 = dynamic_cast<VarDecl*>(superClass->Field->Nth(i));
                //     for(int j=0;j<Field->NumElements();j++){
                //         VarDecl* var2 = dynamic_cast<VarDecl*>(Field->Nth(j));
                        
                //         //this two varDecl exist
                //         if(var1!=NULL&&var2!=NULL&&!strcmp(var1->GetId(),var2->GetId())){
                //             ReportError::DeclConflict(var2,var1);
                //         }
                //     }
                // }

                // If one is FnDecl and another is varDecl
                for(int i=0; i<superClass->Field->NumElements();i++){
                    FnDecl* var1 = dynamic_cast<FnDecl*>(superClass->Field->Nth(i));
                    for(int j=0;j<Field->NumElements();j++){
                        VarDecl* var2 = dynamic_cast<VarDecl*>(Field->Nth(j));
                        
                        if(var1!=NULL&&var2!=NULL&&!strcmp(var1->GetId(),var2->GetId())){
                            ReportError::DeclConflict(var2,var1);
                        }
                    }
                }
                for(int i=0; i<superClass->Field->NumElements();i++) {
                    VarDecl* var1 = dynamic_cast<VarDecl*>(superClass->Field->Nth(i));
                    for(int j=0;j<Field->NumElements();j++){
                        FnDecl* var2 = dynamic_cast<FnDecl*>(Field->Nth(j));

                        if(var1!=NULL&&var2!=NULL&&!strcmp(var1->GetId(),var2->GetId())){
                            ReportError::DeclConflict(var2,var1);
                        }
                    }
                }

                // If there is a grand-parent class, we still need to check them
                if(superClass->GetExtends()) {
                    find = out->LookupDecl(superClass->GetExtends()->GetId()->GetName());
                    superClass = dynamic_cast<ClassDecl*>(find);
                }
                else break;
               }

           }

       }
   }
}

void ClassDecl::CheckImplements() {  // def Error 2
  if (DEBUG_CHECK) printf("Start CheckImplements()\n");
  for(int p = 0; p < implements->NumElements(); p++) {
    // * Check every interface the class implements
    bool hasError = false;  // def Global indicator whether interfaceError is reported
    if (DEBUG_CHECK) printf("%d's interface\n", p);
    Decl* decl = localScope->GetParent()->LookupDecl(implements->Nth(p)->GetTypeName());
    InterfaceDecl* interfaceDecl = dynamic_cast<InterfaceDecl*>(decl);
    if (DEBUG_CHECK) printf("%d's interface: Get InterfaceDecl\n", p);
    // * If we can't find this interface in context
    if (!interfaceDecl) {
        ReportError::IdentifierNotDeclared(implements->Nth(p)->GetId(),reasonT::LookingForInterface);
        continue;
    }

    for(int i=0; i<interfaceDecl->GetPrototype()->NumElements(); i++){
        // * Check every function in interface
        if (DEBUG_CHECK) printf("Find %d's function in interface\n", i);
        // check one function
        FnDecl* interfaceFn = dynamic_cast<FnDecl*>(interfaceDecl->GetPrototype()->Nth(i));
        bool isImplemented = false;
        // def we must report this error after notImplemented one, and use classFn
        for(int j = 0; j<Field->NumElements(); j++){
            // * Check every function in class
            if (DEBUG_CHECK) printf("Get %d's function in class, start comparing: \n", j);
            FnDecl* classFn = dynamic_cast<FnDecl*>(Field->Nth(j));
            if(!classFn) continue;
            if (DEBUG_CHECK) printf("whether interfaceFn %s matches with classFn %s\n",
                              interfaceFn->GetId(), classFn->GetId());
            if(!strcmp(interfaceFn->GetId(), classFn->GetId())) // same id
            {
                if (DEBUG_CHECK) printf("Found two functions with same ID %s\n", interfaceFn->GetId());
                // * We need to check whether they have the same number of parameters and return type
                if (!classFn->GetReturnType()->IsEquivalentTo(interfaceFn->GetReturnType())) {
                    // * if type mismatch, the interface is still fully implemented!
                    if (DEBUG_CHECK) printf("Override Mismatch1\n");
                    // ReportError::OverrideMismatch(classFn);
                    if (overrideMismatches->Nth(j) == NULL) {
                        overrideMismatches->ReplaceAt(classFn, j);
                    }
                    isImplemented = true;
                    continue;
                }
                if(classFn->GetFormals()->NumElements()!=interfaceFn->GetFormals()->NumElements()){
                    if (DEBUG_CHECK) printf("Override Mismatch2\n");
                    // ReportError::OverrideMismatch(classFn);
                    if (overrideMismatches->Nth(j) == NULL) {
                        overrideMismatches->ReplaceAt(classFn, j);
                    }
                    isImplemented = true;
                    continue;
                }
                // * We need to check they have the same type of parameters
                for(int k=0; k<interfaceFn->GetFormals()->NumElements(); k++){
                    Type *interfaceParaType = interfaceFn->GetFormals()->Nth(k)->GetType();
                    Type *classParaType = classFn->GetFormals()->Nth(k)->GetType();
                    if(!interfaceParaType->IsEquivalentTo(classParaType)){
                        if (DEBUG_CHECK) printf("Override Mismatch3\n");
                        // ReportError::OverrideMismatch(classFn);
                        if (overrideMismatches->Nth(j) == NULL) {
                            overrideMismatches->ReplaceAt(classFn, j);
                        }
                        isImplemented = true;
                        break;
                    }
                }
                // * We find the matching function, break;
                isImplemented = true;
                break;
            }
        }
        if (!isImplemented && !hasError)  {
            if (DEBUG_CHECK) printf("Has interface not implemented\n");
            hasError = true;
            ReportError::InterfaceNotImplemented(this, implements->Nth(p));
        }
//        if (overrideMismatch) {
//            if (DEBUG) printf("Has one class misMatched\n");
//            overrideMismatches->Append(overrideMismatch);
//            // ReportError::OverrideMismatch(overrideMismatch);
//        }
//        else overrideMismatches->Append(NULL);

    }
  }
  if (DEBUG_CHECK) printf("Finish CheckImplements()\n");
}

void ClassDecl::Check(Scope* scope) { // def Error 1, Error 3
    if (DEBUG_CHECK) printf("Start ClassDecl and start CheckExtends()\n");
    if (extends != NULL) CheckExtends();
    if (DEBUG_CHECK) printf("Start CheckImplements()\n");
    if (implements->NumElements()) CheckImplements();
    if (DEBUG_CHECK) printf("Start checking fields\n");
    for(int i=0; i<Field->NumElements();i++) {
        if (DEBUG_CHECK) printf("%d iter in ClassDecl::Check()\n", i);
        Field->Nth(i)->Check(localScope);
        if (overrideMismatches->Nth(i) != NULL) {
            FnDecl *fnDecl = overrideMismatches->Nth(i);
            ReportError::OverrideMismatch(fnDecl);
        }
    }
    if (DEBUG_CHECK) printf("Finish ClassDecl\n");
}

int ClassDecl::GetMemBytes() {
    // * all decls (including those from parent class) are in localScope
    int ans = CodeGenerator::VarSize;
    Iterator<Decl*> iter = localScope->GetSymTable()->GetIterator();
    Decl *decl;
    while ((decl = iter.GetNextValue()) != NULL) {
        VarDecl *varDecl = dynamic_cast<VarDecl*>(decl);
        if (varDecl) {
            ans += CodeGenerator::VarSize;
        }
    }
    return ans;
}

// Extend have not been done
Location* ClassDecl::Emit(CodeGenerator* cg){
    if(IsEmit())    return NULL;
    SetEmit();
    //first caculate the value start position    
    NamedType* ex = extends;
    int varCnt = 1;
    while(ex){ //if extend exists
        ClassDecl* classDecl = dynamic_cast<ClassDecl*> (localScope->LookupDecl(ex->GetTypeName()));
        
        if(classDecl){ // we find the superClass's V
            //Add Var Decl into 
            if(!classDecl->IsEmit()) classDecl->Emit(cg);
            for(int i=0; i< classDecl->Field->NumElements(); i++){
                VarDecl *vardecl = dynamic_cast<VarDecl*>(classDecl->Field->Nth(i));
                if(vardecl){
                    varCnt++;
                } 
            } 
        }
        ex = classDecl->GetExtends();
    }
    if(DEBUG_EMIT) printf("We are going to Emit ClassDecl:%s\n",this->GetId());
    for (int i = 0; i < Field->NumElements(); i++) {
        FnDecl* fnDecl = dynamic_cast<FnDecl*>(Field->Nth(i));
        if (fnDecl) {
            // * add prefix before the function's name
            std::string *newLabel = new std::string(fnDecl->GetLabel());
            std::string *nameSuffix = new std::string(id->GetName());
            nameSuffix->insert(nameSuffix->length(),".");
            newLabel->insert(1,nameSuffix->c_str());
            fnDecl->SetLabel(newLabel);
            // Field->Nth(i)->Emit(cg); // we will emit this at the end
        }
    }
    if(DEBUG_EMIT) printf("Finished FnDecl's Label in Class:%s\n",this->GetId());
    // DONE: Add all methods into labels
    if(DEBUG_EMIT)  printf("add labels into Vtable: in Class%s\n",this->GetId());


    Decl *decl;

    int fnCnt = 0;
    List<const char*> *labels = new List<const char*>();
    ex = extends;
    if(ex){ //if extend exists
        ClassDecl* classDecl = dynamic_cast<ClassDecl*> (localScope->LookupDecl(ex->GetTypeName()));
        for(int i=0; i< classDecl->Vt->NumElements();i++){
                FnDecl *fnDecl = dynamic_cast<FnDecl*>(classDecl->Vt->Nth(i));
                // At the same time this Fn should not be rewritten
                if (fnDecl){
                    //if there is a function, then we need to check if this has been rewrited in subclass
                    char* name = fnDecl->GetId();
                    bool rewrite = false;
                    for(int i=0; i<Field->NumElements();i++){
                        if(!strcmp(name,Field->Nth(i)->GetId())){
                            rewrite=true;
                            FnDecl* subFn = dynamic_cast<FnDecl*>(Field->Nth(i));
                            subFn->Setrewrite(true);
                            fnCnt++;
                            labels->Append(strdup(subFn->GetLabel()));
                            Vt->Append(subFn);
                            break;
                        }
                    }
                    if(!rewrite){
                        fnCnt++;
                        labels->Append(strdup(fnDecl->GetLabel())); // in case the pointer is lost
                        Vt->Append(fnDecl);
                    } 
                }
            }
    }
      

    for (int i = 0; i < Field->NumElements(); i++) {
        decl = Field->Nth(i);
         VarDecl *varDecl = dynamic_cast<VarDecl*>(decl);
        if (varDecl) {
            varDecl->Emit(cg);
            varDecl->SetMemLoc(new Location(fpRelative, varCnt * CodeGenerator::VarSize,varDecl->GetName()));
            if(DEBUG_D3) printf("   #%s are setted to %d postion\n",varDecl->GetName(),varCnt);
            varDecl->SetUnderClass(1);
            varCnt++;
        }
        else {
            FnDecl *fnDecl = dynamic_cast<FnDecl*>(decl);
            if(!fnDecl->Isrewrite()){
                labels->Append(strdup(fnDecl->GetLabel()));
                Vt->Append(fnDecl);
                fnDecl->SetLocalOffset(fnCnt * CodeGenerator::VarSize);
                //printf("#Fnoffset is  %d, fnName is %s\n",fnCnt,fnDecl->GetLabel());
                fnCnt++;
            }   
        }
    }

    if(DEBUG_EMIT)  printf("handle FnDecls in classDecl:%s\n",this->GetId());
    for (int i = 0; i < Field->NumElements(); i++) {
        if(DEBUG_EMIT) printf("we are checking %d fndecl in classDecl:%s\n",i,this->GetId());
        FnDecl* fnDecl = dynamic_cast<FnDecl*>(Field->Nth(i));
        if (fnDecl) Field->Nth(i)->Emit(cg);
    }

    // e.g.
    // VTable Pig =
    //	_Animal.PrintHeight,
    //	_Pig.PrintAll,
    //;
    cg->GenVTable(id->GetName(),labels);
    if(DEBUG_EMIT)   printf("finish ClassDecl's Emit\n");
    return NULL;
}



InterfaceDecl::InterfaceDecl(Identifier *n, List<Decl*> *m) : Decl(n) {
    Assert(n != NULL && m != NULL);
    (Prototype=m)->SetParentAll(this);
}

void InterfaceDecl::Check(Scope* scope) {
   
}

void InterfaceDecl::BuildScope(Scope *scope){
    if(DEBUG_EMIT) printf("we are going to Build Scope of interface\n");
    localScope = new Scope();
    localScope->SetParent(scope);
    for(int i=0;i<Prototype->NumElements();i++){
        Prototype->Nth(i)->BuildScope(localScope);
        localScope->InsertDecl( Prototype->Nth(i));
    }
    if(DEBUG_EMIT) printf("we finished Building Scope of interface\n");
}

Location* InterfaceDecl::Emit(CodeGenerator* cg){
    for(int i=0; i<Prototype->NumElements();i++){
        Prototype->Nth(i)->Emit(cg);
    }
    return NULL;
}



FnDecl::FnDecl(Identifier *n, Type *r, List<VarDecl*> *d) : Decl(n) {
    Assert(n != NULL && r!= NULL && d != NULL);
    (returnType=r)->SetParent(this);
    (formals=d)->SetParentAll(this);
    body = NULL;
    label = new std::string(n->GetName());
    if(*label!="main")
        label->insert(0,"_");
    localOffset = CodeGenerator::OffsetToFirstLocal;
    rewrite=false;
}

const char* FnDecl::GetLabel(){
    return label->c_str();
}

void FnDecl::SetFunctionBody(Stmt *b) {
    (body=b)->SetParent(this);
}

void FnDecl::BuildScope(Scope *parent) {
    if(DEBUG_BS) printf("we are goint to Build Scope of FnDecl\n");
    localScope = new Scope();
    localScope->SetParent(parent);
    for (int i = 0; i < formals->NumElements(); i++) {
        localScope->InsertDecl(formals->Nth(i));
        formals->Nth(i)->BuildScope(localScope);
    }
    if(body) body->BuildScope(localScope);  // will set parent in BuildScope()
    if(DEBUG_BS) printf("we finished Building Scope of FnDecl\n");
}

void FnDecl::Check(Scope* scope) {
    // the type check is completed in ReturnStmt
    Type* typeNeed = returnType;
    while(typeNeed->IsArrayType()){
        typeNeed = dynamic_cast<ArrayType*>(typeNeed)->GetElementType();
    }
    if(!typeNeed->IsPrimitiveType()){
        NamedType * namedType = dynamic_cast<NamedType*>(typeNeed);
        Decl* decl = scope->LookupDecl(namedType->GetTypeName());
        if(!decl)
            ReportError::IdentifierNotDeclared(namedType->GetId(),reasonT::LookingForType);
    }
    for(int i=0;i<formals->NumElements();i++)
        formals->Nth(i)->Check(scope);
    if(DEBUG_CHECK) printf("Start this Function check\n");
    body->Check(scope);
    if(DEBUG_CHECK) printf("End this Function check\n");
}

Location* FnDecl::Emit(CodeGenerator* cg){
    // e.g. 1
    // _sum:
    //	BeginFunc 8 ;
    //	_tmp0 = a + b ;
    //	_tmp1 = _tmp0 + c ;
    //	Return _tmp1 ;
    //	EndFunc
    if(DEBUG_FnDecl_Emit) printf("Start FnDecl Emit\n");
    int offset = CodeGenerator::OffsetToFirstParam;
    
    Node* node = this->GetParent();
    ClassDecl* cls = dynamic_cast<ClassDecl*>(node);
    if(cls)   offset = 8;
    // this offset start depdens on the position it at

    for(int i = 0; i< formals->NumElements();i++){
        VarDecl* v = formals->Nth(i);
        v->Emit(cg);
        Location* loc = new Location(fpRelative,offset,v->GetId());
        v->SetMemLoc(loc); // * for FieldAccess to get the location of variable
        offset += v->GetMemBytes();
    }
    if(DEBUG_FnDecl_Emit) printf("Finished FnDecl's formals' setting\n");
    if(body) {
        StmtBlock* stmtbody =dynamic_cast<StmtBlock*>(body);
        stmtbody->PreEmit(cg);
        if(DEBUG_FnDecl_Emit) printf("going to check Fction body\n");
        cg->resetLocalOffset();
        // * start generating
        cg->GenLabel(GetLabel());
        if(DEBUG_FnDecl_Emit) printf("going to get body's size\n");
        int body_size = body->GetMemBytes();
        if(DEBUG_FnDecl_Emit) printf("going to set body's size in CG\n");
        cg->GenBeginFunc()->SetFrameSize(body_size);
        if(DEBUG_FnDecl_Emit) printf("FnDecl %s Starts to Emit the body\n",this->GetId());
        body->Emit(cg);
        if(DEBUG_FnDecl_Emit) printf("FnDecl %s finished Emit the body\n",this->GetId());
        cg->GenEndFunc();
    }
    return NULL;
}




