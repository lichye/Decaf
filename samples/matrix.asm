	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Matrix.Init:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Matrix.Set:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Matrix.Get:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Matrix.PrintMatrix:
	# BeginFunc 76
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp0 from $v0 to $fp-16
	# i = _tmp0
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
  _L0:
	# _tmp1 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp2 = i < _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp2 Goto _L1
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp1 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp2 from $t1 to $fp-24
	  lw $t1, -24($fp)	# fill _tmp2 to $t1 from $fp-24
	  beqz $t1, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# j = _tmp3
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t2
	  move $t7, $t2		# copy value from $t2 to $t7
	# we clean all the regiser
	  sw $t2, -28($fp)	# spill _tmp3 from $t2 to $fp-28
	  sw $t7, -12($fp)	# spill j from $t7 to $fp-12
  _L2:
	# _tmp4 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp5 = j < _tmp4
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t7
	# the op2 is $t0
	  lw $t7, -12($fp)	# fill j to $t7 from $fp-12
	  slt $t1, $t7, $t0	
	# IfZ _tmp5 Goto _L3
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp4 from $t0 to $fp-32
	  sw $t1, -36($fp)	# spill _tmp5 from $t1 to $fp-36
	  lw $t1, -36($fp)	# fill _tmp5 to $t1 from $fp-36
	  beqz $t1, _L3	# branch if _tmp5 is zero 
	# _tmp6 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp6 register is given $t2
	# the reference: this is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp7 = *(_tmp6 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp7 register is given $t3
	# the reference: _tmp6 is given $t2
	  lw $t3, 8($t2) 	# load with offset
	# PushParam j
	# we are in a EmitParam
	# so, the arg register is given $t7
	  lw $t7, -12($fp)	# fill j to $t7 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# PushParam i
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp8 = ACall _tmp7
	# we clean all the regiser
	  sw $t2, -40($fp)	# spill _tmp6 from $t2 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp7 from $t3 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp7 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -48($fp)	# spill _tmp8 from $t4 to $fp-48
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -48($fp)	# fill _tmp8 to $t4 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = "\t"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\t"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\t"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string1
	  la $t0, _string1	# load label
	# PushParam _tmp9
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -52($fp)	# spill _tmp9 from $t0 to $fp-52
	  lw $t0, -52($fp)	# fill _tmp9 to $t0 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp10 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp11 = j + _tmp10
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t7
	# the op2 is $t0
	  lw $t7, -12($fp)	# fill j to $t7 from $fp-12
	  add $t1, $t7, $t0	
	# j = _tmp11
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t1
	  move $t7, $t1		# copy value from $t1 to $t7
	# Goto _L2
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp10 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp11 from $t1 to $fp-60
	  sw $t7, -12($fp)	# spill j from $t7 to $fp-12
	  b _L2		# unconditional branch
	# we clean all the regiser
  _L3:
	# _tmp12 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string2
	  la $t0, _string2	# load label
	# PushParam _tmp12
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -64($fp)	# spill _tmp12 from $t0 to $fp-64
	  lw $t0, -64($fp)	# fill _tmp12 to $t0 from $fp-64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp14 = i + _tmp13
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t6, $v0, $t5	
	# i = _tmp14
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t6
	  move $v0, $t6		# copy value from $t6 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L0
	# we clean all the regiser
	  sw $t5, -68($fp)	# spill _tmp13 from $t5 to $fp-68
	  sw $t6, -72($fp)	# spill _tmp14 from $t6 to $fp-72
	  b _L0		# unconditional branch
	# we clean all the regiser
  _L1:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Matrix.SeedMatrix:
	# BeginFunc 188
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 188	# decrement sp to make space for locals/temps
	# _tmp15 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 0
	  li $t6, 0		# load constant value 0 into $t6
	# i = _tmp15
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t6
	  move $v0, $t6		# copy value from $t6 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t6, -16($fp)	# spill _tmp15 from $t6 to $fp-16
  _L4:
	# _tmp16 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp17 = i < _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp17 Goto _L5
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp16 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp17 from $t1 to $fp-24
	  lw $t1, -24($fp)	# fill _tmp17 to $t1 from $fp-24
	  beqz $t1, _L5	# branch if _tmp17 is zero 
	# _tmp18 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# j = _tmp18
	# We are in the EmitCopy
	# so, the dst register is given $t5
	# the src is $t2
	  move $t5, $t2		# copy value from $t2 to $t5
	# we clean all the regiser
	  sw $t2, -28($fp)	# spill _tmp18 from $t2 to $fp-28
	  sw $t5, -12($fp)	# spill j from $t5 to $fp-12
  _L6:
	# _tmp19 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp20 = j < _tmp19
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t5
	# the op2 is $t0
	  lw $t5, -12($fp)	# fill j to $t5 from $fp-12
	  slt $t1, $t5, $t0	
	# IfZ _tmp20 Goto _L7
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp19 from $t0 to $fp-32
	  sw $t1, -36($fp)	# spill _tmp20 from $t1 to $fp-36
	  lw $t1, -36($fp)	# fill _tmp20 to $t1 from $fp-36
	  beqz $t1, _L7	# branch if _tmp20 is zero 
	# _tmp21 = i + j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $t5, -12($fp)	# fill j to $t5 from $fp-12
	  add $t2, $v0, $t5	
	# _tmp22 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp22 register is given $t3
	# the reference: this is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t3, 0($t0) 	# load with offset
	# _tmp23 = *(_tmp22 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp23 register is given $t4
	# the reference: _tmp22 is given $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp21
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -40($fp)	# spill _tmp21 from $t2 to $fp-40
	  lw $t2, -40($fp)	# fill _tmp21 to $t2 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam j
	# we are in a EmitParam
	# so, the arg register is given $t5
	  lw $t5, -12($fp)	# fill j to $t5 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam i
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp23
	# we clean all the regiser
	  sw $t3, -44($fp)	# spill _tmp22 from $t3 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp23 from $t4 to $fp-48
	  lw $v0, -48($fp)	# fill _tmp23 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp24 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp25 = j + _tmp24
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t5
	# the op2 is $t0
	  lw $t5, -12($fp)	# fill j to $t5 from $fp-12
	  add $t1, $t5, $t0	
	# j = _tmp25
	# We are in the EmitCopy
	# so, the dst register is given $t5
	# the src is $t1
	  move $t5, $t1		# copy value from $t1 to $t5
	# Goto _L6
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp24 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp25 from $t1 to $fp-56
	  sw $t5, -12($fp)	# spill j from $t5 to $fp-12
	  b _L6		# unconditional branch
	# we clean all the regiser
  _L7:
	# _tmp26 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp27 = i + _tmp26
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp27
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L4
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp26 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp27 from $t1 to $fp-64
	  b _L4		# unconditional branch
	# we clean all the regiser
  _L5:
	# _tmp28 = 2
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -68($fp)	# spill _tmp28 from $v0 to $fp-68
	# _tmp29 = 3
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -72($fp)	# spill _tmp29 from $v0 to $fp-72
	# _tmp30 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -76($fp)	# spill _tmp30 from $v0 to $fp-76
	# _tmp31 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp31 register is given $spill
	# the reference: this is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $v0, 0($t0) 	# load with offset
	  sw $v0, -80($fp)	# spill _tmp31 from $v0 to $fp-80
	# _tmp32 = *(_tmp31 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp32 register is given $spill
	# the reference: _tmp31 is given $spill
	  lw $v0, -80($fp)	# fill _tmp31 to $v0 from $fp-80
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp32 from $v0 to $fp-84
	# PushParam _tmp30
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -76($fp)	# fill _tmp30 to $v0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp29
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -72($fp)	# fill _tmp29 to $v0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp28
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -68($fp)	# fill _tmp28 to $v0 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp32
	# we clean all the regiser
	  lw $v0, -84($fp)	# fill _tmp32 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp33 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp34 = 6
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 6
	  sw $t0, -88($fp)	# spill _tmp33 from $t0 to $fp-88
	  li $t0, 6		# load constant value 6 into $t0
	# _tmp35 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp36 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp36 register is given $t2
	# the reference: this is given $t0
	  sw $t0, -92($fp)	# spill _tmp34 from $t0 to $fp-92
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp37 = *(_tmp36 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp37 register is given $t3
	# the reference: _tmp36 is given $t2
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp35
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -96($fp)	# spill _tmp35 from $t1 to $fp-96
	  lw $t1, -96($fp)	# fill _tmp35 to $t1 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp34
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -92($fp)	# fill _tmp34 to $t0 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp33
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -88($fp)	# fill _tmp33 to $t0 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp37
	# we clean all the regiser
	  sw $t2, -100($fp)	# spill _tmp36 from $t2 to $fp-100
	  sw $t3, -104($fp)	# spill _tmp37 from $t3 to $fp-104
	  lw $v0, -104($fp)	# fill _tmp37 to $v0 from $fp-104
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp38 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp39 = 3
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 3
	  sw $t0, -108($fp)	# spill _tmp38 from $t0 to $fp-108
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp40 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 5
	  li $t1, 5		# load constant value 5 into $t1
	# _tmp41 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp41 register is given $t2
	# the reference: this is given $t0
	  sw $t0, -112($fp)	# spill _tmp39 from $t0 to $fp-112
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp42 = *(_tmp41 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp42 register is given $t3
	# the reference: _tmp41 is given $t2
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp40
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -116($fp)	# spill _tmp40 from $t1 to $fp-116
	  lw $t1, -116($fp)	# fill _tmp40 to $t1 from $fp-116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp39
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -112($fp)	# fill _tmp39 to $t0 from $fp-112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp38
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -108($fp)	# fill _tmp38 to $t0 from $fp-108
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp42
	# we clean all the regiser
	  sw $t2, -120($fp)	# spill _tmp41 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp42 from $t3 to $fp-124
	  lw $v0, -124($fp)	# fill _tmp42 to $v0 from $fp-124
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp43 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp44 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  sw $t0, -128($fp)	# spill _tmp43 from $t0 to $fp-128
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp45 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp46 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp46 register is given $t2
	# the reference: this is given $t0
	  sw $t0, -132($fp)	# spill _tmp44 from $t0 to $fp-132
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp47 = *(_tmp46 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp47 register is given $t3
	# the reference: _tmp46 is given $t2
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp45
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -136($fp)	# spill _tmp45 from $t1 to $fp-136
	  lw $t1, -136($fp)	# fill _tmp45 to $t1 from $fp-136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp44
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -132($fp)	# fill _tmp44 to $t0 from $fp-132
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp43
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -128($fp)	# fill _tmp43 to $t0 from $fp-128
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp47
	# we clean all the regiser
	  sw $t2, -140($fp)	# spill _tmp46 from $t2 to $fp-140
	  sw $t3, -144($fp)	# spill _tmp47 from $t3 to $fp-144
	  lw $v0, -144($fp)	# fill _tmp47 to $v0 from $fp-144
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp48 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp49 = 6
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 6
	  sw $t0, -148($fp)	# spill _tmp48 from $t0 to $fp-148
	  li $t0, 6		# load constant value 6 into $t0
	# _tmp50 = 3
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 3
	  li $t1, 3		# load constant value 3 into $t1
	# _tmp51 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp51 register is given $t2
	# the reference: this is given $t0
	  sw $t0, -152($fp)	# spill _tmp49 from $t0 to $fp-152
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp52 = *(_tmp51 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp52 register is given $t3
	# the reference: _tmp51 is given $t2
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp50
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -156($fp)	# spill _tmp50 from $t1 to $fp-156
	  lw $t1, -156($fp)	# fill _tmp50 to $t1 from $fp-156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp49
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -152($fp)	# fill _tmp49 to $t0 from $fp-152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp48
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -148($fp)	# fill _tmp48 to $t0 from $fp-148
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp52
	# we clean all the regiser
	  sw $t2, -160($fp)	# spill _tmp51 from $t2 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp52 from $t3 to $fp-164
	  lw $v0, -164($fp)	# fill _tmp52 to $v0 from $fp-164
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp53 = 7
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 7
	  li $t0, 7		# load constant value 7 into $t0
	# _tmp54 = 7
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 7
	  sw $t0, -168($fp)	# spill _tmp53 from $t0 to $fp-168
	  li $t0, 7		# load constant value 7 into $t0
	# _tmp55 = 7
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 7
	  li $t1, 7		# load constant value 7 into $t1
	# _tmp56 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp56 register is given $t2
	# the reference: this is given $t0
	  sw $t0, -172($fp)	# spill _tmp54 from $t0 to $fp-172
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  lw $t2, 0($t0) 	# load with offset
	# _tmp57 = *(_tmp56 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp57 register is given $t3
	# the reference: _tmp56 is given $t2
	  lw $t3, 4($t2) 	# load with offset
	# PushParam _tmp55
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -176($fp)	# spill _tmp55 from $t1 to $fp-176
	  lw $t1, -176($fp)	# fill _tmp55 to $t1 from $fp-176
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam _tmp54
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -172($fp)	# fill _tmp54 to $t0 from $fp-172
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp53
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -168($fp)	# fill _tmp53 to $t0 from $fp-168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill this to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp57
	# we clean all the regiser
	  sw $t2, -180($fp)	# spill _tmp56 from $t2 to $fp-180
	  sw $t3, -184($fp)	# spill _tmp57 from $t3 to $fp-184
	  lw $v0, -184($fp)	# fill _tmp57 to $v0 from $fp-184
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Matrix
	  .data
	  .align 2
	  Matrix:		# label for class Matrix vtable
	  .word _Matrix.Init
	  .word _Matrix.Set
	  .word _Matrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _DenseMatrix.Init:
	# BeginFunc 296
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 296	# decrement sp to make space for locals/temps
	# _tmp58 = 10
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -16($fp)	# spill _tmp58 from $v0 to $fp-16
	# _tmp59 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp59 from $v0 to $fp-20
	# _tmp60 = _tmp58 < _tmp59
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp58 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp59 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp60 from $v0 to $fp-24
	# IfZ _tmp60 Goto _L8
	# we clean all the regiser
	  lw $v0, -24($fp)	# fill _tmp60 to $v0 from $fp-24
	  beqz $v0, _L8	# branch if _tmp60 is zero 
	# _tmp61 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string3
	  la $v0, _string3	# load label
	  sw $v0, -28($fp)	# spill _tmp61 from $v0 to $fp-28
	# PushParam _tmp61
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -28($fp)	# fill _tmp61 to $v0 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L8:
	# _tmp62 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp63 = _tmp62 + _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill _tmp58 to $v1 from $fp-16
	  add $t1, $t0, $v1	
	# _tmp64 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp65 = _tmp63 * _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  mul $t3, $t1, $t2	
	# PushParam _tmp65
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -44($fp)	# spill _tmp65 from $t3 to $fp-44
	  lw $t3, -44($fp)	# fill _tmp65 to $t3 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp66 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp62 from $t0 to $fp-32
	  sw $t1, -36($fp)	# spill _tmp63 from $t1 to $fp-36
	  sw $t2, -40($fp)	# spill _tmp64 from $t2 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -48($fp)	# spill _tmp66 from $t4 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp66) = _tmp58
	# We are in the EmitStore
	# so, the reference: _tmp66 register is given $t4
	# the value: _tmp58 is given $spill
	  lw $v0, -16($fp)	# fill _tmp58 to $v0 from $fp-16
	  sw $v0, 0($t4) 	# store with offset
	# _tmp67 = _tmp66 + _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t2
	  lw $t2, -40($fp)	# fill _tmp64 to $t2 from $fp-40
	  add $t0, $t4, $t2	
	# *(this + 4) = _tmp67
	# We are in the EmitStore
	# so, the reference: this register is given $spill
	# the value: _tmp67 is given $t0
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $t0, 4($v1) 	# store with offset
	# _tmp68 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp68
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp67 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp68 from $t1 to $fp-56
  _L9:
	# _tmp69 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp70 = i < _tmp69
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp70 Goto _L10
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp69 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp70 from $t1 to $fp-64
	  lw $t1, -64($fp)	# fill _tmp70 to $t1 from $fp-64
	  beqz $t1, _L10	# branch if _tmp70 is zero 
	# _tmp71 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp71 register is given $t7
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $t7, 4($v0) 	# load with offset
	# _tmp72 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp73 = i < _tmp72
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp74 = *(_tmp71 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp74 register is given $t4
	# the reference: _tmp71 is given $t7
	  lw $t4, -4($t7) 	# load with offset
	# _tmp75 = i < _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp76 = _tmp75 == _tmp72
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp77 = _tmp73 || _tmp76
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t6
	  or $s0, $t3, $t6	
	# IfZ _tmp77 Goto _L11
	# we clean all the regiser
	  sw $t2, -72($fp)	# spill _tmp72 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp73 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp74 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp75 from $t5 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp76 from $t6 to $fp-88
	  sw $t7, -68($fp)	# spill _tmp71 from $t7 to $fp-68
	  sw $s0, -92($fp)	# spill _tmp77 from $s0 to $fp-92
	  lw $s0, -92($fp)	# fill _tmp77 to $s0 from $fp-92
	  beqz $s0, _L11	# branch if _tmp77 is zero 
	# _tmp78 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string4
	  la $s1, _string4	# load label
	# PushParam _tmp78
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -96($fp)	# spill _tmp78 from $s1 to $fp-96
	  lw $s1, -96($fp)	# fill _tmp78 to $s1 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L11:
	# _tmp79 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp80 = _tmp79 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp81 = _tmp71 + _tmp80
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t7
	# the op2 is $t1
	  lw $t7, -68($fp)	# fill _tmp71 to $t7 from $fp-68
	  add $t5, $t7, $t1	
	# _tmp82 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 10
	  li $t6, 10		# load constant value 10 into $t6
	# _tmp83 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp84 = _tmp82 < _tmp83
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t6
	# the op2 is $t2
	  slt $t3, $t6, $t2	
	# IfZ _tmp84 Goto _L12
	# we clean all the regiser
	  sw $t0, -100($fp)	# spill _tmp79 from $t0 to $fp-100
	  sw $t1, -104($fp)	# spill _tmp80 from $t1 to $fp-104
	  sw $t2, -116($fp)	# spill _tmp83 from $t2 to $fp-116
	  sw $t3, -120($fp)	# spill _tmp84 from $t3 to $fp-120
	  sw $t5, -108($fp)	# spill _tmp81 from $t5 to $fp-108
	  sw $t6, -112($fp)	# spill _tmp82 from $t6 to $fp-112
	  lw $t3, -120($fp)	# fill _tmp84 to $t3 from $fp-120
	  beqz $t3, _L12	# branch if _tmp84 is zero 
	# _tmp85 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t4
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t4
	# the label is _string5
	  la $t4, _string5	# load label
	# PushParam _tmp85
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -124($fp)	# spill _tmp85 from $t4 to $fp-124
	  lw $t4, -124($fp)	# fill _tmp85 to $t4 from $fp-124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L12:
	# _tmp86 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp87 = _tmp86 + _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t6
	  lw $t6, -112($fp)	# fill _tmp82 to $t6 from $fp-112
	  add $t1, $t0, $t6	
	# _tmp88 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp89 = _tmp87 * _tmp88
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t3
	  mul $t2, $t1, $t3	
	# PushParam _tmp89
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -140($fp)	# spill _tmp89 from $t2 to $fp-140
	  lw $t2, -140($fp)	# fill _tmp89 to $t2 from $fp-140
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp90 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -128($fp)	# spill _tmp86 from $t0 to $fp-128
	  sw $t1, -132($fp)	# spill _tmp87 from $t1 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp88 from $t3 to $fp-136
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -144($fp)	# spill _tmp90 from $t4 to $fp-144
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp90) = _tmp82
	# We are in the EmitStore
	# so, the reference: _tmp90 register is given $t4
	# the value: _tmp82 is given $t6
	  lw $t6, -112($fp)	# fill _tmp82 to $t6 from $fp-112
	  sw $t6, 0($t4) 	# store with offset
	# _tmp91 = _tmp90 + _tmp88
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t3
	  lw $t3, -136($fp)	# fill _tmp88 to $t3 from $fp-136
	  add $t0, $t4, $t3	
	# *(_tmp81) = _tmp91
	# We are in the EmitStore
	# so, the reference: _tmp81 register is given $t5
	# the value: _tmp91 is given $t0
	  lw $t5, -108($fp)	# fill _tmp81 to $t5 from $fp-108
	  sw $t0, 0($t5) 	# store with offset
	# _tmp92 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp93 = i + _tmp92
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# i = _tmp93
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t2
	  move $v0, $t2		# copy value from $t2 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L9
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp91 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp92 from $t1 to $fp-152
	  sw $t2, -156($fp)	# spill _tmp93 from $t2 to $fp-156
	  b _L9		# unconditional branch
	# we clean all the regiser
  _L10:
	# _tmp94 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp94
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -160($fp)	# spill _tmp94 from $t0 to $fp-160
  _L13:
	# _tmp95 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp96 = i < _tmp95
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp96 Goto _L14
	# we clean all the regiser
	  sw $t0, -164($fp)	# spill _tmp95 from $t0 to $fp-164
	  sw $t1, -168($fp)	# spill _tmp96 from $t1 to $fp-168
	  lw $t1, -168($fp)	# fill _tmp96 to $t1 from $fp-168
	  beqz $t1, _L14	# branch if _tmp96 is zero 
	# _tmp97 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# j = _tmp97
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t2
	  move $v0, $t2		# copy value from $t2 to $v0
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# we clean all the regiser
	  sw $t2, -172($fp)	# spill _tmp97 from $t2 to $fp-172
  _L15:
	# _tmp98 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp99 = j < _tmp98
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t1, $v0, $t0	
	# IfZ _tmp99 Goto _L16
	# we clean all the regiser
	  sw $t0, -176($fp)	# spill _tmp98 from $t0 to $fp-176
	  sw $t1, -180($fp)	# spill _tmp99 from $t1 to $fp-180
	  lw $t1, -180($fp)	# fill _tmp99 to $t1 from $fp-180
	  beqz $t1, _L16	# branch if _tmp99 is zero 
	# _tmp100 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp100 register is given $s3
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $s3, 4($v0) 	# load with offset
	# _tmp101 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp102 = i < _tmp101
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp103 = *(_tmp100 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp103 register is given $t4
	# the reference: _tmp100 is given $s3
	  lw $t4, -4($s3) 	# load with offset
	# _tmp104 = i < _tmp103
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp105 = _tmp104 == _tmp101
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp106 = _tmp102 || _tmp105
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp106 Goto _L17
	# we clean all the regiser
	  sw $t2, -188($fp)	# spill _tmp101 from $t2 to $fp-188
	  sw $t3, -192($fp)	# spill _tmp102 from $t3 to $fp-192
	  sw $t4, -196($fp)	# spill _tmp103 from $t4 to $fp-196
	  sw $t5, -200($fp)	# spill _tmp104 from $t5 to $fp-200
	  sw $t6, -204($fp)	# spill _tmp105 from $t6 to $fp-204
	  sw $t7, -208($fp)	# spill _tmp106 from $t7 to $fp-208
	  sw $s3, -184($fp)	# spill _tmp100 from $s3 to $fp-184
	  lw $t7, -208($fp)	# fill _tmp106 to $t7 from $fp-208
	  beqz $t7, _L17	# branch if _tmp106 is zero 
	# _tmp107 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string6
	  la $s0, _string6	# load label
	# PushParam _tmp107
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -212($fp)	# spill _tmp107 from $s0 to $fp-212
	  lw $s0, -212($fp)	# fill _tmp107 to $s0 from $fp-212
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L17:
	# _tmp108 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp109 = _tmp108 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp110 = _tmp100 + _tmp109
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s3
	# the op2 is $t1
	  lw $s3, -184($fp)	# fill _tmp100 to $s3 from $fp-184
	  add $t2, $s3, $t1	
	# _tmp111 = *(_tmp110)
	# We are in the EmitLoad
	# so, the dst: _tmp111 register is given $t6
	# the reference: _tmp110 is given $t2
	  lw $t6, 0($t2) 	# load with offset
	# _tmp112 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp113 = j < _tmp112
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t4, $v0, $t3	
	# _tmp114 = *(_tmp111 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp114 register is given $t5
	# the reference: _tmp111 is given $t6
	  lw $t5, -4($t6) 	# load with offset
	# _tmp115 = j < _tmp114
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t7, $v0, $t5	
	# _tmp116 = _tmp115 == _tmp112
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t3
	  seq $s0, $t7, $t3	
	# _tmp117 = _tmp113 || _tmp116
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t4
	# the op2 is $s0
	  or $s1, $t4, $s0	
	# IfZ _tmp117 Goto _L18
	# we clean all the regiser
	  sw $t0, -216($fp)	# spill _tmp108 from $t0 to $fp-216
	  sw $t1, -220($fp)	# spill _tmp109 from $t1 to $fp-220
	  sw $t2, -224($fp)	# spill _tmp110 from $t2 to $fp-224
	  sw $t3, -232($fp)	# spill _tmp112 from $t3 to $fp-232
	  sw $t4, -236($fp)	# spill _tmp113 from $t4 to $fp-236
	  sw $t5, -240($fp)	# spill _tmp114 from $t5 to $fp-240
	  sw $t6, -228($fp)	# spill _tmp111 from $t6 to $fp-228
	  sw $t7, -244($fp)	# spill _tmp115 from $t7 to $fp-244
	  sw $s0, -248($fp)	# spill _tmp116 from $s0 to $fp-248
	  sw $s1, -252($fp)	# spill _tmp117 from $s1 to $fp-252
	  lw $s1, -252($fp)	# fill _tmp117 to $s1 from $fp-252
	  beqz $s1, _L18	# branch if _tmp117 is zero 
	# _tmp118 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string7
	  la $s2, _string7	# load label
	# PushParam _tmp118
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -256($fp)	# spill _tmp118 from $s2 to $fp-256
	  lw $s2, -256($fp)	# fill _tmp118 to $s2 from $fp-256
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L18:
	# _tmp119 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp120 = _tmp119 * j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $t1, $t0, $v1	
	# _tmp121 = _tmp111 + _tmp120
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -228($fp)	# fill _tmp111 to $t6 from $fp-228
	  add $t3, $t6, $t1	
	# _tmp122 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# *(_tmp121) = _tmp122
	# We are in the EmitStore
	# so, the reference: _tmp121 register is given $t3
	# the value: _tmp122 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp123 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# _tmp124 = j + _tmp123
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  add $t5, $v0, $t4	
	# j = _tmp124
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t5
	  move $v0, $t5		# copy value from $t5 to $v0
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L15
	# we clean all the regiser
	  sw $t0, -260($fp)	# spill _tmp119 from $t0 to $fp-260
	  sw $t1, -264($fp)	# spill _tmp120 from $t1 to $fp-264
	  sw $t2, -272($fp)	# spill _tmp122 from $t2 to $fp-272
	  sw $t3, -268($fp)	# spill _tmp121 from $t3 to $fp-268
	  sw $t4, -276($fp)	# spill _tmp123 from $t4 to $fp-276
	  sw $t5, -280($fp)	# spill _tmp124 from $t5 to $fp-280
	  b _L15		# unconditional branch
	# we clean all the regiser
  _L16:
	# _tmp125 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp126 = i + _tmp125
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp126
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L13
	# we clean all the regiser
	  sw $t0, -284($fp)	# spill _tmp125 from $t0 to $fp-284
	  sw $t1, -288($fp)	# spill _tmp126 from $t1 to $fp-288
	  b _L13		# unconditional branch
	# we clean all the regiser
  _L14:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _DenseMatrix.Set:
	# BeginFunc 88
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp127 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp127 register is given $s4
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $s4, 4($v0) 	# load with offset
	# _tmp128 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp128 from $v0 to $fp-12
	# _tmp129 = x < _tmp128
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $s3, 8($fp)	# fill x to $s3 from $fp+8
	  lw $v1, -12($fp)	# fill _tmp128 to $v1 from $fp-12
	  slt $v0, $s3, $v1	
	  sw $v0, -16($fp)	# spill _tmp129 from $v0 to $fp-16
	# _tmp130 = *(_tmp127 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp130 register is given $spill
	# the reference: _tmp127 is given $s4
	  lw $v0, -4($s4) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp130 from $v0 to $fp-20
	# _tmp131 = x < _tmp130
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $v1, -20($fp)	# fill _tmp130 to $v1 from $fp-20
	  slt $v0, $s3, $v1	
	  sw $v0, -24($fp)	# spill _tmp131 from $v0 to $fp-24
	# _tmp132 = _tmp131 == _tmp128
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -24($fp)	# fill _tmp131 to $v0 from $fp-24
	  lw $v1, -12($fp)	# fill _tmp128 to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp132 from $v0 to $fp-28
	# _tmp133 = _tmp129 || _tmp132
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp129 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp132 to $v1 from $fp-28
	  or $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp133 from $v0 to $fp-32
	# IfZ _tmp133 Goto _L19
	# we clean all the regiser
	  sw $s4, -8($fp)	# spill _tmp127 from $s4 to $fp-8
	  lw $v0, -32($fp)	# fill _tmp133 to $v0 from $fp-32
	  beqz $v0, _L19	# branch if _tmp133 is zero 
	# _tmp134 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string8
	  la $v0, _string8	# load label
	  sw $v0, -36($fp)	# spill _tmp134 from $v0 to $fp-36
	# PushParam _tmp134
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -36($fp)	# fill _tmp134 to $v0 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L19:
	# _tmp135 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp136 = _tmp135 * x
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s3
	  lw $s3, 8($fp)	# fill x to $s3 from $fp+8
	  mul $t1, $t0, $s3	
	# _tmp137 = _tmp127 + _tmp136
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s4
	# the op2 is $t1
	  lw $s4, -8($fp)	# fill _tmp127 to $s4 from $fp-8
	  add $t2, $s4, $t1	
	# _tmp138 = *(_tmp137)
	# We are in the EmitLoad
	# so, the dst: _tmp138 register is given $t3
	# the reference: _tmp137 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp139 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp140 = y < _tmp139
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t0
	# the op2 is $t4
	  sw $t0, -40($fp)	# spill _tmp135 from $t0 to $fp-40
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  slt $t5, $t0, $t4	
	# _tmp141 = *(_tmp138 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp141 register is given $t6
	# the reference: _tmp138 is given $t3
	  lw $t6, -4($t3) 	# load with offset
	# _tmp142 = y < _tmp141
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t0
	# the op2 is $t6
	  slt $t7, $t0, $t6	
	# _tmp143 = _tmp142 == _tmp139
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp144 = _tmp140 || _tmp143
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp144 Goto _L20
	# we clean all the regiser
	  sw $t1, -44($fp)	# spill _tmp136 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp137 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp138 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp139 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp140 from $t5 to $fp-60
	  sw $t6, -64($fp)	# spill _tmp141 from $t6 to $fp-64
	  sw $t7, -68($fp)	# spill _tmp142 from $t7 to $fp-68
	  sw $s0, -72($fp)	# spill _tmp143 from $s0 to $fp-72
	  sw $s1, -76($fp)	# spill _tmp144 from $s1 to $fp-76
	  lw $s1, -76($fp)	# fill _tmp144 to $s1 from $fp-76
	  beqz $s1, _L20	# branch if _tmp144 is zero 
	# _tmp145 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string9
	  la $s2, _string9	# load label
	# PushParam _tmp145
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -80($fp)	# spill _tmp145 from $s2 to $fp-80
	  lw $s2, -80($fp)	# fill _tmp145 to $s2 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L20:
	# _tmp146 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp146 from $v0 to $fp-84
	# _tmp147 = _tmp146 * y
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -84($fp)	# fill _tmp146 to $v0 from $fp-84
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  mul $v0, $v0, $t0	
	  sw $v0, -88($fp)	# spill _tmp147 from $v0 to $fp-88
	# _tmp148 = _tmp138 + _tmp147
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t3
	# the op2 is $spill
	  lw $t3, -52($fp)	# fill _tmp138 to $t3 from $fp-52
	  lw $v1, -88($fp)	# fill _tmp147 to $v1 from $fp-88
	  add $v0, $t3, $v1	
	  sw $v0, -92($fp)	# spill _tmp148 from $v0 to $fp-92
	# *(_tmp148) = value
	# We are in the EmitStore
	# so, the reference: _tmp148 register is given $spill
	# the value: value is given $t0
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  lw $v1, -92($fp)	# fill _tmp148 to $v1 from $fp-92
	  sw $t0, 0($v1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _DenseMatrix.Get:
	# BeginFunc 92
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp149 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp149 register is given $s4
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $s4, 4($v0) 	# load with offset
	# _tmp150 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp150 from $v0 to $fp-12
	# _tmp151 = x < _tmp150
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $s3, 8($fp)	# fill x to $s3 from $fp+8
	  lw $v1, -12($fp)	# fill _tmp150 to $v1 from $fp-12
	  slt $v0, $s3, $v1	
	  sw $v0, -16($fp)	# spill _tmp151 from $v0 to $fp-16
	# _tmp152 = *(_tmp149 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp152 register is given $spill
	# the reference: _tmp149 is given $s4
	  lw $v0, -4($s4) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp152 from $v0 to $fp-20
	# _tmp153 = x < _tmp152
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $v1, -20($fp)	# fill _tmp152 to $v1 from $fp-20
	  slt $v0, $s3, $v1	
	  sw $v0, -24($fp)	# spill _tmp153 from $v0 to $fp-24
	# _tmp154 = _tmp153 == _tmp150
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -24($fp)	# fill _tmp153 to $v0 from $fp-24
	  lw $v1, -12($fp)	# fill _tmp150 to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp154 from $v0 to $fp-28
	# _tmp155 = _tmp151 || _tmp154
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp151 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp154 to $v1 from $fp-28
	  or $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp155 from $v0 to $fp-32
	# IfZ _tmp155 Goto _L21
	# we clean all the regiser
	  sw $s4, -8($fp)	# spill _tmp149 from $s4 to $fp-8
	  lw $v0, -32($fp)	# fill _tmp155 to $v0 from $fp-32
	  beqz $v0, _L21	# branch if _tmp155 is zero 
	# _tmp156 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string10
	  la $v0, _string10	# load label
	  sw $v0, -36($fp)	# spill _tmp156 from $v0 to $fp-36
	# PushParam _tmp156
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -36($fp)	# fill _tmp156 to $v0 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L21:
	# _tmp157 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp158 = _tmp157 * x
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s3
	  lw $s3, 8($fp)	# fill x to $s3 from $fp+8
	  mul $t1, $t0, $s3	
	# _tmp159 = _tmp149 + _tmp158
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s4
	# the op2 is $t1
	  lw $s4, -8($fp)	# fill _tmp149 to $s4 from $fp-8
	  add $t2, $s4, $t1	
	# _tmp160 = *(_tmp159)
	# We are in the EmitLoad
	# so, the dst: _tmp160 register is given $t3
	# the reference: _tmp159 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp161 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp162 = y < _tmp161
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t0
	# the op2 is $t4
	  sw $t0, -40($fp)	# spill _tmp157 from $t0 to $fp-40
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  slt $t5, $t0, $t4	
	# _tmp163 = *(_tmp160 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp163 register is given $t6
	# the reference: _tmp160 is given $t3
	  lw $t6, -4($t3) 	# load with offset
	# _tmp164 = y < _tmp163
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t0
	# the op2 is $t6
	  slt $t7, $t0, $t6	
	# _tmp165 = _tmp164 == _tmp161
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp166 = _tmp162 || _tmp165
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp166 Goto _L22
	# we clean all the regiser
	  sw $t1, -44($fp)	# spill _tmp158 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp159 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp160 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp161 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp162 from $t5 to $fp-60
	  sw $t6, -64($fp)	# spill _tmp163 from $t6 to $fp-64
	  sw $t7, -68($fp)	# spill _tmp164 from $t7 to $fp-68
	  sw $s0, -72($fp)	# spill _tmp165 from $s0 to $fp-72
	  sw $s1, -76($fp)	# spill _tmp166 from $s1 to $fp-76
	  lw $s1, -76($fp)	# fill _tmp166 to $s1 from $fp-76
	  beqz $s1, _L22	# branch if _tmp166 is zero 
	# _tmp167 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string11
	  la $s2, _string11	# load label
	# PushParam _tmp167
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -80($fp)	# spill _tmp167 from $s2 to $fp-80
	  lw $s2, -80($fp)	# fill _tmp167 to $s2 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L22:
	# _tmp168 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp168 from $v0 to $fp-84
	# _tmp169 = _tmp168 * y
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -84($fp)	# fill _tmp168 to $v0 from $fp-84
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  mul $v0, $v0, $t0	
	  sw $v0, -88($fp)	# spill _tmp169 from $v0 to $fp-88
	# _tmp170 = _tmp160 + _tmp169
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t3
	# the op2 is $spill
	  lw $t3, -52($fp)	# fill _tmp160 to $t3 from $fp-52
	  lw $v1, -88($fp)	# fill _tmp169 to $v1 from $fp-88
	  add $v0, $t3, $v1	
	  sw $v0, -92($fp)	# spill _tmp170 from $v0 to $fp-92
	# _tmp171 = *(_tmp170)
	# We are in the EmitLoad
	# so, the dst: _tmp171 register is given $spill
	# the reference: _tmp170 is given $spill
	  lw $v0, -92($fp)	# fill _tmp170 to $v0 from $fp-92
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -96($fp)	# spill _tmp171 from $v0 to $fp-96
	# Return _tmp171
	  lw $v0, -96($fp)	# fill _tmp171 to $v0 from $fp-96
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class DenseMatrix
	  .data
	  .align 2
	  DenseMatrix:		# label for class DenseMatrix vtable
	  .word _DenseMatrix.Init
	  .word _DenseMatrix.Set
	  .word _DenseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _SparseItem.Init:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = d
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: d is given $t0
	  lw $t0, 8($fp)	# fill d to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = y
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: y is given $t0
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  sw $t0, 8($t1) 	# store with offset
	# *(this + 12) = next
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: next is given $t0
	  lw $t0, 16($fp)	# fill next to $t0 from $fp+16
	  sw $t0, 12($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseItem.GetNext:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp172 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp172 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 12($t1) 	# load with offset
	# Return _tmp172
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseItem.GetY:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp173 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp173 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 8($t1) 	# load with offset
	# Return _tmp173
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseItem.GetData:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp174 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp174 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# Return _tmp174
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseItem.SetData:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = val
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: val is given $t0
	  lw $t0, 8($fp)	# fill val to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseItem
	  .data
	  .align 2
	  SparseItem:		# label for class SparseItem vtable
	  .word _SparseItem.Init
	  .word _SparseItem.GetNext
	  .word _SparseItem.GetY
	  .word _SparseItem.GetData
	  .word _SparseItem.SetData
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _SparseMatrix.Init:
	# BeginFunc 116
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 116	# decrement sp to make space for locals/temps
	# _tmp175 = 10
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -12($fp)	# spill _tmp175 from $v0 to $fp-12
	# _tmp176 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp176 from $v0 to $fp-16
	# _tmp177 = _tmp175 < _tmp176
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -12($fp)	# fill _tmp175 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp176 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp177 from $v0 to $fp-20
	# IfZ _tmp177 Goto _L23
	# we clean all the regiser
	  lw $v0, -20($fp)	# fill _tmp177 to $v0 from $fp-20
	  beqz $v0, _L23	# branch if _tmp177 is zero 
	# _tmp178 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string12
	  la $v0, _string12	# load label
	  sw $v0, -24($fp)	# spill _tmp178 from $v0 to $fp-24
	# PushParam _tmp178
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -24($fp)	# fill _tmp178 to $v0 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L23:
	# _tmp179 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp180 = _tmp179 + _tmp175
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill _tmp175 to $v1 from $fp-12
	  add $t1, $t0, $v1	
	# _tmp181 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp182 = _tmp180 * _tmp181
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t3
	  mul $t2, $t1, $t3	
	# PushParam _tmp182
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -40($fp)	# spill _tmp182 from $t2 to $fp-40
	  lw $t2, -40($fp)	# fill _tmp182 to $t2 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp183 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp179 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp180 from $t1 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp181 from $t3 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -44($fp)	# spill _tmp183 from $t4 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp183) = _tmp175
	# We are in the EmitStore
	# so, the reference: _tmp183 register is given $t4
	# the value: _tmp175 is given $spill
	  lw $v0, -12($fp)	# fill _tmp175 to $v0 from $fp-12
	  sw $v0, 0($t4) 	# store with offset
	# _tmp184 = _tmp183 + _tmp181
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t3
	  lw $t3, -36($fp)	# fill _tmp181 to $t3 from $fp-36
	  add $t0, $t4, $t3	
	# *(this + 4) = _tmp184
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp184 is given $t0
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# _tmp185 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# i = _tmp185
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t2
	  move $v0, $t2		# copy value from $t2 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp184 from $t0 to $fp-48
	  sw $t2, -52($fp)	# spill _tmp185 from $t2 to $fp-52
  _L24:
	# _tmp186 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp187 = i < _tmp186
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp187 Goto _L25
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp186 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp187 from $t1 to $fp-60
	  lw $t1, -60($fp)	# fill _tmp187 to $t1 from $fp-60
	  beqz $t1, _L25	# branch if _tmp187 is zero 
	# _tmp188 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp188 register is given $t6
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t6, 4($t1) 	# load with offset
	# _tmp189 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp190 = i < _tmp189
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp191 = *(_tmp188 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp191 register is given $t4
	# the reference: _tmp188 is given $t6
	  lw $t4, -4($t6) 	# load with offset
	# _tmp192 = i < _tmp191
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp193 = _tmp192 == _tmp189
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t2
	  seq $t7, $t5, $t2	
	# _tmp194 = _tmp190 || _tmp193
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t7
	  or $s0, $t3, $t7	
	# IfZ _tmp194 Goto _L26
	# we clean all the regiser
	  sw $t2, -68($fp)	# spill _tmp189 from $t2 to $fp-68
	  sw $t3, -72($fp)	# spill _tmp190 from $t3 to $fp-72
	  sw $t4, -76($fp)	# spill _tmp191 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp192 from $t5 to $fp-80
	  sw $t6, -64($fp)	# spill _tmp188 from $t6 to $fp-64
	  sw $t7, -84($fp)	# spill _tmp193 from $t7 to $fp-84
	  sw $s0, -88($fp)	# spill _tmp194 from $s0 to $fp-88
	  lw $s0, -88($fp)	# fill _tmp194 to $s0 from $fp-88
	  beqz $s0, _L26	# branch if _tmp194 is zero 
	# _tmp195 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string13
	  la $s1, _string13	# load label
	# PushParam _tmp195
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -92($fp)	# spill _tmp195 from $s1 to $fp-92
	  lw $s1, -92($fp)	# fill _tmp195 to $s1 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L26:
	# _tmp196 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp197 = _tmp196 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp198 = _tmp188 + _tmp197
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -64($fp)	# fill _tmp188 to $t6 from $fp-64
	  add $t3, $t6, $t1	
	# _tmp199 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# *(_tmp198) = _tmp199
	# We are in the EmitStore
	# so, the reference: _tmp198 register is given $t3
	# the value: _tmp199 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp200 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# _tmp201 = i + _tmp200
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t5, $v0, $t4	
	# i = _tmp201
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t5
	  move $v0, $t5		# copy value from $t5 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L24
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp196 from $t0 to $fp-96
	  sw $t1, -100($fp)	# spill _tmp197 from $t1 to $fp-100
	  sw $t2, -108($fp)	# spill _tmp199 from $t2 to $fp-108
	  sw $t3, -104($fp)	# spill _tmp198 from $t3 to $fp-104
	  sw $t4, -112($fp)	# spill _tmp200 from $t4 to $fp-112
	  sw $t5, -116($fp)	# spill _tmp201 from $t5 to $fp-116
	  b _L24		# unconditional branch
	# we clean all the regiser
  _L25:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseMatrix.Find:
	# BeginFunc 104
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 104	# decrement sp to make space for locals/temps
	# _tmp202 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp202 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 4($t1) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp202 from $v0 to $fp-12
	# _tmp203 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp203 from $v0 to $fp-16
	# _tmp204 = x < _tmp203
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t4
	# the op2 is $spill
	  lw $t4, 8($fp)	# fill x to $t4 from $fp+8
	  lw $v1, -16($fp)	# fill _tmp203 to $v1 from $fp-16
	  slt $v0, $t4, $v1	
	  sw $v0, -20($fp)	# spill _tmp204 from $v0 to $fp-20
	# _tmp205 = *(_tmp202 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp205 register is given $spill
	# the reference: _tmp202 is given $spill
	  lw $v0, -12($fp)	# fill _tmp202 to $v0 from $fp-12
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp205 from $v0 to $fp-24
	# _tmp206 = x < _tmp205
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t4
	# the op2 is $spill
	  lw $v1, -24($fp)	# fill _tmp205 to $v1 from $fp-24
	  slt $v0, $t4, $v1	
	  sw $v0, -28($fp)	# spill _tmp206 from $v0 to $fp-28
	# _tmp207 = _tmp206 == _tmp203
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -28($fp)	# fill _tmp206 to $v0 from $fp-28
	  lw $v1, -16($fp)	# fill _tmp203 to $v1 from $fp-16
	  seq $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp207 from $v0 to $fp-32
	# _tmp208 = _tmp204 || _tmp207
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -20($fp)	# fill _tmp204 to $v0 from $fp-20
	  lw $v1, -32($fp)	# fill _tmp207 to $v1 from $fp-32
	  or $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp208 from $v0 to $fp-36
	# IfZ _tmp208 Goto _L27
	# we clean all the regiser
	  lw $v0, -36($fp)	# fill _tmp208 to $v0 from $fp-36
	  beqz $v0, _L27	# branch if _tmp208 is zero 
	# _tmp209 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string14
	  la $v0, _string14	# load label
	  sw $v0, -40($fp)	# spill _tmp209 from $v0 to $fp-40
	# PushParam _tmp209
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -40($fp)	# fill _tmp209 to $v0 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L27:
	# _tmp210 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp211 = _tmp210 * x
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t4
	  lw $t4, 8($fp)	# fill x to $t4 from $fp+8
	  mul $t1, $t0, $t4	
	# _tmp212 = _tmp202 + _tmp211
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -12($fp)	# fill _tmp202 to $v0 from $fp-12
	  add $t2, $v0, $t1	
	# _tmp213 = *(_tmp212)
	# We are in the EmitLoad
	# so, the dst: _tmp213 register is given $t3
	# the reference: _tmp212 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# elem = _tmp213
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -44($fp)	# spill _tmp210 from $t0 to $fp-44
	  sw $t1, -48($fp)	# spill _tmp211 from $t1 to $fp-48
	  sw $t2, -52($fp)	# spill _tmp212 from $t2 to $fp-52
	  sw $t3, -56($fp)	# spill _tmp213 from $t3 to $fp-56
  _L28:
	# _tmp214 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp215 = elem == _tmp214
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  seq $t1, $v0, $t0	
	# _tmp216 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp217 = _tmp215 == _tmp216
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  seq $t3, $t1, $t2	
	# IfZ _tmp217 Goto _L29
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp214 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp215 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp216 from $t2 to $fp-68
	  sw $t3, -72($fp)	# spill _tmp217 from $t3 to $fp-72
	  lw $t3, -72($fp)	# fill _tmp217 to $t3 from $fp-72
	  beqz $t3, _L29	# branch if _tmp217 is zero 
	# _tmp218 = *(elem)
	# We are in the EmitLoad
	# so, the dst: _tmp218 register is given $t4
	# the reference: elem is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $t4, 0($v0) 	# load with offset
	# _tmp219 = *(_tmp218 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp219 register is given $t5
	# the reference: _tmp218 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam elem
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp220 = ACall _tmp219
	# we clean all the regiser
	  sw $t4, -76($fp)	# spill _tmp218 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp219 from $t5 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp219 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -84($fp)	# spill _tmp220 from $t2 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp221 = _tmp220 == y
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t2
	# the op2 is $t1
	  lw $t1, 12($fp)	# fill y to $t1 from $fp+12
	  seq $t0, $t2, $t1	
	# IfZ _tmp221 Goto _L30
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp221 from $t0 to $fp-88
	  lw $t0, -88($fp)	# fill _tmp221 to $t0 from $fp-88
	  beqz $t0, _L30	# branch if _tmp221 is zero 
	# Return elem
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
  _L30:
	# _tmp222 = *(elem)
	# We are in the EmitLoad
	# so, the dst: _tmp222 register is given $t0
	# the reference: elem is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp223 = *(_tmp222 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp223 register is given $t1
	# the reference: _tmp222 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam elem
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp224 = ACall _tmp223
	# we clean all the regiser
	  sw $t0, -92($fp)	# spill _tmp222 from $t0 to $fp-92
	  sw $t1, -96($fp)	# spill _tmp223 from $t1 to $fp-96
	  lw $v0, -96($fp)	# fill _tmp223 to $v0 from $fp-96
	  jalr $v0            	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -100($fp)	# spill _tmp224 from $t6 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# elem = _tmp224
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t6
	  move $v0, $t6		# copy value from $t6 to $v0
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# Goto _L28
	# we clean all the regiser
	  b _L28		# unconditional branch
	# we clean all the regiser
  _L29:
	# _tmp225 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -104($fp)	# spill _tmp225 from $v0 to $fp-104
	# Return _tmp225
	  lw $v0, -104($fp)	# fill _tmp225 to $v0 from $fp-104
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseMatrix.Set:
	# BeginFunc 152
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp226 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp226 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 0($t1) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp226 from $v0 to $fp-12
	# _tmp227 = *(_tmp226 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp227 register is given $spill
	# the reference: _tmp226 is given $spill
	  lw $v0, -12($fp)	# fill _tmp226 to $v0 from $fp-12
	  lw $v0, 20($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp227 from $v0 to $fp-16
	# PushParam y
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp228 = ACall _tmp227
	# we clean all the regiser
	  lw $v0, -16($fp)	# fill _tmp227 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -20($fp)	# spill _tmp228 from $t0 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp228
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# _tmp229 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp230 = elem == _tmp229
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  seq $t3, $v0, $t2	
	# _tmp231 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp232 = _tmp230 == _tmp231
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  seq $t5, $t3, $t4	
	# IfZ _tmp232 Goto _L32
	# we clean all the regiser
	  sw $t2, -24($fp)	# spill _tmp229 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp230 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp231 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp232 from $t5 to $fp-36
	  lw $t5, -36($fp)	# fill _tmp232 to $t5 from $fp-36
	  beqz $t5, _L32	# branch if _tmp232 is zero 
	# _tmp233 = *(elem)
	# We are in the EmitLoad
	# so, the dst: _tmp233 register is given $t6
	# the reference: elem is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $t6, 0($v0) 	# load with offset
	# _tmp234 = *(_tmp233 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp234 register is given $t7
	# the reference: _tmp233 is given $t6
	  lw $t7, 16($t6) 	# load with offset
	# PushParam value
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam elem
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp234
	# we clean all the regiser
	  sw $t6, -40($fp)	# spill _tmp233 from $t6 to $fp-40
	  sw $t7, -44($fp)	# spill _tmp234 from $t7 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp234 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L31
	# we clean all the regiser
	  b _L31		# unconditional branch
	# we clean all the regiser
  _L32:
	# _tmp235 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp235
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -48($fp)	# spill _tmp235 from $t0 to $fp-48
	  lw $t0, -48($fp)	# fill _tmp235 to $t0 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp236 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -52($fp)	# spill _tmp236 from $t1 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp237 = SparseItem
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is SparseItem
	  la $t0, SparseItem	# load label
	# *(_tmp236) = _tmp237
	# We are in the EmitStore
	# so, the reference: _tmp236 register is given $t1
	# the value: _tmp237 is given $t0
	  sw $t0, 0($t1) 	# store with offset
	# elem = _tmp236
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill elem from $v0 to $fp-8
	# _tmp238 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp238 register is given $t6
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t6, 4($t1) 	# load with offset
	# _tmp239 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp240 = x < _tmp239
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  slt $t3, $v0, $t2	
	# _tmp241 = *(_tmp238 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp241 register is given $t4
	# the reference: _tmp238 is given $t6
	  lw $t4, -4($t6) 	# load with offset
	# _tmp242 = x < _tmp241
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  slt $t5, $v0, $t4	
	# _tmp243 = _tmp242 == _tmp239
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t2
	  seq $t7, $t5, $t2	
	# _tmp244 = _tmp240 || _tmp243
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t7
	  or $s0, $t3, $t7	
	# IfZ _tmp244 Goto _L33
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp237 from $t0 to $fp-56
	  sw $t2, -64($fp)	# spill _tmp239 from $t2 to $fp-64
	  sw $t3, -68($fp)	# spill _tmp240 from $t3 to $fp-68
	  sw $t4, -72($fp)	# spill _tmp241 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp242 from $t5 to $fp-76
	  sw $t6, -60($fp)	# spill _tmp238 from $t6 to $fp-60
	  sw $t7, -80($fp)	# spill _tmp243 from $t7 to $fp-80
	  sw $s0, -84($fp)	# spill _tmp244 from $s0 to $fp-84
	  lw $s0, -84($fp)	# fill _tmp244 to $s0 from $fp-84
	  beqz $s0, _L33	# branch if _tmp244 is zero 
	# _tmp245 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string15
	  la $s1, _string15	# load label
	# PushParam _tmp245
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -88($fp)	# spill _tmp245 from $s1 to $fp-88
	  lw $s1, -88($fp)	# fill _tmp245 to $s1 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L33:
	# _tmp246 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp247 = _tmp246 * x
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $t1, $t0, $v1	
	# _tmp248 = _tmp238 + _tmp247
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -60($fp)	# fill _tmp238 to $t6 from $fp-60
	  add $t2, $t6, $t1	
	# _tmp249 = *(_tmp248)
	# We are in the EmitLoad
	# so, the dst: _tmp249 register is given $t3
	# the reference: _tmp248 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp250 = *(elem)
	# We are in the EmitLoad
	# so, the dst: _tmp250 register is given $t4
	# the reference: elem is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  lw $t4, 0($v0) 	# load with offset
	# _tmp251 = *(_tmp250)
	# We are in the EmitLoad
	# so, the dst: _tmp251 register is given $t5
	# the reference: _tmp250 is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp249
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -104($fp)	# spill _tmp249 from $t3 to $fp-104
	  lw $t3, -104($fp)	# fill _tmp249 to $t3 from $fp-104
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam y
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -92($fp)	# spill _tmp246 from $t0 to $fp-92
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam value
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 16($fp)	# fill value to $t0 from $fp+16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam elem
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp251
	# we clean all the regiser
	  sw $t1, -96($fp)	# spill _tmp247 from $t1 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp248 from $t2 to $fp-100
	  sw $t4, -108($fp)	# spill _tmp250 from $t4 to $fp-108
	  sw $t5, -112($fp)	# spill _tmp251 from $t5 to $fp-112
	  lw $v0, -112($fp)	# fill _tmp251 to $v0 from $fp-112
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# _tmp252 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp252 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 4($t1) 	# load with offset
	  sw $v0, -116($fp)	# spill _tmp252 from $v0 to $fp-116
	# _tmp253 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -120($fp)	# spill _tmp253 from $v0 to $fp-120
	# _tmp254 = x < _tmp253
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -120($fp)	# fill _tmp253 to $v1 from $fp-120
	  slt $v0, $v0, $v1	
	  sw $v0, -124($fp)	# spill _tmp254 from $v0 to $fp-124
	# _tmp255 = *(_tmp252 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp255 register is given $spill
	# the reference: _tmp252 is given $spill
	  lw $v0, -116($fp)	# fill _tmp252 to $v0 from $fp-116
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -128($fp)	# spill _tmp255 from $v0 to $fp-128
	# _tmp256 = x < _tmp255
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, 8($fp)	# fill x to $v0 from $fp+8
	  lw $v1, -128($fp)	# fill _tmp255 to $v1 from $fp-128
	  slt $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp256 from $v0 to $fp-132
	# _tmp257 = _tmp256 == _tmp253
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -132($fp)	# fill _tmp256 to $v0 from $fp-132
	  lw $v1, -120($fp)	# fill _tmp253 to $v1 from $fp-120
	  seq $v0, $v0, $v1	
	  sw $v0, -136($fp)	# spill _tmp257 from $v0 to $fp-136
	# _tmp258 = _tmp254 || _tmp257
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -124($fp)	# fill _tmp254 to $v0 from $fp-124
	  lw $v1, -136($fp)	# fill _tmp257 to $v1 from $fp-136
	  or $v0, $v0, $v1	
	  sw $v0, -140($fp)	# spill _tmp258 from $v0 to $fp-140
	# IfZ _tmp258 Goto _L34
	# we clean all the regiser
	  lw $v0, -140($fp)	# fill _tmp258 to $v0 from $fp-140
	  beqz $v0, _L34	# branch if _tmp258 is zero 
	# _tmp259 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string16: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string16
	  la $v0, _string16	# load label
	  sw $v0, -144($fp)	# spill _tmp259 from $v0 to $fp-144
	# PushParam _tmp259
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -144($fp)	# fill _tmp259 to $v0 from $fp-144
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L34:
	# _tmp260 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp261 = _tmp260 * x
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, 8($fp)	# fill x to $v1 from $fp+8
	  mul $t1, $t0, $v1	
	# _tmp262 = _tmp252 + _tmp261
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -116($fp)	# fill _tmp252 to $v0 from $fp-116
	  add $t2, $v0, $t1	
	# *(_tmp262) = elem
	# We are in the EmitStore
	# so, the reference: _tmp262 register is given $t2
	# the value: elem is given $spill
	  lw $v0, -8($fp)	# fill elem to $v0 from $fp-8
	  sw $v0, 0($t2) 	# store with offset
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp260 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp261 from $t1 to $fp-152
	  sw $t2, -156($fp)	# spill _tmp262 from $t2 to $fp-156
  _L31:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _SparseMatrix.Get:
	# BeginFunc 48
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 48	# decrement sp to make space for locals/temps
	# _tmp263 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp263 register is given $t2
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 0($t1) 	# load with offset
	# _tmp264 = *(_tmp263 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp264 register is given $s1
	# the reference: _tmp263 is given $t2
	  lw $s1, 20($t2) 	# load with offset
	# PushParam y
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 12($fp)	# fill y to $t0 from $fp+12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam x
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill x to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp265 = ACall _tmp264
	# we clean all the regiser
	  sw $t2, -12($fp)	# spill _tmp263 from $t2 to $fp-12
	  sw $s1, -16($fp)	# spill _tmp264 from $s1 to $fp-16
	  lw $v0, -16($fp)	# fill _tmp264 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp265 from $t3 to $fp-20
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# elem = _tmp265
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# _tmp266 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp267 = elem == _tmp266
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  seq $t6, $t4, $t5	
	# _tmp268 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t7
	# the constant is 0
	  li $t7, 0		# load constant value 0 into $t7
	# _tmp269 = _tmp267 == _tmp268
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t6
	# the op2 is $t7
	  seq $s0, $t6, $t7	
	# IfZ _tmp269 Goto _L36
	# we clean all the regiser
	  sw $t4, -8($fp)	# spill elem from $t4 to $fp-8
	  sw $t5, -24($fp)	# spill _tmp266 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp267 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp268 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp269 from $s0 to $fp-36
	  lw $s0, -36($fp)	# fill _tmp269 to $s0 from $fp-36
	  beqz $s0, _L36	# branch if _tmp269 is zero 
	# _tmp270 = *(elem)
	# We are in the EmitLoad
	# so, the dst: _tmp270 register is given $s2
	# the reference: elem is given $t4
	  lw $t4, -8($fp)	# fill elem to $t4 from $fp-8
	  lw $s2, 0($t4) 	# load with offset
	# _tmp271 = *(_tmp270 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp271 register is given $s3
	# the reference: _tmp270 is given $s2
	  lw $s3, 12($s2) 	# load with offset
	# PushParam elem
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill elem to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp272 = ACall _tmp271
	# we clean all the regiser
	  sw $s2, -40($fp)	# spill _tmp270 from $s2 to $fp-40
	  sw $s3, -44($fp)	# spill _tmp271 from $s3 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp271 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	  move $s4, $v0		# copy function return value from $v0
	  sw $s4, -48($fp)	# spill _tmp272 from $s4 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Return _tmp272
	  move $v0, $s4		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L35
	# we clean all the regiser
	  b _L35		# unconditional branch
	# we clean all the regiser
  _L36:
	# _tmp273 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp273
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp273 from $t0 to $fp-52
  _L35:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class SparseMatrix
	  .data
	  .align 2
	  SparseMatrix:		# label for class SparseMatrix vtable
	  .word _SparseMatrix.Init
	  .word _SparseMatrix.Set
	  .word _SparseMatrix.Get
	  .word _Matrix.PrintMatrix
	  .word _Matrix.SeedMatrix
	  .word _SparseMatrix.Find
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 84
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp274 = "Dense Rep \n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Dense Rep \n"
	  .data			# create string constant marked with label
	  _string17: .asciiz "Dense Rep \n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string17
	  la $t0, _string17	# load label
	# PushParam _tmp274
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp274 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp274 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp275 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp275
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp275 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp275 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp276 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp276 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp277 = DenseMatrix
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is DenseMatrix
	  la $t0, DenseMatrix	# load label
	# *(_tmp276) = _tmp277
	# We are in the EmitStore
	# so, the reference: _tmp276 register is given $t3
	# the value: _tmp277 is given $t0
	  sw $t0, 0($t3) 	# store with offset
	# m = _tmp276
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# _tmp278 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp278 register is given $t1
	# the reference: m is given $t4
	  lw $t1, 0($t4) 	# load with offset
	# _tmp279 = *(_tmp278)
	# We are in the EmitLoad
	# so, the dst: _tmp279 register is given $t2
	# the reference: _tmp278 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -8($fp)	# spill m from $t4 to $fp-8
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp279
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp277 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp278 from $t1 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp279 from $t2 to $fp-32
	  lw $v0, -32($fp)	# fill _tmp279 to $v0 from $fp-32
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp280 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp280 register is given $t0
	# the reference: m is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  lw $t0, 0($t4) 	# load with offset
	# _tmp281 = *(_tmp280 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp281 register is given $t1
	# the reference: _tmp280 is given $t0
	  lw $t1, 16($t0) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp281
	# we clean all the regiser
	  sw $t0, -36($fp)	# spill _tmp280 from $t0 to $fp-36
	  sw $t1, -40($fp)	# spill _tmp281 from $t1 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp281 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp282 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp282 register is given $t0
	# the reference: m is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  lw $t0, 0($t4) 	# load with offset
	# _tmp283 = *(_tmp282 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp283 register is given $t1
	# the reference: _tmp282 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp283
	# we clean all the regiser
	  sw $t0, -44($fp)	# spill _tmp282 from $t0 to $fp-44
	  sw $t1, -48($fp)	# spill _tmp283 from $t1 to $fp-48
	  lw $v0, -48($fp)	# fill _tmp283 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp284 = "Sparse Rep \n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Sparse Rep \n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "Sparse Rep \n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string18
	  la $t0, _string18	# load label
	# PushParam _tmp284
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -52($fp)	# spill _tmp284 from $t0 to $fp-52
	  lw $t0, -52($fp)	# fill _tmp284 to $t0 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp285 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp285
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -56($fp)	# spill _tmp285 from $t0 to $fp-56
	  lw $t0, -56($fp)	# fill _tmp285 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp286 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -60($fp)	# spill _tmp286 from $t3 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp287 = SparseMatrix
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is SparseMatrix
	  la $t0, SparseMatrix	# load label
	# *(_tmp286) = _tmp287
	# We are in the EmitStore
	# so, the reference: _tmp286 register is given $t3
	# the value: _tmp287 is given $t0
	  sw $t0, 0($t3) 	# store with offset
	# m = _tmp286
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# _tmp288 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp288 register is given $t1
	# the reference: m is given $t4
	  lw $t1, 0($t4) 	# load with offset
	# _tmp289 = *(_tmp288)
	# We are in the EmitLoad
	# so, the dst: _tmp289 register is given $t2
	# the reference: _tmp288 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -8($fp)	# spill m from $t4 to $fp-8
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp289
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp287 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp288 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp289 from $t2 to $fp-72
	  lw $v0, -72($fp)	# fill _tmp289 to $v0 from $fp-72
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp290 register is given $t0
	# the reference: m is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  lw $t0, 0($t4) 	# load with offset
	# _tmp291 = *(_tmp290 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp291 register is given $t1
	# the reference: _tmp290 is given $t0
	  lw $t1, 16($t0) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp291
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp290 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp291 from $t1 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp291 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp292 = *(m)
	# We are in the EmitLoad
	# so, the dst: _tmp292 register is given $t0
	# the reference: m is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  lw $t0, 0($t4) 	# load with offset
	# _tmp293 = *(_tmp292 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp293 register is given $t1
	# the reference: _tmp292 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill m to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp293
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp292 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp293 from $t1 to $fp-88
	  lw $v0, -88($fp)	# fill _tmp293 to $v0 from $fp-88
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _PrintInt:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  lw $a0, 4($fp)	# fill a from $fp+4
	# LCall _PrintInt
	  li $v0, 1
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function

  _ReadInteger:
	  subu $sp, $sp, 8	# decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  li $v0, 5
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function


  _PrintBool:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 4
	  beq $a0, $0, PrintBoolFalse
	  la $a0, _PrintBoolTrueString
	  j PrintBoolEnd
  PrintBoolFalse:
 	  la $a0, _PrintBoolFalseString
  PrintBoolEnd:
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

      .data			# create string constant marked with label
      _PrintBoolTrueString: .asciiz "true"
      .text

      .data			# create string constant marked with label
      _PrintBoolFalseString: .asciiz "false"
      .text

  _PrintString:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 4
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

  _Alloc:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra,fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  li $v0, 9
	  syscall
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function

  _Halt:
	  li $v0, 10
	  syscall
	# EndFunc


  _StringEqual:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  lw $a0, 4($fp)        # fill a from $fp+4
	  lw $a1, 8($fp)        # fill a from $fp+8
	  beq $a0,$a1,Lrunt10
  Lrunt12:
	  lbu  $v0,($a0)
	  lbu  $a2,($a1)
	  bne $v0,$a2,Lrunt11
	  addiu $a0,$a0,1
	  addiu $a1,$a1,1
	  bne $v0,$0,Lrunt12
      li  $v0,1
      j Lrunt10
  Lrunt11:
	  li  $v0,0
  Lrunt10:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function



  _ReadLine:
	  subu $sp, $sp, 8      # decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)        # save fp
	  sw $ra, 4($sp)        # save ra
	  addiu $fp, $sp, 8     # set up new fp
	  li $a0, 101
	  li $v0, 9
	  syscall
	  addi $a0, $v0, 0
	  li $v0, 8
	  li $a1,101 
	  syscall
	  addiu $v0,$a0,0       # pointer to begin of string
  Lrunt21:
	  lb $a1,($a0)          # load character at pointer
	  addiu $a0,$a0,1       # forward pointer
	  bnez $a1,Lrunt21      # loop until end of string is reached
	  lb $a1,-2($a0)        # load character before end of string
	  li $a2,10             # newline character	  bneq $a1,$a2,Lrunt20  # do not remove last character if not newline
	  sb $0,-2($a0)         # Add the terminating character in its place
  Lrunt20:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp         # pop callee frame off stack
	  lw $ra, -4($fp)       # restore saved ra
	  lw $fp, 0($fp)        # restore saved fp
	  jr $ra                # return from function
