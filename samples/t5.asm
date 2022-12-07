	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Wild:
	# BeginFunc 80
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp0 from $v0 to $fp-12
	# i = _tmp0
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -12($fp)	# fill _tmp0 to $v0 from $fp-12
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
  _L0:
	# _tmp1 = *(names + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp1 register is given $t0
	# the reference: names is given $spill
	  lw $v0, 4($fp)	# fill names to $v0 from $fp+4
	  lw $t0, -4($v0) 	# load with offset
	# _tmp2 = i < _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp2 Goto _L1
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp1 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp2 from $t1 to $fp-20
	  lw $t1, -20($fp)	# fill _tmp2 to $t1 from $fp-20
	  beqz $t1, _L1	# branch if _tmp2 is zero 
	# _tmp3 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp4 = i < _tmp3
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp5 = *(names + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp5 register is given $t4
	# the reference: names is given $spill
	  lw $v0, 4($fp)	# fill names to $v0 from $fp+4
	  lw $t4, -4($v0) 	# load with offset
	# _tmp6 = i < _tmp5
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp7 = _tmp6 == _tmp3
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp8 = _tmp4 || _tmp7
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp8 Goto _L3
	# we clean all the regiser
	  sw $t2, -24($fp)	# spill _tmp3 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp4 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp5 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp6 from $t5 to $fp-36
	  sw $t6, -40($fp)	# spill _tmp7 from $t6 to $fp-40
	  sw $t7, -44($fp)	# spill _tmp8 from $t7 to $fp-44
	  lw $t7, -44($fp)	# fill _tmp8 to $t7 from $fp-44
	  beqz $t7, _L3	# branch if _tmp8 is zero 
	# _tmp9 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string1
	  la $s0, _string1	# load label
	# PushParam _tmp9
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -48($fp)	# spill _tmp9 from $s0 to $fp-48
	  lw $s0, -48($fp)	# fill _tmp9 to $s0 from $fp-48
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
  _L3:
	# _tmp10 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp11 = _tmp10 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp12 = names + _tmp11
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill names to $v0 from $fp+4
	  add $t2, $v0, $t1	
	# _tmp13 = *(_tmp12)
	# We are in the EmitLoad
	# so, the dst: _tmp13 register is given $t3
	# the reference: _tmp12 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam answer
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -52($fp)	# spill _tmp10 from $t0 to $fp-52
	  lw $t0, 8($fp)	# fill answer to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp13
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -64($fp)	# spill _tmp13 from $t3 to $fp-64
	  lw $t3, -64($fp)	# fill _tmp13 to $t3 from $fp-64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _StringEqual
	# we clean all the regiser
	  sw $t1, -56($fp)	# spill _tmp11 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp12 from $t2 to $fp-60
	  jal _StringEqual   	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -68($fp)	# spill _tmp14 from $t4 to $fp-68
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp14 Goto _L2
	# we clean all the regiser
	  lw $t4, -68($fp)	# fill _tmp14 to $t4 from $fp-68
	  beqz $t4, _L2	# branch if _tmp14 is zero 
	# _tmp15 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# Return _tmp15
	  move $v0, $t5		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
	  sw $t5, -72($fp)	# spill _tmp15 from $t5 to $fp-72
  _L2:
	# _tmp16 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp17 = i + _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp17
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L0
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp16 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp17 from $t1 to $fp-80
	  b _L0		# unconditional branch
	# we clean all the regiser
  _L1:
	# _tmp18 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -84($fp)	# spill _tmp18 from $v0 to $fp-84
	# Return _tmp18
	  lw $v0, -84($fp)	# fill _tmp18 to $v0 from $fp-84
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
  main:
	# BeginFunc 216
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 216	# decrement sp to make space for locals/temps
	# _tmp19 = 3
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -12($fp)	# spill _tmp19 from $v0 to $fp-12
	# _tmp20 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp20 from $v0 to $fp-16
	# _tmp21 = _tmp19 < _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -12($fp)	# fill _tmp19 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp20 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp21 from $v0 to $fp-20
	# IfZ _tmp21 Goto _L4
	# we clean all the regiser
	  lw $v0, -20($fp)	# fill _tmp21 to $v0 from $fp-20
	  beqz $v0, _L4	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string2
	  la $v0, _string2	# load label
	  sw $v0, -24($fp)	# spill _tmp22 from $v0 to $fp-24
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -24($fp)	# fill _tmp22 to $v0 from $fp-24
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
  _L4:
	# _tmp23 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp24 = _tmp23 + _tmp19
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill _tmp19 to $v1 from $fp-12
	  add $t1, $t0, $v1	
	# _tmp25 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s0
	# the constant is 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp26 = _tmp24 * _tmp25
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $s0
	  mul $t2, $t1, $s0	
	# PushParam _tmp26
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -40($fp)	# spill _tmp26 from $t2 to $fp-40
	  lw $t2, -40($fp)	# fill _tmp26 to $t2 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp23 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp24 from $t1 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp25 from $s0 to $fp-36
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -44($fp)	# spill _tmp27 from $v0 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	# We are in the EmitStore
	# so, the reference: _tmp27 register is given $spill
	# the value: _tmp19 is given $spill
	  lw $v0, -12($fp)	# fill _tmp19 to $v0 from $fp-12
	  lw $v1, -44($fp)	# fill _tmp27 to $v1 from $fp-44
	  sw $v0, 0($v1) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $s0
	  lw $v0, -44($fp)	# fill _tmp27 to $v0 from $fp-44
	  lw $s0, -36($fp)	# fill _tmp25 to $s0 from $fp-36
	  add $t0, $v0, $s0	
	# names = _tmp28
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill names from $v0 to $fp-8
	# _tmp29 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -52($fp)	# spill _tmp29 from $v0 to $fp-52
	# _tmp30 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp31 = _tmp29 < _tmp30
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -52($fp)	# fill _tmp29 to $v0 from $fp-52
	  slt $t2, $v0, $t1	
	# _tmp32 = *(names + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp32 register is given $t3
	# the reference: names is given $spill
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  lw $t3, -4($v0) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -52($fp)	# fill _tmp29 to $v0 from $fp-52
	  slt $t4, $v0, $t3	
	# _tmp34 = _tmp33 == _tmp30
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp35 = _tmp31 || _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp35 Goto _L5
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp28 from $t0 to $fp-48
	  sw $t1, -56($fp)	# spill _tmp30 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp31 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp32 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp33 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp34 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp35 from $t6 to $fp-76
	  lw $t6, -76($fp)	# fill _tmp35 to $t6 from $fp-76
	  beqz $t6, _L5	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string3
	  la $t7, _string3	# load label
	# PushParam _tmp36
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -80($fp)	# spill _tmp36 from $t7 to $fp-80
	  lw $t7, -80($fp)	# fill _tmp36 to $t7 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L5:
	# _tmp37 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp38 = _tmp37 * _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -52($fp)	# fill _tmp29 to $v1 from $fp-52
	  mul $t1, $t0, $v1	
	# _tmp39 = names + _tmp38
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  add $t3, $v0, $t1	
	# _tmp40 = "Satish"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "Satish"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Satish"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string4
	  la $t2, _string4	# load label
	# *(_tmp39) = _tmp40
	# We are in the EmitStore
	# so, the reference: _tmp39 register is given $t3
	# the value: _tmp40 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp41 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -100($fp)	# spill _tmp41 from $v0 to $fp-100
	# _tmp42 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp43 = _tmp41 < _tmp42
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -100($fp)	# fill _tmp41 to $v0 from $fp-100
	  slt $t5, $v0, $t4	
	# _tmp44 = *(names + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp44 register is given $t6
	# the reference: names is given $spill
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  lw $t6, -4($v0) 	# load with offset
	# _tmp45 = _tmp41 < _tmp44
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -100($fp)	# fill _tmp41 to $v0 from $fp-100
	  slt $t7, $v0, $t6	
	# _tmp46 = _tmp45 == _tmp42
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp47 = _tmp43 || _tmp46
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp47 Goto _L6
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp37 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp38 from $t1 to $fp-88
	  sw $t2, -96($fp)	# spill _tmp40 from $t2 to $fp-96
	  sw $t3, -92($fp)	# spill _tmp39 from $t3 to $fp-92
	  sw $t4, -104($fp)	# spill _tmp42 from $t4 to $fp-104
	  sw $t5, -108($fp)	# spill _tmp43 from $t5 to $fp-108
	  sw $t6, -112($fp)	# spill _tmp44 from $t6 to $fp-112
	  sw $t7, -116($fp)	# spill _tmp45 from $t7 to $fp-116
	  sw $s0, -120($fp)	# spill _tmp46 from $s0 to $fp-120
	  sw $s1, -124($fp)	# spill _tmp47 from $s1 to $fp-124
	  lw $s1, -124($fp)	# fill _tmp47 to $s1 from $fp-124
	  beqz $s1, _L6	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string5
	  la $s2, _string5	# load label
	# PushParam _tmp48
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -128($fp)	# spill _tmp48 from $s2 to $fp-128
	  lw $s2, -128($fp)	# fill _tmp48 to $s2 from $fp-128
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
  _L6:
	# _tmp49 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp50 = _tmp49 * _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -100($fp)	# fill _tmp41 to $v1 from $fp-100
	  mul $t1, $t0, $v1	
	# _tmp51 = names + _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  add $t3, $v0, $t1	
	# _tmp52 = "Chun"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "Chun"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Chun"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string6
	  la $t2, _string6	# load label
	# *(_tmp51) = _tmp52
	# We are in the EmitStore
	# so, the reference: _tmp51 register is given $t3
	# the value: _tmp52 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp53 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 2
	  li $t4, 2		# load constant value 2 into $t4
	# _tmp54 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp55 = _tmp53 < _tmp54
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  slt $t6, $t4, $t5	
	# _tmp56 = *(names + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp56 register is given $t7
	# the reference: names is given $spill
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  lw $t7, -4($v0) 	# load with offset
	# _tmp57 = _tmp53 < _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  slt $s0, $t4, $t7	
	# _tmp58 = _tmp57 == _tmp54
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t5
	  seq $s1, $s0, $t5	
	# _tmp59 = _tmp55 || _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t6
	# the op2 is $s1
	  or $s2, $t6, $s1	
	# IfZ _tmp59 Goto _L7
	# we clean all the regiser
	  sw $t0, -132($fp)	# spill _tmp49 from $t0 to $fp-132
	  sw $t1, -136($fp)	# spill _tmp50 from $t1 to $fp-136
	  sw $t2, -144($fp)	# spill _tmp52 from $t2 to $fp-144
	  sw $t3, -140($fp)	# spill _tmp51 from $t3 to $fp-140
	  sw $t4, -148($fp)	# spill _tmp53 from $t4 to $fp-148
	  sw $t5, -152($fp)	# spill _tmp54 from $t5 to $fp-152
	  sw $t6, -156($fp)	# spill _tmp55 from $t6 to $fp-156
	  sw $t7, -160($fp)	# spill _tmp56 from $t7 to $fp-160
	  sw $s0, -164($fp)	# spill _tmp57 from $s0 to $fp-164
	  sw $s1, -168($fp)	# spill _tmp58 from $s1 to $fp-168
	  sw $s2, -172($fp)	# spill _tmp59 from $s2 to $fp-172
	  lw $s2, -172($fp)	# fill _tmp59 to $s2 from $fp-172
	  beqz $s2, _L7	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string7
	  la $s3, _string7	# load label
	# PushParam _tmp60
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -176($fp)	# spill _tmp60 from $s3 to $fp-176
	  lw $s3, -176($fp)	# fill _tmp60 to $s3 from $fp-176
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# we clean all the regiser
  _L7:
	# _tmp61 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp62 = _tmp61 * _tmp53
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t4
	  lw $t4, -148($fp)	# fill _tmp53 to $t4 from $fp-148
	  mul $t1, $t0, $t4	
	# _tmp63 = names + _tmp62
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp64 = "Supriya"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "Supriya"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Supriya"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string8
	  la $t3, _string8	# load label
	# *(_tmp63) = _tmp64
	# We are in the EmitStore
	# so, the reference: _tmp63 register is given $t2
	# the value: _tmp64 is given $t3
	  sw $t3, 0($t2) 	# store with offset
	# we clean all the regiser
	  sw $t0, -180($fp)	# spill _tmp61 from $t0 to $fp-180
	  sw $t1, -184($fp)	# spill _tmp62 from $t1 to $fp-184
	  sw $t2, -188($fp)	# spill _tmp63 from $t2 to $fp-188
	  sw $t3, -192($fp)	# spill _tmp64 from $t3 to $fp-192
  _L8:
	# _tmp65 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# IfZ _tmp65 Goto _L9
	# we clean all the regiser
	  sw $t0, -196($fp)	# spill _tmp65 from $t0 to $fp-196
	  lw $t0, -196($fp)	# fill _tmp65 to $t0 from $fp-196
	  beqz $t0, _L9	# branch if _tmp65 is zero 
	# _tmp66 = "\nWho is your favorite EECS483 staff member? "
	# We are in the LoadString
	# so, the dst register is given $t1
	# the String is "\nWho is your favorite EECS483 staff member? "
	  .data			# create string constant marked with label
	  _string9: .asciiz "\nWho is your favorite EECS483 staff member? "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t1
	# the label is _string9
	  la $t1, _string9	# load label
	# PushParam _tmp66
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -200($fp)	# spill _tmp66 from $t1 to $fp-200
	  lw $t1, -200($fp)	# fill _tmp66 to $t1 from $fp-200
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp67 = LCall _ReadLine
	# we clean all the regiser
	  jal _ReadLine      	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -204($fp)	# spill _tmp67 from $t0 to $fp-204
	# PushParam _tmp67
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -204($fp)	# fill _tmp67 to $t0 from $fp-204
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam names
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill names to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp68 = LCall _Wild
	# we clean all the regiser
	  jal _Wild          	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -208($fp)	# spill _tmp68 from $t1 to $fp-208
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# IfZ _tmp68 Goto _L10
	# we clean all the regiser
	  lw $t1, -208($fp)	# fill _tmp68 to $t1 from $fp-208
	  beqz $t1, _L10	# branch if _tmp68 is zero 
	# _tmp69 = "You just earned 1000 bonus points!\n"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "You just earned 1000 bonus points!\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "You just earned 1000 bonus points!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string10
	  la $t2, _string10	# load label
	# PushParam _tmp69
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -212($fp)	# spill _tmp69 from $t2 to $fp-212
	  lw $t2, -212($fp)	# fill _tmp69 to $t2 from $fp-212
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L9
	# we clean all the regiser
	  b _L9		# unconditional branch
	# we clean all the regiser
  _L10:
	# _tmp70 = "That's not a good way to make points. Try again!\..."
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "That's not a good way to make points. Try again!\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "That's not a good way to make points. Try again!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string11
	  la $t0, _string11	# load label
	# PushParam _tmp70
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -216($fp)	# spill _tmp70 from $t0 to $fp-216
	  lw $t0, -216($fp)	# fill _tmp70 to $t0 from $fp-216
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L8
	# we clean all the regiser
	  b _L8		# unconditional branch
	# we clean all the regiser
  _L9:
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
