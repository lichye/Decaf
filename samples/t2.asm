	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _tester:
	# BeginFunc 192
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 192	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp0 from $v0 to $fp-16
	# _tmp1 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -20($fp)	# spill _tmp1 from $v0 to $fp-20
	# _tmp2 = _tmp0 < _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  lw $v1, -20($fp)	# fill _tmp1 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp2 from $v0 to $fp-24
	# IfZ _tmp2 Goto _L0
	# we clean all the regiser
	  lw $v0, -24($fp)	# fill _tmp2 to $v0 from $fp-24
	  beqz $v0, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string1
	  la $v0, _string1	# load label
	  sw $v0, -28($fp)	# spill _tmp3 from $v0 to $fp-28
	# PushParam _tmp3
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -28($fp)	# fill _tmp3 to $v0 from $fp-28
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
	# _tmp4 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp5 = _tmp4 + _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill _tmp0 to $v1 from $fp-16
	  add $t1, $t0, $v1	
	# _tmp6 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp7 = _tmp5 * _tmp6
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t5
	  mul $t2, $t1, $t5	
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -44($fp)	# spill _tmp7 from $t2 to $fp-44
	  lw $t2, -44($fp)	# fill _tmp7 to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp4 from $t0 to $fp-32
	  sw $t1, -36($fp)	# spill _tmp5 from $t1 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp6 from $t5 to $fp-40
	  jal _Alloc         	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -48($fp)	# spill _tmp8 from $t6 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	# We are in the EmitStore
	# so, the reference: _tmp8 register is given $t6
	# the value: _tmp0 is given $spill
	  lw $v0, -16($fp)	# fill _tmp0 to $v0 from $fp-16
	  sw $v0, 0($t6) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t6
	# the op2 is $t5
	  lw $t5, -40($fp)	# fill _tmp6 to $t5 from $fp-40
	  add $t0, $t6, $t5	
	# b = _tmp9
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# _tmp10 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp11 = sz < _tmp10
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, 4($fp)	# fill sz to $v0 from $fp+4
	  slt $t3, $v0, $t2	
	# IfZ _tmp11 Goto _L1
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp9 from $t0 to $fp-52
	  sw $t1, 4($gp)	# spill b from $t1 to $gp+4
	  sw $t2, -56($fp)	# spill _tmp10 from $t2 to $fp-56
	  sw $t3, -60($fp)	# spill _tmp11 from $t3 to $fp-60
	  lw $t3, -60($fp)	# fill _tmp11 to $t3 from $fp-60
	  beqz $t3, _L1	# branch if _tmp11 is zero 
	# _tmp12 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t4
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t4
	# the label is _string2
	  la $t4, _string2	# load label
	# PushParam _tmp12
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -64($fp)	# spill _tmp12 from $t4 to $fp-64
	  lw $t4, -64($fp)	# fill _tmp12 to $t4 from $fp-64
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
  _L1:
	# _tmp13 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp14 = _tmp13 + sz
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, 4($fp)	# fill sz to $v1 from $fp+4
	  add $t1, $t0, $v1	
	# _tmp15 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp16 = _tmp14 * _tmp15
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  mul $t3, $t1, $t2	
	# PushParam _tmp16
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -80($fp)	# spill _tmp16 from $t3 to $fp-80
	  lw $t3, -80($fp)	# fill _tmp16 to $t3 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp17 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -68($fp)	# spill _tmp13 from $t0 to $fp-68
	  sw $t1, -72($fp)	# spill _tmp14 from $t1 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp15 from $t2 to $fp-76
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -84($fp)	# spill _tmp17 from $t4 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp17) = sz
	# We are in the EmitStore
	# so, the reference: _tmp17 register is given $t4
	# the value: sz is given $spill
	  lw $v0, 4($fp)	# fill sz to $v0 from $fp+4
	  sw $v0, 0($t4) 	# store with offset
	# _tmp18 = _tmp17 + _tmp15
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t2
	  lw $t2, -76($fp)	# fill _tmp15 to $t2 from $fp-76
	  add $t0, $t4, $t2	
	# result = _tmp18
	# We are in the EmitCopy
	# so, the dst register is given $s0
	# the src is $t0
	  move $s0, $t0		# copy value from $t0 to $s0
	# _tmp19 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp19
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp18 from $t0 to $fp-88
	  sw $t1, -92($fp)	# spill _tmp19 from $t1 to $fp-92
	  sw $s0, -12($fp)	# spill result from $s0 to $fp-12
  _L2:
	# _tmp20 = i < sz
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, 4($fp)	# fill sz to $v1 from $fp+4
	  slt $t0, $v0, $v1	
	# IfZ _tmp20 Goto _L3
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp20 from $t0 to $fp-96
	  lw $t0, -96($fp)	# fill _tmp20 to $t0 from $fp-96
	  beqz $t0, _L3	# branch if _tmp20 is zero 
	# _tmp21 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp22 = i < _tmp21
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# _tmp23 = *(result + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp23 register is given $t3
	# the reference: result is given $s0
	  lw $s0, -12($fp)	# fill result to $s0 from $fp-12
	  lw $t3, -4($s0) 	# load with offset
	# _tmp24 = i < _tmp23
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t4, $v0, $t3	
	# _tmp25 = _tmp24 == _tmp21
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp26 = _tmp22 || _tmp25
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp26 Goto _L4
	# we clean all the regiser
	  sw $t1, -100($fp)	# spill _tmp21 from $t1 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp22 from $t2 to $fp-104
	  sw $t3, -108($fp)	# spill _tmp23 from $t3 to $fp-108
	  sw $t4, -112($fp)	# spill _tmp24 from $t4 to $fp-112
	  sw $t5, -116($fp)	# spill _tmp25 from $t5 to $fp-116
	  sw $t6, -120($fp)	# spill _tmp26 from $t6 to $fp-120
	  lw $t6, -120($fp)	# fill _tmp26 to $t6 from $fp-120
	  beqz $t6, _L4	# branch if _tmp26 is zero 
	# _tmp27 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp27
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -124($fp)	# spill _tmp27 from $t7 to $fp-124
	  lw $t7, -124($fp)	# fill _tmp27 to $t7 from $fp-124
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
  _L4:
	# _tmp28 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp29 = _tmp28 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp30 = result + _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s0
	# the op2 is $t1
	  lw $s0, -12($fp)	# fill result to $s0 from $fp-12
	  add $t2, $s0, $t1	
	# *(_tmp30) = i
	# We are in the EmitStore
	# so, the reference: _tmp30 register is given $t2
	# the value: i is given $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  sw $v0, 0($t2) 	# store with offset
	# _tmp31 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp32 = i + _tmp31
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t4, $v0, $t3	
	# i = _tmp32
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L2
	# we clean all the regiser
	  sw $t0, -128($fp)	# spill _tmp28 from $t0 to $fp-128
	  sw $t1, -132($fp)	# spill _tmp29 from $t1 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp30 from $t2 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp31 from $t3 to $fp-140
	  sw $t4, -144($fp)	# spill _tmp32 from $t4 to $fp-144
	  b _L2		# unconditional branch
	# we clean all the regiser
  _L3:
	# _tmp33 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp34 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp35 = _tmp33 < _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# _tmp36 = *(b + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp36 register is given $t3
	# the reference: b is given $t1
	  sw $t1, -152($fp)	# spill _tmp34 from $t1 to $fp-152
	  lw $t1, 4($gp)	# fill b to $t1 from $gp+4
	  lw $t3, -4($t1) 	# load with offset
	# _tmp37 = _tmp33 < _tmp36
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t3
	  slt $t4, $t0, $t3	
	# _tmp38 = _tmp37 == _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  lw $t1, -152($fp)	# fill _tmp34 to $t1 from $fp-152
	  seq $t5, $t4, $t1	
	# _tmp39 = _tmp35 || _tmp38
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp39 Goto _L5
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp33 from $t0 to $fp-148
	  sw $t2, -156($fp)	# spill _tmp35 from $t2 to $fp-156
	  sw $t3, -160($fp)	# spill _tmp36 from $t3 to $fp-160
	  sw $t4, -164($fp)	# spill _tmp37 from $t4 to $fp-164
	  sw $t5, -168($fp)	# spill _tmp38 from $t5 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp39 from $t6 to $fp-172
	  lw $t6, -172($fp)	# fill _tmp39 to $t6 from $fp-172
	  beqz $t6, _L5	# branch if _tmp39 is zero 
	# _tmp40 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string4
	  la $t7, _string4	# load label
	# PushParam _tmp40
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -176($fp)	# spill _tmp40 from $t7 to $fp-176
	  lw $t7, -176($fp)	# fill _tmp40 to $t7 from $fp-176
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
	# _tmp41 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -180($fp)	# spill _tmp41 from $v0 to $fp-180
	# _tmp42 = _tmp41 * _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -180($fp)	# fill _tmp41 to $v0 from $fp-180
	  lw $t0, -148($fp)	# fill _tmp33 to $t0 from $fp-148
	  mul $v0, $v0, $t0	
	  sw $v0, -184($fp)	# spill _tmp42 from $v0 to $fp-184
	# _tmp43 = b + _tmp42
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t1
	# the op2 is $spill
	  lw $t1, 4($gp)	# fill b to $t1 from $gp+4
	  lw $v1, -184($fp)	# fill _tmp42 to $v1 from $fp-184
	  add $v0, $t1, $v1	
	  sw $v0, -188($fp)	# spill _tmp43 from $v0 to $fp-188
	# _tmp44 = "Done"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Done"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Done"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string5
	  la $v0, _string5	# load label
	  sw $v0, -192($fp)	# spill _tmp44 from $v0 to $fp-192
	# *(_tmp43) = _tmp44
	# We are in the EmitStore
	# so, the reference: _tmp43 register is given $spill
	# the value: _tmp44 is given $spill
	  lw $v0, -192($fp)	# fill _tmp44 to $v0 from $fp-192
	  lw $v1, -188($fp)	# fill _tmp43 to $v1 from $fp-188
	  sw $v0, 0($v1) 	# store with offset
	# Return result
	  lw $s0, -12($fp)	# fill result to $s0 from $fp-12
	  move $v0, $s0		# assign return value into $v0
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
	# BeginFunc 168
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp45 = 8
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -12($fp)	# spill _tmp45 from $v0 to $fp-12
	# PushParam _tmp45
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill _tmp45 to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp46 = LCall _tester
	# we clean all the regiser
	  jal _tester        	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -16($fp)	# spill _tmp46 from $v0 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# d = _tmp46
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -16($fp)	# fill _tmp46 to $v0 from $fp-16
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill d from $v0 to $fp-8
	# _tmp47 = 1
	# We are in the LoadConstant
	# so, the dst register is given $s3
	# the constant is 1
	  li $s3, 1		# load constant value 1 into $s3
	# _tmp48 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp49 = _tmp47 < _tmp48
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $s3
	# the op2 is $t0
	  slt $t1, $s3, $t0	
	# _tmp50 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp50 register is given $t2
	# the reference: d is given $spill
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $t2, -4($v0) 	# load with offset
	# _tmp51 = _tmp47 < _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $s3
	# the op2 is $t2
	  slt $t3, $s3, $t2	
	# _tmp52 = _tmp51 == _tmp48
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t0
	  seq $t4, $t3, $t0	
	# _tmp53 = _tmp49 || _tmp52
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t1
	# the op2 is $t4
	  or $t5, $t1, $t4	
	# IfZ _tmp53 Goto _L6
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp48 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp49 from $t1 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp50 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp51 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp52 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp53 from $t5 to $fp-44
	  sw $s3, -20($fp)	# spill _tmp47 from $s3 to $fp-20
	  lw $t5, -44($fp)	# fill _tmp53 to $t5 from $fp-44
	  beqz $t5, _L6	# branch if _tmp53 is zero 
	# _tmp54 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t6
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t6
	# the label is _string6
	  la $t6, _string6	# load label
	# PushParam _tmp54
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -48($fp)	# spill _tmp54 from $t6 to $fp-48
	  lw $t6, -48($fp)	# fill _tmp54 to $t6 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
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
	# _tmp55 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp56 = _tmp55 * _tmp47
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s3
	  lw $s3, -20($fp)	# fill _tmp47 to $s3 from $fp-20
	  mul $t1, $t0, $s3	
	# _tmp57 = d + _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp58 = *(_tmp57)
	# We are in the EmitLoad
	# so, the dst: _tmp58 register is given $t4
	# the reference: _tmp57 is given $t2
	  lw $t4, 0($t2) 	# load with offset
	# _tmp59 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp60 = _tmp58 < _tmp59
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t3
	  slt $t5, $t4, $t3	
	# _tmp61 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp61 register is given $t6
	# the reference: d is given $spill
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $t6, -4($v0) 	# load with offset
	# _tmp62 = _tmp58 < _tmp61
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t4
	# the op2 is $t6
	  slt $t7, $t4, $t6	
	# _tmp63 = _tmp62 == _tmp59
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t3
	  seq $s0, $t7, $t3	
	# _tmp64 = _tmp60 || _tmp63
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp64 Goto _L7
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp55 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp56 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp57 from $t2 to $fp-60
	  sw $t3, -68($fp)	# spill _tmp59 from $t3 to $fp-68
	  sw $t4, -64($fp)	# spill _tmp58 from $t4 to $fp-64
	  sw $t5, -72($fp)	# spill _tmp60 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp61 from $t6 to $fp-76
	  sw $t7, -80($fp)	# spill _tmp62 from $t7 to $fp-80
	  sw $s0, -84($fp)	# spill _tmp63 from $s0 to $fp-84
	  sw $s1, -88($fp)	# spill _tmp64 from $s1 to $fp-88
	  lw $s1, -88($fp)	# fill _tmp64 to $s1 from $fp-88
	  beqz $s1, _L7	# branch if _tmp64 is zero 
	# _tmp65 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp65
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -92($fp)	# spill _tmp65 from $s2 to $fp-92
	  lw $s2, -92($fp)	# fill _tmp65 to $s2 from $fp-92
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
  _L7:
	# _tmp66 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp67 = _tmp66 * _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t4
	  lw $t4, -64($fp)	# fill _tmp58 to $t4 from $fp-64
	  mul $t1, $t0, $t4	
	# _tmp68 = d + _tmp67
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp69 = *(_tmp68)
	# We are in the EmitLoad
	# so, the dst: _tmp69 register is given $t3
	# the reference: _tmp68 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp69
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -108($fp)	# spill _tmp69 from $t3 to $fp-108
	  lw $t3, -108($fp)	# fill _tmp69 to $t3 from $fp-108
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp66 from $t0 to $fp-96
	  sw $t1, -100($fp)	# spill _tmp67 from $t1 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp68 from $t2 to $fp-104
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string8
	  la $t0, _string8	# load label
	# PushParam _tmp70
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -112($fp)	# spill _tmp70 from $t0 to $fp-112
	  lw $t0, -112($fp)	# fill _tmp70 to $t0 from $fp-112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp71 = *(d + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp71 register is given $t0
	# the reference: d is given $spill
	  lw $v0, -8($fp)	# fill d to $v0 from $fp-8
	  lw $t0, -4($v0) 	# load with offset
	# PushParam _tmp71
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -116($fp)	# spill _tmp71 from $t0 to $fp-116
	  lw $t0, -116($fp)	# fill _tmp71 to $t0 from $fp-116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp72 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string9
	  la $t0, _string9	# load label
	# PushParam _tmp72
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -120($fp)	# spill _tmp72 from $t0 to $fp-120
	  lw $t0, -120($fp)	# fill _tmp72 to $t0 from $fp-120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp74 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp75 = _tmp73 < _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# _tmp76 = *(b + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp76 register is given $t3
	# the reference: b is given $t1
	  sw $t1, -128($fp)	# spill _tmp74 from $t1 to $fp-128
	  lw $t1, 4($gp)	# fill b to $t1 from $gp+4
	  lw $t3, -4($t1) 	# load with offset
	# _tmp77 = _tmp73 < _tmp76
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t3
	  slt $t4, $t0, $t3	
	# _tmp78 = _tmp77 == _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  lw $t1, -128($fp)	# fill _tmp74 to $t1 from $fp-128
	  seq $t5, $t4, $t1	
	# _tmp79 = _tmp75 || _tmp78
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp79 Goto _L8
	# we clean all the regiser
	  sw $t0, -124($fp)	# spill _tmp73 from $t0 to $fp-124
	  sw $t2, -132($fp)	# spill _tmp75 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp76 from $t3 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp77 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp78 from $t5 to $fp-144
	  sw $t6, -148($fp)	# spill _tmp79 from $t6 to $fp-148
	  lw $t6, -148($fp)	# fill _tmp79 to $t6 from $fp-148
	  beqz $t6, _L8	# branch if _tmp79 is zero 
	# _tmp80 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string10
	  la $t7, _string10	# load label
	# PushParam _tmp80
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -152($fp)	# spill _tmp80 from $t7 to $fp-152
	  lw $t7, -152($fp)	# fill _tmp80 to $t7 from $fp-152
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
  _L8:
	# _tmp81 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 4
	  li $t1, 4		# load constant value 4 into $t1
	# _tmp82 = _tmp81 * _tmp73
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  lw $t0, -124($fp)	# fill _tmp73 to $t0 from $fp-124
	  mul $t2, $t1, $t0	
	# _tmp83 = b + _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  sw $t1, -156($fp)	# spill _tmp81 from $t1 to $fp-156
	  lw $t1, 4($gp)	# fill b to $t1 from $gp+4
	  add $t3, $t1, $t2	
	# _tmp84 = *(_tmp83)
	# We are in the EmitLoad
	# so, the dst: _tmp84 register is given $t4
	# the reference: _tmp83 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp84
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -168($fp)	# spill _tmp84 from $t4 to $fp-168
	  lw $t4, -168($fp)	# fill _tmp84 to $t4 from $fp-168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t2, -160($fp)	# spill _tmp82 from $t2 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp83 from $t3 to $fp-164
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp85 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string11
	  la $t0, _string11	# load label
	# PushParam _tmp85
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -172($fp)	# spill _tmp85 from $t0 to $fp-172
	  lw $t0, -172($fp)	# fill _tmp85 to $t0 from $fp-172
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
