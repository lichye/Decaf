/* File: parser.y
 * --------------
 * Yacc input file to generate the parser for the compiler.
 *
 * pp2: your job is to write a parser that will construct the parse tree
 *      and if no parse errors were found, print it.  The parser should 
 *      accept the language as described in specification, and as augmented 
 *      in the pp2 handout.
 */

%{

/* Just like lex, the text within this first region delimited by  and
 * is assumed to be C/C++ code and will be copied verbatim to the y.tab.c
 * file ahead of the definitions of the yyparse() function. Add other header
 * file inclusions or C++ variable declarations/prototypes that are needed
 * by your code here.
 */
#include "scanner.h" // for yylex
#include "parser.h"
#include "errors.h"
#include "debug.h"

void yyerror(const char *msg); // standard error-handling routine

%}

/* The section before the first %% is the Definitions section of the yacc
 * input file. Here is where you declare tokens and types, add precedence
 * and associativity options, and so on.
 */
 
/* yylval 
 * ------
 * Here we define the type of the yylval global variable that is used by
 * the scanner to store attibute information about the token just scanned
 * and thus communicate that information to the parser. 
 *
 * pp2: You will need to add new fields to this union as you add different 
 *      attributes to your non-terminal symbols.
 */
%union {
    int integerConstant;
    bool boolConstant;
    char* stringConstant;
    double doubleConstant;
    char identifier[MaxIdentLen+1]; // +1 for terminating null

    Decl* decl;
    List<Decl*>* declList;
    VarDecl* varDecl;
    List<VarDecl*>* varDeclList;
    ClassDecl* classDecl;
    InterfaceDecl* interfaceDecl;
    FnDecl* fnDecl;
    Stmt* stmt;
    StmtBlock* stmtBlock;
    List<Stmt*>* stmtList;
    ConditionalStmt* conditionalStmt;
    Expr* expr;
    ForStmt* forStmt;
    WhileStmt* whileStmt;
    IfStmt* ifStmt;
    BreakStmt* breakStmt;
    ReturnStmt* returnStmt;
    PrintStmt* printStmt;
    Type* type;
    NamedType* namedType;
    ArrayType* arrayType;
    List<NamedType*>* namedTypeList;
    Identifier* ident;
    List<Identifier*>* identList;
    LValue* lvalue;
    ArrayAccess* arrayAccess;
    ArithmeticExpr* arithmeticExpr;
    FieldAccess* fieldAccess;
    AssignExpr* assignExpr;
    Call* call;
    List<Expr*>* exprlist;
    IntConstant*  intc;
    DoubleConstant* doublec;
    BoolConstant* boolc;
    StringConstant* stringc;
    NullConstant* nullc;
    RelationalExpr* relationalExpr;
    EqualityExpr* equalityExpr;
    This*	is;
    LogicalExpr*	logicalExpr;
    NewExpr*	newExpr;
    NewArrayExpr* newArrayExpr;
    ReadIntegerExpr* readIntegerExpr;
    ReadLineExpr*	readLineExpr;
}


/* Tokens
 * ------
 * Here we tell yacc about all the token types that we are using.
 * Yacc will assign unique numbers to these and export the #define
 * in the generated y.tab.h header file.
 */
%token   T_Void T_Bool T_Int T_Double T_String T_Class 
%token   T_LessEqual T_GreaterEqual T_Equal T_NotEqual T_Dims
%token   T_And T_Or T_Null T_Extends T_This T_Interface T_Implements
%token   T_While T_For T_If T_Else T_Return T_Break
%token   T_New T_NewArray T_Print T_ReadInteger T_ReadLine

%token   <identifier> T_Identifier
%token   <stringConstant> T_StringConstant 
%token   <integerConstant> T_IntConstant
%token   <doubleConstant> T_DoubleConstant
%token   <boolConstant> T_BoolConstant

%token   T_Increm T_Decrem T_Switch T_Case T_Default

%left '='
%left T_Or
%left T_And
%nonassoc T_Equal T_NotEqual
%nonassoc  '<' T_LessEqual T_GreaterEqual '>'
%left '+' '-'
%left '*' '/' '%'
%left '!' UMINUS T_Increm T_Decrem
%left '[' ']' '.'

