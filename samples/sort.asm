	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _ReadArray:
	# BeginFunc 132
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 132	# decrement sp to make space for locals/temps
	# _tmp0 = "How many scores? "
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "How many scores? "
	  .data			# create string constant marked with label
	  _string1: .asciiz "How many scores? "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string1
	  la $v0, _string1	# load label
	  sw $v0, -24($fp)	# spill _tmp0 from $v0 to $fp-24
	# PushParam _tmp0
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -24($fp)	# fill _tmp0 to $v0 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -28($fp)	# spill _tmp1 from $t0 to $fp-28
	# numScores = _tmp1
	# We are in the EmitCopy
	# so, the dst register is given $t5
	# the src is $t0
	  move $t5, $t0		# copy value from $t0 to $t5
	# _tmp2 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp3 = numScores < _tmp2
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t5
	# the op2 is $t1
	  slt $t2, $t5, $t1	
	# IfZ _tmp3 Goto _L0
	# we clean all the regiser
	  sw $t1, -32($fp)	# spill _tmp2 from $t1 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp3 from $t2 to $fp-36
	  sw $t5, -20($fp)	# spill numScores from $t5 to $fp-20
	  lw $t2, -36($fp)	# fill _tmp3 to $t2 from $fp-36
	  beqz $t2, _L0	# branch if _tmp3 is zero 
	# _tmp4 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string2
	  la $t3, _string2	# load label
	# PushParam _tmp4
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -40($fp)	# spill _tmp4 from $t3 to $fp-40
	  lw $t3, -40($fp)	# fill _tmp4 to $t3 from $fp-40
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
  _L0:
	# _tmp5 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp6 = _tmp5 + numScores
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  lw $t5, -20($fp)	# fill numScores to $t5 from $fp-20
	  add $t1, $t0, $t5	
	# _tmp7 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp8 = _tmp6 * _tmp7
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  mul $t3, $t1, $t2	
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -56($fp)	# spill _tmp8 from $t3 to $fp-56
	  lw $t3, -56($fp)	# fill _tmp8 to $t3 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp9 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -44($fp)	# spill _tmp5 from $t0 to $fp-44
	  sw $t1, -48($fp)	# spill _tmp6 from $t1 to $fp-48
	  sw $t2, -52($fp)	# spill _tmp7 from $t2 to $fp-52
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -60($fp)	# spill _tmp9 from $t4 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp9) = numScores
	# We are in the EmitStore
	# so, the reference: _tmp9 register is given $t4
	# the value: numScores is given $t5
	  lw $t5, -20($fp)	# fill numScores to $t5 from $fp-20
	  sw $t5, 0($t4) 	# store with offset
	# _tmp10 = _tmp9 + _tmp7
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t2
	  lw $t2, -52($fp)	# fill _tmp7 to $t2 from $fp-52
	  add $t0, $t4, $t2	
	# arr = _tmp10
	# We are in the EmitCopy
	# so, the dst register is given $s1
	# the src is $t0
	  move $s1, $t0		# copy value from $t0 to $s1
	# _tmp11 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp11
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp10 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp11 from $t1 to $fp-68
	  sw $s1, -16($fp)	# spill arr from $s1 to $fp-16
  _L1:
	# _tmp12 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp12 register is given $t0
	# the reference: arr is given $s1
	  lw $s1, -16($fp)	# fill arr to $s1 from $fp-16
	  lw $t0, -4($s1) 	# load with offset
	# _tmp13 = i < _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp13 Goto _L2
	# we clean all the regiser
	  sw $t0, -72($fp)	# spill _tmp12 from $t0 to $fp-72
	  sw $t1, -76($fp)	# spill _tmp13 from $t1 to $fp-76
	  lw $t1, -76($fp)	# fill _tmp13 to $t1 from $fp-76
	  beqz $t1, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Enter next number: "
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "Enter next number: "
	  .data			# create string constant marked with label
	  _string3: .asciiz "Enter next number: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string3
	  la $t2, _string3	# load label
	# PushParam _tmp14
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -80($fp)	# spill _tmp14 from $t2 to $fp-80
	  lw $t2, -80($fp)	# fill _tmp14 to $t2 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -84($fp)	# spill _tmp15 from $t0 to $fp-84
	# num = _tmp15
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# _tmp16 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp17 = i < _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp18 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp18 register is given $t4
	# the reference: arr is given $s1
	  lw $s1, -16($fp)	# fill arr to $s1 from $fp-16
	  lw $t4, -4($s1) 	# load with offset
	# _tmp19 = i < _tmp18
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp20 = _tmp19 == _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp21 = _tmp17 || _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp21 Goto _L3
	# we clean all the regiser
	  sw $t1, -12($fp)	# spill num from $t1 to $fp-12
	  sw $t2, -88($fp)	# spill _tmp16 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp17 from $t3 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp18 from $t4 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp19 from $t5 to $fp-100
	  sw $t6, -104($fp)	# spill _tmp20 from $t6 to $fp-104
	  sw $t7, -108($fp)	# spill _tmp21 from $t7 to $fp-108
	  lw $t7, -108($fp)	# fill _tmp21 to $t7 from $fp-108
	  beqz $t7, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -112($fp)	# spill _tmp22 from $s0 to $fp-112
	  lw $s0, -112($fp)	# fill _tmp22 to $s0 from $fp-112
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
	# _tmp23 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp24 = _tmp23 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp25 = arr + _tmp24
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s1
	# the op2 is $t1
	  lw $s1, -16($fp)	# fill arr to $s1 from $fp-16
	  add $t2, $s1, $t1	
	# *(_tmp25) = num
	# We are in the EmitStore
	# so, the reference: _tmp25 register is given $t2
	# the value: num is given $t1
	  sw $t1, -120($fp)	# spill _tmp24 from $t1 to $fp-120
	  lw $t1, -12($fp)	# fill num to $t1 from $fp-12
	  sw $t1, 0($t2) 	# store with offset
	# _tmp26 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp27 = i + _tmp26
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t4, $v0, $t3	
	# i = _tmp27
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L1
	# we clean all the regiser
	  sw $t0, -116($fp)	# spill _tmp23 from $t0 to $fp-116
	  sw $t2, -124($fp)	# spill _tmp25 from $t2 to $fp-124
	  sw $t3, -128($fp)	# spill _tmp26 from $t3 to $fp-128
	  sw $t4, -132($fp)	# spill _tmp27 from $t4 to $fp-132
	  b _L1		# unconditional branch
	# we clean all the regiser
  _L2:
	# Return arr
	  lw $s1, -16($fp)	# fill arr to $s1 from $fp-16
	  move $v0, $s1		# assign return value into $v0
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
  _Sort:
	# BeginFunc 312
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 312	# decrement sp to make space for locals/temps
	# _tmp28 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp28 from $v0 to $fp-20
	# i = _tmp28
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -20($fp)	# fill _tmp28 to $v0 from $fp-20
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
  _L4:
	# _tmp29 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp29 register is given $t0
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t0, -4($v0) 	# load with offset
	# _tmp30 = i < _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp30 Goto _L5
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp29 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp30 from $t1 to $fp-28
	  lw $t1, -28($fp)	# fill _tmp30 to $t1 from $fp-28
	  beqz $t1, _L5	# branch if _tmp30 is zero 
	# _tmp31 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp32 = i - _tmp31
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  sub $t3, $v0, $t2	
	# j = _tmp32
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# _tmp33 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp34 = i < _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp35 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp35 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t6, -4($v0) 	# load with offset
	# _tmp36 = i < _tmp35
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t7, $v0, $t6	
	# _tmp37 = _tmp36 == _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp38 = _tmp34 || _tmp37
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp38 Goto _L6
	# we clean all the regiser
	  sw $t2, -32($fp)	# spill _tmp31 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp32 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp33 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp34 from $t5 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp35 from $t6 to $fp-48
	  sw $t7, -52($fp)	# spill _tmp36 from $t7 to $fp-52
	  sw $s0, -56($fp)	# spill _tmp37 from $s0 to $fp-56
	  sw $s1, -60($fp)	# spill _tmp38 from $s1 to $fp-60
	  lw $s1, -60($fp)	# fill _tmp38 to $s1 from $fp-60
	  beqz $s1, _L6	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp39
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -64($fp)	# spill _tmp39 from $s2 to $fp-64
	  lw $s2, -64($fp)	# fill _tmp39 to $s2 from $fp-64
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
	# _tmp40 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp41 = _tmp40 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp42 = arr + _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  add $t2, $v0, $t1	
	# _tmp43 = *(_tmp42)
	# We are in the EmitLoad
	# so, the dst: _tmp43 register is given $t3
	# the reference: _tmp42 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# val = _tmp43
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t3
	  move $t7, $t3		# copy value from $t3 to $t7
	# we clean all the regiser
	  sw $t0, -68($fp)	# spill _tmp40 from $t0 to $fp-68
	  sw $t1, -72($fp)	# spill _tmp41 from $t1 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp42 from $t2 to $fp-76
	  sw $t3, -80($fp)	# spill _tmp43 from $t3 to $fp-80
	  sw $t7, -16($fp)	# spill val from $t7 to $fp-16
  _L7:
	# _tmp44 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp45 = _tmp44 < j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  slt $t1, $t0, $v1	
	# _tmp46 = j == _tmp44
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  seq $t2, $v0, $t0	
	# _tmp47 = _tmp45 || _tmp46
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  or $t3, $t1, $t2	
	# IfZ _tmp47 Goto _L8
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp44 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp45 from $t1 to $fp-88
	  sw $t2, -92($fp)	# spill _tmp46 from $t2 to $fp-92
	  sw $t3, -96($fp)	# spill _tmp47 from $t3 to $fp-96
	  lw $t3, -96($fp)	# fill _tmp47 to $t3 from $fp-96
	  beqz $t3, _L8	# branch if _tmp47 is zero 
	# _tmp48 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp49 = j < _tmp48
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t5, $v0, $t4	
	# _tmp50 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp50 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t6, -4($v0) 	# load with offset
	# _tmp51 = j < _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t7, $v0, $t6	
	# _tmp52 = _tmp51 == _tmp48
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  seq $s0, $t7, $t4	
	# _tmp53 = _tmp49 || _tmp52
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp53 Goto _L10
	# we clean all the regiser
	  sw $t4, -100($fp)	# spill _tmp48 from $t4 to $fp-100
	  sw $t5, -104($fp)	# spill _tmp49 from $t5 to $fp-104
	  sw $t6, -108($fp)	# spill _tmp50 from $t6 to $fp-108
	  sw $t7, -112($fp)	# spill _tmp51 from $t7 to $fp-112
	  sw $s0, -116($fp)	# spill _tmp52 from $s0 to $fp-116
	  sw $s1, -120($fp)	# spill _tmp53 from $s1 to $fp-120
	  lw $s1, -120($fp)	# fill _tmp53 to $s1 from $fp-120
	  beqz $s1, _L10	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string6
	  la $s2, _string6	# load label
	# PushParam _tmp54
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -124($fp)	# spill _tmp54 from $s2 to $fp-124
	  lw $s2, -124($fp)	# fill _tmp54 to $s2 from $fp-124
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
  _L10:
	# _tmp55 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp56 = _tmp55 * j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $t1, $t0, $v1	
	# _tmp57 = arr + _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  add $t2, $v0, $t1	
	# _tmp58 = *(_tmp57)
	# We are in the EmitLoad
	# so, the dst: _tmp58 register is given $t3
	# the reference: _tmp57 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp59 = _tmp58 < val
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t7
	  lw $t7, -16($fp)	# fill val to $t7 from $fp-16
	  slt $t4, $t3, $t7	
	# _tmp60 = val == _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t7
	# the op2 is $t3
	  seq $t5, $t7, $t3	
	# _tmp61 = _tmp59 || _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  or $t6, $t4, $t5	
	# IfZ _tmp61 Goto _L9
	# we clean all the regiser
	  sw $t0, -128($fp)	# spill _tmp55 from $t0 to $fp-128
	  sw $t1, -132($fp)	# spill _tmp56 from $t1 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp57 from $t2 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp58 from $t3 to $fp-140
	  sw $t4, -144($fp)	# spill _tmp59 from $t4 to $fp-144
	  sw $t5, -148($fp)	# spill _tmp60 from $t5 to $fp-148
	  sw $t6, -152($fp)	# spill _tmp61 from $t6 to $fp-152
	  lw $t6, -152($fp)	# fill _tmp61 to $t6 from $fp-152
	  beqz $t6, _L9	# branch if _tmp61 is zero 
	# Goto _L8
	# we clean all the regiser
	  b _L8		# unconditional branch
	# we clean all the regiser
  _L9:
	# _tmp62 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp63 = j + _tmp62
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  add $s2, $v0, $t0	
	# _tmp64 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp65 = _tmp63 < _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s2
	# the op2 is $t1
	  slt $t2, $s2, $t1	
	# _tmp66 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp66 register is given $t3
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t3, -4($v0) 	# load with offset
	# _tmp67 = _tmp63 < _tmp66
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $s2
	# the op2 is $t3
	  slt $t4, $s2, $t3	
	# _tmp68 = _tmp67 == _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp69 = _tmp65 || _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp69 Goto _L11
	# we clean all the regiser
	  sw $t0, -156($fp)	# spill _tmp62 from $t0 to $fp-156
	  sw $t1, -164($fp)	# spill _tmp64 from $t1 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp65 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp66 from $t3 to $fp-172
	  sw $t4, -176($fp)	# spill _tmp67 from $t4 to $fp-176
	  sw $t5, -180($fp)	# spill _tmp68 from $t5 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp69 from $t6 to $fp-184
	  sw $s2, -160($fp)	# spill _tmp63 from $s2 to $fp-160
	  lw $t6, -184($fp)	# fill _tmp69 to $t6 from $fp-184
	  beqz $t6, _L11	# branch if _tmp69 is zero 
	# _tmp70 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp70
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -188($fp)	# spill _tmp70 from $t7 to $fp-188
	  lw $t7, -188($fp)	# fill _tmp70 to $t7 from $fp-188
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
  _L11:
	# _tmp71 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp72 = _tmp71 * _tmp63
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s2
	  lw $s2, -160($fp)	# fill _tmp63 to $s2 from $fp-160
	  mul $t1, $t0, $s2	
	# _tmp73 = arr + _tmp72
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  add $t6, $v0, $t1	
	# _tmp74 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp75 = j < _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t3, $v0, $t2	
	# _tmp76 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp76 register is given $t4
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t4, -4($v0) 	# load with offset
	# _tmp77 = j < _tmp76
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  slt $t5, $v0, $t4	
	# _tmp78 = _tmp77 == _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t2
	  seq $t7, $t5, $t2	
	# _tmp79 = _tmp75 || _tmp78
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t7
	  or $s0, $t3, $t7	
	# IfZ _tmp79 Goto _L12
	# we clean all the regiser
	  sw $t0, -192($fp)	# spill _tmp71 from $t0 to $fp-192
	  sw $t1, -196($fp)	# spill _tmp72 from $t1 to $fp-196
	  sw $t2, -204($fp)	# spill _tmp74 from $t2 to $fp-204
	  sw $t3, -208($fp)	# spill _tmp75 from $t3 to $fp-208
	  sw $t4, -212($fp)	# spill _tmp76 from $t4 to $fp-212
	  sw $t5, -216($fp)	# spill _tmp77 from $t5 to $fp-216
	  sw $t6, -200($fp)	# spill _tmp73 from $t6 to $fp-200
	  sw $t7, -220($fp)	# spill _tmp78 from $t7 to $fp-220
	  sw $s0, -224($fp)	# spill _tmp79 from $s0 to $fp-224
	  lw $s0, -224($fp)	# fill _tmp79 to $s0 from $fp-224
	  beqz $s0, _L12	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string8
	  la $s1, _string8	# load label
	# PushParam _tmp80
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -228($fp)	# spill _tmp80 from $s1 to $fp-228
	  lw $s1, -228($fp)	# fill _tmp80 to $s1 from $fp-228
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
  _L12:
	# _tmp81 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp82 = _tmp81 * j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill j to $v1 from $fp-12
	  mul $t1, $t0, $v1	
	# _tmp83 = arr + _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  add $t2, $v0, $t1	
	# _tmp84 = *(_tmp83)
	# We are in the EmitLoad
	# so, the dst: _tmp84 register is given $t3
	# the reference: _tmp83 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# *(_tmp73) = _tmp84
	# We are in the EmitStore
	# so, the reference: _tmp73 register is given $t6
	# the value: _tmp84 is given $t3
	  lw $t6, -200($fp)	# fill _tmp73 to $t6 from $fp-200
	  sw $t3, 0($t6) 	# store with offset
	# _tmp85 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# _tmp86 = j - _tmp85
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  sub $t5, $v0, $t4	
	# j = _tmp86
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t5
	  move $v0, $t5		# copy value from $t5 to $v0
	  sw $v0, -12($fp)	# spill j from $v0 to $fp-12
	# Goto _L7
	# we clean all the regiser
	  sw $t0, -232($fp)	# spill _tmp81 from $t0 to $fp-232
	  sw $t1, -236($fp)	# spill _tmp82 from $t1 to $fp-236
	  sw $t2, -240($fp)	# spill _tmp83 from $t2 to $fp-240
	  sw $t3, -244($fp)	# spill _tmp84 from $t3 to $fp-244
	  sw $t4, -248($fp)	# spill _tmp85 from $t4 to $fp-248
	  sw $t5, -252($fp)	# spill _tmp86 from $t5 to $fp-252
	  b _L7		# unconditional branch
	# we clean all the regiser
  _L8:
	# _tmp87 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp88 = j + _tmp87
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill j to $v0 from $fp-12
	  add $t5, $v0, $t0	
	# _tmp89 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp90 = _tmp88 < _tmp89
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t5
	# the op2 is $t1
	  slt $t2, $t5, $t1	
	# _tmp91 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp91 register is given $t3
	# the reference: arr is given $spill
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $t3, -4($v0) 	# load with offset
	# _tmp92 = _tmp88 < _tmp91
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t5
	# the op2 is $t3
	  slt $t4, $t5, $t3	
	# _tmp93 = _tmp92 == _tmp89
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t1
	  seq $t6, $t4, $t1	
	# _tmp94 = _tmp90 || _tmp93
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp94 Goto _L13
	# we clean all the regiser
	  sw $t0, -256($fp)	# spill _tmp87 from $t0 to $fp-256
	  sw $t1, -264($fp)	# spill _tmp89 from $t1 to $fp-264
	  sw $t2, -268($fp)	# spill _tmp90 from $t2 to $fp-268
	  sw $t3, -272($fp)	# spill _tmp91 from $t3 to $fp-272
	  sw $t4, -276($fp)	# spill _tmp92 from $t4 to $fp-276
	  sw $t5, -260($fp)	# spill _tmp88 from $t5 to $fp-260
	  sw $t6, -280($fp)	# spill _tmp93 from $t6 to $fp-280
	  sw $t7, -284($fp)	# spill _tmp94 from $t7 to $fp-284
	  lw $t7, -284($fp)	# fill _tmp94 to $t7 from $fp-284
	  beqz $t7, _L13	# branch if _tmp94 is zero 
	# _tmp95 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string9
	  la $s0, _string9	# load label
	# PushParam _tmp95
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -288($fp)	# spill _tmp95 from $s0 to $fp-288
	  lw $s0, -288($fp)	# fill _tmp95 to $s0 from $fp-288
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
  _L13:
	# _tmp96 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp97 = _tmp96 * _tmp88
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  lw $t5, -260($fp)	# fill _tmp88 to $t5 from $fp-260
	  mul $t1, $t0, $t5	
	# _tmp98 = arr + _tmp97
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  add $t2, $v0, $t1	
	# *(_tmp98) = val
	# We are in the EmitStore
	# so, the reference: _tmp98 register is given $t2
	# the value: val is given $t7
	  lw $t7, -16($fp)	# fill val to $t7 from $fp-16
	  sw $t7, 0($t2) 	# store with offset
	# _tmp99 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp100 = i + _tmp99
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t4, $v0, $t3	
	# i = _tmp100
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L4
	# we clean all the regiser
	  sw $t0, -292($fp)	# spill _tmp96 from $t0 to $fp-292
	  sw $t1, -296($fp)	# spill _tmp97 from $t1 to $fp-296
	  sw $t2, -300($fp)	# spill _tmp98 from $t2 to $fp-300
	  sw $t3, -304($fp)	# spill _tmp99 from $t3 to $fp-304
	  sw $t4, -308($fp)	# spill _tmp100 from $t4 to $fp-308
	  b _L4		# unconditional branch
	# we clean all the regiser
  _L5:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _PrintArray:
	# BeginFunc 84
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp101 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s2
	# the constant is 0
	  li $s2, 0		# load constant value 0 into $s2
	# i = _tmp101
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $s2
	  move $v0, $s2		# copy value from $s2 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# _tmp102 = "Sorted results: "
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Sorted results: "
	  .data			# create string constant marked with label
	  _string10: .asciiz "Sorted results: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string10
	  la $v0, _string10	# load label
	  sw $v0, -16($fp)	# spill _tmp102 from $v0 to $fp-16
	# PushParam _tmp102
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -16($fp)	# fill _tmp102 to $v0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $s2, -12($fp)	# spill _tmp101 from $s2 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L14:
	# _tmp103 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp103 register is given $t0
	# the reference: arr is given $s1
	  lw $s1, 4($fp)	# fill arr to $s1 from $fp+4
	  lw $t0, -4($s1) 	# load with offset
	# _tmp104 = i < _tmp103
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp104 Goto _L15
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp103 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp104 from $t1 to $fp-24
	  lw $t1, -24($fp)	# fill _tmp104 to $t1 from $fp-24
	  beqz $t1, _L15	# branch if _tmp104 is zero 
	# _tmp105 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp106 = i < _tmp105
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp107 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp107 register is given $t4
	# the reference: arr is given $s1
	  lw $s1, 4($fp)	# fill arr to $s1 from $fp+4
	  lw $t4, -4($s1) 	# load with offset
	# _tmp108 = i < _tmp107
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp109 = _tmp108 == _tmp105
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp110 = _tmp106 || _tmp109
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp110 Goto _L16
	# we clean all the regiser
	  sw $t2, -28($fp)	# spill _tmp105 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp106 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp107 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp108 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp109 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp110 from $t7 to $fp-48
	  lw $t7, -48($fp)	# fill _tmp110 to $t7 from $fp-48
	  beqz $t7, _L16	# branch if _tmp110 is zero 
	# _tmp111 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string11
	  la $s0, _string11	# load label
	# PushParam _tmp111
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -52($fp)	# spill _tmp111 from $s0 to $fp-52
	  lw $s0, -52($fp)	# fill _tmp111 to $s0 from $fp-52
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
  _L16:
	# _tmp112 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp113 = _tmp112 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp114 = arr + _tmp113
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s1
	# the op2 is $t1
	  lw $s1, 4($fp)	# fill arr to $s1 from $fp+4
	  add $t2, $s1, $t1	
	# _tmp115 = *(_tmp114)
	# We are in the EmitLoad
	# so, the dst: _tmp115 register is given $t3
	# the reference: _tmp114 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp115
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -68($fp)	# spill _tmp115 from $t3 to $fp-68
	  lw $t3, -68($fp)	# fill _tmp115 to $t3 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp112 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp113 from $t1 to $fp-60
	  sw $t2, -64($fp)	# spill _tmp114 from $t2 to $fp-64
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp116 = " "
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
	# PushParam _tmp116
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -72($fp)	# spill _tmp116 from $t0 to $fp-72
	  lw $t0, -72($fp)	# fill _tmp116 to $t0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp117 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp118 = i + _tmp117
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp118
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L14
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp117 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp118 from $t1 to $fp-80
	  b _L14		# unconditional branch
	# we clean all the regiser
  _L15:
	# _tmp119 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string13
	  la $t0, _string13	# load label
	# PushParam _tmp119
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -84($fp)	# spill _tmp119 from $t0 to $fp-84
	  lw $t0, -84($fp)	# fill _tmp119 to $t0 from $fp-84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp120 = "\nThis program will read in a bunch of numbers an..."
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\nThis program will read in a bunch of numbers and print them\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "\nThis program will read in a bunch of numbers and print them\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string14
	  la $t0, _string14	# load label
	# PushParam _tmp120
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp120 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp120 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp121 = "back out in sorted order.\n\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "back out in sorted order.\n\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "back out in sorted order.\n\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string15
	  la $t0, _string15	# load label
	# PushParam _tmp121
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp121 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp121 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp122 = LCall _ReadArray
	# we clean all the regiser
	  jal _ReadArray     	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -20($fp)	# spill _tmp122 from $t0 to $fp-20
	# arr = _tmp122
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# PushParam arr
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -8($fp)	# spill arr from $t1 to $fp-8
	  lw $t1, -8($fp)	# fill arr to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _Sort
	# we clean all the regiser
	  jal _Sort          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam arr
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill arr to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	# we clean all the regiser
	  jal _PrintArray    	# jump to function
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
