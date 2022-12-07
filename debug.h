#define DEBUG 1

#define DEBUG_EMIT 0&&DEBUG
#define DEBUG_CHECK 0&&DEBUG
#define DEBUG_BS 0&&DEBUG
#define DEBUG_MEMBYTE 0&&DEBUG

//DEBUG_EMIT
#define DEBUG_GetBuild 1&&DEBUG_EMIT
#define DEBUG_PrintStmt_Emit 1&&DEBUG_EMIT
#define DEBUG_StmtBlock_Emit 1&&DEBUG_EMIT
#define DEBUG_FieldAccess_Emit 1&&DEBUG_EMIT
#define DEBUG_FnDecl_Emit 1&&DEBUG_EMIT
#define DEBUG_Call_Emit 1&&DEBUG_EMIT
#define DEBUG_StmtBlock_Emit 1&&DEBUG_EMIT
#define DEBUG_ClassDecl_Emit 1&&DEBUG_EMIT
#define DEBUG_AssignExpr_Emit 1&&DEBUG_EMIT
//DEBUG_MEMBYTE
#define DEBUG_ForSmt_GetB 1&&DEBUG_MEMBYTE
#define DEBUG_COM_GetB 1&&DEBUG_MEMBYTE
#define DEBUG_StmtBlock_GetB 1&&DEBUG_MEMBYTE
#define DEBUG_AssignExpr_GetM 1&&DEBUG_MEMBYTE
#define DEBUG_FieldAccess_GetMemBytes 1&&DEBUG_MEMBYTE
#define DEBUG_Call_GetMemBytes 1&&DEBUG_MEMBYTE
#define DEBUG_IfStmt_GetMemBytes 1&&DEBUG_MEMBYTE

//Important

#define DEBUG_D1 0 &&DEBUG
#define DEBUG_D2 0 &&DEBUG
#define DEBUG_D3 0 &&DEBUG

#define DEBUG_P5 0&&DEBUG
#define DEBUG_MIPS 1&&DEBUG
#define DEBUG_RS 1&&DEBUG