//
/* Non-terminal types
 * ------------------
 * In order for yacc to assign/access the correct field of $$, $1, we
 * must to declare which field is appropriate for the non-terminal.
 * As an example, this first type declaration establishes that the DeclList
 * non-terminal uses the field named "declList" in the yylval union. This
 * means that when we are setting $$ for a reduction for DeclList ore reading
 * $n which corresponds to a DeclList nonterminal we are accessing the field
 * of the union named "declList" which is of type List<Decl*>.
 * pp2: You'll need to add many of these of your own.
 */
%type <declList>	Program
%type <declList>  	DeclList  // DeclList non-terminal uses the field named declList defined in %union
%type <decl>      	Decl
%type <decl>		Field
%type <declList>	FieldList
%type <fnDecl>   	FnDecl
%type <classDecl>  	ClassDecl
%type <decl>		Prototype
%type <declList>	PrototypeList
%type <interfaceDecl> 	InterfaceDecl
%type <stmtBlock>	StmtBlock
%type <stmt>		Stmt
%type <ifStmt>		IfStmt
%type <returnStmt>	ReturnStmt
%type <printStmt>	PrintStmt
%type <forStmt>		ForStmt
%type <whileStmt>	WhileStmt
%type <breakStmt>	BreakStmt
%type <expr>		Expr
%type <assignExpr>	AssignExpr
%type <ident>		Ident
%type <intc>		IntConstant
%type <doublec>		DoubleConstant
%type <stringc>		StringConstant
%type <boolc>		BoolConstant
%type <nullc>		NullConstant

%type <lvalue>		LValue
%type <arrayAccess>	ArrayAccess
%type <fieldAccess>	FieldAccess

%type <arithmeticExpr>	ArithmeticExpr
%type <call>		Call
%type <type>		Type
%type <arrayType>	ArrayType
%type <namedType>	NamedType
%type <namedTypeList>	NamedTypeList
%type <exprlist>	Actuals
%type <varDeclList>	Formals
%type <varDecl>   	VarDecl
%type <relationalExpr>	RelationalExpr
%type <equalityExpr>	EqualityExpr
%type <is>		This
%type <logicalExpr>	LogicalExpr
%type <newExpr>		NewExpr
%type <newArrayExpr>	NewArrayExpr
%type <readIntegerExpr>	ReadIntegerExpr
%type <readLineExpr>	ReadLineExpr
%type <stmtList>	StmtList
%type <varDeclList>	VarDeclList
%type <varDecl>		Variable
%%
/* Rules
 * -----
 * All productions and actions should be placed between the start and stop
 * %% markers which delimit the Rules section.
	 
 */
Program   :    DeclList            { 
                                      @1;
                                      /* pp2: The @1 is needed to convince 
                                       * yacc to set up yylloc. You can remove 
                                       * it once you have other uses of @n */
                                      Program *program = new Program($1);
                                      // if no errors, advance to next phase
                                      // if (ReportError::NumErrors() == 0)
                                      	  // will BuildScope() here
                                          // program->Check();
				      if (ReportError::NumErrors() == 0){
						  program->BuildScope();
						  program->Check();
						  program->Emit();
					  }
					  
                                    }
          ;

DeclList  :    DeclList Decl        { ($$=$1)->Append($2); }
          |    Decl                 { ($$ = new List<Decl*>)->Append($1); }
          ;

Decl      :    VarDecl               { $$ = $1; }
	  |    ClassDecl             { $$ = $1; }
	  |    InterfaceDecl             { $$ = $1; }
	  |    FnDecl             { $$ = $1; }
          ;

Variable  :    Type Ident   { $$ = new VarDecl($2, $1);}
	 // No T_void Ident!!!
          ;

VarDecl   :	Variable ';' { $$ = $1; }

FnDecl	  :	Type	Ident '(' Formals ')' Stmt
			{
			$$ = new FnDecl($2, $1, $4);
			$$->SetFunctionBody($6);
			}
	  |	Type	Ident '(' ')'  Stmt
			{
			List<VarDecl*> * empty = new List<VarDecl*>;
			$$ = new FnDecl($2,$1,empty);
			$$->SetFunctionBody($5);
			}
	  |	T_Void	Ident '(' Formals ')' Stmt
			{
			$$ = new FnDecl($2, new Type("void"), $4);
			$$->SetFunctionBody($6);
			}
	  |	T_Void	Ident '(' ')'  Stmt
			{
			List<VarDecl*> * empty = new List<VarDecl*>;
			$$ = new FnDecl($2,new Type("void"),empty);
			$$->SetFunctionBody($5);
			}
	  ;

