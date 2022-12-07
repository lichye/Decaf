/* File: ast_stmt.cc
 * -----------------
 * Implementation of statement node classes.
 */
#include "ast_stmt.h"
#include "ast_expr.h"


Program::Program(List<Decl*> *d) {
    parent = NULL;
    Assert(d != NULL);
    (decls=d)->SetParentAll(this);
}

void Program::Check() {
    if (DEBUG_CHECK) printf("Start Program's Check()\n");
    BuildScope(); // we need to first build the scope
    for (int i = 0; i < decls->NumElements(); i++) {
        decls->Nth(i)->Check(globalScope);
    }
}

void Program::Emit() {
    /* pp4: here is where the code generation is kicked off.
     *      The general idea is perform a tree traversal of the
     *      entire program, generating instructions as you go.
     *      Each node can have its own way of translating itself,
     *      which makes for a great use of inheritance and
     *      polymorphism in the node classes.
     */
    //Sort();
    if (DEBUG_EMIT) printf("Start Program's Emit()\n");
    if (!globalScope->LookupDecl("main")) {
        ReportError::NoMainFound();
        return;
    }
    if (DEBUG_EMIT) printf("Find main() function.\n");
    if (DEBUG_EMIT) printf("There are %d declarations\n", decls->NumElements());

    int offset = CodeGenerator::OffsetToFirstGlobal;
    for (int i = 0; i < decls->NumElements(); i++) {
        VarDecl* v = dynamic_cast<VarDecl*>(decls->Nth(i));
        if(v != NULL) {
            Location* l = new Location(gpRelative, offset, v->GetName());
            v->SetMemLoc(l); // * will be used in FieldAccess
            offset += v->GetMemBytes();
        }
    }
    CodeGenerator *cg = new CodeGenerator;
    for (int i = 0; i< decls->NumElements(); i++ ){
        if (DEBUG_EMIT) printf("We are going to Emit %d decls in Program\n", i);
        decls->Nth(i)->Emit(cg);
        if (DEBUG_EMIT) printf("We finished Emit %d Decls in program\n", i);
    }
    cg->DoFinalCodeGen();
}

void Program::BuildScope() {
    globalScope = new Scope();
    for (int i = 0; i < decls->NumElements(); i++) {
        globalScope->InsertDecl(decls->Nth(i));
    }
    for (int i = 0; i < decls->NumElements(); i++) {
        decls->Nth(i)->BuildScope(globalScope);
    }
}

// void Program::Sort(){
//     // to sort decls;
//     // first we seprate all the decls first into Four different kinds
//     List<VarDecl*>* VarDeclList = new List<VarDecl*>;
//     List<ClassDecl*>* ClassDeclList = new List<ClassDecl*>;
//     List<InterfaceDecl*>* InterfaceDeclList = new List<InterfaceDecl*>;
//     List<FnDecl*>* FnDeclList = new List<FnDecl*>;
//     for(int i=0; i<decls->NumElements();i++){
//         Decl* decl = decls->Nth(i);
//         VarDecl* vard = dynamic_cast<VarDecl*> (decl);
//         ClassDecl* classd = dynamic_cast<ClassDecl*> (decl);
//         InterfaceDecl* InterfaceD = dynamic_cast<InterfaceDecl*> (decl);
//         FnDecl* Fnd = dynamic_cast<FnDecl*> (decl);
//         if(vard)
//             VarDeclList->Append(vard);
//         if(classd)
//             ClassDeclList->Append(classd);
//         if(InterfaceD)
//             InterfaceDeclList->Append(InterfaceD);
//         if(Fnd)
//             FnDeclList->Append(Fnd);
//         //then we need to sort the classList
//     }

