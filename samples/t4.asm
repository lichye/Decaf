	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Binky:
	# BeginFunc 92
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s3
	# the constant is 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp1 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp1 from $v0 to $fp-12
	# _tmp2 = _tmp0 < _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill _tmp1 to $v1 from $fp-12
	  slt $v0, $s3, $v1	
	  sw $v0, -16($fp)	# spill _tmp2 from $v0 to $fp-16
	# _tmp3 = *(c + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp3 register is given $spill
	# the reference: c is given $t0
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  lw $v0, -4($t0) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# _tmp4 = _tmp0 < _tmp3
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s3
	# the op2 is $spill
	  lw $v1, -20($fp)	# fill _tmp3 to $v1 from $fp-20
	  slt $v0, $s3, $v1	
	  sw $v0, -24($fp)	# spill _tmp4 from $v0 to $fp-24
	# _tmp5 = _tmp4 == _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -24($fp)	# fill _tmp4 to $v0 from $fp-24
	  lw $v1, -12($fp)	# fill _tmp1 to $v1 from $fp-12
	  seq $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp5 from $v0 to $fp-28
	# _tmp6 = _tmp2 || _tmp5
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp2 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp5 to $v1 from $fp-28
	  or $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp6 from $v0 to $fp-32
	# IfZ _tmp6 Goto _L0
	# we clean all the regiser
	  sw $s3, -8($fp)	# spill _tmp0 from $s3 to $fp-8
	  lw $v0, -32($fp)	# fill _tmp6 to $v0 from $fp-32
	  beqz $v0, _L0	# branch if _tmp6 is zero 
	# _tmp7 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string1
	  la $v0, _string1	# load label
	  sw $v0, -36($fp)	# spill _tmp7 from $v0 to $fp-36
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -36($fp)	# fill _tmp7 to $v0 from $fp-36
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
  _L0:
	# _tmp8 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp9 = _tmp8 * _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s3
	  lw $s3, -8($fp)	# fill _tmp0 to $s3 from $fp-8
	  mul $t1, $t0, $s3	
	# _tmp10 = c + _tmp9
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  sw $t0, -40($fp)	# spill _tmp8 from $t0 to $fp-40
	  lw $t0, 12($fp)	# fill c to $t0 from $fp+12
	  add $t2, $t0, $t1	
	# _tmp11 = *(_tmp10)
	# We are in the EmitLoad
	# so, the dst: _tmp11 register is given $t3
	# the reference: _tmp10 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp12 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp13 = _tmp11 < _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  slt $t5, $t3, $t4	
	# _tmp14 = *(b + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp14 register is given $t6
	# the reference: b is given $t0
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  lw $t6, -4($t0) 	# load with offset
	# _tmp15 = _tmp11 < _tmp14
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  slt $t7, $t3, $t6	
	# _tmp16 = _tmp15 == _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp17 = _tmp13 || _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp17 Goto _L1
	# we clean all the regiser
	  sw $t1, -44($fp)	# spill _tmp9 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp10 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp11 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp12 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp13 from $t5 to $fp-60
	  sw $t6, -64($fp)	# spill _tmp14 from $t6 to $fp-64
	  sw $t7, -68($fp)	# spill _tmp15 from $t7 to $fp-68
	  sw $s0, -72($fp)	# spill _tmp16 from $s0 to $fp-72
	  sw $s1, -76($fp)	# spill _tmp17 from $s1 to $fp-76
	  lw $s1, -76($fp)	# fill _tmp17 to $s1 from $fp-76
	  beqz $s1, _L1	# branch if _tmp17 is zero 
	# _tmp18 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string2
	  la $s2, _string2	# load label
	# PushParam _tmp18
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -80($fp)	# spill _tmp18 from $s2 to $fp-80
	  lw $s2, -80($fp)	# fill _tmp18 to $s2 from $fp-80
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
  _L1:
	# _tmp19 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -84($fp)	# spill _tmp19 from $v0 to $fp-84
	# _tmp20 = _tmp19 * _tmp11
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -84($fp)	# fill _tmp19 to $v0 from $fp-84
	  lw $t3, -52($fp)	# fill _tmp11 to $t3 from $fp-52
	  mul $v0, $v0, $t3	
	  sw $v0, -88($fp)	# spill _tmp20 from $v0 to $fp-88
	# _tmp21 = b + _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t0
	# the op2 is $spill
	  lw $t0, 8($fp)	# fill b to $t0 from $fp+8
	  lw $v1, -88($fp)	# fill _tmp20 to $v1 from $fp-88
	  add $v0, $t0, $v1	
	  sw $v0, -92($fp)	# spill _tmp21 from $v0 to $fp-92
	# _tmp22 = *(_tmp21)
	# We are in the EmitLoad
	# so, the dst: _tmp22 register is given $spill
	# the reference: _tmp21 is given $spill
	  lw $v0, -92($fp)	# fill _tmp21 to $v0 from $fp-92
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -96($fp)	# spill _tmp22 from $v0 to $fp-96
	# Return _tmp22
	  lw $v0, -96($fp)	# fill _tmp22 to $v0 from $fp-96
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
	# BeginFunc 508
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 508	# decrement sp to make space for locals/temps
	# _tmp23 = 5
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -16($fp)	# spill _tmp23 from $v0 to $fp-16
	# _tmp24 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp24 from $v0 to $fp-20
	# _tmp25 = _tmp23 < _tmp24
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp23 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp24 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp25 from $v0 to $fp-24
	# IfZ _tmp25 Goto _L2
	# we clean all the regiser
	  lw $v0, -24($fp)	# fill _tmp25 to $v0 from $fp-24
	  beqz $v0, _L2	# branch if _tmp25 is zero 
	# _tmp26 = "Decaf runtime error: Array size is <= 0\n"
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
	  sw $v0, -28($fp)	# spill _tmp26 from $v0 to $fp-28
	# PushParam _tmp26
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -28($fp)	# fill _tmp26 to $v0 from $fp-28
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
  _L2:
	# _tmp27 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp28 = _tmp27 + _tmp23
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill _tmp23 to $v1 from $fp-16
	  add $t1, $t0, $v1	
	# _tmp29 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp30 = _tmp28 * _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $s1
	  mul $t2, $t1, $s1	
	# PushParam _tmp30
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -44($fp)	# spill _tmp30 from $t2 to $fp-44
	  lw $t2, -44($fp)	# fill _tmp30 to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp31 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp27 from $t0 to $fp-32
	  sw $t1, -36($fp)	# spill _tmp28 from $t1 to $fp-36
	  sw $s1, -40($fp)	# spill _tmp29 from $s1 to $fp-40
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -48($fp)	# spill _tmp31 from $v0 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp31) = _tmp23
	# We are in the EmitStore
	# so, the reference: _tmp31 register is given $spill
	# the value: _tmp23 is given $spill
	  lw $v0, -16($fp)	# fill _tmp23 to $v0 from $fp-16
	  lw $v1, -48($fp)	# fill _tmp31 to $v1 from $fp-48
	  sw $v0, 0($v1) 	# store with offset
	# _tmp32 = _tmp31 + _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $s1
	  lw $v0, -48($fp)	# fill _tmp31 to $v0 from $fp-48
	  lw $s1, -40($fp)	# fill _tmp29 to $s1 from $fp-40
	  add $t0, $v0, $s1	
	# d = _tmp32
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -12($fp)	# spill d from $v0 to $fp-12
	# _tmp33 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp34 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp35 = _tmp33 < _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t5
	# the op2 is $t1
	  slt $t2, $t5, $t1	
	# _tmp36 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp36 register is given $t3
	# the reference: d is given $spill
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  lw $t3, -4($v0) 	# load with offset
	# _tmp37 = _tmp33 < _tmp36
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t5
	# the op2 is $t3
	  slt $t4, $t5, $t3	
	# _tmp38 = _tmp37 == _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t1
	  seq $t6, $t4, $t1	
	# _tmp39 = _tmp35 || _tmp38
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp39 Goto _L3
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp32 from $t0 to $fp-52
	  sw $t1, -60($fp)	# spill _tmp34 from $t1 to $fp-60
	  sw $t2, -64($fp)	# spill _tmp35 from $t2 to $fp-64
	  sw $t3, -68($fp)	# spill _tmp36 from $t3 to $fp-68
	  sw $t4, -72($fp)	# spill _tmp37 from $t4 to $fp-72
	  sw $t5, -56($fp)	# spill _tmp33 from $t5 to $fp-56
	  sw $t6, -76($fp)	# spill _tmp38 from $t6 to $fp-76
	  sw $t7, -80($fp)	# spill _tmp39 from $t7 to $fp-80
	  lw $t7, -80($fp)	# fill _tmp39 to $t7 from $fp-80
	  beqz $t7, _L3	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string4
	  la $s0, _string4	# load label
	# PushParam _tmp40
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -84($fp)	# spill _tmp40 from $s0 to $fp-84
	  lw $s0, -84($fp)	# fill _tmp40 to $s0 from $fp-84
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
	# _tmp41 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp42 = _tmp41 * _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  lw $t5, -56($fp)	# fill _tmp33 to $t5 from $fp-56
	  mul $t1, $t0, $t5	
	# _tmp43 = d + _tmp42
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  add $t6, $v0, $t1	
	# _tmp44 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t7
	# the constant is 12
	  li $t7, 12		# load constant value 12 into $t7
	# _tmp45 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp46 = _tmp44 < _tmp45
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t7
	# the op2 is $t2
	  slt $t3, $t7, $t2	
	# IfZ _tmp46 Goto _L4
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp41 from $t0 to $fp-88
	  sw $t1, -92($fp)	# spill _tmp42 from $t1 to $fp-92
	  sw $t2, -104($fp)	# spill _tmp45 from $t2 to $fp-104
	  sw $t3, -108($fp)	# spill _tmp46 from $t3 to $fp-108
	  sw $t6, -96($fp)	# spill _tmp43 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp44 from $t7 to $fp-100
	  lw $t3, -108($fp)	# fill _tmp46 to $t3 from $fp-108
	  beqz $t3, _L4	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array size is <= 0\n"
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
	# PushParam _tmp47
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -112($fp)	# spill _tmp47 from $t4 to $fp-112
	  lw $t4, -112($fp)	# fill _tmp47 to $t4 from $fp-112
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
  _L4:
	# _tmp48 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp49 = _tmp48 + _tmp44
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t7
	  lw $t7, -100($fp)	# fill _tmp44 to $t7 from $fp-100
	  add $t1, $t0, $t7	
	# _tmp50 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp51 = _tmp49 * _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t4
	  mul $t2, $t1, $t4	
	# PushParam _tmp51
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -128($fp)	# spill _tmp51 from $t2 to $fp-128
	  lw $t2, -128($fp)	# fill _tmp51 to $t2 from $fp-128
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -116($fp)	# spill _tmp48 from $t0 to $fp-116
	  sw $t1, -120($fp)	# spill _tmp49 from $t1 to $fp-120
	  sw $t4, -124($fp)	# spill _tmp50 from $t4 to $fp-124
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -132($fp)	# spill _tmp52 from $t5 to $fp-132
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp52) = _tmp44
	# We are in the EmitStore
	# so, the reference: _tmp52 register is given $t5
	# the value: _tmp44 is given $t7
	  lw $t7, -100($fp)	# fill _tmp44 to $t7 from $fp-100
	  sw $t7, 0($t5) 	# store with offset
	# _tmp53 = _tmp52 + _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t5
	# the op2 is $t4
	  lw $t4, -124($fp)	# fill _tmp50 to $t4 from $fp-124
	  add $t0, $t5, $t4	
	# *(_tmp43) = _tmp53
	# We are in the EmitStore
	# so, the reference: _tmp43 register is given $t6
	# the value: _tmp53 is given $t0
	  lw $t6, -96($fp)	# fill _tmp43 to $t6 from $fp-96
	  sw $t0, 0($t6) 	# store with offset
	# _tmp54 = 10
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 10
	  li $v0, 10		# load constant value 10 into $v0
	  sw $v0, -140($fp)	# spill _tmp54 from $v0 to $fp-140
	# _tmp55 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp56 = _tmp54 < _tmp55
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -140($fp)	# fill _tmp54 to $v0 from $fp-140
	  slt $t2, $v0, $t1	
	# IfZ _tmp56 Goto _L5
	# we clean all the regiser
	  sw $t0, -136($fp)	# spill _tmp53 from $t0 to $fp-136
	  sw $t1, -144($fp)	# spill _tmp55 from $t1 to $fp-144
	  sw $t2, -148($fp)	# spill _tmp56 from $t2 to $fp-148
	  lw $t2, -148($fp)	# fill _tmp56 to $t2 from $fp-148
	  beqz $t2, _L5	# branch if _tmp56 is zero 
	# _tmp57 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string6
	  la $t3, _string6	# load label
	# PushParam _tmp57
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -152($fp)	# spill _tmp57 from $t3 to $fp-152
	  lw $t3, -152($fp)	# fill _tmp57 to $t3 from $fp-152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
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
	# _tmp58 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp59 = _tmp58 + _tmp54
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -140($fp)	# fill _tmp54 to $v1 from $fp-140
	  add $t1, $t0, $v1	
	# _tmp60 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s0
	# the constant is 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp61 = _tmp59 * _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $s0
	  mul $t2, $t1, $s0	
	# PushParam _tmp61
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -168($fp)	# spill _tmp61 from $t2 to $fp-168
	  lw $t2, -168($fp)	# fill _tmp61 to $t2 from $fp-168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp62 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -156($fp)	# spill _tmp58 from $t0 to $fp-156
	  sw $t1, -160($fp)	# spill _tmp59 from $t1 to $fp-160
	  sw $s0, -164($fp)	# spill _tmp60 from $s0 to $fp-164
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -172($fp)	# spill _tmp62 from $v0 to $fp-172
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp62) = _tmp54
	# We are in the EmitStore
	# so, the reference: _tmp62 register is given $spill
	# the value: _tmp54 is given $spill
	  lw $v0, -140($fp)	# fill _tmp54 to $v0 from $fp-140
	  lw $v1, -172($fp)	# fill _tmp62 to $v1 from $fp-172
	  sw $v0, 0($v1) 	# store with offset
	# _tmp63 = _tmp62 + _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $s0
	  lw $v0, -172($fp)	# fill _tmp62 to $v0 from $fp-172
	  lw $s0, -164($fp)	# fill _tmp60 to $s0 from $fp-164
	  add $t0, $v0, $s0	
	# c = _tmp63
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill c from $v0 to $fp-8
	# _tmp64 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -180($fp)	# spill _tmp64 from $v0 to $fp-180
	# _tmp65 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp66 = _tmp64 < _tmp65
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -180($fp)	# fill _tmp64 to $v0 from $fp-180
	  slt $t2, $v0, $t1	
	# _tmp67 = *(c + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp67 register is given $t3
	# the reference: c is given $spill
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  lw $t3, -4($v0) 	# load with offset
	# _tmp68 = _tmp64 < _tmp67
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -180($fp)	# fill _tmp64 to $v0 from $fp-180
	  slt $t4, $v0, $t3	
	# _tmp69 = _tmp68 == _tmp65
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp70 = _tmp66 || _tmp69
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp70 Goto _L6
	# we clean all the regiser
	  sw $t0, -176($fp)	# spill _tmp63 from $t0 to $fp-176
	  sw $t1, -184($fp)	# spill _tmp65 from $t1 to $fp-184
	  sw $t2, -188($fp)	# spill _tmp66 from $t2 to $fp-188
	  sw $t3, -192($fp)	# spill _tmp67 from $t3 to $fp-192
	  sw $t4, -196($fp)	# spill _tmp68 from $t4 to $fp-196
	  sw $t5, -200($fp)	# spill _tmp69 from $t5 to $fp-200
	  sw $t6, -204($fp)	# spill _tmp70 from $t6 to $fp-204
	  lw $t6, -204($fp)	# fill _tmp70 to $t6 from $fp-204
	  beqz $t6, _L6	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string7
	  la $t7, _string7	# load label
	# PushParam _tmp71
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -208($fp)	# spill _tmp71 from $t7 to $fp-208
	  lw $t7, -208($fp)	# fill _tmp71 to $t7 from $fp-208
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
  _L6:
	# _tmp72 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp73 = _tmp72 * _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -180($fp)	# fill _tmp64 to $v1 from $fp-180
	  mul $t1, $t0, $v1	
	# _tmp74 = c + _tmp73
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  add $s3, $v0, $t1	
	# _tmp75 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp76 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 5
	  li $t3, 5		# load constant value 5 into $t3
	# _tmp77 = 3
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 3
	  li $t4, 3		# load constant value 3 into $t4
	# _tmp78 = _tmp76 * _tmp77
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  mul $t5, $t3, $t4	
	# _tmp79 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 4
	  li $t6, 4		# load constant value 4 into $t6
	# _tmp80 = _tmp78 / _tmp79
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t6
	  div $t7, $t5, $t6	
	# _tmp81 = 2
	# We are in the LoadConstant
	# so, the dst register is given $s0
	# the constant is 2
	  li $s0, 2		# load constant value 2 into $s0
	# _tmp82 = _tmp80 % _tmp81
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t7
	# the op2 is $s0
	  rem $s1, $t7, $s0	
	# _tmp83 = _tmp75 + _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t2
	# the op2 is $s1
	  add $s2, $t2, $s1	
	# *(_tmp74) = _tmp83
	# We are in the EmitStore
	# so, the reference: _tmp74 register is given $s3
	# the value: _tmp83 is given $s2
	  sw $s2, 0($s3) 	# store with offset
	# _tmp84 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -260($fp)	# spill _tmp84 from $v0 to $fp-260
	# _tmp85 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s4
	# the constant is 0
	  li $s4, 0		# load constant value 0 into $s4
	# _tmp86 = _tmp84 < _tmp85
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $s4
	  lw $v0, -260($fp)	# fill _tmp84 to $v0 from $fp-260
	  slt $v0, $v0, $s4	
	  sw $v0, -268($fp)	# spill _tmp86 from $v0 to $fp-268
	# _tmp87 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp87 register is given $spill
	# the reference: d is given $spill
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -272($fp)	# spill _tmp87 from $v0 to $fp-272
	# _tmp88 = _tmp84 < _tmp87
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -260($fp)	# fill _tmp84 to $v0 from $fp-260
	  lw $v1, -272($fp)	# fill _tmp87 to $v1 from $fp-272
	  slt $v0, $v0, $v1	
	  sw $v0, -276($fp)	# spill _tmp88 from $v0 to $fp-276
	# _tmp89 = _tmp88 == _tmp85
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $s4
	  lw $v0, -276($fp)	# fill _tmp88 to $v0 from $fp-276
	  seq $v0, $v0, $s4	
	  sw $v0, -280($fp)	# spill _tmp89 from $v0 to $fp-280
	# _tmp90 = _tmp86 || _tmp89
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -268($fp)	# fill _tmp86 to $v0 from $fp-268
	  lw $v1, -280($fp)	# fill _tmp89 to $v1 from $fp-280
	  or $v0, $v0, $v1	
	  sw $v0, -284($fp)	# spill _tmp90 from $v0 to $fp-284
	# IfZ _tmp90 Goto _L7
	# we clean all the regiser
	  sw $t0, -212($fp)	# spill _tmp72 from $t0 to $fp-212
	  sw $t1, -216($fp)	# spill _tmp73 from $t1 to $fp-216
	  sw $t2, -224($fp)	# spill _tmp75 from $t2 to $fp-224
	  sw $t3, -228($fp)	# spill _tmp76 from $t3 to $fp-228
	  sw $t4, -232($fp)	# spill _tmp77 from $t4 to $fp-232
	  sw $t5, -236($fp)	# spill _tmp78 from $t5 to $fp-236
	  sw $t6, -240($fp)	# spill _tmp79 from $t6 to $fp-240
	  sw $t7, -244($fp)	# spill _tmp80 from $t7 to $fp-244
	  sw $s0, -248($fp)	# spill _tmp81 from $s0 to $fp-248
	  sw $s1, -252($fp)	# spill _tmp82 from $s1 to $fp-252
	  sw $s2, -256($fp)	# spill _tmp83 from $s2 to $fp-256
	  sw $s3, -220($fp)	# spill _tmp74 from $s3 to $fp-220
	  sw $s4, -264($fp)	# spill _tmp85 from $s4 to $fp-264
	  lw $v0, -284($fp)	# fill _tmp90 to $v0 from $fp-284
	  beqz $v0, _L7	# branch if _tmp90 is zero 
	# _tmp91 = "Decaf runtime error: Array subscript out of bound..."
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
	  sw $v0, -288($fp)	# spill _tmp91 from $v0 to $fp-288
	# PushParam _tmp91
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -288($fp)	# fill _tmp91 to $v0 from $fp-288
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
  _L7:
	# _tmp92 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp93 = _tmp92 * _tmp84
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -260($fp)	# fill _tmp84 to $v1 from $fp-260
	  mul $t1, $t0, $v1	
	# _tmp94 = d + _tmp93
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  add $t2, $v0, $t1	
	# _tmp95 = *(_tmp94)
	# We are in the EmitLoad
	# so, the dst: _tmp95 register is given $spill
	# the reference: _tmp94 is given $t2
	  lw $v0, 0($t2) 	# load with offset
	  sw $v0, -304($fp)	# spill _tmp95 from $v0 to $fp-304
	# _tmp96 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -308($fp)	# spill _tmp96 from $v0 to $fp-308
	# _tmp97 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp98 = _tmp96 < _tmp97
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -308($fp)	# fill _tmp96 to $v0 from $fp-308
	  slt $t4, $v0, $t3	
	# _tmp99 = *(c + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp99 register is given $t5
	# the reference: c is given $spill
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  lw $t5, -4($v0) 	# load with offset
	# _tmp100 = _tmp96 < _tmp99
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -308($fp)	# fill _tmp96 to $v0 from $fp-308
	  slt $t6, $v0, $t5	
	# _tmp101 = _tmp100 == _tmp97
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t6
	# the op2 is $t3
	  seq $t7, $t6, $t3	
	# _tmp102 = _tmp98 || _tmp101
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  or $s0, $t4, $t7	
	# IfZ _tmp102 Goto _L8
	# we clean all the regiser
	  sw $t0, -292($fp)	# spill _tmp92 from $t0 to $fp-292
	  sw $t1, -296($fp)	# spill _tmp93 from $t1 to $fp-296
	  sw $t2, -300($fp)	# spill _tmp94 from $t2 to $fp-300
	  sw $t3, -312($fp)	# spill _tmp97 from $t3 to $fp-312
	  sw $t4, -316($fp)	# spill _tmp98 from $t4 to $fp-316
	  sw $t5, -320($fp)	# spill _tmp99 from $t5 to $fp-320
	  sw $t6, -324($fp)	# spill _tmp100 from $t6 to $fp-324
	  sw $t7, -328($fp)	# spill _tmp101 from $t7 to $fp-328
	  sw $s0, -332($fp)	# spill _tmp102 from $s0 to $fp-332
	  lw $s0, -332($fp)	# fill _tmp102 to $s0 from $fp-332
	  beqz $s0, _L8	# branch if _tmp102 is zero 
	# _tmp103 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string9
	  la $s1, _string9	# load label
	# PushParam _tmp103
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -336($fp)	# spill _tmp103 from $s1 to $fp-336
	  lw $s1, -336($fp)	# fill _tmp103 to $s1 from $fp-336
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
  _L8:
	# _tmp104 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp105 = _tmp104 * _tmp96
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -308($fp)	# fill _tmp96 to $v1 from $fp-308
	  mul $t1, $t0, $v1	
	# _tmp106 = c + _tmp105
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp107 = *(_tmp106)
	# We are in the EmitLoad
	# so, the dst: _tmp107 register is given $spill
	# the reference: _tmp106 is given $t2
	  lw $v0, 0($t2) 	# load with offset
	  sw $v0, -352($fp)	# spill _tmp107 from $v0 to $fp-352
	# _tmp108 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp109 = _tmp107 < _tmp108
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -352($fp)	# fill _tmp107 to $v0 from $fp-352
	  slt $t4, $v0, $t3	
	# _tmp110 = *(_tmp95 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp110 register is given $t5
	# the reference: _tmp95 is given $spill
	  lw $v0, -304($fp)	# fill _tmp95 to $v0 from $fp-304
	  lw $t5, -4($v0) 	# load with offset
	# _tmp111 = _tmp107 < _tmp110
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -352($fp)	# fill _tmp107 to $v0 from $fp-352
	  slt $t6, $v0, $t5	
	# _tmp112 = _tmp111 == _tmp108
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t6
	# the op2 is $t3
	  seq $t7, $t6, $t3	
	# _tmp113 = _tmp109 || _tmp112
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  or $s0, $t4, $t7	
	# IfZ _tmp113 Goto _L9
	# we clean all the regiser
	  sw $t0, -340($fp)	# spill _tmp104 from $t0 to $fp-340
	  sw $t1, -344($fp)	# spill _tmp105 from $t1 to $fp-344
	  sw $t2, -348($fp)	# spill _tmp106 from $t2 to $fp-348
	  sw $t3, -356($fp)	# spill _tmp108 from $t3 to $fp-356
	  sw $t4, -360($fp)	# spill _tmp109 from $t4 to $fp-360
	  sw $t5, -364($fp)	# spill _tmp110 from $t5 to $fp-364
	  sw $t6, -368($fp)	# spill _tmp111 from $t6 to $fp-368
	  sw $t7, -372($fp)	# spill _tmp112 from $t7 to $fp-372
	  sw $s0, -376($fp)	# spill _tmp113 from $s0 to $fp-376
	  lw $s0, -376($fp)	# fill _tmp113 to $s0 from $fp-376
	  beqz $s0, _L9	# branch if _tmp113 is zero 
	# _tmp114 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string10
	  la $s1, _string10	# load label
	# PushParam _tmp114
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -380($fp)	# spill _tmp114 from $s1 to $fp-380
	  lw $s1, -380($fp)	# fill _tmp114 to $s1 from $fp-380
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
  _L9:
	# _tmp115 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp116 = _tmp115 * _tmp107
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -352($fp)	# fill _tmp107 to $v1 from $fp-352
	  mul $t1, $t0, $v1	
	# _tmp117 = _tmp95 + _tmp116
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -304($fp)	# fill _tmp95 to $v0 from $fp-304
	  add $t3, $v0, $t1	
	# _tmp118 = 55
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 55
	  li $t2, 55		# load constant value 55 into $t2
	# *(_tmp117) = _tmp118
	# We are in the EmitStore
	# so, the reference: _tmp117 register is given $t3
	# the value: _tmp118 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp119 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp120 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp121 = _tmp119 < _tmp120
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  slt $t6, $t4, $t5	
	# _tmp122 = *(c + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp122 register is given $t7
	# the reference: c is given $spill
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  lw $t7, -4($v0) 	# load with offset
	# _tmp123 = _tmp119 < _tmp122
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  slt $s0, $t4, $t7	
	# _tmp124 = _tmp123 == _tmp120
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t5
	  seq $s1, $s0, $t5	
	# _tmp125 = _tmp121 || _tmp124
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t6
	# the op2 is $s1
	  or $s2, $t6, $s1	
	# IfZ _tmp125 Goto _L10
	# we clean all the regiser
	  sw $t0, -384($fp)	# spill _tmp115 from $t0 to $fp-384
	  sw $t1, -388($fp)	# spill _tmp116 from $t1 to $fp-388
	  sw $t2, -396($fp)	# spill _tmp118 from $t2 to $fp-396
	  sw $t3, -392($fp)	# spill _tmp117 from $t3 to $fp-392
	  sw $t4, -400($fp)	# spill _tmp119 from $t4 to $fp-400
	  sw $t5, -404($fp)	# spill _tmp120 from $t5 to $fp-404
	  sw $t6, -408($fp)	# spill _tmp121 from $t6 to $fp-408
	  sw $t7, -412($fp)	# spill _tmp122 from $t7 to $fp-412
	  sw $s0, -416($fp)	# spill _tmp123 from $s0 to $fp-416
	  sw $s1, -420($fp)	# spill _tmp124 from $s1 to $fp-420
	  sw $s2, -424($fp)	# spill _tmp125 from $s2 to $fp-424
	  lw $s2, -424($fp)	# fill _tmp125 to $s2 from $fp-424
	  beqz $s2, _L10	# branch if _tmp125 is zero 
	# _tmp126 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string11
	  la $s3, _string11	# load label
	# PushParam _tmp126
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -428($fp)	# spill _tmp126 from $s3 to $fp-428
	  lw $s3, -428($fp)	# fill _tmp126 to $s3 from $fp-428
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
  _L10:
	# _tmp127 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp128 = _tmp127 * _tmp119
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t4
	  lw $t4, -400($fp)	# fill _tmp119 to $t4 from $fp-400
	  mul $t1, $t0, $t4	
	# _tmp129 = c + _tmp128
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp130 = *(_tmp129)
	# We are in the EmitLoad
	# so, the dst: _tmp130 register is given $t3
	# the reference: _tmp129 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp130
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -444($fp)	# spill _tmp130 from $t3 to $fp-444
	  lw $t3, -444($fp)	# fill _tmp130 to $t3 from $fp-444
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  sw $t0, -432($fp)	# spill _tmp127 from $t0 to $fp-432
	  sw $t1, -436($fp)	# spill _tmp128 from $t1 to $fp-436
	  sw $t2, -440($fp)	# spill _tmp129 from $t2 to $fp-440
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp131 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string12: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string12
	  la $t0, _string12	# load label
	# PushParam _tmp131
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -448($fp)	# spill _tmp131 from $t0 to $fp-448
	  lw $t0, -448($fp)	# fill _tmp131 to $t0 from $fp-448
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp132 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp133 = 100
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 100
	  sw $t0, -452($fp)	# spill _tmp132 from $t0 to $fp-452
	  li $t0, 100		# load constant value 100 into $t0
	# _tmp134 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp135 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp136 = _tmp134 < _tmp135
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  slt $t3, $t1, $t2	
	# _tmp137 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp137 register is given $t4
	# the reference: d is given $spill
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  lw $t4, -4($v0) 	# load with offset
	# _tmp138 = _tmp134 < _tmp137
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t1
	# the op2 is $t4
	  slt $t5, $t1, $t4	
	# _tmp139 = _tmp138 == _tmp135
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp140 = _tmp136 || _tmp139
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp140 Goto _L11
	# we clean all the regiser
	  sw $t0, -456($fp)	# spill _tmp133 from $t0 to $fp-456
	  sw $t1, -460($fp)	# spill _tmp134 from $t1 to $fp-460
	  sw $t2, -464($fp)	# spill _tmp135 from $t2 to $fp-464
	  sw $t3, -468($fp)	# spill _tmp136 from $t3 to $fp-468
	  sw $t4, -472($fp)	# spill _tmp137 from $t4 to $fp-472
	  sw $t5, -476($fp)	# spill _tmp138 from $t5 to $fp-476
	  sw $t6, -480($fp)	# spill _tmp139 from $t6 to $fp-480
	  sw $t7, -484($fp)	# spill _tmp140 from $t7 to $fp-484
	  lw $t7, -484($fp)	# fill _tmp140 to $t7 from $fp-484
	  beqz $t7, _L11	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string13
	  la $s0, _string13	# load label
	# PushParam _tmp141
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -488($fp)	# spill _tmp141 from $s0 to $fp-488
	  lw $s0, -488($fp)	# fill _tmp141 to $s0 from $fp-488
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
  _L11:
	# _tmp142 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp143 = _tmp142 * _tmp134
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  lw $t1, -460($fp)	# fill _tmp134 to $t1 from $fp-460
	  mul $t2, $t0, $t1	
	# _tmp144 = d + _tmp143
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -12($fp)	# fill d to $v0 from $fp-12
	  add $t3, $v0, $t2	
	# _tmp145 = *(_tmp144)
	# We are in the EmitLoad
	# so, the dst: _tmp145 register is given $t4
	# the reference: _tmp144 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# PushParam c
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam _tmp145
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -504($fp)	# spill _tmp145 from $t4 to $fp-504
	  lw $t4, -504($fp)	# fill _tmp145 to $t4 from $fp-504
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp133
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -492($fp)	# spill _tmp142 from $t0 to $fp-492
	  lw $t0, -456($fp)	# fill _tmp133 to $t0 from $fp-456
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp146 = LCall _Binky
	# we clean all the regiser
	  sw $t2, -496($fp)	# spill _tmp143 from $t2 to $fp-496
	  sw $t3, -500($fp)	# spill _tmp144 from $t3 to $fp-500
	  jal _Binky         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -508($fp)	# spill _tmp146 from $t5 to $fp-508
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp147 = _tmp132 * _tmp146
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t0
	# the op2 is $t5
	  lw $t0, -452($fp)	# fill _tmp132 to $t0 from $fp-452
	  mul $t6, $t0, $t5	
	# PushParam _tmp147
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -512($fp)	# spill _tmp147 from $t6 to $fp-512
	  lw $t6, -512($fp)	# fill _tmp147 to $t6 from $fp-512
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
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