Formals	  :	Formals ',' Variable {
			$$ = $1;
			$$ -> Append($3);
			}
	  |	Variable	{
			$$ = new List<VarDecl*>;
			$$ -> Append($1);
		}
	  |	epsilon { $$ = new List<VarDecl*>; }
	  ;

ClassDecl :	T_Class	Ident  T_Extends NamedType   T_Implements NamedTypeList  '{' FieldList '}'
		{ $$ = new ClassDecl($2, $4, $6, $8); }
	  |	T_Class	Ident  T_Extends NamedType   '{' FieldList '}'
		{ $$ = new ClassDecl($2, $4, new List<NamedType*>(), $6); }
	  |	T_Class	Ident  T_Implements NamedTypeList  '{' FieldList '}'
		{ $$ = new ClassDecl($2, NULL, $4, $6); }
	  |	T_Class	Ident '{' FieldList '}'
		{ $$ = new ClassDecl($2, NULL, new List<NamedType*>(), $4); }
	  ;

FieldList :	FieldList Field { ($$=$1)->Append($2); }
	  |	Field    { ($$ = new List<Decl*>)->Append($1); }
	  |	epsilon	 {  $$ = new List<Decl*>;	}
	  ;

Field     :	Variable ';' { $$ = $1; }
	  |	FnDecl  { $$ = $1; }
	  ;

InterfaceDecl :	T_Interface Ident '{' PrototypeList '}' { $$ = new InterfaceDecl($2, $4); }
	      ;

PrototypeList :	PrototypeList Prototype { ($$=$1)->Append($2); }
	      | Prototype { ($$ = new List<Decl*>)->Append($1); }
	      | epsilon { $$ = new List<Decl*>; }
	      ;

Prototype :	Type	Ident '(' Formals ')' ';'
                {
                	$$ = new FnDecl($2, $1, $4);
                }
          |	Type	Ident '(' ')' ';'
                {
                	List<VarDecl*> * empty = new List<VarDecl*>;
                	$$ = new FnDecl($2,$1,empty);
               	}
	  |	T_Void	Ident '(' Formals ')' ';'
                {
                	$$ = new FnDecl($2, new Type("void"), $4);
                }
          |	T_Void	Ident '(' ')' ';'
                {
                	List<VarDecl*> * empty = new List<VarDecl*>;
                	$$ = new FnDecl($2,new Type("void"),empty);
               	}
	  ;

StmtBlock :	'{' VarDeclList StmtList '}'	{ $$ = new StmtBlock($2,$3); }
	  |	'{' StmtList '}'		{ $$ = new StmtBlock(new List<VarDecl*>,$2);}
	  ;

VarDeclList	: VarDecl	{ $$ = new List<VarDecl*>; $$->Append($1);}
		| VarDeclList VarDecl { $$ =$1; $$->Append($2); }
		| epsilon	{ $$ = new List<VarDecl*>; }
		;

Stmt	  : 	Expr ';'		{ $$ = $1; }
	  |	IfStmt			{ $$ = $1; }
	  |	WhileStmt		{ $$ = $1; }
	  |	ForStmt			{ $$ = $1; }
	  |	BreakStmt		{ $$ = $1; }
	  |	ReturnStmt		{ $$ = $1; }
	  |	PrintStmt		{ $$ = $1; }
	  |	StmtBlock 		{ $$ = $1; }
	  |	';'			{ $$ = new EmptyExpr(); }
	  ;




StmtList   :	StmtList Stmt	{ $$ = $1; $$->Append($2);}
	   |	Stmt		{ $$ = new List<Stmt*>;  $$->Append($1); }
	   |	epsilon		{ $$ = new List<Stmt*>; }
	   ;


BreakStmt :	T_Break	 ';' { $$=new BreakStmt(@1); }
	  ;
	  
ReturnStmt :	T_Return Expr ';'
		{ $$=new ReturnStmt(@2, $2); }
	   |	T_Return ';'
	   	{ $$=new ReturnStmt(@1, new EmptyExpr()); }
	   ;

PrintStmt :	T_Print '(' Actuals ')' ';'
		{ $$ = new PrintStmt($3); }
	  ;

ForStmt	  :	 T_For '(' Expr ';' Expr ';' Expr ')' Stmt
                { $$ = new ForStmt($3,$5,$7,$9); }
          |	T_For '('  ';' Expr ';' Expr ')' Stmt
                { 	Expr* empty = new EmptyExpr();
                	$$ = new ForStmt(empty,$4,$6,$8); }
          |	T_For '(' Expr ';' Expr ';'  ')' Stmt
                { 	Expr* empty = new EmptyExpr();
                        $$ = new ForStmt($3,$5,empty,$8); }
          |	T_For '(' ';' Expr ';'  ')' Stmt
                          { 	Expr* empty1 = new EmptyExpr();
                          	Expr* empty2 = new EmptyExpr();
                                $$ = new ForStmt(empty1,$4,empty2,$7); }
	  ;