//     while(1){
//         bool change = false;
//         int index1;
//         int index2;
//         for(int i=0;i<ClassDeclList->NumElements();i++){
//             ClassDecl* decl1 = ClassDeclList->Nth(i);
//             //when this is a base class
//             if(decl1->GetExtends()==NULL){
//                 //then we need to check if any extends class before
//                 int j =0;
//                 for(; j<i;j++){
//                     ClassDecl* decl2 = ClassDeclList->Nth(j);
//                     if(decl2->GetExtends()!=NULL){
//                         index1=i;
//                         index2=j;
//                         change = true;
//                         break;
//                     }
//                 }
//             }//if this have base class, we need to check if this class is before
//             else{
//                 NamedType* type = decl1->GetExtends();
//                 int j=0;
//                 bool find = false;
//                 for(;j<i;j++){
//                     ClassDecl* decl2 = ClassDeclList->Nth(j);
//                     //this means base class is in front of us
//                     if(!strcmp(decl2->GetId(),type->GetId()->GetName())){
//                         find = true;
//                         break;
//                     }
//                 }
//                 if(!find){
//                     int j = i+1;
//                     for(;j<ClassDeclList->NumElements();j++){
//                         ClassDecl* decl2 = ClassDeclList->Nth(j);
//                         if(!strcmp(decl2->GetId(),type->GetId()->GetName())){
//                             find = true;
//                             index1=i;
//                             index2=j;
//                             change = true;
//                             break;
//                         }
//                     }
//                 }
                
//             }
//             if(change) break;
//         }
//         if(!change) break;
//         else{
//             index1;
//             index2;
//             ClassDecl* temp;
//             temp = ClassDeclList->Nth(index1);
//             ClassDeclList->RemoveAt(index1);
//             ClassDeclList->InsertAt(ClassDeclList->Nth(index2),index1);
//             ClassDeclList->RemoveAt(index2);
//             ClassDeclList->InsertAt(temp,index2);
//         }
//     }

//     delete decls;
//     decls = new List<Decl*>;
//     FnDecl* main;
//     for(int i=0;i<VarDeclList->NumElements();i++){
//         decls->Append(VarDeclList->Nth(i));
//     } 
//     for(int i=0;i<InterfaceDeclList->NumElements();i++){
//         decls->Append(InterfaceDeclList->Nth(i));
//     }
//     for(int i=0;i<FnDeclList->NumElements();i++){
//         if(!strcmp(FnDeclList->Nth(i)->GetId(),"main")){
//             main = FnDeclList->Nth(i);
//         }
//         else
//             decls->Append(FnDeclList->Nth(i));
//     }
//     for(int i=0;i<ClassDeclList->NumElements();i++){
//         decls->Append(ClassDeclList->Nth(i));
//     }
//     decls->Append(main);
// }



StmtBlock::StmtBlock(List<VarDecl*> *d, List<Stmt*> *s) {
    Assert(d != NULL && s != NULL);
    (decls=d)->SetParentAll(this);
    (stmts=s)->SetParentAll(this);
}

void StmtBlock::BuildScope(Scope *parent) {
    localScope = new Scope();
    localScope->SetParent(parent);
    //add all decls to the scope

    for(int i=0; i<decls->NumElements();i++){
        localScope->InsertDecl(decls->Nth(i));
       // printf("build %d stmt scope \n",i);
        decls->Nth(i)->BuildScope(localScope);
    }

    for(int i=0; i<stmts->NumElements();i++){
        if(DEBUG_BS) printf("We are going to check %d stmt\n",i);
        stmts->Nth(i)->BuildScope(localScope);
        if(DEBUG_BS) printf("We finished check %d stmt\n",i);
    }
}

void StmtBlock::Check(Scope *parent) {
    for(int i=0; i<decls->NumElements();i++){
        decls->Nth(i)->Check(localScope);
    }

     if (DEBUG_CHECK) printf("Under this stmtBlock is %d\n",stmts->NumElements());
    for(int j=0; j<stmts->NumElements();j++){
         if (DEBUG_CHECK) printf("Then we are going to check Stmt %d\n",j);
        stmts->Nth(j)->Check(localScope);
         if (DEBUG_CHECK) printf("Then we finish checking Stmt %d\n",j);
    }
     if (DEBUG_CHECK) printf("Finish StmtBlock Check()\n");
}

Location* StmtBlock::Emit(CodeGenerator* cg){
    for(int i=0; i<decls->NumElements();i++){
        if(DEBUG_StmtBlock_Emit)    printf("going to check %d Vardecl\n",i);
        VarDecl* varl = dynamic_cast<VarDecl*>(decls->Nth(i));
        if(varl!=NULL){
            Location* l = cg->GenLocalVar(varl->GetName(),varl->GetMemBytes());
            varl->SetMemLoc(l);
        }
    }
    for(int i=0;i<stmts->NumElements();i++){
        if(DEBUG_StmtBlock_Emit)    printf("going to check %d stmt\n",i);
        stmts->Nth(i)->Emit(cg);
    }
    return NULL;
}

