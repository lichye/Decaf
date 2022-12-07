	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Stack.Init:
	# BeginFunc 56
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp0 = 100
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 100
	  li $t0, 100		# load constant value 100 into $t0
	# _tmp1 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp2 = _tmp0 < _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp2 Goto _L0
	# we clean all the regiser
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  sw $t1, -12($fp)	# spill _tmp1 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp2 from $t2 to $fp-16
	  lw $t2, -16($fp)	# fill _tmp2 to $t2 from $fp-16
	  beqz $t2, _L0	# branch if _tmp2 is zero 
	# _tmp3 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string1
	  la $t3, _string1	# load label
	# PushParam _tmp3
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -20($fp)	# spill _tmp3 from $t3 to $fp-20
	  lw $t3, -20($fp)	# fill _tmp3 to $t3 from $fp-20
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
	# _tmp4 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp5 = _tmp4 + _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  add $t2, $t1, $t0	
	# _tmp6 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp7 = _tmp5 * _tmp6
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  mul $t4, $t2, $t3	
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -36($fp)	# spill _tmp7 from $t4 to $fp-36
	  lw $t4, -36($fp)	# fill _tmp7 to $t4 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _Alloc
	# we clean all the regiser
	  sw $t1, -24($fp)	# spill _tmp4 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp5 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp6 from $t3 to $fp-32
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -40($fp)	# spill _tmp8 from $t5 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp8) = _tmp0
	# We are in the EmitStore
	# so, the reference: _tmp8 register is given $t5
	# the value: _tmp0 is given $t0
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  sw $t0, 0($t5) 	# store with offset
	# _tmp9 = _tmp8 + _tmp6
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t3
	  lw $t3, -32($fp)	# fill _tmp6 to $t3 from $fp-32
	  add $t6, $t5, $t3	
	# *(this + 8) = _tmp9
	# We are in the EmitStore
	# so, the reference: this register is given $s0
	# the value: _tmp9 is given $t6
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  sw $t6, 8($s0) 	# store with offset
	# _tmp10 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t7
	# the constant is 0
	  li $t7, 0		# load constant value 0 into $t7
	# *(this + 4) = _tmp10
	# We are in the EmitStore
	# so, the reference: this register is given $s0
	# the value: _tmp10 is given $t7
	  sw $t7, 4($s0) 	# store with offset
	# _tmp11 = 3
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 3
	  li $s1, 3		# load constant value 3 into $s1
	# _tmp12 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp12 register is given $s2
	# the reference: this is given $s0
	  lw $s2, 0($s0) 	# load with offset
	# _tmp13 = *(_tmp12 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp13 register is given $spill
	# the reference: _tmp12 is given $s2
	  lw $v0, 4($s2) 	# load with offset
	  sw $v0, -60($fp)	# spill _tmp13 from $v0 to $fp-60
	# PushParam _tmp11
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -52($fp)	# spill _tmp11 from $s1 to $fp-52
	  lw $s1, -52($fp)	# fill _tmp11 to $s1 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s1, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# ACall _tmp13
	# we clean all the regiser
	  sw $t6, -44($fp)	# spill _tmp9 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp10 from $t7 to $fp-48
	  sw $s2, -56($fp)	# spill _tmp12 from $s2 to $fp-56
	  lw $v0, -60($fp)	# fill _tmp13 to $v0 from $fp-60
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Stack.Push:
	# BeginFunc 60
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 60	# decrement sp to make space for locals/temps
	# _tmp14 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp14 register is given $t0
	# the reference: this is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  lw $t0, 8($s0) 	# load with offset
	# _tmp15 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp15 register is given $t1
	# the reference: this is given $s0
	  lw $t1, 4($s0) 	# load with offset
	# _tmp16 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp17 = _tmp15 < _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  slt $t3, $t1, $t2	
	# _tmp18 = *(_tmp14 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp18 register is given $t4
	# the reference: _tmp14 is given $t0
	  lw $t4, -4($t0) 	# load with offset
	# _tmp19 = _tmp15 < _tmp18
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t1
	# the op2 is $t4
	  slt $t5, $t1, $t4	
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
	# IfZ _tmp21 Goto _L1
	# we clean all the regiser
	  sw $t0, -8($fp)	# spill _tmp14 from $t0 to $fp-8
	  sw $t1, -12($fp)	# spill _tmp15 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp16 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp17 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp18 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp19 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp20 from $t6 to $fp-32
	  sw $t7, -36($fp)	# spill _tmp21 from $t7 to $fp-36
	  lw $t7, -36($fp)	# fill _tmp21 to $t7 from $fp-36
	  beqz $t7, _L1	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string2
	  la $s1, _string2	# load label
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -40($fp)	# spill _tmp22 from $s1 to $fp-40
	  lw $s1, -40($fp)	# fill _tmp22 to $s1 from $fp-40
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
  _L1:
	# _tmp23 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s2
	# the constant is 4
	  li $s2, 4		# load constant value 4 into $s2
	# _tmp24 = _tmp23 * _tmp15
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $s2
	# the op2 is $t1
	  lw $t1, -12($fp)	# fill _tmp15 to $t1 from $fp-12
	  mul $s3, $s2, $t1	
	# _tmp25 = _tmp14 + _tmp24
	# We are in the EmitBinaryOp
	# so, the dst register is given $s4
	# the op1 is $t0
	# the op2 is $s3
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  add $s4, $t0, $s3	
	# *(_tmp25) = i
	# We are in the EmitStore
	# so, the reference: _tmp25 register is given $s4
	# the value: i is given $t0
	  lw $t0, 8($fp)	# fill i to $t0 from $fp+8
	  sw $t0, 0($s4) 	# store with offset
	# _tmp26 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp26 register is given $s5
	# the reference: this is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  lw $s5, 4($s0) 	# load with offset
	# _tmp27 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -60($fp)	# spill _tmp27 from $v0 to $fp-60
	# _tmp28 = _tmp26 + _tmp27
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s5
	# the op2 is $spill
	  lw $v1, -60($fp)	# fill _tmp27 to $v1 from $fp-60
	  add $v0, $s5, $v1	
	  sw $v0, -64($fp)	# spill _tmp28 from $v0 to $fp-64
	# *(this + 4) = _tmp28
	# We are in the EmitStore
	# so, the reference: this register is given $s0
	# the value: _tmp28 is given $spill
	  lw $v0, -64($fp)	# fill _tmp28 to $v0 from $fp-64
	  sw $v0, 4($s0) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Stack.Pop:
	# BeginFunc 76
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp29 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp29 register is given $t0
	# the reference: this is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  lw $t0, 8($s0) 	# load with offset
	# _tmp30 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp30 register is given $t1
	# the reference: this is given $s0
	  lw $t1, 4($s0) 	# load with offset
	# _tmp31 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp32 = _tmp30 - _tmp31
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  sub $t3, $t1, $t2	
	# _tmp33 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp34 = _tmp32 < _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  slt $t5, $t3, $t4	
	# _tmp35 = *(_tmp29 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp35 register is given $t6
	# the reference: _tmp29 is given $t0
	  lw $t6, -4($t0) 	# load with offset
	# _tmp36 = _tmp32 < _tmp35
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  slt $t7, $t3, $t6	
	# _tmp37 = _tmp36 == _tmp33
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t7
	# the op2 is $t4
	  seq $s1, $t7, $t4	
	# _tmp38 = _tmp34 || _tmp37
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp38 Goto _L2
	# we clean all the regiser
	  sw $t0, -12($fp)	# spill _tmp29 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp30 from $t1 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp31 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp32 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp33 from $t4 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp34 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp35 from $t6 to $fp-36
	  sw $t7, -40($fp)	# spill _tmp36 from $t7 to $fp-40
	  sw $s1, -44($fp)	# spill _tmp37 from $s1 to $fp-44
	  sw $s2, -48($fp)	# spill _tmp38 from $s2 to $fp-48
	  lw $s2, -48($fp)	# fill _tmp38 to $s2 from $fp-48
	  beqz $s2, _L2	# branch if _tmp38 is zero 
	# _tmp39 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string3
	  la $s3, _string3	# load label
	# PushParam _tmp39
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -52($fp)	# spill _tmp39 from $s3 to $fp-52
	  lw $s3, -52($fp)	# fill _tmp39 to $s3 from $fp-52
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
  _L2:
	# _tmp40 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s4
	# the constant is 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp41 = _tmp40 * _tmp32
	# We are in the EmitBinaryOp
	# so, the dst register is given $s5
	# the op1 is $s4
	# the op2 is $t3
	  lw $t3, -24($fp)	# fill _tmp32 to $t3 from $fp-24
	  mul $s5, $s4, $t3	
	# _tmp42 = _tmp29 + _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $s6
	# the op1 is $t0
	# the op2 is $s5
	  lw $t0, -12($fp)	# fill _tmp29 to $t0 from $fp-12
	  add $s6, $t0, $s5	
	# _tmp43 = *(_tmp42)
	# We are in the EmitLoad
	# so, the dst: _tmp43 register is given $spill
	# the reference: _tmp42 is given $s6
	  lw $v0, 0($s6) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp43 from $v0 to $fp-68
	# val = _tmp43
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -68($fp)	# fill _tmp43 to $v0 from $fp-68
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill val from $v0 to $fp-8
	# _tmp44 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp44 register is given $spill
	# the reference: this is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  lw $v0, 4($s0) 	# load with offset
	  sw $v0, -72($fp)	# spill _tmp44 from $v0 to $fp-72
	# _tmp45 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -76($fp)	# spill _tmp45 from $v0 to $fp-76
	# _tmp46 = _tmp44 - _tmp45
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -72($fp)	# fill _tmp44 to $v0 from $fp-72
	  lw $v1, -76($fp)	# fill _tmp45 to $v1 from $fp-76
	  sub $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp46 from $v0 to $fp-80
	# *(this + 4) = _tmp46
	# We are in the EmitStore
	# so, the reference: this register is given $s0
	# the value: _tmp46 is given $spill
	  lw $v0, -80($fp)	# fill _tmp46 to $v0 from $fp-80
	  sw $v0, 4($s0) 	# store with offset
	# Return val
	  lw $v0, -8($fp)	# fill val to $v0 from $fp-8
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
  _Stack.NumElems:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp47 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp47 register is given $t0
	# the reference: this is given $s0
	  lw $s0, 4($fp)	# fill this to $s0 from $fp+4
	  lw $t0, 4($s0) 	# load with offset
	# Return _tmp47
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
	# VTable for class Stack
	  .data
	  .align 2
	  Stack:		# label for class Stack vtable
	  .word _Stack.Init
	  .word _Stack.Push
	  .word _Stack.Pop
	  .word _Stack.NumElems
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 136
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp48 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 12
	  li $t0, 12		# load constant value 12 into $t0
	# PushParam _tmp48
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp48 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp48 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp49 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp49 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp50 = Stack
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Stack
	  la $t0, Stack	# load label
	# *(_tmp49) = _tmp50
	# We are in the EmitStore
	# so, the reference: _tmp49 register is given $t3
	# the value: _tmp50 is given $t0
	  sw $t0, 0($t3) 	# store with offset
	# s = _tmp49
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -8($fp)	# spill s from $v0 to $fp-8
	# _tmp51 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp51 register is given $t1
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t1, 0($v0) 	# load with offset
	# _tmp52 = *(_tmp51)
	# We are in the EmitLoad
	# so, the dst: _tmp52 register is given $t2
	# the reference: _tmp51 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp52
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp50 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp51 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp52 from $t2 to $fp-28
	  lw $v0, -28($fp)	# fill _tmp52 to $v0 from $fp-28
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = 3
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 3
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp54 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp54 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $t0, -32($fp)	# spill _tmp53 from $t0 to $fp-32
	  lw $t0, 0($v0) 	# load with offset
	# _tmp55 = *(_tmp54 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp55 register is given $t1
	# the reference: _tmp54 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam _tmp53
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -36($fp)	# spill _tmp54 from $t0 to $fp-36
	  lw $t0, -32($fp)	# fill _tmp53 to $t0 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp55
	# we clean all the regiser
	  sw $t1, -40($fp)	# spill _tmp55 from $t1 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp55 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp56 = 7
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 7
	  li $t0, 7		# load constant value 7 into $t0
	# _tmp57 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp57 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $t0, -44($fp)	# spill _tmp56 from $t0 to $fp-44
	  lw $t0, 0($v0) 	# load with offset
	# _tmp58 = *(_tmp57 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp58 register is given $t1
	# the reference: _tmp57 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam _tmp56
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -48($fp)	# spill _tmp57 from $t0 to $fp-48
	  lw $t0, -44($fp)	# fill _tmp56 to $t0 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp58
	# we clean all the regiser
	  sw $t1, -52($fp)	# spill _tmp58 from $t1 to $fp-52
	  lw $v0, -52($fp)	# fill _tmp58 to $v0 from $fp-52
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp59 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp60 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp60 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  sw $t0, -56($fp)	# spill _tmp59 from $t0 to $fp-56
	  lw $t0, 0($v0) 	# load with offset
	# _tmp61 = *(_tmp60 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp61 register is given $t1
	# the reference: _tmp60 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam _tmp59
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp60 from $t0 to $fp-60
	  lw $t0, -56($fp)	# fill _tmp59 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp61
	# we clean all the regiser
	  sw $t1, -64($fp)	# spill _tmp61 from $t1 to $fp-64
	  lw $v0, -64($fp)	# fill _tmp61 to $v0 from $fp-64
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp62 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp62 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp63 = *(_tmp62 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp63 register is given $t1
	# the reference: _tmp62 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp64 = ACall _tmp63
	# we clean all the regiser
	  sw $t0, -68($fp)	# spill _tmp62 from $t0 to $fp-68
	  sw $t1, -72($fp)	# spill _tmp63 from $t1 to $fp-72
	  lw $v0, -72($fp)	# fill _tmp63 to $v0 from $fp-72
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -76($fp)	# spill _tmp64 from $t0 to $fp-76
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp64
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -76($fp)	# fill _tmp64 to $t0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp65 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string4: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string4
	  la $t0, _string4	# load label
	# PushParam _tmp65
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -80($fp)	# spill _tmp65 from $t0 to $fp-80
	  lw $t0, -80($fp)	# fill _tmp65 to $t0 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp66 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp66 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp67 = *(_tmp66 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp67 register is given $t1
	# the reference: _tmp66 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp68 = ACall _tmp67
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp66 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp67 from $t1 to $fp-88
	  lw $v0, -88($fp)	# fill _tmp67 to $v0 from $fp-88
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -92($fp)	# spill _tmp68 from $t0 to $fp-92
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp68
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -92($fp)	# fill _tmp68 to $t0 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp69 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string5: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string5
	  la $t0, _string5	# load label
	# PushParam _tmp69
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -96($fp)	# spill _tmp69 from $t0 to $fp-96
	  lw $t0, -96($fp)	# fill _tmp69 to $t0 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp70 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp70 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp71 = *(_tmp70 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp71 register is given $t1
	# the reference: _tmp70 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp72 = ACall _tmp71
	# we clean all the regiser
	  sw $t0, -100($fp)	# spill _tmp70 from $t0 to $fp-100
	  sw $t1, -104($fp)	# spill _tmp71 from $t1 to $fp-104
	  lw $v0, -104($fp)	# fill _tmp71 to $v0 from $fp-104
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -108($fp)	# spill _tmp72 from $t0 to $fp-108
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp72
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -108($fp)	# fill _tmp72 to $t0 from $fp-108
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp73 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string6: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string6
	  la $t0, _string6	# load label
	# PushParam _tmp73
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -112($fp)	# spill _tmp73 from $t0 to $fp-112
	  lw $t0, -112($fp)	# fill _tmp73 to $t0 from $fp-112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp74 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp74 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp75 = *(_tmp74 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp75 register is given $t1
	# the reference: _tmp74 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp76 = ACall _tmp75
	# we clean all the regiser
	  sw $t0, -116($fp)	# spill _tmp74 from $t0 to $fp-116
	  sw $t1, -120($fp)	# spill _tmp75 from $t1 to $fp-120
	  lw $v0, -120($fp)	# fill _tmp75 to $v0 from $fp-120
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -124($fp)	# spill _tmp76 from $t0 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp76
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -124($fp)	# fill _tmp76 to $t0 from $fp-124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp77 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string7: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string7
	  la $t0, _string7	# load label
	# PushParam _tmp77
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -128($fp)	# spill _tmp77 from $t0 to $fp-128
	  lw $t0, -128($fp)	# fill _tmp77 to $t0 from $fp-128
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp78 = *(s)
	# We are in the EmitLoad
	# so, the dst: _tmp78 register is given $t0
	# the reference: s is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  lw $t0, 0($v0) 	# load with offset
	# _tmp79 = *(_tmp78 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp79 register is given $t1
	# the reference: _tmp78 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill s to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp80 = ACall _tmp79
	# we clean all the regiser
	  sw $t0, -132($fp)	# spill _tmp78 from $t0 to $fp-132
	  sw $t1, -136($fp)	# spill _tmp79 from $t1 to $fp-136
	  lw $v0, -136($fp)	# fill _tmp79 to $v0 from $fp-136
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -140($fp)	# spill _tmp80 from $v0 to $fp-140
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp80
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -140($fp)	# fill _tmp80 to $v0 from $fp-140
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
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