IfStmt	  :	T_If '(' Expr ')' Stmt  T_Else Stmt
	  	{
	  		$$ = new IfStmt($3,$5,$7);
	  	}
          |	T_If '(' Expr ')' Stmt
                {
                        $$ = new IfStmt($3,$5,NULL);
                }
	  ;

WhileStmt  :	T_While	'(' Expr ')' Stmt
		{
			$$ = new  WhileStmt($3,$5);
		}
 	   ;

Expr	  :     '(' Expr ')' { $$ = $2; }
	  |	AssignExpr { $$ = $1; }
	  |	LValue       { $$ = $1; }
	  |	ArithmeticExpr	{ $$ = $1; }
	  |	LogicalExpr	{ $$ = $1; }
	  |	RelationalExpr	{ $$ = $1; }
	  |	EqualityExpr	{ $$ = $1; }
	  |	NewExpr		{ $$ = $1; }
	  |	NewArrayExpr	{ $$ = $1; }
	  |	ReadIntegerExpr	{ $$ = $1; }
	  |	ReadLineExpr	{ $$ = $1; }
	  |	IntConstant	{ $$ = $1; }
	  |	DoubleConstant	{ $$ = $1; }
	  |	BoolConstant	{ $$ = $1; }
	  |	StringConstant 	{ $$ = $1; }
	  |	NullConstant	{ $$ = $1; }
	  |	Call		{ $$ = $1; }
	  |	This		{ $$ = $1; }
	  ;

AssignExpr	:	LValue '='  Expr
                        {
                        	$$ = new  AssignExpr($1, new Operator(@2, "="), $3);
                        }
			;


ArithmeticExpr	: Expr '*' Expr
			{
                                $$ = new ArithmeticExpr($1,new Operator(@2,"*"),$3);

			}
		| Expr	'/' Expr
                        {
                                $$ = new ArithmeticExpr($1,new Operator(@2,"/"),$3);
                        }
		| Expr  '+' Expr
                	{
                                $$ = new ArithmeticExpr($1,new Operator(@2,"+"),$3);
                	}
                | Expr	'-' Expr
                	{
                		$$ = new ArithmeticExpr($1,new Operator(@2,"-"),$3);
                	}
		| Expr  '%' Expr
			{
                                $$ = new ArithmeticExpr($1,new Operator(@2,"%"),$3);
			}
		| '-' Expr %prec UMINUS
                	    	{

                	    		$$ = new ArithmeticExpr(new Operator(@1,"-"),$2);
                	    	}
		;

RelationalExpr :	Expr  '>' Expr
				{
                       $$ = new  RelationalExpr($1,new Operator(@2,">"),$3);
                }
               |	Expr  '<' Expr
				{
                      	$$ = new  RelationalExpr($1,new Operator(@2,"<"),$3);
                                }
               |	Expr  T_GreaterEqual Expr
               	{
                      $$ = new  RelationalExpr($1,new Operator(@2,">="),$3);
                }

               |	Expr  T_LessEqual  Expr
               			{	$$ = new  RelationalExpr($1,new Operator(@2,"<="),$3);
               			}
               ;

EqualityExpr :		Expr  T_Equal	Expr
                              { 	$$ = new  EqualityExpr($1,new Operator(@2,"=="),$3);
                              }
             |          Expr  T_NotEqual Expr
             		      {		$$ = new  EqualityExpr($1,new Operator(@2,"!="),$3);
             		      }
	     ;

LogicalExpr :	'!' Expr
		{
			$$ = new LogicalExpr(new Operator(@1,"!"),$2);
		}
	    |	Expr T_And Expr
	    	{	$$ = new  LogicalExpr($1,new Operator(@2,"&&"),$3);
               	}
            |	Expr T_Or Expr
            	{	$$ = new  LogicalExpr($1,new Operator(@2,"||"),$3);
                }
	    ;

LValue	  :	ArrayAccess	{ $$ = $1; }
          |	FieldAccess	{ $$ = $1; }
  	  ;

ArrayAccess :	Expr '[' Expr ']'  { $$ = new ArrayAccess(yyloc,$1,$3);}
	  ;