void StmtBlock::PreEmit(CodeGenerator*cg){
    for(int i=0; i<decls->NumElements();i++){
        VarDecl* varl = dynamic_cast<VarDecl*>(decls->Nth(i));
        if(varl!=NULL){
            varl->Emit(cg);
        }
    }
}

int  StmtBlock::GetMemBytes()
{
    if(DEBUG_StmtBlock_GetB) printf("start getMemByte of StmtBlock\n");
    int memBytes = 0;
    for (int i = 0; i < decls->NumElements(); i++) {
        if(DEBUG_StmtBlock_GetB) printf("start getMemByte of %dth Vardecl\n",i);
        memBytes += decls->Nth(i)->GetMemBytes();
    }
    for (int i = 0; i < stmts->NumElements(); i++) {
        if(DEBUG_StmtBlock_GetB) printf("start getMemByte of %dth Stmt\n",i);
        memBytes += stmts->Nth(i)->GetMemBytes();
    }
    return memBytes;
}

ConditionalStmt::ConditionalStmt(Expr *t, Stmt *b) { 
    Assert(t != NULL && b != NULL);
    (test=t)->SetParent(this); 
    (body=b)->SetParent(this);
}

Location* ConditionalStmt::Emit(CodeGenerator* cg){
    // todo: don't need to complete?
    test->Emit(cg);
    return body->Emit(cg);
}

ForStmt::ForStmt(Expr *i, Expr *t, Expr *s, Stmt *b): LoopStmt(t, b) { 
    Assert(i != NULL && t != NULL && s != NULL && b != NULL);
    (init=i)->SetParent(this);
    (step=s)->SetParent(this);
}

void ForStmt::BuildScope(Scope* parent){
    localScope = new Scope();
    localScope->SetParent(parent);
    body->BuildScope(localScope);
    init->BuildScope(localScope);
    step->BuildScope(localScope);
    test->BuildScope(localScope);
}

void ForStmt::Check(Scope* scope) {
    init->Check(localScope);
    test->Check(localScope);
    if(!test->GetType(scope)->IsEquivalentTo(Type::boolType)
        && !test->GetType(scope)->IsEquivalentTo(Type::errorType)) {
        ReportError::TestNotBoolean(test);
    }
    step->Check(localScope);
    if(test)// test is a Expr
    body->Check(localScope);
}

Location* ForStmt::Emit(CodeGenerator* cg){
    const char* loop = cg->NewLabel();
    const char* done = cg->NewLabel();
    SetBreak(done);
    init->Emit(cg);
    cg->GenLabel(loop);
    cg->GenIfZ(test->Emit(cg),done);
    body->Emit(cg);
    step->Emit(cg);
    cg->GenGoto(loop);
    cg->GenLabel(done);
    return NULL;
}

int ForStmt::GetMemBytes(){

    int memBytes = CodeGenerator::VarSize;
    memBytes += init->GetMemBytes();
    if(DEBUG_ForSmt_GetB) printf("the init size is %d\n",init->GetMemBytes());
    memBytes += step->GetMemBytes();
    if(DEBUG_ForSmt_GetB) printf("the step size is %d\n",step->GetMemBytes());
    memBytes += test->GetMemBytes();
    if(DEBUG_ForSmt_GetB) printf("the test size is %d\n",test->GetMemBytes());
    memBytes += body->GetMemBytes();
    if(DEBUG_ForSmt_GetB) printf("the test body is %d\n",body->GetMemBytes());
    if(DEBUG_ForSmt_GetB) printf("So, the forStmt's size is %d\n",memBytes);
    return memBytes;
}

IfStmt::IfStmt(Expr *t, Stmt *tb, Stmt *eb): ConditionalStmt(t, tb) { 
    Assert(t != NULL && tb != NULL); // else can be NULL
    elseBody = eb;
    if (elseBody) elseBody->SetParent(this);
}

int IfStmt::GetMemBytes(){
    if(DEBUG_IfStmt_GetMemBytes) printf("Get Membyte in Ifstmt\n");
    int memBytes = 0; // * both if and else don't count toward size
    if(DEBUG_D3) printf("going to check test\n");
    memBytes += test->GetMemBytes();
    if(DEBUG_D3) printf("going to check body\n");
    memBytes += body->GetMemBytes();
    if(elseBody) memBytes += elseBody->GetMemBytes();
    if(DEBUG_IfStmt_GetMemBytes) printf("Finished Get Membyte in Ifstmt\n");
    return memBytes;
}

void IfStmt::BuildScope(Scope* parent){
    if (DEBUG_BS) printf("Start Build IfStmt\n");
    localScope = new Scope();
    localScope->SetParent(parent);
    test->BuildScope(localScope);
    body->BuildScope(localScope);
    if(elseBody) elseBody->BuildScope(localScope);
    if (DEBUG_BS) printf("Finish Build IfStmt\n");
}

Location* IfStmt::Emit(CodeGenerator* cg){
    if(DEBUG_D3) printf("we are going to Emit in Ifstmt\n");
    if(elseBody){
        if(DEBUG_D3) printf("we are going to Emit Elsebody in Ifstmt\n");
        const char* then_label = cg->NewLabel();
        const char* else_label = cg->NewLabel();
        cg->GenIfZ(test->Emit(cg), else_label);
        body->Emit(cg);
        cg->GenGoto(then_label);
        cg->GenLabel(else_label);
        elseBody->Emit(cg);
        cg->GenLabel(then_label);
        return NULL;
    }
    else {
        if(DEBUG_D3) printf("we are going to check normal body\n");
        const char* not_do = cg->NewLabel();
        if(DEBUG_D3) printf("we are Gen no branch label\n");
        cg->GenIfZ(test->Emit(cg), not_do);
        if(DEBUG_D3) printf("we are going to check body in Ifstmt\n");
        body->Emit(cg);
        cg->GenLabel(not_do);
        return NULL;
    }
}

void IfStmt::Check(Scope* scope) {
    if (DEBUG_CHECK) printf("Start IfStmt\n");
    test->Check(localScope);
    if(!test->GetType(scope)->IsEquivalentTo(Type::boolType)&&
       !test->GetType(scope)->IsEquivalentTo(Type::errorType))
        ReportError::TestNotBoolean(test);
    if (DEBUG_CHECK) printf("\tFinish test_check in Ifstmt\n");
    body->Check(localScope);
    if (DEBUG_CHECK) printf("\tFinish body Check()\n");
    if(elseBody) elseBody->Check(localScope);
    if (DEBUG_CHECK) printf("Finish elseBody Check()\n");
}

Location* BreakStmt::Emit(CodeGenerator* cg){
    Scope* s = localScope;
    LoopStmt* loop = NULL;
    Node* p = this->parent;
    while(p){
        if(!strcmp(p->GetPrintNameForNode(),"ForStmt")||!strcmp(p->GetPrintNameForNode(),"WhileStmt")){
            break;
        }
        p = p->GetParent();
    }
    loop = dynamic_cast<LoopStmt*>(p);
    cg->GenGoto(loop->GetBreak());
    return NULL;
}

void BreakStmt::Check(Scope* scope) {
    Node* p = this->parent;
    int flag = 0;
    while(p){
        if(!strcmp(p->GetPrintNameForNode(),"ForStmt")||!strcmp(p->GetPrintNameForNode(),"WhileStmt")){
            flag = 1;
            return;
        }
        p = p->GetParent();
    }
    if(!flag)
        ReportError::BreakOutsideLoop(this);
}

void WhileStmt::BuildScope(Scope* parent) {
    // printf("Build WhileStmt");
    test->BuildScope(parent);
    body->BuildScope(parent);
}

void WhileStmt::Check(Scope* scope) {
    if(DEBUG_CHECK) printf("start to check WhileStmt\n");
    test->Check(scope);
    if(!test->GetType(scope)->IsEquivalentTo(Type::boolType)
    &&!test->GetType(scope)->IsEquivalentTo(Type::errorType))
        ReportError::TestNotBoolean(test);
    body->Check(scope);
    if(DEBUG_CHECK) printf("end checking whileStmt\n");
}