FieldAccess :   Expr '.' Ident  { $$ = new FieldAccess($1,$3); }
	    |	Ident		{ $$ = new FieldAccess(NULL,$1);}
            ;

NewArrayExpr :  T_NewArray '(' Expr ',' Ident ')'
		{
			NamedType* Type = new NamedType($5);
                        $$ = new NewArrayExpr(yyloc,$3,Type);
		}
	     |	T_NewArray '(' Expr ',' Type ')'
	        {
                        $$ = new NewArrayExpr(yyloc,$3,$5);
	        }
	     |	T_NewArray '(' Expr ',' Type '[' ']' ')'
	     	{
			ArrayType* Type = new ArrayType(yyloc,$5);
			$$ = new NewArrayExpr(yyloc,$3,$5);
	     	}
	     ;

ReadIntegerExpr	:	T_ReadInteger '(' ')' { $$ = new ReadIntegerExpr(yyloc); }
		;

ReadLineExpr	:	T_ReadLine '(' ')' { $$ = new ReadLineExpr(yyloc); }
		;

Type	  :   T_Bool 		{ $$ = new Type("bool"); }
 	  |   T_Int 		{ $$ = new Type("int"); }
 	  |   T_Double 		{ $$ = new Type("double"); }
 	  |   T_String 		{ $$ = new Type("string"); }
 	  |   ArrayType		{ $$ = $1;}
 	  |   NamedType		{ $$ = $1; }
 	  ;

ArrayType :  Type T_Dims { $$ = new ArrayType(yyloc, $1); }
	  ;

NamedType :   Ident 		{ $$ = new NamedType($1); }

NamedTypeList :	NamedTypeList ',' NamedType { ($$=$1)->Append($3); }
	      | NamedType { ($$ = new List<NamedType*>)->Append($1); }
	      ;

NewExpr	  :   T_New '(' Ident ')'
		{
			NamedType* Type = new NamedType($3);
			$$ = new NewExpr(yyloc, Type);
		}
	  ;

Ident     :   T_Identifier   { $$ = new Identifier(yyloc, $1); }
	  ;

IntConstant :	T_IntConstant  { $$ = new IntConstant(yyloc, $1); }
	  ;

DoubleConstant : T_DoubleConstant { $$ = new DoubleConstant(yyloc, $1); }
	  ;

BoolConstant :	T_BoolConstant { $$ = new BoolConstant(yyloc,$1); }
	  ;

StringConstant : T_StringConstant { $$ = new StringConstant(yyloc,$1); }
	  ;

NullConstant	: T_Null	{ $$ = new NullConstant(yyloc); }
	  ;

Call	:	Expr '.' Ident '(' Actuals ')'
		{
			$$ = new Call(yyloc,$1,$3,$5);
		}
	|	Ident '(' Actuals ')'
		{
			$$ = new Call(yyloc,NULL,$1,$3);
			
		}
	|	Expr '.' Ident '('  ')'
        		{	List<Expr*> * empty = new List<Expr*>;
        			$$ = new Call(yyloc,$1,$3,empty);
        		}
        |	Ident '('  ')'
        		{
        			List<Expr*> * empty = new List<Expr*>;
        			$$ = new Call(yyloc,NULL,$1,empty);
        		}
	;

Actuals :	Actuals ',' Expr
		{
			$$ = $1;
			$$ -> Append($3);
		}
	|	Expr
		{
			$$ = new List<Expr*>;
			$$ -> Append($1);
		}
	;

This	:	T_This	{ $$ = new This(yyloc);}
	;


epsilon : {};
%%

/* The closing %% above marks the end of the Rules section and the beginning
 * of the User Subroutines section. All text from here to the end of the
 * file is copied verbatim to the end of the generated y.tab.c file.
 * This section is where you put definitions of helper functions.
 */

/* Function: InitParser
 * --------------------
 * This function will be ed before any calls to yyparse().  It is designed
 * to give you an opportunity to do anything that must be done to initialize
 * the parser (set global variables, configure starting state, etc.). One
 * thing it already does for you is assign the value of the global variable
 * yydebug that controls whether yacc prints debugging information about
 * parser actions (shift/reduce) and contents of state stack during parser.
 * If set to false, no information is printed. Setting it to true will give
 * you a running trail that might be helpful when debugging your parser.
 * Please be sure the variable is set to false when submitting your final
 * version.
 */
void InitParser()
{
   PrintDebug("parser", "Initializing parser");
   yydebug = false; // no information is printed
}