Location* WhileStmt::Emit(CodeGenerator* cg){
    const char* loop = cg->NewLabel();
    const char* done = cg->NewLabel();
    SetBreak(done);
    cg->GenLabel(loop);
    cg->GenIfZ(test->Emit(cg), done);
    body->Emit(cg);
    cg->GenGoto(loop);
    cg->GenLabel(done); 
    return NULL;
}

ReturnStmt::ReturnStmt(yyltype loc, Expr *e) : Stmt(loc) { 
    Assert(e != NULL);
    (expr=e)->SetParent(this);
}

Location* ReturnStmt::Emit(CodeGenerator* cg){
    if(expr)
        cg->GenReturn(expr->Emit(cg));
    else
        cg->GenReturn();
    return NULL;
}

void ReturnStmt::BuildScope(Scope* father){
    localScope = new Scope();
    localScope->SetParent(father);
    expr->BuildScope(localScope);
}

void ReturnStmt::Check(Scope* scope) {
    Node* p = this->parent;
    expr->Check(scope);
    while(p){
        if (DEBUG_CHECK) printf("p is %s\n", p->GetPrintNameForNode());
        if(!strcmp(p->GetPrintNameForNode(),"FnDecl")){
            FnDecl* decl = dynamic_cast<FnDecl*>(p);
            Type* given = expr->GetType(scope);
            Type* expected = decl->GetReturnType();
            if(!expected->IsEquivalentTo(given)){
                if(given->IsEquivalentTo(Type::errorType))
                    return;
                // allow superType!
                if(scope->IsSuperType(expected, given))
                    return;
                ReportError::ReturnMismatch(this,given,expected);
                return;
            }
        }
        p = p -> GetParent();
    }
}

PrintStmt::PrintStmt(List<Expr*> *a) {    
    Assert(a != NULL);
    (args=a)->SetParentAll(this);
}

//have not finish Print check
void PrintStmt::Check(Scope* scope) {
    if(DEBUG_CHECK) printf("we are check printStmt\n");
    for(int i=0; i<args->NumElements();i++){
        args->Nth(i)->Check(scope);
        Type* type = args->Nth(i)->GetType(scope);
        if (type->IsEquivalentTo(Type::errorType)) continue;
        if(!type->IsEquivalentTo(Type::intType)&
           !type->IsEquivalentTo(Type::stringType)&
           !type->IsEquivalentTo(Type::boolType))
            ReportError::PrintArgMismatch(args->Nth(i),i+1,args->Nth(i)->GetType(scope));
        //PrintArgMismatch(args->Nth(i),i,args->Nth(i)->GetType(scope));
    }
}

void PrintStmt::BuildScope(Scope *father) {
    if(DEBUG_BS)    printf("we are building scope on PrintStmt\n");
    if(DEBUG_BS&&father==NULL) printf("we are sending a NULL father down\n");
    localScope = new Scope();
    localScope->SetParent(father);
    for(int i=0; i<args->NumElements();i++){
        args->Nth(i)->BuildScope(localScope);
    }
}

Location* PrintStmt::Emit(CodeGenerator* cg){
    if(DEBUG_PrintStmt_Emit) printf("we are going to debug PrintStmt\n");
    for(int i = 0; i < args->NumElements(); i++) {
        Expr* expr = args->Nth(i);
        BuiltIn buildIn = expr->GetType(localScope)->GetBuild();
        if(DEBUG_PrintStmt_Emit) printf("Try to get Location of Variable\n");
        Location* location = expr->Emit(cg);
        if(DEBUG_PrintStmt_Emit) printf("Call BuiltInCall\n");
        cg->GenBuiltInCall(buildIn, location);
    }
    if(DEBUG_PrintStmt_Emit) printf("we finished debug PrintStmt\n");
    return NULL;
}

int PrintStmt::GetMemBytes(){
    int ret=0;
    int actuals_size=0;
    for(int i=0; i<args->NumElements();i++){
        actuals_size+=args->Nth(i)->GetMemBytes();
    }

    return actuals_size;
}





