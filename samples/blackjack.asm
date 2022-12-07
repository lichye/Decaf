	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Random.Init:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = seedVal
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: seedVal is given $t0
	  lw $t0, 8($fp)	# fill seedVal to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Random.GenRandom:
	# BeginFunc 40
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 15625
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 15625
	  li $t0, 15625		# load constant value 15625 into $t0
	# _tmp1 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp1 register is given $t2
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 4($t1) 	# load with offset
	# _tmp2 = 10000
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 10000
	  li $t3, 10000		# load constant value 10000 into $t3
	# _tmp3 = _tmp1 % _tmp2
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  rem $t4, $t2, $t3	
	# _tmp4 = _tmp0 * _tmp3
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t0
	# the op2 is $t4
	  mul $t5, $t0, $t4	
	# _tmp5 = 22221
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 22221
	  li $t6, 22221		# load constant value 22221 into $t6
	# _tmp6 = _tmp4 + _tmp5
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t6
	  add $t7, $t5, $t6	
	# _tmp7 = 65536
	# We are in the LoadConstant
	# so, the dst register is given $s0
	# the constant is 65536
	  li $s0, 65536		# load constant value 65536 into $s0
	# _tmp8 = _tmp6 % _tmp7
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t7
	# the op2 is $s0
	  rem $s1, $t7, $s0	
	# *(this + 4) = _tmp8
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp8 is given $s1
	  sw $s1, 4($t1) 	# store with offset
	# _tmp9 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp9 register is given $s2
	# the reference: this is given $t1
	  lw $s2, 4($t1) 	# load with offset
	# Return _tmp9
	  move $v0, $s2		# assign return value into $v0
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
  _Random.RndInt:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp10 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp10 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 0($t1) 	# load with offset
	# _tmp11 = *(_tmp10 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp11 register is given $t2
	# the reference: _tmp10 is given $t0
	  lw $t2, 4($t0) 	# load with offset
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp12 = ACall _tmp11
	# we clean all the regiser
	  sw $t0, -8($fp)	# spill _tmp10 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp11 from $t2 to $fp-12
	  lw $v0, -12($fp)	# fill _tmp11 to $v0 from $fp-12
	  jalr $v0            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp12 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp13 = _tmp12 % max
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t0
	  lw $t0, 8($fp)	# fill max to $t0 from $fp+8
	  rem $t4, $t3, $t0	
	# Return _tmp13
	  move $v0, $t4		# assign return value into $v0
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
	# VTable for class Random
	  .data
	  .align 2
	  Random:		# label for class Random vtable
	  .word _Random.Init
	  .word _Random.GenRandom
	  .word _Random.RndInt
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Deck.Init:
	# BeginFunc 40
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp14 = 52
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 52
	  li $t0, 52		# load constant value 52 into $t0
	# _tmp15 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp16 = _tmp14 < _tmp15
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp16 Goto _L0
	# we clean all the regiser
	  sw $t0, -8($fp)	# spill _tmp14 from $t0 to $fp-8
	  sw $t1, -12($fp)	# spill _tmp15 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp16 from $t2 to $fp-16
	  lw $t2, -16($fp)	# fill _tmp16 to $t2 from $fp-16
	  beqz $t2, _L0	# branch if _tmp16 is zero 
	# _tmp17 = "Decaf runtime error: Array size is <= 0\n"
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
	# PushParam _tmp17
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -20($fp)	# spill _tmp17 from $t3 to $fp-20
	  lw $t3, -20($fp)	# fill _tmp17 to $t3 from $fp-20
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
	# _tmp18 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp19 = _tmp18 + _tmp14
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  add $t2, $t1, $t0	
	# _tmp20 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 4
	  li $t3, 4		# load constant value 4 into $t3
	# _tmp21 = _tmp19 * _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  mul $t4, $t2, $t3	
	# PushParam _tmp21
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -36($fp)	# spill _tmp21 from $t4 to $fp-36
	  lw $t4, -36($fp)	# fill _tmp21 to $t4 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp22 = LCall _Alloc
	# we clean all the regiser
	  sw $t1, -24($fp)	# spill _tmp18 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp19 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp20 from $t3 to $fp-32
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -40($fp)	# spill _tmp22 from $t5 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp22) = _tmp14
	# We are in the EmitStore
	# so, the reference: _tmp22 register is given $t5
	# the value: _tmp14 is given $t0
	  lw $t0, -8($fp)	# fill _tmp14 to $t0 from $fp-8
	  sw $t0, 0($t5) 	# store with offset
	# _tmp23 = _tmp22 + _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t3
	  lw $t3, -32($fp)	# fill _tmp20 to $t3 from $fp-32
	  add $t6, $t5, $t3	
	# *(this + 8) = _tmp23
	# We are in the EmitStore
	# so, the reference: this register is given $t7
	# the value: _tmp23 is given $t6
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  sw $t6, 8($t7) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Deck.Shuffle:
	# BeginFunc 344
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 344	# decrement sp to make space for locals/temps
	# _tmp24 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -8($fp)	# spill _tmp24 from $v0 to $fp-8
	# *(this + 4) = _tmp24
	# We are in the EmitStore
	# so, the reference: this register is given $t7
	# the value: _tmp24 is given $spill
	  lw $v0, -8($fp)	# fill _tmp24 to $v0 from $fp-8
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  sw $v0, 4($t7) 	# store with offset
	# we clean all the regiser
  _L1:
	# _tmp25 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp25 register is given $t0
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t0, 4($t7) 	# load with offset
	# _tmp26 = 52
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 52
	  li $t1, 52		# load constant value 52 into $t1
	# _tmp27 = _tmp25 < _tmp26
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp27 Goto _L2
	# we clean all the regiser
	  sw $t0, -12($fp)	# spill _tmp25 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp26 from $t1 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp27 from $t2 to $fp-20
	  lw $t2, -20($fp)	# fill _tmp27 to $t2 from $fp-20
	  beqz $t2, _L2	# branch if _tmp27 is zero 
	# _tmp28 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp28 register is given $s4
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $s4, 8($t7) 	# load with offset
	# _tmp29 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp29 register is given $spill
	# the reference: this is given $t7
	  lw $v0, 4($t7) 	# load with offset
	  sw $v0, -28($fp)	# spill _tmp29 from $v0 to $fp-28
	# _tmp30 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp31 = _tmp29 < _tmp30
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -28($fp)	# fill _tmp29 to $v0 from $fp-28
	  slt $t4, $v0, $t3	
	# _tmp32 = *(_tmp28 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp32 register is given $t5
	# the reference: _tmp28 is given $s4
	  lw $t5, -4($s4) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -28($fp)	# fill _tmp29 to $v0 from $fp-28
	  slt $t6, $v0, $t5	
	# _tmp34 = _tmp33 == _tmp30
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t6
	# the op2 is $t3
	  seq $s0, $t6, $t3	
	# _tmp35 = _tmp31 || _tmp34
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t4
	# the op2 is $s0
	  or $s1, $t4, $s0	
	# IfZ _tmp35 Goto _L3
	# we clean all the regiser
	  sw $t3, -32($fp)	# spill _tmp30 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp31 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp32 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp33 from $t6 to $fp-44
	  sw $s0, -48($fp)	# spill _tmp34 from $s0 to $fp-48
	  sw $s1, -52($fp)	# spill _tmp35 from $s1 to $fp-52
	  sw $s4, -24($fp)	# spill _tmp28 from $s4 to $fp-24
	  lw $s1, -52($fp)	# fill _tmp35 to $s1 from $fp-52
	  beqz $s1, _L3	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp36
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -56($fp)	# spill _tmp36 from $s2 to $fp-56
	  lw $s2, -56($fp)	# fill _tmp36 to $s2 from $fp-56
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
  _L3:
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
	  lw $v1, -28($fp)	# fill _tmp29 to $v1 from $fp-28
	  mul $t1, $t0, $v1	
	# _tmp39 = _tmp28 + _tmp38
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $s4
	# the op2 is $t1
	  lw $s4, -24($fp)	# fill _tmp28 to $s4 from $fp-24
	  add $s0, $s4, $t1	
	# _tmp40 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp40 register is given $t2
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t2, 4($t7) 	# load with offset
	# _tmp41 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp42 = _tmp40 + _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  add $t4, $t2, $t3	
	# _tmp43 = 13
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 13
	  li $t5, 13		# load constant value 13 into $t5
	# _tmp44 = _tmp42 % _tmp43
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  rem $t6, $t4, $t5	
	# *(_tmp39) = _tmp44
	# We are in the EmitStore
	# so, the reference: _tmp39 register is given $s0
	# the value: _tmp44 is given $t6
	  sw $t6, 0($s0) 	# store with offset
	# _tmp45 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp45 register is given $s1
	# the reference: this is given $t7
	  lw $s1, 4($t7) 	# load with offset
	# _tmp46 = 1
	# We are in the LoadConstant
	# so, the dst register is given $s2
	# the constant is 1
	  li $s2, 1		# load constant value 1 into $s2
	# _tmp47 = _tmp45 + _tmp46
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $s1
	# the op2 is $s2
	  add $s3, $s1, $s2	
	# *(this + 4) = _tmp47
	# We are in the EmitStore
	# so, the reference: this register is given $t7
	# the value: _tmp47 is given $s3
	  sw $s3, 4($t7) 	# store with offset
	# Goto _L1
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp37 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp38 from $t1 to $fp-64
	  sw $t2, -72($fp)	# spill _tmp40 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp41 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp42 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp43 from $t5 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp44 from $t6 to $fp-88
	  sw $s0, -68($fp)	# spill _tmp39 from $s0 to $fp-68
	  sw $s1, -92($fp)	# spill _tmp45 from $s1 to $fp-92
	  sw $s2, -96($fp)	# spill _tmp46 from $s2 to $fp-96
	  sw $s3, -100($fp)	# spill _tmp47 from $s3 to $fp-100
	  b _L1		# unconditional branch
	# we clean all the regiser
  _L2:
	# we clean all the regiser
  _L4:
	# _tmp48 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp48 register is given $t0
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t0, 4($t7) 	# load with offset
	# _tmp49 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp50 = _tmp49 < _tmp48
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  slt $t2, $t1, $t0	
	# IfZ _tmp50 Goto _L5
	# we clean all the regiser
	  sw $t0, -104($fp)	# spill _tmp48 from $t0 to $fp-104
	  sw $t1, -108($fp)	# spill _tmp49 from $t1 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp50 from $t2 to $fp-112
	  lw $t2, -112($fp)	# fill _tmp50 to $t2 from $fp-112
	  beqz $t2, _L5	# branch if _tmp50 is zero 
	# _tmp51 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp51 register is given $t3
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t3, 4($t7) 	# load with offset
	# _tmp52 = *(gRnd)
	# We are in the EmitLoad
	# so, the dst: _tmp52 register is given $t4
	# the reference: gRnd is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t4, 0($t0) 	# load with offset
	# _tmp53 = *(_tmp52 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp53 register is given $t5
	# the reference: _tmp52 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam _tmp51
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -124($fp)	# spill _tmp51 from $t3 to $fp-124
	  lw $t3, -124($fp)	# fill _tmp51 to $t3 from $fp-124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam gRnd
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp54 = ACall _tmp53
	# we clean all the regiser
	  sw $t4, -128($fp)	# spill _tmp52 from $t4 to $fp-128
	  sw $t5, -132($fp)	# spill _tmp53 from $t5 to $fp-132
	  lw $v0, -132($fp)	# fill _tmp53 to $v0 from $fp-132
	  jalr $v0            	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -136($fp)	# spill _tmp54 from $t6 to $fp-136
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# r = _tmp54
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t6
	  move $v0, $t6		# copy value from $t6 to $v0
	  sw $v0, -116($fp)	# spill r from $v0 to $fp-116
	# _tmp55 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp55 register is given $s0
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $s0, 4($t7) 	# load with offset
	# _tmp56 = 1
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 1
	  li $s1, 1		# load constant value 1 into $s1
	# _tmp57 = _tmp55 - _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $s0
	# the op2 is $s1
	  sub $s2, $s0, $s1	
	# *(this + 4) = _tmp57
	# We are in the EmitStore
	# so, the reference: this register is given $t7
	# the value: _tmp57 is given $s2
	  sw $s2, 4($t7) 	# store with offset
	# _tmp58 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp58 register is given $spill
	# the reference: this is given $t7
	  lw $v0, 8($t7) 	# load with offset
	  sw $v0, -152($fp)	# spill _tmp58 from $v0 to $fp-152
	# _tmp59 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp59 register is given $spill
	# the reference: this is given $t7
	  lw $v0, 4($t7) 	# load with offset
	  sw $v0, -156($fp)	# spill _tmp59 from $v0 to $fp-156
	# _tmp60 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -160($fp)	# spill _tmp60 from $v0 to $fp-160
	# _tmp61 = _tmp59 < _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -156($fp)	# fill _tmp59 to $v0 from $fp-156
	  lw $v1, -160($fp)	# fill _tmp60 to $v1 from $fp-160
	  slt $v0, $v0, $v1	
	  sw $v0, -164($fp)	# spill _tmp61 from $v0 to $fp-164
	# _tmp62 = *(_tmp58 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp62 register is given $spill
	# the reference: _tmp58 is given $spill
	  lw $v0, -152($fp)	# fill _tmp58 to $v0 from $fp-152
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -168($fp)	# spill _tmp62 from $v0 to $fp-168
	# _tmp63 = _tmp59 < _tmp62
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -156($fp)	# fill _tmp59 to $v0 from $fp-156
	  lw $v1, -168($fp)	# fill _tmp62 to $v1 from $fp-168
	  slt $v0, $v0, $v1	
	  sw $v0, -172($fp)	# spill _tmp63 from $v0 to $fp-172
	# _tmp64 = _tmp63 == _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -172($fp)	# fill _tmp63 to $v0 from $fp-172
	  lw $v1, -160($fp)	# fill _tmp60 to $v1 from $fp-160
	  seq $v0, $v0, $v1	
	  sw $v0, -176($fp)	# spill _tmp64 from $v0 to $fp-176
	# _tmp65 = _tmp61 || _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -164($fp)	# fill _tmp61 to $v0 from $fp-164
	  lw $v1, -176($fp)	# fill _tmp64 to $v1 from $fp-176
	  or $v0, $v0, $v1	
	  sw $v0, -180($fp)	# spill _tmp65 from $v0 to $fp-180
	# IfZ _tmp65 Goto _L6
	# we clean all the regiser
	  sw $s0, -140($fp)	# spill _tmp55 from $s0 to $fp-140
	  sw $s1, -144($fp)	# spill _tmp56 from $s1 to $fp-144
	  sw $s2, -148($fp)	# spill _tmp57 from $s2 to $fp-148
	  lw $v0, -180($fp)	# fill _tmp65 to $v0 from $fp-180
	  beqz $v0, _L6	# branch if _tmp65 is zero 
	# _tmp66 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string3
	  la $v0, _string3	# load label
	  sw $v0, -184($fp)	# spill _tmp66 from $v0 to $fp-184
	# PushParam _tmp66
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -184($fp)	# fill _tmp66 to $v0 from $fp-184
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
  _L6:
	# _tmp67 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp68 = _tmp67 * _tmp59
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -156($fp)	# fill _tmp59 to $v1 from $fp-156
	  mul $t1, $t0, $v1	
	# _tmp69 = _tmp58 + _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -152($fp)	# fill _tmp58 to $v0 from $fp-152
	  add $t2, $v0, $t1	
	# _tmp70 = *(_tmp69)
	# We are in the EmitLoad
	# so, the dst: _tmp70 register is given $t3
	# the reference: _tmp69 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# temp = _tmp70
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# _tmp71 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp71 register is given $spill
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $v0, 8($t7) 	# load with offset
	  sw $v0, -204($fp)	# spill _tmp71 from $v0 to $fp-204
	# _tmp72 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp72 register is given $spill
	# the reference: this is given $t7
	  lw $v0, 4($t7) 	# load with offset
	  sw $v0, -208($fp)	# spill _tmp72 from $v0 to $fp-208
	# _tmp73 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp74 = _tmp72 < _tmp73
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -208($fp)	# fill _tmp72 to $v0 from $fp-208
	  slt $t6, $v0, $t5	
	# _tmp75 = *(_tmp71 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp75 register is given $s0
	# the reference: _tmp71 is given $spill
	  lw $v0, -204($fp)	# fill _tmp71 to $v0 from $fp-204
	  lw $s0, -4($v0) 	# load with offset
	# _tmp76 = _tmp72 < _tmp75
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $spill
	# the op2 is $s0
	  lw $v0, -208($fp)	# fill _tmp72 to $v0 from $fp-208
	  slt $s1, $v0, $s0	
	# _tmp77 = _tmp76 == _tmp73
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $s1
	# the op2 is $t5
	  seq $s2, $s1, $t5	
	# _tmp78 = _tmp74 || _tmp77
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $t6
	# the op2 is $s2
	  or $s3, $t6, $s2	
	# IfZ _tmp78 Goto _L7
	# we clean all the regiser
	  sw $t0, -188($fp)	# spill _tmp67 from $t0 to $fp-188
	  sw $t1, -192($fp)	# spill _tmp68 from $t1 to $fp-192
	  sw $t2, -196($fp)	# spill _tmp69 from $t2 to $fp-196
	  sw $t3, -200($fp)	# spill _tmp70 from $t3 to $fp-200
	  sw $t4, -120($fp)	# spill temp from $t4 to $fp-120
	  sw $t5, -212($fp)	# spill _tmp73 from $t5 to $fp-212
	  sw $t6, -216($fp)	# spill _tmp74 from $t6 to $fp-216
	  sw $s0, -220($fp)	# spill _tmp75 from $s0 to $fp-220
	  sw $s1, -224($fp)	# spill _tmp76 from $s1 to $fp-224
	  sw $s2, -228($fp)	# spill _tmp77 from $s2 to $fp-228
	  sw $s3, -232($fp)	# spill _tmp78 from $s3 to $fp-232
	  lw $s3, -232($fp)	# fill _tmp78 to $s3 from $fp-232
	  beqz $s3, _L7	# branch if _tmp78 is zero 
	# _tmp79 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string4
	  la $v0, _string4	# load label
	  sw $v0, -236($fp)	# spill _tmp79 from $v0 to $fp-236
	# PushParam _tmp79
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -236($fp)	# fill _tmp79 to $v0 from $fp-236
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
	# _tmp80 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp81 = _tmp80 * _tmp72
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -208($fp)	# fill _tmp72 to $v1 from $fp-208
	  mul $t1, $t0, $v1	
	# _tmp82 = _tmp71 + _tmp81
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -204($fp)	# fill _tmp71 to $v0 from $fp-204
	  add $v0, $v0, $t1	
	  sw $v0, -248($fp)	# spill _tmp82 from $v0 to $fp-248
	# _tmp83 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp83 register is given $spill
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $v0, 8($t7) 	# load with offset
	  sw $v0, -252($fp)	# spill _tmp83 from $v0 to $fp-252
	# _tmp84 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp85 = r < _tmp84
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -116($fp)	# fill r to $v0 from $fp-116
	  slt $t3, $v0, $t2	
	# _tmp86 = *(_tmp83 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp86 register is given $t4
	# the reference: _tmp83 is given $spill
	  lw $v0, -252($fp)	# fill _tmp83 to $v0 from $fp-252
	  lw $t4, -4($v0) 	# load with offset
	# _tmp87 = r < _tmp86
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -116($fp)	# fill r to $v0 from $fp-116
	  slt $t5, $v0, $t4	
	# _tmp88 = _tmp87 == _tmp84
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp89 = _tmp85 || _tmp88
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t6
	  or $s0, $t3, $t6	
	# IfZ _tmp89 Goto _L8
	# we clean all the regiser
	  sw $t0, -240($fp)	# spill _tmp80 from $t0 to $fp-240
	  sw $t1, -244($fp)	# spill _tmp81 from $t1 to $fp-244
	  sw $t2, -256($fp)	# spill _tmp84 from $t2 to $fp-256
	  sw $t3, -260($fp)	# spill _tmp85 from $t3 to $fp-260
	  sw $t4, -264($fp)	# spill _tmp86 from $t4 to $fp-264
	  sw $t5, -268($fp)	# spill _tmp87 from $t5 to $fp-268
	  sw $t6, -272($fp)	# spill _tmp88 from $t6 to $fp-272
	  sw $s0, -276($fp)	# spill _tmp89 from $s0 to $fp-276
	  lw $s0, -276($fp)	# fill _tmp89 to $s0 from $fp-276
	  beqz $s0, _L8	# branch if _tmp89 is zero 
	# _tmp90 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string5
	  la $s1, _string5	# load label
	# PushParam _tmp90
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -280($fp)	# spill _tmp90 from $s1 to $fp-280
	  lw $s1, -280($fp)	# fill _tmp90 to $s1 from $fp-280
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
	# _tmp91 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp92 = _tmp91 * r
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -116($fp)	# fill r to $v1 from $fp-116
	  mul $t1, $t0, $v1	
	# _tmp93 = _tmp83 + _tmp92
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -252($fp)	# fill _tmp83 to $v0 from $fp-252
	  add $t2, $v0, $t1	
	# _tmp94 = *(_tmp93)
	# We are in the EmitLoad
	# so, the dst: _tmp94 register is given $t3
	# the reference: _tmp93 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# *(_tmp82) = _tmp94
	# We are in the EmitStore
	# so, the reference: _tmp82 register is given $spill
	# the value: _tmp94 is given $t3
	  lw $v1, -248($fp)	# fill _tmp82 to $v1 from $fp-248
	  sw $t3, 0($v1) 	# store with offset
	# _tmp95 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp95 register is given $t4
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t4, 8($t7) 	# load with offset
	# _tmp96 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp97 = r < _tmp96
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -116($fp)	# fill r to $v0 from $fp-116
	  slt $t6, $v0, $t5	
	# _tmp98 = *(_tmp95 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp98 register is given $s0
	# the reference: _tmp95 is given $t4
	  lw $s0, -4($t4) 	# load with offset
	# _tmp99 = r < _tmp98
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $spill
	# the op2 is $s0
	  lw $v0, -116($fp)	# fill r to $v0 from $fp-116
	  slt $s1, $v0, $s0	
	# _tmp100 = _tmp99 == _tmp96
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $s1
	# the op2 is $t5
	  seq $s2, $s1, $t5	
	# _tmp101 = _tmp97 || _tmp100
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $t6
	# the op2 is $s2
	  or $s3, $t6, $s2	
	# IfZ _tmp101 Goto _L9
	# we clean all the regiser
	  sw $t0, -284($fp)	# spill _tmp91 from $t0 to $fp-284
	  sw $t1, -288($fp)	# spill _tmp92 from $t1 to $fp-288
	  sw $t2, -292($fp)	# spill _tmp93 from $t2 to $fp-292
	  sw $t3, -296($fp)	# spill _tmp94 from $t3 to $fp-296
	  sw $t4, -300($fp)	# spill _tmp95 from $t4 to $fp-300
	  sw $t5, -304($fp)	# spill _tmp96 from $t5 to $fp-304
	  sw $t6, -308($fp)	# spill _tmp97 from $t6 to $fp-308
	  sw $s0, -312($fp)	# spill _tmp98 from $s0 to $fp-312
	  sw $s1, -316($fp)	# spill _tmp99 from $s1 to $fp-316
	  sw $s2, -320($fp)	# spill _tmp100 from $s2 to $fp-320
	  sw $s3, -324($fp)	# spill _tmp101 from $s3 to $fp-324
	  lw $s3, -324($fp)	# fill _tmp101 to $s3 from $fp-324
	  beqz $s3, _L9	# branch if _tmp101 is zero 
	# _tmp102 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s4
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s4
	# the label is _string6
	  la $s4, _string6	# load label
	# PushParam _tmp102
	# we are in a EmitParam
	# so, the arg register is given $s4
	  sw $s4, -328($fp)	# spill _tmp102 from $s4 to $fp-328
	  lw $s4, -328($fp)	# fill _tmp102 to $s4 from $fp-328
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s4, 4($sp)	# copy param value to stack
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
	# _tmp103 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp104 = _tmp103 * r
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -116($fp)	# fill r to $v1 from $fp-116
	  mul $t1, $t0, $v1	
	# _tmp105 = _tmp95 + _tmp104
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t4
	# the op2 is $t1
	  lw $t4, -300($fp)	# fill _tmp95 to $t4 from $fp-300
	  add $t2, $t4, $t1	
	# *(_tmp105) = temp
	# We are in the EmitStore
	# so, the reference: _tmp105 register is given $t2
	# the value: temp is given $t4
	  lw $t4, -120($fp)	# fill temp to $t4 from $fp-120
	  sw $t4, 0($t2) 	# store with offset
	# Goto _L4
	# we clean all the regiser
	  sw $t0, -332($fp)	# spill _tmp103 from $t0 to $fp-332
	  sw $t1, -336($fp)	# spill _tmp104 from $t1 to $fp-336
	  sw $t2, -340($fp)	# spill _tmp105 from $t2 to $fp-340
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
  _Deck.GetCard:
	# BeginFunc 92
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 92	# decrement sp to make space for locals/temps
	# _tmp106 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp106 register is given $s1
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $s1, 4($t7) 	# load with offset
	# _tmp107 = 52
	# We are in the LoadConstant
	# so, the dst register is given $s2
	# the constant is 52
	  li $s2, 52		# load constant value 52 into $s2
	# _tmp108 = _tmp107 < _tmp106
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $s2
	# the op2 is $s1
	  slt $s3, $s2, $s1	
	# _tmp109 = _tmp106 == _tmp107
	# We are in the EmitBinaryOp
	# so, the dst register is given $s4
	# the op1 is $s1
	# the op2 is $s2
	  seq $s4, $s1, $s2	
	# _tmp110 = _tmp108 || _tmp109
	# We are in the EmitBinaryOp
	# so, the dst register is given $s5
	# the op1 is $s3
	# the op2 is $s4
	  or $s5, $s3, $s4	
	# IfZ _tmp110 Goto _L10
	# we clean all the regiser
	  sw $s1, -12($fp)	# spill _tmp106 from $s1 to $fp-12
	  sw $s2, -16($fp)	# spill _tmp107 from $s2 to $fp-16
	  sw $s3, -20($fp)	# spill _tmp108 from $s3 to $fp-20
	  sw $s4, -24($fp)	# spill _tmp109 from $s4 to $fp-24
	  sw $s5, -28($fp)	# spill _tmp110 from $s5 to $fp-28
	  lw $s5, -28($fp)	# fill _tmp110 to $s5 from $fp-28
	  beqz $s5, _L10	# branch if _tmp110 is zero 
	# _tmp111 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -32($fp)	# spill _tmp111 from $v0 to $fp-32
	# Return _tmp111
	  lw $v0, -32($fp)	# fill _tmp111 to $v0 from $fp-32
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
  _L10:
	# _tmp112 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp112 register is given $t0
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $t0, 8($t7) 	# load with offset
	# _tmp113 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp113 register is given $t0
	# the reference: this is given $t7
	  sw $t0, -36($fp)	# spill _tmp112 from $t0 to $fp-36
	  lw $t0, 4($t7) 	# load with offset
	# _tmp114 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp115 = _tmp113 < _tmp114
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  slt $t2, $t0, $t1	
	# _tmp116 = *(_tmp112 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp116 register is given $t3
	# the reference: _tmp112 is given $t0
	  sw $t0, -40($fp)	# spill _tmp113 from $t0 to $fp-40
	  lw $t0, -36($fp)	# fill _tmp112 to $t0 from $fp-36
	  lw $t3, -4($t0) 	# load with offset
	# _tmp117 = _tmp113 < _tmp116
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t3
	  lw $t0, -40($fp)	# fill _tmp113 to $t0 from $fp-40
	  slt $t4, $t0, $t3	
	# _tmp118 = _tmp117 == _tmp114
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp119 = _tmp115 || _tmp118
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  or $t6, $t2, $t5	
	# IfZ _tmp119 Goto _L11
	# we clean all the regiser
	  sw $t1, -44($fp)	# spill _tmp114 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp115 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp116 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp117 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp118 from $t5 to $fp-60
	  sw $t6, -64($fp)	# spill _tmp119 from $t6 to $fp-64
	  lw $t6, -64($fp)	# fill _tmp119 to $t6 from $fp-64
	  beqz $t6, _L11	# branch if _tmp119 is zero 
	# _tmp120 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string7
	  la $s0, _string7	# load label
	# PushParam _tmp120
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -68($fp)	# spill _tmp120 from $s0 to $fp-68
	  lw $s0, -68($fp)	# fill _tmp120 to $s0 from $fp-68
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
	# _tmp121 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -72($fp)	# spill _tmp121 from $v0 to $fp-72
	# _tmp122 = _tmp121 * _tmp113
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -72($fp)	# fill _tmp121 to $v0 from $fp-72
	  lw $t0, -40($fp)	# fill _tmp113 to $t0 from $fp-40
	  mul $v0, $v0, $t0	
	  sw $v0, -76($fp)	# spill _tmp122 from $v0 to $fp-76
	# _tmp123 = _tmp112 + _tmp122
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t0
	# the op2 is $spill
	  lw $t0, -36($fp)	# fill _tmp112 to $t0 from $fp-36
	  lw $v1, -76($fp)	# fill _tmp122 to $v1 from $fp-76
	  add $v0, $t0, $v1	
	  sw $v0, -80($fp)	# spill _tmp123 from $v0 to $fp-80
	# _tmp124 = *(_tmp123)
	# We are in the EmitLoad
	# so, the dst: _tmp124 register is given $spill
	# the reference: _tmp123 is given $spill
	  lw $v0, -80($fp)	# fill _tmp123 to $v0 from $fp-80
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -84($fp)	# spill _tmp124 from $v0 to $fp-84
	# result = _tmp124
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -84($fp)	# fill _tmp124 to $v0 from $fp-84
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill result from $v0 to $fp-8
	# _tmp125 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp125 register is given $spill
	# the reference: this is given $t7
	  lw $t7, 4($fp)	# fill this to $t7 from $fp+4
	  lw $v0, 4($t7) 	# load with offset
	  sw $v0, -88($fp)	# spill _tmp125 from $v0 to $fp-88
	# _tmp126 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -92($fp)	# spill _tmp126 from $v0 to $fp-92
	# _tmp127 = _tmp125 + _tmp126
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -88($fp)	# fill _tmp125 to $v0 from $fp-88
	  lw $v1, -92($fp)	# fill _tmp126 to $v1 from $fp-92
	  add $v0, $v0, $v1	
	  sw $v0, -96($fp)	# spill _tmp127 from $v0 to $fp-96
	# *(this + 4) = _tmp127
	# We are in the EmitStore
	# so, the reference: this register is given $t7
	# the value: _tmp127 is given $spill
	  lw $v0, -96($fp)	# fill _tmp127 to $v0 from $fp-96
	  sw $v0, 4($t7) 	# store with offset
	# Return result
	  lw $v0, -8($fp)	# fill result to $v0 from $fp-8
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
	# VTable for class Deck
	  .data
	  .align 2
	  Deck:		# label for class Deck vtable
	  .word _Deck.Init
	  .word _Deck.Shuffle
	  .word _Deck.GetCard
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _BJDeck.Init:
	# BeginFunc 180
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp128 = 8
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -12($fp)	# spill _tmp128 from $v0 to $fp-12
	# _tmp129 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp129 from $v0 to $fp-16
	# _tmp130 = _tmp128 < _tmp129
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -12($fp)	# fill _tmp128 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp129 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp130 from $v0 to $fp-20
	# IfZ _tmp130 Goto _L12
	# we clean all the regiser
	  lw $v0, -20($fp)	# fill _tmp130 to $v0 from $fp-20
	  beqz $v0, _L12	# branch if _tmp130 is zero 
	# _tmp131 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string8
	  la $v0, _string8	# load label
	  sw $v0, -24($fp)	# spill _tmp131 from $v0 to $fp-24
	# PushParam _tmp131
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -24($fp)	# fill _tmp131 to $v0 from $fp-24
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
  _L12:
	# _tmp132 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp133 = _tmp132 + _tmp128
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill _tmp128 to $v1 from $fp-12
	  add $t1, $t0, $v1	
	# _tmp134 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp135 = _tmp133 * _tmp134
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  mul $t3, $t1, $t2	
	# PushParam _tmp135
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -40($fp)	# spill _tmp135 from $t3 to $fp-40
	  lw $t3, -40($fp)	# fill _tmp135 to $t3 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp136 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp132 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp133 from $t1 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp134 from $t2 to $fp-36
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -44($fp)	# spill _tmp136 from $t4 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp136) = _tmp128
	# We are in the EmitStore
	# so, the reference: _tmp136 register is given $t4
	# the value: _tmp128 is given $spill
	  lw $v0, -12($fp)	# fill _tmp128 to $v0 from $fp-12
	  sw $v0, 0($t4) 	# store with offset
	# _tmp137 = _tmp136 + _tmp134
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t4
	# the op2 is $t2
	  lw $t2, -36($fp)	# fill _tmp134 to $t2 from $fp-36
	  add $t0, $t4, $t2	
	# *(this + 4) = _tmp137
	# We are in the EmitStore
	# so, the reference: this register is given $spill
	# the value: _tmp137 is given $t0
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $t0, 4($v1) 	# store with offset
	# _tmp138 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp138
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp137 from $t0 to $fp-48
	  sw $t1, -52($fp)	# spill _tmp138 from $t1 to $fp-52
  _L13:
	# _tmp139 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp140 = i < _tmp139
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp140 Goto _L14
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp139 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp140 from $t1 to $fp-60
	  lw $t1, -60($fp)	# fill _tmp140 to $t1 from $fp-60
	  beqz $t1, _L14	# branch if _tmp140 is zero 
	# _tmp141 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp141 register is given $t3
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $t3, 4($v0) 	# load with offset
	# _tmp142 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp143 = i < _tmp142
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t4, $v0, $t2	
	# _tmp144 = *(_tmp141 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp144 register is given $t5
	# the reference: _tmp141 is given $t3
	  lw $t5, -4($t3) 	# load with offset
	# _tmp145 = i < _tmp144
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t6, $v0, $t5	
	# _tmp146 = _tmp145 == _tmp142
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t6
	# the op2 is $t2
	  seq $t7, $t6, $t2	
	# _tmp147 = _tmp143 || _tmp146
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  or $s0, $t4, $t7	
	# IfZ _tmp147 Goto _L15
	# we clean all the regiser
	  sw $t2, -68($fp)	# spill _tmp142 from $t2 to $fp-68
	  sw $t3, -64($fp)	# spill _tmp141 from $t3 to $fp-64
	  sw $t4, -72($fp)	# spill _tmp143 from $t4 to $fp-72
	  sw $t5, -76($fp)	# spill _tmp144 from $t5 to $fp-76
	  sw $t6, -80($fp)	# spill _tmp145 from $t6 to $fp-80
	  sw $t7, -84($fp)	# spill _tmp146 from $t7 to $fp-84
	  sw $s0, -88($fp)	# spill _tmp147 from $s0 to $fp-88
	  lw $s0, -88($fp)	# fill _tmp147 to $s0 from $fp-88
	  beqz $s0, _L15	# branch if _tmp147 is zero 
	# _tmp148 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp148
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -92($fp)	# spill _tmp148 from $s1 to $fp-92
	  lw $s1, -92($fp)	# fill _tmp148 to $s1 from $fp-92
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
  _L15:
	# _tmp149 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp150 = _tmp149 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp151 = _tmp141 + _tmp150
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t3
	# the op2 is $t1
	  lw $t3, -64($fp)	# fill _tmp141 to $t3 from $fp-64
	  add $s1, $t3, $t1	
	# _tmp152 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 12
	  li $t2, 12		# load constant value 12 into $t2
	# PushParam _tmp152
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -108($fp)	# spill _tmp152 from $t2 to $fp-108
	  lw $t2, -108($fp)	# fill _tmp152 to $t2 from $fp-108
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp153 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp149 from $t0 to $fp-96
	  sw $t1, -100($fp)	# spill _tmp150 from $t1 to $fp-100
	  sw $s1, -104($fp)	# spill _tmp151 from $s1 to $fp-104
	  jal _Alloc         	# jump to function
	  move $s2, $v0		# copy function return value from $v0
	  sw $s2, -112($fp)	# spill _tmp153 from $s2 to $fp-112
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp154 = Deck
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Deck
	  la $t0, Deck	# load label
	# *(_tmp153) = _tmp154
	# We are in the EmitStore
	# so, the reference: _tmp153 register is given $s2
	# the value: _tmp154 is given $t0
	  sw $t0, 0($s2) 	# store with offset
	# *(_tmp151) = _tmp153
	# We are in the EmitStore
	# so, the reference: _tmp151 register is given $s1
	# the value: _tmp153 is given $s2
	  lw $s1, -104($fp)	# fill _tmp151 to $s1 from $fp-104
	  sw $s2, 0($s1) 	# store with offset
	# _tmp155 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp155 register is given $t6
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $t6, 4($v0) 	# load with offset
	# _tmp156 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp157 = i < _tmp156
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# _tmp158 = *(_tmp155 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp158 register is given $t3
	# the reference: _tmp155 is given $t6
	  lw $t3, -4($t6) 	# load with offset
	# _tmp159 = i < _tmp158
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t4, $v0, $t3	
	# _tmp160 = _tmp159 == _tmp156
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  seq $t5, $t4, $t1	
	# _tmp161 = _tmp157 || _tmp160
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t5
	  or $t7, $t2, $t5	
	# IfZ _tmp161 Goto _L16
	# we clean all the regiser
	  sw $t0, -116($fp)	# spill _tmp154 from $t0 to $fp-116
	  sw $t1, -124($fp)	# spill _tmp156 from $t1 to $fp-124
	  sw $t2, -128($fp)	# spill _tmp157 from $t2 to $fp-128
	  sw $t3, -132($fp)	# spill _tmp158 from $t3 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp159 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp160 from $t5 to $fp-140
	  sw $t6, -120($fp)	# spill _tmp155 from $t6 to $fp-120
	  sw $t7, -144($fp)	# spill _tmp161 from $t7 to $fp-144
	  lw $t7, -144($fp)	# fill _tmp161 to $t7 from $fp-144
	  beqz $t7, _L16	# branch if _tmp161 is zero 
	# _tmp162 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string10
	  la $s0, _string10	# load label
	# PushParam _tmp162
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -148($fp)	# spill _tmp162 from $s0 to $fp-148
	  lw $s0, -148($fp)	# fill _tmp162 to $s0 from $fp-148
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
	# _tmp163 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp164 = _tmp163 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp165 = _tmp155 + _tmp164
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -120($fp)	# fill _tmp155 to $t6 from $fp-120
	  add $t2, $t6, $t1	
	# _tmp166 = *(_tmp165)
	# We are in the EmitLoad
	# so, the dst: _tmp166 register is given $t3
	# the reference: _tmp165 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp167 = *(_tmp166)
	# We are in the EmitLoad
	# so, the dst: _tmp167 register is given $t4
	# the reference: _tmp166 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp168 = *(_tmp167)
	# We are in the EmitLoad
	# so, the dst: _tmp168 register is given $t5
	# the reference: _tmp167 is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp166
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -164($fp)	# spill _tmp166 from $t3 to $fp-164
	  lw $t3, -164($fp)	# fill _tmp166 to $t3 from $fp-164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp168
	# we clean all the regiser
	  sw $t0, -152($fp)	# spill _tmp163 from $t0 to $fp-152
	  sw $t1, -156($fp)	# spill _tmp164 from $t1 to $fp-156
	  sw $t2, -160($fp)	# spill _tmp165 from $t2 to $fp-160
	  sw $t4, -168($fp)	# spill _tmp167 from $t4 to $fp-168
	  sw $t5, -172($fp)	# spill _tmp168 from $t5 to $fp-172
	  lw $v0, -172($fp)	# fill _tmp168 to $v0 from $fp-172
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp169 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -176($fp)	# spill _tmp169 from $v0 to $fp-176
	# _tmp170 = i + _tmp169
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -176($fp)	# fill _tmp169 to $v1 from $fp-176
	  add $v0, $v0, $v1	
	  sw $v0, -180($fp)	# spill _tmp170 from $v0 to $fp-180
	# i = _tmp170
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -180($fp)	# fill _tmp170 to $v0 from $fp-180
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L13
	# we clean all the regiser
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
  _BJDeck.DealCard:
	# BeginFunc 168
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp171 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp171 from $v0 to $fp-12
	# c = _tmp171
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -12($fp)	# fill _tmp171 to $v0 from $fp-12
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill c from $v0 to $fp-8
	# _tmp172 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp172 register is given $spill
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp172 from $v0 to $fp-16
	# _tmp173 = 8
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -20($fp)	# spill _tmp173 from $v0 to $fp-20
	# _tmp174 = 52
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 52
	  li $v0, 52		# load constant value 52 into $v0
	  sw $v0, -24($fp)	# spill _tmp174 from $v0 to $fp-24
	# _tmp175 = _tmp173 * _tmp174
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -20($fp)	# fill _tmp173 to $v0 from $fp-20
	  lw $v1, -24($fp)	# fill _tmp174 to $v1 from $fp-24
	  mul $v0, $v0, $v1	
	  sw $v0, -28($fp)	# spill _tmp175 from $v0 to $fp-28
	# _tmp176 = _tmp175 < _tmp172
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -28($fp)	# fill _tmp175 to $v0 from $fp-28
	  lw $v1, -16($fp)	# fill _tmp172 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp176 from $v0 to $fp-32
	# _tmp177 = _tmp172 == _tmp175
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -16($fp)	# fill _tmp172 to $v0 from $fp-16
	  lw $v1, -28($fp)	# fill _tmp175 to $v1 from $fp-28
	  seq $v0, $v0, $v1	
	  sw $v0, -36($fp)	# spill _tmp177 from $v0 to $fp-36
	# _tmp178 = _tmp176 || _tmp177
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -32($fp)	# fill _tmp176 to $v0 from $fp-32
	  lw $v1, -36($fp)	# fill _tmp177 to $v1 from $fp-36
	  or $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp178 from $v0 to $fp-40
	# IfZ _tmp178 Goto _L17
	# we clean all the regiser
	  lw $v0, -40($fp)	# fill _tmp178 to $v0 from $fp-40
	  beqz $v0, _L17	# branch if _tmp178 is zero 
	# _tmp179 = 11
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 11
	  li $v0, 11		# load constant value 11 into $v0
	  sw $v0, -44($fp)	# spill _tmp179 from $v0 to $fp-44
	# Return _tmp179
	  lw $v0, -44($fp)	# fill _tmp179 to $v0 from $fp-44
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
  _L17:
	# we clean all the regiser
  _L18:
	# _tmp180 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp181 = c == _tmp180
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  seq $t1, $v0, $t0	
	# IfZ _tmp181 Goto _L19
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp180 from $t0 to $fp-48
	  sw $t1, -52($fp)	# spill _tmp181 from $t1 to $fp-52
	  lw $t1, -52($fp)	# fill _tmp181 to $t1 from $fp-52
	  beqz $t1, _L19	# branch if _tmp181 is zero 
	# _tmp182 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 8
	  li $t2, 8		# load constant value 8 into $t2
	# _tmp183 = *(gRnd)
	# We are in the EmitLoad
	# so, the dst: _tmp183 register is given $t3
	# the reference: gRnd is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t3, 0($t0) 	# load with offset
	# _tmp184 = *(_tmp183 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp184 register is given $t4
	# the reference: _tmp183 is given $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp182
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -60($fp)	# spill _tmp182 from $t2 to $fp-60
	  lw $t2, -60($fp)	# fill _tmp182 to $t2 from $fp-60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam gRnd
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp185 = ACall _tmp184
	# we clean all the regiser
	  sw $t3, -64($fp)	# spill _tmp183 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp184 from $t4 to $fp-68
	  lw $v0, -68($fp)	# fill _tmp184 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -72($fp)	# spill _tmp185 from $t5 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# d = _tmp185
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t5
	  move $t7, $t5		# copy value from $t5 to $t7
	# _tmp186 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp186 register is given $s0
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $s0, 4($v0) 	# load with offset
	# _tmp187 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp188 = d < _tmp187
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t7
	# the op2 is $t6
	  slt $s1, $t7, $t6	
	# _tmp189 = *(_tmp186 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp189 register is given $s2
	# the reference: _tmp186 is given $s0
	  lw $s2, -4($s0) 	# load with offset
	# _tmp190 = d < _tmp189
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $t7
	# the op2 is $s2
	  slt $s3, $t7, $s2	
	# _tmp191 = _tmp190 == _tmp187
	# We are in the EmitBinaryOp
	# so, the dst register is given $s4
	# the op1 is $s3
	# the op2 is $t6
	  seq $s4, $s3, $t6	
	# _tmp192 = _tmp188 || _tmp191
	# We are in the EmitBinaryOp
	# so, the dst register is given $s5
	# the op1 is $s1
	# the op2 is $s4
	  or $s5, $s1, $s4	
	# IfZ _tmp192 Goto _L20
	# we clean all the regiser
	  sw $t6, -80($fp)	# spill _tmp187 from $t6 to $fp-80
	  sw $t7, -56($fp)	# spill d from $t7 to $fp-56
	  sw $s0, -76($fp)	# spill _tmp186 from $s0 to $fp-76
	  sw $s1, -84($fp)	# spill _tmp188 from $s1 to $fp-84
	  sw $s2, -88($fp)	# spill _tmp189 from $s2 to $fp-88
	  sw $s3, -92($fp)	# spill _tmp190 from $s3 to $fp-92
	  sw $s4, -96($fp)	# spill _tmp191 from $s4 to $fp-96
	  sw $s5, -100($fp)	# spill _tmp192 from $s5 to $fp-100
	  lw $s5, -100($fp)	# fill _tmp192 to $s5 from $fp-100
	  beqz $s5, _L20	# branch if _tmp192 is zero 
	# _tmp193 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string11
	  la $v0, _string11	# load label
	  sw $v0, -104($fp)	# spill _tmp193 from $v0 to $fp-104
	# PushParam _tmp193
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -104($fp)	# fill _tmp193 to $v0 from $fp-104
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
  _L20:
	# _tmp194 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp195 = _tmp194 * d
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t7
	  lw $t7, -56($fp)	# fill d to $t7 from $fp-56
	  mul $t1, $t0, $t7	
	# _tmp196 = _tmp186 + _tmp195
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s0
	# the op2 is $t1
	  lw $s0, -76($fp)	# fill _tmp186 to $s0 from $fp-76
	  add $t2, $s0, $t1	
	# _tmp197 = *(_tmp196)
	# We are in the EmitLoad
	# so, the dst: _tmp197 register is given $t3
	# the reference: _tmp196 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp198 = *(_tmp197)
	# We are in the EmitLoad
	# so, the dst: _tmp198 register is given $t4
	# the reference: _tmp197 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp199 = *(_tmp198 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp199 register is given $t5
	# the reference: _tmp198 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam _tmp197
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -120($fp)	# spill _tmp197 from $t3 to $fp-120
	  lw $t3, -120($fp)	# fill _tmp197 to $t3 from $fp-120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp200 = ACall _tmp199
	# we clean all the regiser
	  sw $t0, -108($fp)	# spill _tmp194 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp195 from $t1 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp196 from $t2 to $fp-116
	  sw $t4, -124($fp)	# spill _tmp198 from $t4 to $fp-124
	  sw $t5, -128($fp)	# spill _tmp199 from $t5 to $fp-128
	  lw $v0, -128($fp)	# fill _tmp199 to $v0 from $fp-128
	  jalr $v0            	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -132($fp)	# spill _tmp200 from $t6 to $fp-132
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# c = _tmp200
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t6
	  move $v0, $t6		# copy value from $t6 to $v0
	  sw $v0, -8($fp)	# spill c from $v0 to $fp-8
	# Goto _L18
	# we clean all the regiser
	  b _L18		# unconditional branch
	# we clean all the regiser
  _L19:
	# _tmp201 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp202 = _tmp201 < c
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill c to $v1 from $fp-8
	  slt $t1, $t0, $v1	
	# IfZ _tmp202 Goto _L22
	# we clean all the regiser
	  sw $t0, -136($fp)	# spill _tmp201 from $t0 to $fp-136
	  sw $t1, -140($fp)	# spill _tmp202 from $t1 to $fp-140
	  lw $t1, -140($fp)	# fill _tmp202 to $t1 from $fp-140
	  beqz $t1, _L22	# branch if _tmp202 is zero 
	# _tmp203 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 10
	  li $t2, 10		# load constant value 10 into $t2
	# c = _tmp203
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t2
	  move $v0, $t2		# copy value from $t2 to $v0
	  sw $v0, -8($fp)	# spill c from $v0 to $fp-8
	# Goto _L21
	# we clean all the regiser
	  sw $t2, -144($fp)	# spill _tmp203 from $t2 to $fp-144
	  b _L21		# unconditional branch
	# we clean all the regiser
  _L22:
	# _tmp204 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp205 = c == _tmp204
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
	  seq $t1, $v0, $t0	
	# IfZ _tmp205 Goto _L23
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp204 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp205 from $t1 to $fp-152
	  lw $t1, -152($fp)	# fill _tmp205 to $t1 from $fp-152
	  beqz $t1, _L23	# branch if _tmp205 is zero 
	# _tmp206 = 11
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 11
	  li $t2, 11		# load constant value 11 into $t2
	# c = _tmp206
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t2
	  move $v0, $t2		# copy value from $t2 to $v0
	  sw $v0, -8($fp)	# spill c from $v0 to $fp-8
	# we clean all the regiser
	  sw $t2, -156($fp)	# spill _tmp206 from $t2 to $fp-156
  _L23:
	# we clean all the regiser
  _L21:
	# _tmp207 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp207 register is given $spill
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $v0, 8($v0) 	# load with offset
	  sw $v0, -160($fp)	# spill _tmp207 from $v0 to $fp-160
	# _tmp208 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -164($fp)	# spill _tmp208 from $v0 to $fp-164
	# _tmp209 = _tmp207 + _tmp208
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -160($fp)	# fill _tmp207 to $v0 from $fp-160
	  lw $v1, -164($fp)	# fill _tmp208 to $v1 from $fp-164
	  add $v0, $v0, $v1	
	  sw $v0, -168($fp)	# spill _tmp209 from $v0 to $fp-168
	# *(this + 8) = _tmp209
	# We are in the EmitStore
	# so, the reference: this register is given $spill
	# the value: _tmp209 is given $spill
	  lw $v0, -168($fp)	# fill _tmp209 to $v0 from $fp-168
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $v0, 8($v1) 	# store with offset
	# Return c
	  lw $v0, -8($fp)	# fill c to $v0 from $fp-8
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
  _BJDeck.Shuffle:
	# BeginFunc 96
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 96	# decrement sp to make space for locals/temps
	# _tmp210 = "Shuffling..."
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Shuffling..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Shuffling..."
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string12
	  la $v0, _string12	# load label
	  sw $v0, -12($fp)	# spill _tmp210 from $v0 to $fp-12
	# PushParam _tmp210
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill _tmp210 to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp211 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp211
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp211 from $t0 to $fp-16
  _L24:
	# _tmp212 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp213 = i < _tmp212
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp213 Goto _L25
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp212 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp213 from $t1 to $fp-24
	  lw $t1, -24($fp)	# fill _tmp213 to $t1 from $fp-24
	  beqz $t1, _L25	# branch if _tmp213 is zero 
	# _tmp214 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp214 register is given $t6
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $t6, 4($v0) 	# load with offset
	# _tmp215 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp216 = i < _tmp215
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp217 = *(_tmp214 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp217 register is given $t4
	# the reference: _tmp214 is given $t6
	  lw $t4, -4($t6) 	# load with offset
	# _tmp218 = i < _tmp217
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp219 = _tmp218 == _tmp215
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t2
	  seq $t7, $t5, $t2	
	# _tmp220 = _tmp216 || _tmp219
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t7
	  or $s0, $t3, $t7	
	# IfZ _tmp220 Goto _L26
	# we clean all the regiser
	  sw $t2, -32($fp)	# spill _tmp215 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp216 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp217 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp218 from $t5 to $fp-44
	  sw $t6, -28($fp)	# spill _tmp214 from $t6 to $fp-28
	  sw $t7, -48($fp)	# spill _tmp219 from $t7 to $fp-48
	  sw $s0, -52($fp)	# spill _tmp220 from $s0 to $fp-52
	  lw $s0, -52($fp)	# fill _tmp220 to $s0 from $fp-52
	  beqz $s0, _L26	# branch if _tmp220 is zero 
	# _tmp221 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp221
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -56($fp)	# spill _tmp221 from $s1 to $fp-56
	  lw $s1, -56($fp)	# fill _tmp221 to $s1 from $fp-56
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
	# _tmp222 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp223 = _tmp222 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp224 = _tmp214 + _tmp223
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -28($fp)	# fill _tmp214 to $t6 from $fp-28
	  add $t2, $t6, $t1	
	# _tmp225 = *(_tmp224)
	# We are in the EmitLoad
	# so, the dst: _tmp225 register is given $t3
	# the reference: _tmp224 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp226 = *(_tmp225)
	# We are in the EmitLoad
	# so, the dst: _tmp226 register is given $t4
	# the reference: _tmp225 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp227 = *(_tmp226 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp227 register is given $t5
	# the reference: _tmp226 is given $t4
	  lw $t5, 4($t4) 	# load with offset
	# PushParam _tmp225
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -72($fp)	# spill _tmp225 from $t3 to $fp-72
	  lw $t3, -72($fp)	# fill _tmp225 to $t3 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp227
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp222 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp223 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp224 from $t2 to $fp-68
	  sw $t4, -76($fp)	# spill _tmp226 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp227 from $t5 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp227 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp228 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp229 = i + _tmp228
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp229
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L24
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp228 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp229 from $t1 to $fp-88
	  b _L24		# unconditional branch
	# we clean all the regiser
  _L25:
	# _tmp230 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# *(this + 8) = _tmp230
	# We are in the EmitStore
	# so, the reference: this register is given $spill
	# the value: _tmp230 is given $t1
	  lw $v1, 4($fp)	# fill this to $v1 from $fp+4
	  sw $t1, 8($v1) 	# store with offset
	# _tmp231 = "done.\n"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "done.\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "done.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string14
	  la $t2, _string14	# load label
	# PushParam _tmp231
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -96($fp)	# spill _tmp231 from $t2 to $fp-96
	  lw $t2, -96($fp)	# fill _tmp231 to $t2 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t1, -92($fp)	# spill _tmp230 from $t1 to $fp-92
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
  _BJDeck.NumCardsRemaining:
	# BeginFunc 20
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp232 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp233 = 52
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 52
	  li $t1, 52		# load constant value 52 into $t1
	# _tmp234 = _tmp232 * _tmp233
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  mul $t2, $t0, $t1	
	# _tmp235 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp235 register is given $t3
	# the reference: this is given $spill
	  lw $v0, 4($fp)	# fill this to $v0 from $fp+4
	  lw $t3, 8($v0) 	# load with offset
	# _tmp236 = _tmp234 - _tmp235
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  sub $t4, $t2, $t3	
	# Return _tmp236
	  move $v0, $t4		# assign return value into $v0
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
	# VTable for class BJDeck
	  .data
	  .align 2
	  BJDeck:		# label for class BJDeck vtable
	  .word _BJDeck.Init
	  .word _BJDeck.DealCard
	  .word _BJDeck.Shuffle
	  .word _BJDeck.NumCardsRemaining
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Player.Init:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp237 = 1000
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1000
	  li $t0, 1000		# load constant value 1000 into $t0
	# *(this + 20) = _tmp237
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp237 is given $t0
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 20($t1) 	# store with offset
	# _tmp238 = "What is the name of player #"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "What is the name of player #"
	  .data			# create string constant marked with label
	  _string15: .asciiz "What is the name of player #"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string15
	  la $t2, _string15	# load label
	# PushParam _tmp238
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -12($fp)	# spill _tmp238 from $t2 to $fp-12
	  lw $t2, -12($fp)	# fill _tmp238 to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -8($fp)	# spill _tmp237 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam num
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill num to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp239 = "? "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "? "
	  .data			# create string constant marked with label
	  _string16: .asciiz "? "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string16
	  la $t0, _string16	# load label
	# PushParam _tmp239
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp239 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp239 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp240 = LCall _ReadLine
	# we clean all the regiser
	  jal _ReadLine      	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp240 from $t3 to $fp-20
	# *(this + 24) = _tmp240
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp240 is given $t3
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t3, 24($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Player.Hit:
	# BeginFunc 124
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp241 = *(deck)
	# We are in the EmitLoad
	# so, the dst: _tmp241 register is given $spill
	# the reference: deck is given $t0
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  lw $v0, 0($t0) 	# load with offset
	  sw $v0, -12($fp)	# spill _tmp241 from $v0 to $fp-12
	# _tmp242 = *(_tmp241 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp242 register is given $spill
	# the reference: _tmp241 is given $spill
	  lw $v0, -12($fp)	# fill _tmp241 to $v0 from $fp-12
	  lw $v0, 4($v0) 	# load with offset
	  sw $v0, -16($fp)	# spill _tmp242 from $v0 to $fp-16
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp243 = ACall _tmp242
	# we clean all the regiser
	  lw $v0, -16($fp)	# fill _tmp242 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp243 from $v0 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp243
	# We are in the EmitCopy
	# so, the dst register is given $t0
	# the src is $spill
	  lw $v0, -20($fp)	# fill _tmp243 to $v0 from $fp-20
	  move $t0, $v0		# copy value from $v0 to $t0
	# _tmp244 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp244 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, -8($fp)	# spill card from $t0 to $fp-8
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp244
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -24($fp)	# spill _tmp244 from $t0 to $fp-24
	  lw $t0, -24($fp)	# fill _tmp244 to $t0 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp245 = " was dealt a "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " was dealt a "
	  .data			# create string constant marked with label
	  _string17: .asciiz " was dealt a "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string17
	  la $t0, _string17	# load label
	# PushParam _tmp245
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -28($fp)	# spill _tmp245 from $t0 to $fp-28
	  lw $t0, -28($fp)	# fill _tmp245 to $t0 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp246 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string18
	  la $t0, _string18	# load label
	# PushParam _tmp246
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -32($fp)	# spill _tmp246 from $t0 to $fp-32
	  lw $t0, -32($fp)	# fill _tmp246 to $t0 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp247 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp247 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 4($t1) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp247 from $v0 to $fp-36
	# _tmp248 = _tmp247 + card
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -36($fp)	# fill _tmp247 to $v0 from $fp-36
	  lw $t0, -8($fp)	# fill card to $t0 from $fp-8
	  add $v0, $v0, $t0	
	  sw $v0, -40($fp)	# spill _tmp248 from $v0 to $fp-40
	# *(this + 4) = _tmp248
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp248 is given $spill
	  lw $v0, -40($fp)	# fill _tmp248 to $v0 from $fp-40
	  sw $v0, 4($t1) 	# store with offset
	# _tmp249 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp249 register is given $spill
	# the reference: this is given $t1
	  lw $v0, 12($t1) 	# load with offset
	  sw $v0, -44($fp)	# spill _tmp249 from $v0 to $fp-44
	# _tmp250 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -48($fp)	# spill _tmp250 from $v0 to $fp-48
	# _tmp251 = _tmp249 + _tmp250
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -44($fp)	# fill _tmp249 to $v0 from $fp-44
	  lw $v1, -48($fp)	# fill _tmp250 to $v1 from $fp-48
	  add $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp251 from $v0 to $fp-52
	# *(this + 12) = _tmp251
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp251 is given $spill
	  lw $v0, -52($fp)	# fill _tmp251 to $v0 from $fp-52
	  sw $v0, 12($t1) 	# store with offset
	# _tmp252 = 11
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 11
	  li $v0, 11		# load constant value 11 into $v0
	  sw $v0, -56($fp)	# spill _tmp252 from $v0 to $fp-56
	# _tmp253 = card == _tmp252
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -56($fp)	# fill _tmp252 to $v1 from $fp-56
	  seq $v0, $t0, $v1	
	  sw $v0, -60($fp)	# spill _tmp253 from $v0 to $fp-60
	# IfZ _tmp253 Goto _L27
	# we clean all the regiser
	  lw $v0, -60($fp)	# fill _tmp253 to $v0 from $fp-60
	  beqz $v0, _L27	# branch if _tmp253 is zero 
	# _tmp254 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp254 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 8($t1) 	# load with offset
	  sw $v0, -64($fp)	# spill _tmp254 from $v0 to $fp-64
	# _tmp255 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -68($fp)	# spill _tmp255 from $v0 to $fp-68
	# _tmp256 = _tmp254 + _tmp255
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -64($fp)	# fill _tmp254 to $v0 from $fp-64
	  lw $v1, -68($fp)	# fill _tmp255 to $v1 from $fp-68
	  add $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp256 from $v0 to $fp-72
	# *(this + 8) = _tmp256
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp256 is given $spill
	  lw $v0, -72($fp)	# fill _tmp256 to $v0 from $fp-72
	  sw $v0, 8($t1) 	# store with offset
	# we clean all the regiser
  _L27:
	# we clean all the regiser
  _L28:
	# _tmp257 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp257 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp258 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 21
	  li $t2, 21		# load constant value 21 into $t2
	# _tmp259 = _tmp258 < _tmp257
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t2
	# the op2 is $t0
	  slt $t3, $t2, $t0	
	# _tmp260 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp260 register is given $t4
	# the reference: this is given $t1
	  lw $t4, 8($t1) 	# load with offset
	# _tmp261 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp262 = _tmp261 < _tmp260
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t4
	  slt $t6, $t5, $t4	
	# _tmp263 = _tmp259 && _tmp262
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  and $t7, $t3, $t6	
	# IfZ _tmp263 Goto _L29
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp257 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp258 from $t2 to $fp-80
	  sw $t3, -84($fp)	# spill _tmp259 from $t3 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp260 from $t4 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp261 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp262 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp263 from $t7 to $fp-100
	  lw $t7, -100($fp)	# fill _tmp263 to $t7 from $fp-100
	  beqz $t7, _L29	# branch if _tmp263 is zero 
	# _tmp264 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp264 register is given $s0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $s0, 4($t1) 	# load with offset
	# _tmp265 = 10
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 10
	  li $s1, 10		# load constant value 10 into $s1
	# _tmp266 = _tmp264 - _tmp265
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $s0
	# the op2 is $s1
	  sub $s2, $s0, $s1	
	# *(this + 4) = _tmp266
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp266 is given $s2
	  sw $s2, 4($t1) 	# store with offset
	# _tmp267 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp267 register is given $s3
	# the reference: this is given $t1
	  lw $s3, 8($t1) 	# load with offset
	# _tmp268 = 1
	# We are in the LoadConstant
	# so, the dst register is given $s4
	# the constant is 1
	  li $s4, 1		# load constant value 1 into $s4
	# _tmp269 = _tmp267 - _tmp268
	# We are in the EmitBinaryOp
	# so, the dst register is given $s5
	# the op1 is $s3
	# the op2 is $s4
	  sub $s5, $s3, $s4	
	# *(this + 8) = _tmp269
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp269 is given $s5
	  sw $s5, 8($t1) 	# store with offset
	# Goto _L28
	# we clean all the regiser
	  sw $s0, -104($fp)	# spill _tmp264 from $s0 to $fp-104
	  sw $s1, -108($fp)	# spill _tmp265 from $s1 to $fp-108
	  sw $s2, -112($fp)	# spill _tmp266 from $s2 to $fp-112
	  sw $s3, -116($fp)	# spill _tmp267 from $s3 to $fp-116
	  sw $s4, -120($fp)	# spill _tmp268 from $s4 to $fp-120
	  sw $s5, -124($fp)	# spill _tmp269 from $s5 to $fp-124
	  b _L28		# unconditional branch
	# we clean all the regiser
  _L29:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Player.DoubleDown:
	# BeginFunc 104
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 104	# decrement sp to make space for locals/temps
	# _tmp270 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp270 register is given $s0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $s0, 4($t1) 	# load with offset
	# _tmp271 = 10
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 10
	  li $s1, 10		# load constant value 10 into $s1
	# _tmp272 = _tmp270 == _tmp271
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $s0
	# the op2 is $s1
	  seq $s2, $s0, $s1	
	# _tmp273 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s3
	# the constant is 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp274 = _tmp272 == _tmp273
	# We are in the EmitBinaryOp
	# so, the dst register is given $s4
	# the op1 is $s2
	# the op2 is $s3
	  seq $s4, $s2, $s3	
	# _tmp275 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp275 register is given $s5
	# the reference: this is given $t1
	  lw $s5, 4($t1) 	# load with offset
	# _tmp276 = 11
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 11
	  li $v0, 11		# load constant value 11 into $v0
	  sw $v0, -36($fp)	# spill _tmp276 from $v0 to $fp-36
	# _tmp277 = _tmp275 == _tmp276
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s5
	# the op2 is $spill
	  lw $v1, -36($fp)	# fill _tmp276 to $v1 from $fp-36
	  seq $v0, $s5, $v1	
	  sw $v0, -40($fp)	# spill _tmp277 from $v0 to $fp-40
	# _tmp278 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -44($fp)	# spill _tmp278 from $v0 to $fp-44
	# _tmp279 = _tmp277 == _tmp278
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -40($fp)	# fill _tmp277 to $v0 from $fp-40
	  lw $v1, -44($fp)	# fill _tmp278 to $v1 from $fp-44
	  seq $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp279 from $v0 to $fp-48
	# _tmp280 = _tmp274 && _tmp279
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s4
	# the op2 is $spill
	  lw $v1, -48($fp)	# fill _tmp279 to $v1 from $fp-48
	  and $v0, $s4, $v1	
	  sw $v0, -52($fp)	# spill _tmp280 from $v0 to $fp-52
	# IfZ _tmp280 Goto _L30
	# we clean all the regiser
	  sw $s0, -12($fp)	# spill _tmp270 from $s0 to $fp-12
	  sw $s1, -16($fp)	# spill _tmp271 from $s1 to $fp-16
	  sw $s2, -20($fp)	# spill _tmp272 from $s2 to $fp-20
	  sw $s3, -24($fp)	# spill _tmp273 from $s3 to $fp-24
	  sw $s4, -28($fp)	# spill _tmp274 from $s4 to $fp-28
	  sw $s5, -32($fp)	# spill _tmp275 from $s5 to $fp-32
	  lw $v0, -52($fp)	# fill _tmp280 to $v0 from $fp-52
	  beqz $v0, _L30	# branch if _tmp280 is zero 
	# _tmp281 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -56($fp)	# spill _tmp281 from $v0 to $fp-56
	# Return _tmp281
	  lw $v0, -56($fp)	# fill _tmp281 to $v0 from $fp-56
	  move $v0, $v0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
  _L30:
	# _tmp282 = "Would you like to double down?"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string19: .asciiz "Would you like to double down?"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string19
	  la $t0, _string19	# load label
	# PushParam _tmp282
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp282 from $t0 to $fp-60
	  lw $t0, -60($fp)	# fill _tmp282 to $t0 from $fp-60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp283 = LCall _GetYesOrNo
	# we clean all the regiser
	  jal _GetYesOrNo    	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -64($fp)	# spill _tmp283 from $t1 to $fp-64
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp283 Goto _L31
	# we clean all the regiser
	  lw $t1, -64($fp)	# fill _tmp283 to $t1 from $fp-64
	  beqz $t1, _L31	# branch if _tmp283 is zero 
	# _tmp284 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp284 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 16($t1) 	# load with offset
	# _tmp285 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 2
	  li $t2, 2		# load constant value 2 into $t2
	# _tmp286 = _tmp284 * _tmp285
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t0
	# the op2 is $t2
	  mul $t3, $t0, $t2	
	# *(this + 16) = _tmp286
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp286 is given $t3
	  sw $t3, 16($t1) 	# store with offset
	# _tmp287 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp287 register is given $t4
	# the reference: this is given $t1
	  lw $t4, 0($t1) 	# load with offset
	# _tmp288 = *(_tmp287 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp288 register is given $t5
	# the reference: _tmp287 is given $t4
	  lw $t5, 4($t4) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -68($fp)	# spill _tmp284 from $t0 to $fp-68
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp288
	# we clean all the regiser
	  sw $t2, -72($fp)	# spill _tmp285 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp286 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp287 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp288 from $t5 to $fp-84
	  lw $v0, -84($fp)	# fill _tmp288 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp289 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp289 register is given $t6
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t6, 24($t1) 	# load with offset
	# PushParam _tmp289
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -88($fp)	# spill _tmp289 from $t6 to $fp-88
	  lw $t6, -88($fp)	# fill _tmp289 to $t6 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp290 = ", your total is "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", your total is "
	  .data			# create string constant marked with label
	  _string20: .asciiz ", your total is "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string20
	  la $t0, _string20	# load label
	# PushParam _tmp290
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -92($fp)	# spill _tmp290 from $t0 to $fp-92
	  lw $t0, -92($fp)	# fill _tmp290 to $t0 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp291 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp291 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp291
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -96($fp)	# spill _tmp291 from $t0 to $fp-96
	  lw $t0, -96($fp)	# fill _tmp291 to $t0 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp292 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string21: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string21
	  la $t0, _string21	# load label
	# PushParam _tmp292
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -100($fp)	# spill _tmp292 from $t0 to $fp-100
	  lw $t0, -100($fp)	# fill _tmp292 to $t0 from $fp-100
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp293 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t7
	# the constant is 1
	  li $t7, 1		# load constant value 1 into $t7
	# Return _tmp293
	  move $v0, $t7		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
	  sw $t7, -104($fp)	# spill _tmp293 from $t7 to $fp-104
  _L31:
	# _tmp294 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -108($fp)	# spill _tmp294 from $v0 to $fp-108
	# Return _tmp294
	  lw $v0, -108($fp)	# fill _tmp294 to $v0 from $fp-108
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
  _Player.TakeTurn:
	# BeginFunc 172
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 172	# decrement sp to make space for locals/temps
	# _tmp295 = "\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string22
	  la $v0, _string22	# load label
	  sw $v0, -12($fp)	# spill _tmp295 from $v0 to $fp-12
	# PushParam _tmp295
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill _tmp295 to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp296 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp296 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp296
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp296 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp296 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp297 = "'s turn.\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "'s turn.\n"
	  .data			# create string constant marked with label
	  _string23: .asciiz "'s turn.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string23
	  la $t0, _string23	# load label
	# PushParam _tmp297
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -20($fp)	# spill _tmp297 from $t0 to $fp-20
	  lw $t0, -20($fp)	# fill _tmp297 to $t0 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp298 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# *(this + 4) = _tmp298
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp298 is given $t0
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# _tmp299 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# *(this + 8) = _tmp299
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp299 is given $t2
	  sw $t2, 8($t1) 	# store with offset
	# _tmp300 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# *(this + 12) = _tmp300
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp300 is given $t3
	  sw $t3, 12($t1) 	# store with offset
	# _tmp301 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp301 register is given $t4
	# the reference: this is given $t1
	  lw $t4, 0($t1) 	# load with offset
	# _tmp302 = *(_tmp301 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp302 register is given $t5
	# the reference: _tmp301 is given $t4
	  lw $t5, 4($t4) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -24($fp)	# spill _tmp298 from $t0 to $fp-24
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp302
	# we clean all the regiser
	  sw $t2, -28($fp)	# spill _tmp299 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp300 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp301 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp302 from $t5 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp302 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp303 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp303 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 0($t1) 	# load with offset
	# _tmp304 = *(_tmp303 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp304 register is given $t2
	# the reference: _tmp303 is given $t0
	  lw $t2, 4($t0) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -44($fp)	# spill _tmp303 from $t0 to $fp-44
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp304
	# we clean all the regiser
	  sw $t2, -48($fp)	# spill _tmp304 from $t2 to $fp-48
	  lw $v0, -48($fp)	# fill _tmp304 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp305 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp305 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 0($t1) 	# load with offset
	# _tmp306 = *(_tmp305 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp306 register is given $t2
	# the reference: _tmp305 is given $t0
	  lw $t2, 8($t0) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -52($fp)	# spill _tmp305 from $t0 to $fp-52
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp307 = ACall _tmp306
	# we clean all the regiser
	  sw $t2, -56($fp)	# spill _tmp306 from $t2 to $fp-56
	  lw $v0, -56($fp)	# fill _tmp306 to $v0 from $fp-56
	  jalr $v0            	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -60($fp)	# spill _tmp307 from $t1 to $fp-60
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp308 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp309 = _tmp307 == _tmp308
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  seq $t2, $t1, $t0	
	# IfZ _tmp309 Goto _L32
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp308 from $t0 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp309 from $t2 to $fp-68
	  lw $t2, -68($fp)	# fill _tmp309 to $t2 from $fp-68
	  beqz $t2, _L32	# branch if _tmp309 is zero 
	# _tmp310 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# stillGoing = _tmp310
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# we clean all the regiser
	  sw $t3, -72($fp)	# spill _tmp310 from $t3 to $fp-72
	  sw $t4, -8($fp)	# spill stillGoing from $t4 to $fp-8
  _L33:
	# _tmp311 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp311 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp312 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 21
	  li $t2, 21		# load constant value 21 into $t2
	# _tmp313 = _tmp311 < _tmp312
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t0
	# the op2 is $t2
	  slt $t3, $t0, $t2	
	# _tmp314 = _tmp311 == _tmp312
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t2
	  seq $t4, $t0, $t2	
	# _tmp315 = _tmp313 || _tmp314
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  or $t5, $t3, $t4	
	# _tmp316 = _tmp315 && stillGoing
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t4
	  sw $t4, -88($fp)	# spill _tmp314 from $t4 to $fp-88
	  lw $t4, -8($fp)	# fill stillGoing to $t4 from $fp-8
	  and $t6, $t5, $t4	
	# IfZ _tmp316 Goto _L34
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp311 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp312 from $t2 to $fp-80
	  sw $t3, -84($fp)	# spill _tmp313 from $t3 to $fp-84
	  sw $t5, -92($fp)	# spill _tmp315 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp316 from $t6 to $fp-96
	  lw $t6, -96($fp)	# fill _tmp316 to $t6 from $fp-96
	  beqz $t6, _L34	# branch if _tmp316 is zero 
	# _tmp317 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp317 register is given $t7
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t7, 24($t1) 	# load with offset
	# PushParam _tmp317
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -100($fp)	# spill _tmp317 from $t7 to $fp-100
	  lw $t7, -100($fp)	# fill _tmp317 to $t7 from $fp-100
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp318 = ", your total is "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", your total is "
	  .data			# create string constant marked with label
	  _string24: .asciiz ", your total is "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string24
	  la $t0, _string24	# load label
	# PushParam _tmp318
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -104($fp)	# spill _tmp318 from $t0 to $fp-104
	  lw $t0, -104($fp)	# fill _tmp318 to $t0 from $fp-104
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp319 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp319 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp319
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -108($fp)	# spill _tmp319 from $t0 to $fp-108
	  lw $t0, -108($fp)	# fill _tmp319 to $t0 from $fp-108
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp320 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string25
	  la $t0, _string25	# load label
	# PushParam _tmp320
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -112($fp)	# spill _tmp320 from $t0 to $fp-112
	  lw $t0, -112($fp)	# fill _tmp320 to $t0 from $fp-112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp321 = "Would you like a hit?"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Would you like a hit?"
	  .data			# create string constant marked with label
	  _string26: .asciiz "Would you like a hit?"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string26
	  la $t0, _string26	# load label
	# PushParam _tmp321
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -116($fp)	# spill _tmp321 from $t0 to $fp-116
	  lw $t0, -116($fp)	# fill _tmp321 to $t0 from $fp-116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp322 = LCall _GetYesOrNo
	# we clean all the regiser
	  jal _GetYesOrNo    	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -120($fp)	# spill _tmp322 from $t1 to $fp-120
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# stillGoing = _tmp322
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t1
	  move $t4, $t1		# copy value from $t1 to $t4
	# IfZ stillGoing Goto _L35
	# we clean all the regiser
	  sw $t4, -8($fp)	# spill stillGoing from $t4 to $fp-8
	  lw $t4, -8($fp)	# fill stillGoing to $t4 from $fp-8
	  beqz $t4, _L35	# branch if stillGoing is zero 
	# _tmp323 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp323 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 0($t1) 	# load with offset
	# _tmp324 = *(_tmp323 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp324 register is given $t2
	# the reference: _tmp323 is given $t0
	  lw $t2, 4($t0) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -124($fp)	# spill _tmp323 from $t0 to $fp-124
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp324
	# we clean all the regiser
	  sw $t2, -128($fp)	# spill _tmp324 from $t2 to $fp-128
	  lw $v0, -128($fp)	# fill _tmp324 to $v0 from $fp-128
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# we clean all the regiser
  _L35:
	# Goto _L33
	# we clean all the regiser
	  b _L33		# unconditional branch
	# we clean all the regiser
  _L34:
	# we clean all the regiser
  _L32:
	# _tmp325 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp325 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp326 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 21
	  li $t2, 21		# load constant value 21 into $t2
	# _tmp327 = _tmp326 < _tmp325
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t2
	# the op2 is $t0
	  slt $t3, $t2, $t0	
	# IfZ _tmp327 Goto _L37
	# we clean all the regiser
	  sw $t0, -132($fp)	# spill _tmp325 from $t0 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp326 from $t2 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp327 from $t3 to $fp-140
	  lw $t3, -140($fp)	# fill _tmp327 to $t3 from $fp-140
	  beqz $t3, _L37	# branch if _tmp327 is zero 
	# _tmp328 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp328 register is given $t4
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t4, 24($t1) 	# load with offset
	# PushParam _tmp328
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -144($fp)	# spill _tmp328 from $t4 to $fp-144
	  lw $t4, -144($fp)	# fill _tmp328 to $t4 from $fp-144
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp329 = " busts with the big "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " busts with the big "
	  .data			# create string constant marked with label
	  _string27: .asciiz " busts with the big "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string27
	  la $t0, _string27	# load label
	# PushParam _tmp329
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -148($fp)	# spill _tmp329 from $t0 to $fp-148
	  lw $t0, -148($fp)	# fill _tmp329 to $t0 from $fp-148
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp330 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp330 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp330
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -152($fp)	# spill _tmp330 from $t0 to $fp-152
	  lw $t0, -152($fp)	# fill _tmp330 to $t0 from $fp-152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp331 = "!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "!\n"
	  .data			# create string constant marked with label
	  _string28: .asciiz "!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string28
	  la $t0, _string28	# load label
	# PushParam _tmp331
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -156($fp)	# spill _tmp331 from $t0 to $fp-156
	  lw $t0, -156($fp)	# fill _tmp331 to $t0 from $fp-156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L36
	# we clean all the regiser
	  b _L36		# unconditional branch
	# we clean all the regiser
  _L37:
	# _tmp332 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp332 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp332
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -160($fp)	# spill _tmp332 from $t0 to $fp-160
	  lw $t0, -160($fp)	# fill _tmp332 to $t0 from $fp-160
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp333 = " stays at "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " stays at "
	  .data			# create string constant marked with label
	  _string29: .asciiz " stays at "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string29
	  la $t0, _string29	# load label
	# PushParam _tmp333
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -164($fp)	# spill _tmp333 from $t0 to $fp-164
	  lw $t0, -164($fp)	# fill _tmp333 to $t0 from $fp-164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp334 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp334 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp334
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -168($fp)	# spill _tmp334 from $t0 to $fp-168
	  lw $t0, -168($fp)	# fill _tmp334 to $t0 from $fp-168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp335 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string30: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string30
	  la $t0, _string30	# load label
	# PushParam _tmp335
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -172($fp)	# spill _tmp335 from $t0 to $fp-172
	  lw $t0, -172($fp)	# fill _tmp335 to $t0 from $fp-172
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L36:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Player.HasMoney:
	# BeginFunc 12
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp336 = *(this + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp336 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 20($t1) 	# load with offset
	# _tmp337 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp338 = _tmp337 < _tmp336
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t2
	# the op2 is $t0
	  slt $t3, $t2, $t0	
	# Return _tmp338
	  move $v0, $t3		# assign return value into $v0
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
  _Player.PrintMoney:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp339 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp339 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp339
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp339 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp339 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp340 = ", you have $"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", you have $"
	  .data			# create string constant marked with label
	  _string31: .asciiz ", you have $"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string31
	  la $t0, _string31	# load label
	# PushParam _tmp340
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp340 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp340 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp341 = *(this + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp341 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 20($t1) 	# load with offset
	# PushParam _tmp341
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp341 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp341 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp342 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string32: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string32
	  la $t0, _string32	# load label
	# PushParam _tmp342
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -20($fp)	# spill _tmp342 from $t0 to $fp-20
	  lw $t0, -20($fp)	# fill _tmp342 to $t0 from $fp-20
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
  _Player.PlaceBet:
	# BeginFunc 56
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp343 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s3
	# the constant is 0
	  li $s3, 0		# load constant value 0 into $s3
	# *(this + 16) = _tmp343
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp343 is given $s3
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $s3, 16($t1) 	# store with offset
	# _tmp344 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp344 register is given $s4
	# the reference: this is given $t1
	  lw $s4, 0($t1) 	# load with offset
	# _tmp345 = *(_tmp344 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp345 register is given $s5
	# the reference: _tmp344 is given $s4
	  lw $s5, 20($s4) 	# load with offset
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp345
	# we clean all the regiser
	  sw $s3, -8($fp)	# spill _tmp343 from $s3 to $fp-8
	  sw $s4, -12($fp)	# spill _tmp344 from $s4 to $fp-12
	  sw $s5, -16($fp)	# spill _tmp345 from $s5 to $fp-16
	  lw $v0, -16($fp)	# fill _tmp345 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L38:
	# _tmp346 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp346 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 16($t1) 	# load with offset
	# _tmp347 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp348 = _tmp346 < _tmp347
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t0
	# the op2 is $t2
	  slt $t3, $t0, $t2	
	# _tmp349 = _tmp346 == _tmp347
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t2
	  seq $t4, $t0, $t2	
	# _tmp350 = _tmp348 || _tmp349
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  or $t5, $t3, $t4	
	# _tmp351 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp351 register is given $t6
	# the reference: this is given $t1
	  lw $t6, 16($t1) 	# load with offset
	# _tmp352 = *(this + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp352 register is given $t7
	# the reference: this is given $t1
	  lw $t7, 20($t1) 	# load with offset
	# _tmp353 = _tmp352 < _tmp351
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t6
	  slt $s0, $t7, $t6	
	# _tmp354 = _tmp350 || _tmp353
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  or $s1, $t5, $s0	
	# IfZ _tmp354 Goto _L39
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp346 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp347 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp348 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp349 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp350 from $t5 to $fp-36
	  sw $t6, -40($fp)	# spill _tmp351 from $t6 to $fp-40
	  sw $t7, -44($fp)	# spill _tmp352 from $t7 to $fp-44
	  sw $s0, -48($fp)	# spill _tmp353 from $s0 to $fp-48
	  sw $s1, -52($fp)	# spill _tmp354 from $s1 to $fp-52
	  lw $s1, -52($fp)	# fill _tmp354 to $s1 from $fp-52
	  beqz $s1, _L39	# branch if _tmp354 is zero 
	# _tmp355 = "How much would you like to bet? "
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string33: .asciiz "How much would you like to bet? "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string33
	  la $s2, _string33	# load label
	# PushParam _tmp355
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -56($fp)	# spill _tmp355 from $s2 to $fp-56
	  lw $s2, -56($fp)	# fill _tmp355 to $s2 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp356 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -60($fp)	# spill _tmp356 from $v0 to $fp-60
	# *(this + 16) = _tmp356
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp356 is given $spill
	  lw $v0, -60($fp)	# fill _tmp356 to $v0 from $fp-60
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $v0, 16($t1) 	# store with offset
	# Goto _L38
	# we clean all the regiser
	  b _L38		# unconditional branch
	# we clean all the regiser
  _L39:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Player.GetTotal:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp357 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp357 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# Return _tmp357
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
  _Player.Resolve:
	# BeginFunc 200
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 200	# decrement sp to make space for locals/temps
	# _tmp358 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -16($fp)	# spill _tmp358 from $v0 to $fp-16
	# win = _tmp358
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -16($fp)	# fill _tmp358 to $v0 from $fp-16
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill win from $v0 to $fp-8
	# _tmp359 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -20($fp)	# spill _tmp359 from $v0 to $fp-20
	# lose = _tmp359
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -20($fp)	# fill _tmp359 to $v0 from $fp-20
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -12($fp)	# spill lose from $v0 to $fp-12
	# _tmp360 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp360 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 4($t1) 	# load with offset
	  sw $v0, -24($fp)	# spill _tmp360 from $v0 to $fp-24
	# _tmp361 = 21
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 21
	  li $v0, 21		# load constant value 21 into $v0
	  sw $v0, -28($fp)	# spill _tmp361 from $v0 to $fp-28
	# _tmp362 = _tmp360 == _tmp361
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -24($fp)	# fill _tmp360 to $v0 from $fp-24
	  lw $v1, -28($fp)	# fill _tmp361 to $v1 from $fp-28
	  seq $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp362 from $v0 to $fp-32
	# _tmp363 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp363 register is given $spill
	# the reference: this is given $t1
	  lw $v0, 12($t1) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp363 from $v0 to $fp-36
	# _tmp364 = 2
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -40($fp)	# spill _tmp364 from $v0 to $fp-40
	# _tmp365 = _tmp363 == _tmp364
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -36($fp)	# fill _tmp363 to $v0 from $fp-36
	  lw $v1, -40($fp)	# fill _tmp364 to $v1 from $fp-40
	  seq $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp365 from $v0 to $fp-44
	# _tmp366 = _tmp362 && _tmp365
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -32($fp)	# fill _tmp362 to $v0 from $fp-32
	  lw $v1, -44($fp)	# fill _tmp365 to $v1 from $fp-44
	  and $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp366 from $v0 to $fp-48
	# IfZ _tmp366 Goto _L41
	# we clean all the regiser
	  lw $v0, -48($fp)	# fill _tmp366 to $v0 from $fp-48
	  beqz $v0, _L41	# branch if _tmp366 is zero 
	# _tmp367 = 2
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -52($fp)	# spill _tmp367 from $v0 to $fp-52
	# win = _tmp367
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -52($fp)	# fill _tmp367 to $v0 from $fp-52
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill win from $v0 to $fp-8
	# Goto _L40
	# we clean all the regiser
	  b _L40		# unconditional branch
	# we clean all the regiser
  _L41:
	# _tmp368 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp368 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp369 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 21
	  li $t2, 21		# load constant value 21 into $t2
	# _tmp370 = _tmp369 < _tmp368
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t2
	# the op2 is $t0
	  slt $t3, $t2, $t0	
	# IfZ _tmp370 Goto _L43
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp368 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp369 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp370 from $t3 to $fp-64
	  lw $t3, -64($fp)	# fill _tmp370 to $t3 from $fp-64
	  beqz $t3, _L43	# branch if _tmp370 is zero 
	# _tmp371 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# lose = _tmp371
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -12($fp)	# spill lose from $v0 to $fp-12
	# Goto _L42
	# we clean all the regiser
	  sw $t4, -68($fp)	# spill _tmp371 from $t4 to $fp-68
	  b _L42		# unconditional branch
	# we clean all the regiser
  _L43:
	# _tmp372 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 21
	  li $t0, 21		# load constant value 21 into $t0
	# _tmp373 = _tmp372 < dealer
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	# IfZ _tmp373 Goto _L45
	# we clean all the regiser
	  sw $t0, -72($fp)	# spill _tmp372 from $t0 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp373 from $t2 to $fp-76
	  lw $t2, -76($fp)	# fill _tmp373 to $t2 from $fp-76
	  beqz $t2, _L45	# branch if _tmp373 is zero 
	# _tmp374 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# win = _tmp374
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -8($fp)	# spill win from $v0 to $fp-8
	# Goto _L44
	# we clean all the regiser
	  sw $t3, -80($fp)	# spill _tmp374 from $t3 to $fp-80
	  b _L44		# unconditional branch
	# we clean all the regiser
  _L45:
	# _tmp375 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp375 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp376 = dealer < _tmp375
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t0
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t1, $t0	
	# IfZ _tmp376 Goto _L47
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp375 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp376 from $t2 to $fp-88
	  lw $t2, -88($fp)	# fill _tmp376 to $t2 from $fp-88
	  beqz $t2, _L47	# branch if _tmp376 is zero 
	# _tmp377 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# win = _tmp377
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -8($fp)	# spill win from $v0 to $fp-8
	# Goto _L46
	# we clean all the regiser
	  sw $t3, -92($fp)	# spill _tmp377 from $t3 to $fp-92
	  b _L46		# unconditional branch
	# we clean all the regiser
  _L47:
	# _tmp378 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp378 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp379 = _tmp378 < dealer
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  lw $t1, 8($fp)	# fill dealer to $t1 from $fp+8
	  slt $t2, $t0, $t1	
	# IfZ _tmp379 Goto _L48
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp378 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp379 from $t2 to $fp-100
	  lw $t2, -100($fp)	# fill _tmp379 to $t2 from $fp-100
	  beqz $t2, _L48	# branch if _tmp379 is zero 
	# _tmp380 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# lose = _tmp380
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -12($fp)	# spill lose from $v0 to $fp-12
	# we clean all the regiser
	  sw $t3, -104($fp)	# spill _tmp380 from $t3 to $fp-104
  _L48:
	# we clean all the regiser
  _L46:
	# we clean all the regiser
  _L44:
	# we clean all the regiser
  _L42:
	# we clean all the regiser
  _L40:
	# _tmp381 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp382 = _tmp381 < win
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill win to $v1 from $fp-8
	  slt $t1, $t0, $v1	
	# _tmp383 = win == _tmp381
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill win to $v0 from $fp-8
	  seq $t2, $v0, $t0	
	# _tmp384 = _tmp382 || _tmp383
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  or $t3, $t1, $t2	
	# IfZ _tmp384 Goto _L50
	# we clean all the regiser
	  sw $t0, -108($fp)	# spill _tmp381 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp382 from $t1 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp383 from $t2 to $fp-116
	  sw $t3, -120($fp)	# spill _tmp384 from $t3 to $fp-120
	  lw $t3, -120($fp)	# fill _tmp384 to $t3 from $fp-120
	  beqz $t3, _L50	# branch if _tmp384 is zero 
	# _tmp385 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp385 register is given $t4
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t4, 24($t1) 	# load with offset
	# PushParam _tmp385
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -124($fp)	# spill _tmp385 from $t4 to $fp-124
	  lw $t4, -124($fp)	# fill _tmp385 to $t4 from $fp-124
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp386 = ", you won $"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", you won $"
	  .data			# create string constant marked with label
	  _string34: .asciiz ", you won $"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string34
	  la $t0, _string34	# load label
	# PushParam _tmp386
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -128($fp)	# spill _tmp386 from $t0 to $fp-128
	  lw $t0, -128($fp)	# fill _tmp386 to $t0 from $fp-128
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp387 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp387 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 16($t1) 	# load with offset
	# PushParam _tmp387
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -132($fp)	# spill _tmp387 from $t0 to $fp-132
	  lw $t0, -132($fp)	# fill _tmp387 to $t0 from $fp-132
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp388 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string35: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string35
	  la $t0, _string35	# load label
	# PushParam _tmp388
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -136($fp)	# spill _tmp388 from $t0 to $fp-136
	  lw $t0, -136($fp)	# fill _tmp388 to $t0 from $fp-136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L49
	# we clean all the regiser
	  b _L49		# unconditional branch
	# we clean all the regiser
  _L50:
	# _tmp389 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp390 = _tmp389 < lose
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill lose to $v1 from $fp-12
	  slt $t1, $t0, $v1	
	# _tmp391 = lose == _tmp389
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill lose to $v0 from $fp-12
	  seq $t2, $v0, $t0	
	# _tmp392 = _tmp390 || _tmp391
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  or $t3, $t1, $t2	
	# IfZ _tmp392 Goto _L52
	# we clean all the regiser
	  sw $t0, -140($fp)	# spill _tmp389 from $t0 to $fp-140
	  sw $t1, -144($fp)	# spill _tmp390 from $t1 to $fp-144
	  sw $t2, -148($fp)	# spill _tmp391 from $t2 to $fp-148
	  sw $t3, -152($fp)	# spill _tmp392 from $t3 to $fp-152
	  lw $t3, -152($fp)	# fill _tmp392 to $t3 from $fp-152
	  beqz $t3, _L52	# branch if _tmp392 is zero 
	# _tmp393 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp393 register is given $t4
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t4, 24($t1) 	# load with offset
	# PushParam _tmp393
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -156($fp)	# spill _tmp393 from $t4 to $fp-156
	  lw $t4, -156($fp)	# fill _tmp393 to $t4 from $fp-156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp394 = ", you lost $"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", you lost $"
	  .data			# create string constant marked with label
	  _string36: .asciiz ", you lost $"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string36
	  la $t0, _string36	# load label
	# PushParam _tmp394
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -160($fp)	# spill _tmp394 from $t0 to $fp-160
	  lw $t0, -160($fp)	# fill _tmp394 to $t0 from $fp-160
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp395 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp395 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 16($t1) 	# load with offset
	# PushParam _tmp395
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -164($fp)	# spill _tmp395 from $t0 to $fp-164
	  lw $t0, -164($fp)	# fill _tmp395 to $t0 from $fp-164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp396 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string37: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string37
	  la $t0, _string37	# load label
	# PushParam _tmp396
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -168($fp)	# spill _tmp396 from $t0 to $fp-168
	  lw $t0, -168($fp)	# fill _tmp396 to $t0 from $fp-168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L51
	# we clean all the regiser
	  b _L51		# unconditional branch
	# we clean all the regiser
  _L52:
	# _tmp397 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp397 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp397
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -172($fp)	# spill _tmp397 from $t0 to $fp-172
	  lw $t0, -172($fp)	# fill _tmp397 to $t0 from $fp-172
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp398 = ", you push!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ", you push!\n"
	  .data			# create string constant marked with label
	  _string38: .asciiz ", you push!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string38
	  la $t0, _string38	# load label
	# PushParam _tmp398
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -176($fp)	# spill _tmp398 from $t0 to $fp-176
	  lw $t0, -176($fp)	# fill _tmp398 to $t0 from $fp-176
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L51:
	# we clean all the regiser
  _L49:
	# _tmp399 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp399 register is given $spill
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $v0, 16($t1) 	# load with offset
	  sw $v0, -180($fp)	# spill _tmp399 from $v0 to $fp-180
	# _tmp400 = win * _tmp399
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -8($fp)	# fill win to $v0 from $fp-8
	  lw $v1, -180($fp)	# fill _tmp399 to $v1 from $fp-180
	  mul $v0, $v0, $v1	
	  sw $v0, -184($fp)	# spill _tmp400 from $v0 to $fp-184
	# win = _tmp400
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -184($fp)	# fill _tmp400 to $v0 from $fp-184
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill win from $v0 to $fp-8
	# _tmp401 = *(this + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp401 register is given $spill
	# the reference: this is given $t1
	  lw $v0, 16($t1) 	# load with offset
	  sw $v0, -188($fp)	# spill _tmp401 from $v0 to $fp-188
	# _tmp402 = lose * _tmp401
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -12($fp)	# fill lose to $v0 from $fp-12
	  lw $v1, -188($fp)	# fill _tmp401 to $v1 from $fp-188
	  mul $v0, $v0, $v1	
	  sw $v0, -192($fp)	# spill _tmp402 from $v0 to $fp-192
	# lose = _tmp402
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -192($fp)	# fill _tmp402 to $v0 from $fp-192
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -12($fp)	# spill lose from $v0 to $fp-12
	# _tmp403 = *(this + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp403 register is given $spill
	# the reference: this is given $t1
	  lw $v0, 20($t1) 	# load with offset
	  sw $v0, -196($fp)	# spill _tmp403 from $v0 to $fp-196
	# _tmp404 = _tmp403 + win
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -196($fp)	# fill _tmp403 to $v0 from $fp-196
	  lw $v1, -8($fp)	# fill win to $v1 from $fp-8
	  add $v0, $v0, $v1	
	  sw $v0, -200($fp)	# spill _tmp404 from $v0 to $fp-200
	# _tmp405 = _tmp404 - lose
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -200($fp)	# fill _tmp404 to $v0 from $fp-200
	  lw $v1, -12($fp)	# fill lose to $v1 from $fp-12
	  sub $v0, $v0, $v1	
	  sw $v0, -204($fp)	# spill _tmp405 from $v0 to $fp-204
	# *(this + 20) = _tmp405
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: _tmp405 is given $spill
	  lw $v0, -204($fp)	# fill _tmp405 to $v0 from $fp-204
	  sw $v0, 20($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word _Player.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Player.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Dealer.Init:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp406 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# *(this + 4) = _tmp406
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp406 is given $t0
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t0, 4($t3) 	# store with offset
	# _tmp407 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# *(this + 8) = _tmp407
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp407 is given $t1
	  sw $t1, 8($t3) 	# store with offset
	# _tmp408 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# *(this + 12) = _tmp408
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp408 is given $t2
	  sw $t2, 12($t3) 	# store with offset
	# _tmp409 = "Dealer"
	# We are in the LoadString
	# so, the dst register is given $t4
	# the String is "Dealer"
	  .data			# create string constant marked with label
	  _string39: .asciiz "Dealer"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t4
	# the label is _string39
	  la $t4, _string39	# load label
	# *(this + 24) = _tmp409
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp409 is given $t4
	  sw $t4, 24($t3) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Dealer.TakeTurn:
	# BeginFunc 88
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp410 = "\n"
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string40: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string40
	  la $s0, _string40	# load label
	# PushParam _tmp410
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -8($fp)	# spill _tmp410 from $s0 to $fp-8
	  lw $s0, -8($fp)	# fill _tmp410 to $s0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp411 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp411 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp411
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp411 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp411 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp412 = "'s turn.\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "'s turn.\n"
	  .data			# create string constant marked with label
	  _string41: .asciiz "'s turn.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string41
	  la $t0, _string41	# load label
	# PushParam _tmp412
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp412 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp412 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L53:
	# _tmp413 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp413 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp414 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 16
	  li $t2, 16		# load constant value 16 into $t2
	# _tmp415 = _tmp413 < _tmp414
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t0
	# the op2 is $t2
	  slt $t3, $t0, $t2	
	# _tmp416 = _tmp413 == _tmp414
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t0
	# the op2 is $t2
	  seq $t4, $t0, $t2	
	# _tmp417 = _tmp415 || _tmp416
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  or $t5, $t3, $t4	
	# IfZ _tmp417 Goto _L54
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp413 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp414 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp415 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp416 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp417 from $t5 to $fp-36
	  lw $t5, -36($fp)	# fill _tmp417 to $t5 from $fp-36
	  beqz $t5, _L54	# branch if _tmp417 is zero 
	# _tmp418 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp418 register is given $t6
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t6, 0($t1) 	# load with offset
	# _tmp419 = *(_tmp418 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp419 register is given $t7
	# the reference: _tmp418 is given $t6
	  lw $t7, 4($t6) 	# load with offset
	# PushParam deck
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill deck to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp419
	# we clean all the regiser
	  sw $t6, -40($fp)	# spill _tmp418 from $t6 to $fp-40
	  sw $t7, -44($fp)	# spill _tmp419 from $t7 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp419 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L53
	# we clean all the regiser
	  b _L53		# unconditional branch
	# we clean all the regiser
  _L54:
	# _tmp420 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp420 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# _tmp421 = 21
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 21
	  li $t2, 21		# load constant value 21 into $t2
	# _tmp422 = _tmp421 < _tmp420
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t2
	# the op2 is $t0
	  slt $t3, $t2, $t0	
	# IfZ _tmp422 Goto _L56
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp420 from $t0 to $fp-48
	  sw $t2, -52($fp)	# spill _tmp421 from $t2 to $fp-52
	  sw $t3, -56($fp)	# spill _tmp422 from $t3 to $fp-56
	  lw $t3, -56($fp)	# fill _tmp422 to $t3 from $fp-56
	  beqz $t3, _L56	# branch if _tmp422 is zero 
	# _tmp423 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp423 register is given $t4
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t4, 24($t1) 	# load with offset
	# PushParam _tmp423
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -60($fp)	# spill _tmp423 from $t4 to $fp-60
	  lw $t4, -60($fp)	# fill _tmp423 to $t4 from $fp-60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp424 = " busts with the big "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " busts with the big "
	  .data			# create string constant marked with label
	  _string42: .asciiz " busts with the big "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string42
	  la $t0, _string42	# load label
	# PushParam _tmp424
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -64($fp)	# spill _tmp424 from $t0 to $fp-64
	  lw $t0, -64($fp)	# fill _tmp424 to $t0 from $fp-64
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp425 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp425 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp425
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -68($fp)	# spill _tmp425 from $t0 to $fp-68
	  lw $t0, -68($fp)	# fill _tmp425 to $t0 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp426 = "!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "!\n"
	  .data			# create string constant marked with label
	  _string43: .asciiz "!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string43
	  la $t0, _string43	# load label
	# PushParam _tmp426
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -72($fp)	# spill _tmp426 from $t0 to $fp-72
	  lw $t0, -72($fp)	# fill _tmp426 to $t0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L55
	# we clean all the regiser
	  b _L55		# unconditional branch
	# we clean all the regiser
  _L56:
	# _tmp427 = *(this + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp427 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 24($t1) 	# load with offset
	# PushParam _tmp427
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -76($fp)	# spill _tmp427 from $t0 to $fp-76
	  lw $t0, -76($fp)	# fill _tmp427 to $t0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp428 = " stays at "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " stays at "
	  .data			# create string constant marked with label
	  _string44: .asciiz " stays at "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string44
	  la $t0, _string44	# load label
	# PushParam _tmp428
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -80($fp)	# spill _tmp428 from $t0 to $fp-80
	  lw $t0, -80($fp)	# fill _tmp428 to $t0 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp429 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp429 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp429
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -84($fp)	# spill _tmp429 from $t0 to $fp-84
	  lw $t0, -84($fp)	# fill _tmp429 to $t0 from $fp-84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp430 = ".\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ".\n"
	  .data			# create string constant marked with label
	  _string45: .asciiz ".\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string45
	  la $t0, _string45	# load label
	# PushParam _tmp430
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -88($fp)	# spill _tmp430 from $t0 to $fp-88
	  lw $t0, -88($fp)	# fill _tmp430 to $t0 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L55:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Dealer
	  .data
	  .align 2
	  Dealer:		# label for class Dealer vtable
	  .word _Dealer.Init
	  .word _Player.Hit
	  .word _Player.DoubleDown
	  .word _Dealer.TakeTurn
	  .word _Player.HasMoney
	  .word _Player.PrintMoney
	  .word _Player.PlaceBet
	  .word _Player.GetTotal
	  .word _Player.Resolve
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _House.SetupGame:
	# BeginFunc 84
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp431 = "\nWelcome to CS143 BlackJack!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\nWelcome to CS143 BlackJack!\n"
	  .data			# create string constant marked with label
	  _string46: .asciiz "\nWelcome to CS143 BlackJack!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string46
	  la $t0, _string46	# load label
	# PushParam _tmp431
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp431 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp431 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp432 = "---------------------------\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "---------------------------\n"
	  .data			# create string constant marked with label
	  _string47: .asciiz "---------------------------\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string47
	  la $t0, _string47	# load label
	# PushParam _tmp432
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp432 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp432 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp433 = 8
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp433
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp433 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp433 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp434 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -20($fp)	# spill _tmp434 from $t3 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp435 = Random
	# We are in the LoadLabel
	# so, the dst register is given $t1
	# the label is Random
	  la $t1, Random	# load label
	# *(_tmp434) = _tmp435
	# We are in the EmitStore
	# so, the reference: _tmp434 register is given $t3
	# the value: _tmp435 is given $t1
	  sw $t1, 0($t3) 	# store with offset
	# gRnd = _tmp434
	# We are in the EmitCopy
	# so, the dst register is given $t0
	# the src is $t3
	  move $t0, $t3		# copy value from $t3 to $t0
	# _tmp436 = "Please enter a random number seed: "
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string48: .asciiz "Please enter a random number seed: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string48
	  la $t2, _string48	# load label
	# PushParam _tmp436
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -28($fp)	# spill _tmp436 from $t2 to $fp-28
	  lw $t2, -28($fp)	# fill _tmp436 to $t2 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, 0($gp)	# spill gRnd from $t0 to $gp+0
	  sw $t1, -24($fp)	# spill _tmp435 from $t1 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp437 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -32($fp)	# spill _tmp437 from $t0 to $fp-32
	# _tmp438 = *(gRnd)
	# We are in the EmitLoad
	# so, the dst: _tmp438 register is given $t1
	# the reference: gRnd is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp439 = *(_tmp438)
	# We are in the EmitLoad
	# so, the dst: _tmp439 register is given $t2
	# the reference: _tmp438 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam _tmp437
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -32($fp)	# fill _tmp437 to $t0 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam gRnd
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 0($gp)	# fill gRnd to $t0 from $gp+0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp439
	# we clean all the regiser
	  sw $t1, -36($fp)	# spill _tmp438 from $t1 to $fp-36
	  sw $t2, -40($fp)	# spill _tmp439 from $t2 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp439 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp440 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 12
	  li $t3, 12		# load constant value 12 into $t3
	# PushParam _tmp440
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -44($fp)	# spill _tmp440 from $t3 to $fp-44
	  lw $t3, -44($fp)	# fill _tmp440 to $t3 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp441 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -48($fp)	# spill _tmp441 from $t6 to $fp-48
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp442 = BJDeck
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is BJDeck
	  la $t0, BJDeck	# load label
	# *(_tmp441) = _tmp442
	# We are in the EmitStore
	# so, the reference: _tmp441 register is given $t6
	# the value: _tmp442 is given $t0
	  sw $t0, 0($t6) 	# store with offset
	# *(this + 12) = _tmp441
	# We are in the EmitStore
	# so, the reference: this register is given $t4
	# the value: _tmp441 is given $t6
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t6, 12($t4) 	# store with offset
	# _tmp443 = 28
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 28
	  li $t1, 28		# load constant value 28 into $t1
	# PushParam _tmp443
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -56($fp)	# spill _tmp443 from $t1 to $fp-56
	  lw $t1, -56($fp)	# fill _tmp443 to $t1 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp444 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp442 from $t0 to $fp-52
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -60($fp)	# spill _tmp444 from $t5 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp445 = Dealer
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Dealer
	  la $t0, Dealer	# load label
	# *(_tmp444) = _tmp445
	# We are in the EmitStore
	# so, the reference: _tmp444 register is given $t5
	# the value: _tmp445 is given $t0
	  sw $t0, 0($t5) 	# store with offset
	# *(this + 8) = _tmp444
	# We are in the EmitStore
	# so, the reference: this register is given $t4
	# the value: _tmp444 is given $t5
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t5, 8($t4) 	# store with offset
	# _tmp446 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp446 register is given $t1
	# the reference: this is given $t4
	  lw $t1, 12($t4) 	# load with offset
	# _tmp447 = *(_tmp446)
	# We are in the EmitLoad
	# so, the dst: _tmp447 register is given $t2
	# the reference: _tmp446 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp448 = *(_tmp447)
	# We are in the EmitLoad
	# so, the dst: _tmp448 register is given $t3
	# the reference: _tmp447 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp446
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -68($fp)	# spill _tmp446 from $t1 to $fp-68
	  lw $t1, -68($fp)	# fill _tmp446 to $t1 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp448
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp445 from $t0 to $fp-64
	  sw $t2, -72($fp)	# spill _tmp447 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp448 from $t3 to $fp-76
	  lw $v0, -76($fp)	# fill _tmp448 to $v0 from $fp-76
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp449 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp449 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 12($t4) 	# load with offset
	# _tmp450 = *(_tmp449)
	# We are in the EmitLoad
	# so, the dst: _tmp450 register is given $t1
	# the reference: _tmp449 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp451 = *(_tmp450 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp451 register is given $t2
	# the reference: _tmp450 is given $t1
	  lw $t2, 8($t1) 	# load with offset
	# PushParam _tmp449
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -80($fp)	# spill _tmp449 from $t0 to $fp-80
	  lw $t0, -80($fp)	# fill _tmp449 to $t0 from $fp-80
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp451
	# we clean all the regiser
	  sw $t1, -84($fp)	# spill _tmp450 from $t1 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp451 from $t2 to $fp-88
	  lw $v0, -88($fp)	# fill _tmp451 to $v0 from $fp-88
	  jalr $v0            	# jump to function
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
  _House.SetupPlayers:
	# BeginFunc 200
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 200	# decrement sp to make space for locals/temps
	# _tmp452 = "How many players do we have today? "
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "How many players do we have today? "
	  .data			# create string constant marked with label
	  _string49: .asciiz "How many players do we have today? "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string49
	  la $v0, _string49	# load label
	  sw $v0, -16($fp)	# spill _tmp452 from $v0 to $fp-16
	# PushParam _tmp452
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -16($fp)	# fill _tmp452 to $v0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp453 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -20($fp)	# spill _tmp453 from $t0 to $fp-20
	# numPlayers = _tmp453
	# We are in the EmitCopy
	# so, the dst register is given $t6
	# the src is $t0
	  move $t6, $t0		# copy value from $t0 to $t6
	# _tmp454 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp455 = numPlayers < _tmp454
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  slt $t2, $t6, $t1	
	# IfZ _tmp455 Goto _L57
	# we clean all the regiser
	  sw $t1, -24($fp)	# spill _tmp454 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp455 from $t2 to $fp-28
	  sw $t6, -12($fp)	# spill numPlayers from $t6 to $fp-12
	  lw $t2, -28($fp)	# fill _tmp455 to $t2 from $fp-28
	  beqz $t2, _L57	# branch if _tmp455 is zero 
	# _tmp456 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string50: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string50
	  la $t3, _string50	# load label
	# PushParam _tmp456
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -32($fp)	# spill _tmp456 from $t3 to $fp-32
	  lw $t3, -32($fp)	# fill _tmp456 to $t3 from $fp-32
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
  _L57:
	# _tmp457 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp458 = _tmp457 + numPlayers
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t6
	  lw $t6, -12($fp)	# fill numPlayers to $t6 from $fp-12
	  add $t1, $t0, $t6	
	# _tmp459 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp460 = _tmp458 * _tmp459
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  mul $t3, $t1, $t2	
	# PushParam _tmp460
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -48($fp)	# spill _tmp460 from $t3 to $fp-48
	  lw $t3, -48($fp)	# fill _tmp460 to $t3 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp461 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -36($fp)	# spill _tmp457 from $t0 to $fp-36
	  sw $t1, -40($fp)	# spill _tmp458 from $t1 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp459 from $t2 to $fp-44
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -52($fp)	# spill _tmp461 from $t5 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp461) = numPlayers
	# We are in the EmitStore
	# so, the reference: _tmp461 register is given $t5
	# the value: numPlayers is given $t6
	  lw $t6, -12($fp)	# fill numPlayers to $t6 from $fp-12
	  sw $t6, 0($t5) 	# store with offset
	# _tmp462 = _tmp461 + _tmp459
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $t5
	# the op2 is $t2
	  lw $t2, -44($fp)	# fill _tmp459 to $t2 from $fp-44
	  add $t0, $t5, $t2	
	# *(this + 4) = _tmp462
	# We are in the EmitStore
	# so, the reference: this register is given $t4
	# the value: _tmp462 is given $t0
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t0, 4($t4) 	# store with offset
	# _tmp463 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# i = _tmp463
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp462 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp463 from $t1 to $fp-60
  _L58:
	# _tmp464 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp464 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp465 = *(_tmp464 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp465 register is given $t1
	# the reference: _tmp464 is given $t0
	  lw $t1, -4($t0) 	# load with offset
	# _tmp466 = i < _tmp465
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# IfZ _tmp466 Goto _L59
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp464 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp465 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp466 from $t2 to $fp-72
	  lw $t2, -72($fp)	# fill _tmp466 to $t2 from $fp-72
	  beqz $t2, _L59	# branch if _tmp466 is zero 
	# _tmp467 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp467 register is given $t3
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t3, 4($t4) 	# load with offset
	# _tmp468 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp469 = i < _tmp468
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t5
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t6, $v0, $t5	
	# _tmp470 = *(_tmp467 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp470 register is given $t7
	# the reference: _tmp467 is given $t3
	  lw $t7, -4($t3) 	# load with offset
	# _tmp471 = i < _tmp470
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $spill
	# the op2 is $t7
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $s0, $v0, $t7	
	# _tmp472 = _tmp471 == _tmp468
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t5
	  seq $s1, $s0, $t5	
	# _tmp473 = _tmp469 || _tmp472
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t6
	# the op2 is $s1
	  or $s2, $t6, $s1	
	# IfZ _tmp473 Goto _L60
	# we clean all the regiser
	  sw $t3, -76($fp)	# spill _tmp467 from $t3 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp468 from $t5 to $fp-80
	  sw $t6, -84($fp)	# spill _tmp469 from $t6 to $fp-84
	  sw $t7, -88($fp)	# spill _tmp470 from $t7 to $fp-88
	  sw $s0, -92($fp)	# spill _tmp471 from $s0 to $fp-92
	  sw $s1, -96($fp)	# spill _tmp472 from $s1 to $fp-96
	  sw $s2, -100($fp)	# spill _tmp473 from $s2 to $fp-100
	  lw $s2, -100($fp)	# fill _tmp473 to $s2 from $fp-100
	  beqz $s2, _L60	# branch if _tmp473 is zero 
	# _tmp474 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string51: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string51
	  la $s3, _string51	# load label
	# PushParam _tmp474
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -104($fp)	# spill _tmp474 from $s3 to $fp-104
	  lw $s3, -104($fp)	# fill _tmp474 to $s3 from $fp-104
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
  _L60:
	# _tmp475 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp476 = _tmp475 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp477 = _tmp467 + _tmp476
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t1
	  lw $t3, -76($fp)	# fill _tmp467 to $t3 from $fp-76
	  add $t4, $t3, $t1	
	# _tmp478 = 28
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 28
	  li $t2, 28		# load constant value 28 into $t2
	# PushParam _tmp478
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -120($fp)	# spill _tmp478 from $t2 to $fp-120
	  lw $t2, -120($fp)	# fill _tmp478 to $t2 from $fp-120
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp479 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -108($fp)	# spill _tmp475 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp476 from $t1 to $fp-112
	  sw $t4, -116($fp)	# spill _tmp477 from $t4 to $fp-116
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -124($fp)	# spill _tmp479 from $v0 to $fp-124
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp480 = Player
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Player
	  la $t0, Player	# load label
	# *(_tmp479) = _tmp480
	# We are in the EmitStore
	# so, the reference: _tmp479 register is given $spill
	# the value: _tmp480 is given $t0
	  lw $v1, -124($fp)	# fill _tmp479 to $v1 from $fp-124
	  sw $t0, 0($v1) 	# store with offset
	# *(_tmp477) = _tmp479
	# We are in the EmitStore
	# so, the reference: _tmp477 register is given $t4
	# the value: _tmp479 is given $spill
	  lw $v0, -124($fp)	# fill _tmp479 to $v0 from $fp-124
	  lw $t4, -116($fp)	# fill _tmp477 to $t4 from $fp-116
	  sw $v0, 0($t4) 	# store with offset
	# _tmp481 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp482 = i + _tmp481
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp483 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp483 register is given $s0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $s0, 4($t4) 	# load with offset
	# _tmp484 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp485 = i < _tmp484
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp486 = *(_tmp483 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp486 register is given $t6
	# the reference: _tmp483 is given $s0
	  lw $t6, -4($s0) 	# load with offset
	# _tmp487 = i < _tmp486
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t7, $v0, $t6	
	# _tmp488 = _tmp487 == _tmp484
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t7
	# the op2 is $t3
	  seq $s1, $t7, $t3	
	# _tmp489 = _tmp485 || _tmp488
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp489 Goto _L61
	# we clean all the regiser
	  sw $t0, -128($fp)	# spill _tmp480 from $t0 to $fp-128
	  sw $t1, -132($fp)	# spill _tmp481 from $t1 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp482 from $t2 to $fp-136
	  sw $t3, -144($fp)	# spill _tmp484 from $t3 to $fp-144
	  sw $t5, -148($fp)	# spill _tmp485 from $t5 to $fp-148
	  sw $t6, -152($fp)	# spill _tmp486 from $t6 to $fp-152
	  sw $t7, -156($fp)	# spill _tmp487 from $t7 to $fp-156
	  sw $s0, -140($fp)	# spill _tmp483 from $s0 to $fp-140
	  sw $s1, -160($fp)	# spill _tmp488 from $s1 to $fp-160
	  sw $s2, -164($fp)	# spill _tmp489 from $s2 to $fp-164
	  lw $s2, -164($fp)	# fill _tmp489 to $s2 from $fp-164
	  beqz $s2, _L61	# branch if _tmp489 is zero 
	# _tmp490 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string52: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string52
	  la $s3, _string52	# load label
	# PushParam _tmp490
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -168($fp)	# spill _tmp490 from $s3 to $fp-168
	  lw $s3, -168($fp)	# fill _tmp490 to $s3 from $fp-168
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
  _L61:
	# _tmp491 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp492 = _tmp491 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp493 = _tmp483 + _tmp492
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s0
	# the op2 is $t1
	  lw $s0, -140($fp)	# fill _tmp483 to $s0 from $fp-140
	  add $t2, $s0, $t1	
	# _tmp494 = *(_tmp493)
	# We are in the EmitLoad
	# so, the dst: _tmp494 register is given $t3
	# the reference: _tmp493 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp495 = *(_tmp494)
	# We are in the EmitLoad
	# so, the dst: _tmp495 register is given $t4
	# the reference: _tmp494 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp496 = *(_tmp495)
	# We are in the EmitLoad
	# so, the dst: _tmp496 register is given $t5
	# the reference: _tmp495 is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp482
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -180($fp)	# spill _tmp493 from $t2 to $fp-180
	  lw $t2, -136($fp)	# fill _tmp482 to $t2 from $fp-136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp494
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -184($fp)	# spill _tmp494 from $t3 to $fp-184
	  lw $t3, -184($fp)	# fill _tmp494 to $t3 from $fp-184
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp496
	# we clean all the regiser
	  sw $t0, -172($fp)	# spill _tmp491 from $t0 to $fp-172
	  sw $t1, -176($fp)	# spill _tmp492 from $t1 to $fp-176
	  sw $t4, -188($fp)	# spill _tmp495 from $t4 to $fp-188
	  sw $t5, -192($fp)	# spill _tmp496 from $t5 to $fp-192
	  lw $v0, -192($fp)	# fill _tmp496 to $v0 from $fp-192
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp497 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp498 = i + _tmp497
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t7, $v0, $t6	
	# i = _tmp498
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t7
	  move $v0, $t7		# copy value from $t7 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L58
	# we clean all the regiser
	  sw $t6, -196($fp)	# spill _tmp497 from $t6 to $fp-196
	  sw $t7, -200($fp)	# spill _tmp498 from $t7 to $fp-200
	  b _L58		# unconditional branch
	# we clean all the regiser
  _L59:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _House.TakeAllBets:
	# BeginFunc 152
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp499 = "\nFirst, let's take bets.\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "\nFirst, let's take bets.\n"
	  .data			# create string constant marked with label
	  _string53: .asciiz "\nFirst, let's take bets.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string53
	  la $v0, _string53	# load label
	  sw $v0, -12($fp)	# spill _tmp499 from $v0 to $fp-12
	# PushParam _tmp499
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill _tmp499 to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp500 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp500
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp500 from $t0 to $fp-16
  _L62:
	# _tmp501 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp501 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp502 = *(_tmp501 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp502 register is given $t1
	# the reference: _tmp501 is given $t0
	  lw $t1, -4($t0) 	# load with offset
	# _tmp503 = i < _tmp502
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# IfZ _tmp503 Goto _L63
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp501 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp502 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp503 from $t2 to $fp-28
	  lw $t2, -28($fp)	# fill _tmp503 to $t2 from $fp-28
	  beqz $t2, _L63	# branch if _tmp503 is zero 
	# _tmp504 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp504 register is given $t6
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t6, 4($t4) 	# load with offset
	# _tmp505 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp506 = i < _tmp505
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp507 = *(_tmp504 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp507 register is given $t7
	# the reference: _tmp504 is given $t6
	  lw $t7, -4($t6) 	# load with offset
	# _tmp508 = i < _tmp507
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $spill
	# the op2 is $t7
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $s0, $v0, $t7	
	# _tmp509 = _tmp508 == _tmp505
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t3
	  seq $s1, $s0, $t3	
	# _tmp510 = _tmp506 || _tmp509
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp510 Goto _L65
	# we clean all the regiser
	  sw $t3, -36($fp)	# spill _tmp505 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp506 from $t5 to $fp-40
	  sw $t6, -32($fp)	# spill _tmp504 from $t6 to $fp-32
	  sw $t7, -44($fp)	# spill _tmp507 from $t7 to $fp-44
	  sw $s0, -48($fp)	# spill _tmp508 from $s0 to $fp-48
	  sw $s1, -52($fp)	# spill _tmp509 from $s1 to $fp-52
	  sw $s2, -56($fp)	# spill _tmp510 from $s2 to $fp-56
	  lw $s2, -56($fp)	# fill _tmp510 to $s2 from $fp-56
	  beqz $s2, _L65	# branch if _tmp510 is zero 
	# _tmp511 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string54: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string54
	  la $s3, _string54	# load label
	# PushParam _tmp511
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -60($fp)	# spill _tmp511 from $s3 to $fp-60
	  lw $s3, -60($fp)	# fill _tmp511 to $s3 from $fp-60
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
  _L65:
	# _tmp512 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp513 = _tmp512 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp514 = _tmp504 + _tmp513
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -32($fp)	# fill _tmp504 to $t6 from $fp-32
	  add $t2, $t6, $t1	
	# _tmp515 = *(_tmp514)
	# We are in the EmitLoad
	# so, the dst: _tmp515 register is given $t3
	# the reference: _tmp514 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp516 = *(_tmp515)
	# We are in the EmitLoad
	# so, the dst: _tmp516 register is given $t4
	# the reference: _tmp515 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp517 = *(_tmp516 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp517 register is given $t5
	# the reference: _tmp516 is given $t4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp515
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -76($fp)	# spill _tmp515 from $t3 to $fp-76
	  lw $t3, -76($fp)	# fill _tmp515 to $t3 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp518 = ACall _tmp517
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp512 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp513 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp514 from $t2 to $fp-72
	  sw $t4, -80($fp)	# spill _tmp516 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp517 from $t5 to $fp-84
	  lw $v0, -84($fp)	# fill _tmp517 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -88($fp)	# spill _tmp518 from $v0 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp518 Goto _L64
	# we clean all the regiser
	  lw $v0, -88($fp)	# fill _tmp518 to $v0 from $fp-88
	  beqz $v0, _L64	# branch if _tmp518 is zero 
	# _tmp519 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp519 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp520 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp521 = i < _tmp520
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# _tmp522 = *(_tmp519 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp522 register is given $t3
	# the reference: _tmp519 is given $t0
	  lw $t3, -4($t0) 	# load with offset
	# _tmp523 = i < _tmp522
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp524 = _tmp523 == _tmp520
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t1
	  seq $t6, $t5, $t1	
	# _tmp525 = _tmp521 || _tmp524
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp525 Goto _L66
	# we clean all the regiser
	  sw $t0, -92($fp)	# spill _tmp519 from $t0 to $fp-92
	  sw $t1, -96($fp)	# spill _tmp520 from $t1 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp521 from $t2 to $fp-100
	  sw $t3, -104($fp)	# spill _tmp522 from $t3 to $fp-104
	  sw $t5, -108($fp)	# spill _tmp523 from $t5 to $fp-108
	  sw $t6, -112($fp)	# spill _tmp524 from $t6 to $fp-112
	  sw $t7, -116($fp)	# spill _tmp525 from $t7 to $fp-116
	  lw $t7, -116($fp)	# fill _tmp525 to $t7 from $fp-116
	  beqz $t7, _L66	# branch if _tmp525 is zero 
	# _tmp526 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string55: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string55
	  la $s0, _string55	# load label
	# PushParam _tmp526
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -120($fp)	# spill _tmp526 from $s0 to $fp-120
	  lw $s0, -120($fp)	# fill _tmp526 to $s0 from $fp-120
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
  _L66:
	# _tmp527 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp528 = _tmp527 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp529 = _tmp519 + _tmp528
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  sw $t0, -124($fp)	# spill _tmp527 from $t0 to $fp-124
	  lw $t0, -92($fp)	# fill _tmp519 to $t0 from $fp-92
	  add $t2, $t0, $t1	
	# _tmp530 = *(_tmp529)
	# We are in the EmitLoad
	# so, the dst: _tmp530 register is given $t3
	# the reference: _tmp529 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp531 = *(_tmp530)
	# We are in the EmitLoad
	# so, the dst: _tmp531 register is given $t4
	# the reference: _tmp530 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp532 = *(_tmp531 + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp532 register is given $t5
	# the reference: _tmp531 is given $t4
	  lw $t5, 24($t4) 	# load with offset
	# PushParam _tmp530
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -136($fp)	# spill _tmp530 from $t3 to $fp-136
	  lw $t3, -136($fp)	# fill _tmp530 to $t3 from $fp-136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp532
	# we clean all the regiser
	  sw $t1, -128($fp)	# spill _tmp528 from $t1 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp529 from $t2 to $fp-132
	  sw $t4, -140($fp)	# spill _tmp531 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp532 from $t5 to $fp-144
	  lw $v0, -144($fp)	# fill _tmp532 to $v0 from $fp-144
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L64:
	# _tmp533 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp534 = i + _tmp533
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp534
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L62
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp533 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp534 from $t1 to $fp-152
	  b _L62		# unconditional branch
	# we clean all the regiser
  _L63:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _House.TakeAllTurns:
	# BeginFunc 152
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp535 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp535 from $v0 to $fp-12
	# i = _tmp535
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -12($fp)	# fill _tmp535 to $v0 from $fp-12
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
  _L67:
	# _tmp536 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp536 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp537 = *(_tmp536 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp537 register is given $t1
	# the reference: _tmp536 is given $t0
	  lw $t1, -4($t0) 	# load with offset
	# _tmp538 = i < _tmp537
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# IfZ _tmp538 Goto _L68
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp536 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp537 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp538 from $t2 to $fp-24
	  lw $t2, -24($fp)	# fill _tmp538 to $t2 from $fp-24
	  beqz $t2, _L68	# branch if _tmp538 is zero 
	# _tmp539 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp539 register is given $t6
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t6, 4($t4) 	# load with offset
	# _tmp540 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp541 = i < _tmp540
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp542 = *(_tmp539 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp542 register is given $t7
	# the reference: _tmp539 is given $t6
	  lw $t7, -4($t6) 	# load with offset
	# _tmp543 = i < _tmp542
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $spill
	# the op2 is $t7
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $s0, $v0, $t7	
	# _tmp544 = _tmp543 == _tmp540
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t3
	  seq $s1, $s0, $t3	
	# _tmp545 = _tmp541 || _tmp544
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp545 Goto _L70
	# we clean all the regiser
	  sw $t3, -32($fp)	# spill _tmp540 from $t3 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp541 from $t5 to $fp-36
	  sw $t6, -28($fp)	# spill _tmp539 from $t6 to $fp-28
	  sw $t7, -40($fp)	# spill _tmp542 from $t7 to $fp-40
	  sw $s0, -44($fp)	# spill _tmp543 from $s0 to $fp-44
	  sw $s1, -48($fp)	# spill _tmp544 from $s1 to $fp-48
	  sw $s2, -52($fp)	# spill _tmp545 from $s2 to $fp-52
	  lw $s2, -52($fp)	# fill _tmp545 to $s2 from $fp-52
	  beqz $s2, _L70	# branch if _tmp545 is zero 
	# _tmp546 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string56: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string56
	  la $s3, _string56	# load label
	# PushParam _tmp546
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -56($fp)	# spill _tmp546 from $s3 to $fp-56
	  lw $s3, -56($fp)	# fill _tmp546 to $s3 from $fp-56
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
  _L70:
	# _tmp547 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp548 = _tmp547 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp549 = _tmp539 + _tmp548
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -28($fp)	# fill _tmp539 to $t6 from $fp-28
	  add $t2, $t6, $t1	
	# _tmp550 = *(_tmp549)
	# We are in the EmitLoad
	# so, the dst: _tmp550 register is given $t3
	# the reference: _tmp549 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp551 = *(_tmp550)
	# We are in the EmitLoad
	# so, the dst: _tmp551 register is given $t4
	# the reference: _tmp550 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp552 = *(_tmp551 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp552 register is given $t5
	# the reference: _tmp551 is given $t4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp550
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -72($fp)	# spill _tmp550 from $t3 to $fp-72
	  lw $t3, -72($fp)	# fill _tmp550 to $t3 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp553 = ACall _tmp552
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp547 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp548 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp549 from $t2 to $fp-68
	  sw $t4, -76($fp)	# spill _tmp551 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp552 from $t5 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp552 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -84($fp)	# spill _tmp553 from $v0 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp553 Goto _L69
	# we clean all the regiser
	  lw $v0, -84($fp)	# fill _tmp553 to $v0 from $fp-84
	  beqz $v0, _L69	# branch if _tmp553 is zero 
	# _tmp554 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp554 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 12($t4) 	# load with offset
	# _tmp555 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp555 register is given $t6
	# the reference: this is given $t4
	  lw $t6, 4($t4) 	# load with offset
	# _tmp556 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp557 = i < _tmp556
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# _tmp558 = *(_tmp555 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp558 register is given $t3
	# the reference: _tmp555 is given $t6
	  lw $t3, -4($t6) 	# load with offset
	# _tmp559 = i < _tmp558
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp560 = _tmp559 == _tmp556
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t1
	  seq $t7, $t5, $t1	
	# _tmp561 = _tmp557 || _tmp560
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t2
	# the op2 is $t7
	  or $s0, $t2, $t7	
	# IfZ _tmp561 Goto _L71
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp554 from $t0 to $fp-88
	  sw $t1, -96($fp)	# spill _tmp556 from $t1 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp557 from $t2 to $fp-100
	  sw $t3, -104($fp)	# spill _tmp558 from $t3 to $fp-104
	  sw $t5, -108($fp)	# spill _tmp559 from $t5 to $fp-108
	  sw $t6, -92($fp)	# spill _tmp555 from $t6 to $fp-92
	  sw $t7, -112($fp)	# spill _tmp560 from $t7 to $fp-112
	  sw $s0, -116($fp)	# spill _tmp561 from $s0 to $fp-116
	  lw $s0, -116($fp)	# fill _tmp561 to $s0 from $fp-116
	  beqz $s0, _L71	# branch if _tmp561 is zero 
	# _tmp562 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string57: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string57
	  la $s1, _string57	# load label
	# PushParam _tmp562
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -120($fp)	# spill _tmp562 from $s1 to $fp-120
	  lw $s1, -120($fp)	# fill _tmp562 to $s1 from $fp-120
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
  _L71:
	# _tmp563 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp564 = _tmp563 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp565 = _tmp555 + _tmp564
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -92($fp)	# fill _tmp555 to $t6 from $fp-92
	  add $t2, $t6, $t1	
	# _tmp566 = *(_tmp565)
	# We are in the EmitLoad
	# so, the dst: _tmp566 register is given $t3
	# the reference: _tmp565 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp567 = *(_tmp566)
	# We are in the EmitLoad
	# so, the dst: _tmp567 register is given $t4
	# the reference: _tmp566 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp568 = *(_tmp567 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp568 register is given $t5
	# the reference: _tmp567 is given $t4
	  lw $t5, 12($t4) 	# load with offset
	# PushParam _tmp554
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -124($fp)	# spill _tmp563 from $t0 to $fp-124
	  lw $t0, -88($fp)	# fill _tmp554 to $t0 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp566
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -136($fp)	# spill _tmp566 from $t3 to $fp-136
	  lw $t3, -136($fp)	# fill _tmp566 to $t3 from $fp-136
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp568
	# we clean all the regiser
	  sw $t1, -128($fp)	# spill _tmp564 from $t1 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp565 from $t2 to $fp-132
	  sw $t4, -140($fp)	# spill _tmp567 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp568 from $t5 to $fp-144
	  lw $v0, -144($fp)	# fill _tmp568 to $v0 from $fp-144
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# we clean all the regiser
  _L69:
	# _tmp569 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp570 = i + _tmp569
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp570
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L67
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp569 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp570 from $t1 to $fp-152
	  b _L67		# unconditional branch
	# we clean all the regiser
  _L68:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _House.ResolveAllPlayers:
	# BeginFunc 168
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 168	# decrement sp to make space for locals/temps
	# _tmp571 = "\nTime to resolve bets.\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "\nTime to resolve bets.\n"
	  .data			# create string constant marked with label
	  _string58: .asciiz "\nTime to resolve bets.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string58
	  la $v0, _string58	# load label
	  sw $v0, -12($fp)	# spill _tmp571 from $v0 to $fp-12
	# PushParam _tmp571
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill _tmp571 to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp572 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp572
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp572 from $t0 to $fp-16
  _L72:
	# _tmp573 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp573 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp574 = *(_tmp573 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp574 register is given $t1
	# the reference: _tmp573 is given $t0
	  lw $t1, -4($t0) 	# load with offset
	# _tmp575 = i < _tmp574
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# IfZ _tmp575 Goto _L73
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp573 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp574 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp575 from $t2 to $fp-28
	  lw $t2, -28($fp)	# fill _tmp575 to $t2 from $fp-28
	  beqz $t2, _L73	# branch if _tmp575 is zero 
	# _tmp576 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp576 register is given $t7
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t7, 4($t4) 	# load with offset
	# _tmp577 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp578 = i < _tmp577
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp579 = *(_tmp576 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp579 register is given $t6
	# the reference: _tmp576 is given $t7
	  lw $t6, -4($t7) 	# load with offset
	# _tmp580 = i < _tmp579
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $s0, $v0, $t6	
	# _tmp581 = _tmp580 == _tmp577
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t3
	  seq $s1, $s0, $t3	
	# _tmp582 = _tmp578 || _tmp581
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp582 Goto _L75
	# we clean all the regiser
	  sw $t3, -36($fp)	# spill _tmp577 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp578 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp579 from $t6 to $fp-44
	  sw $t7, -32($fp)	# spill _tmp576 from $t7 to $fp-32
	  sw $s0, -48($fp)	# spill _tmp580 from $s0 to $fp-48
	  sw $s1, -52($fp)	# spill _tmp581 from $s1 to $fp-52
	  sw $s2, -56($fp)	# spill _tmp582 from $s2 to $fp-56
	  lw $s2, -56($fp)	# fill _tmp582 to $s2 from $fp-56
	  beqz $s2, _L75	# branch if _tmp582 is zero 
	# _tmp583 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string59: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string59
	  la $s3, _string59	# load label
	# PushParam _tmp583
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -60($fp)	# spill _tmp583 from $s3 to $fp-60
	  lw $s3, -60($fp)	# fill _tmp583 to $s3 from $fp-60
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
  _L75:
	# _tmp584 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp585 = _tmp584 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp586 = _tmp576 + _tmp585
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t7
	# the op2 is $t1
	  lw $t7, -32($fp)	# fill _tmp576 to $t7 from $fp-32
	  add $t2, $t7, $t1	
	# _tmp587 = *(_tmp586)
	# We are in the EmitLoad
	# so, the dst: _tmp587 register is given $t3
	# the reference: _tmp586 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp588 = *(_tmp587)
	# We are in the EmitLoad
	# so, the dst: _tmp588 register is given $t4
	# the reference: _tmp587 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp589 = *(_tmp588 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp589 register is given $t5
	# the reference: _tmp588 is given $t4
	  lw $t5, 16($t4) 	# load with offset
	# PushParam _tmp587
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -76($fp)	# spill _tmp587 from $t3 to $fp-76
	  lw $t3, -76($fp)	# fill _tmp587 to $t3 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp590 = ACall _tmp589
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp584 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp585 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp586 from $t2 to $fp-72
	  sw $t4, -80($fp)	# spill _tmp588 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp589 from $t5 to $fp-84
	  lw $v0, -84($fp)	# fill _tmp589 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -88($fp)	# spill _tmp590 from $t6 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp590 Goto _L74
	# we clean all the regiser
	  lw $t6, -88($fp)	# fill _tmp590 to $t6 from $fp-88
	  beqz $t6, _L74	# branch if _tmp590 is zero 
	# _tmp591 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp591 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 8($t4) 	# load with offset
	# _tmp592 = *(_tmp591)
	# We are in the EmitLoad
	# so, the dst: _tmp592 register is given $t1
	# the reference: _tmp591 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp593 = *(_tmp592 + 28)
	# We are in the EmitLoad
	# so, the dst: _tmp593 register is given $t2
	# the reference: _tmp592 is given $t1
	  lw $t2, 28($t1) 	# load with offset
	# PushParam _tmp591
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -92($fp)	# spill _tmp591 from $t0 to $fp-92
	  lw $t0, -92($fp)	# fill _tmp591 to $t0 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp594 = ACall _tmp593
	# we clean all the regiser
	  sw $t1, -96($fp)	# spill _tmp592 from $t1 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp593 from $t2 to $fp-100
	  lw $v0, -100($fp)	# fill _tmp593 to $v0 from $fp-100
	  jalr $v0            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -104($fp)	# spill _tmp594 from $t3 to $fp-104
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp595 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp595 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp596 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  sw $t0, -108($fp)	# spill _tmp595 from $t0 to $fp-108
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp597 = i < _tmp596
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# _tmp598 = *(_tmp595 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp598 register is given $t2
	# the reference: _tmp595 is given $t0
	  sw $t0, -112($fp)	# spill _tmp596 from $t0 to $fp-112
	  lw $t0, -108($fp)	# fill _tmp595 to $t0 from $fp-108
	  lw $t2, -4($t0) 	# load with offset
	# _tmp599 = i < _tmp598
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp600 = _tmp599 == _tmp596
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t0
	  lw $t0, -112($fp)	# fill _tmp596 to $t0 from $fp-112
	  seq $t5, $t3, $t0	
	# _tmp601 = _tmp597 || _tmp600
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t1
	# the op2 is $t5
	  or $t6, $t1, $t5	
	# IfZ _tmp601 Goto _L76
	# we clean all the regiser
	  sw $t1, -116($fp)	# spill _tmp597 from $t1 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp598 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp599 from $t3 to $fp-124
	  sw $t5, -128($fp)	# spill _tmp600 from $t5 to $fp-128
	  sw $t6, -132($fp)	# spill _tmp601 from $t6 to $fp-132
	  lw $t6, -132($fp)	# fill _tmp601 to $t6 from $fp-132
	  beqz $t6, _L76	# branch if _tmp601 is zero 
	# _tmp602 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string60: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string60
	  la $t7, _string60	# load label
	# PushParam _tmp602
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -136($fp)	# spill _tmp602 from $t7 to $fp-136
	  lw $t7, -136($fp)	# fill _tmp602 to $t7 from $fp-136
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
  _L76:
	# _tmp603 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp604 = _tmp603 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp605 = _tmp595 + _tmp604
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  sw $t0, -140($fp)	# spill _tmp603 from $t0 to $fp-140
	  lw $t0, -108($fp)	# fill _tmp595 to $t0 from $fp-108
	  add $t2, $t0, $t1	
	# _tmp606 = *(_tmp605)
	# We are in the EmitLoad
	# so, the dst: _tmp606 register is given $t3
	# the reference: _tmp605 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp607 = *(_tmp606)
	# We are in the EmitLoad
	# so, the dst: _tmp607 register is given $t4
	# the reference: _tmp606 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp608 = *(_tmp607 + 32)
	# We are in the EmitLoad
	# so, the dst: _tmp608 register is given $t5
	# the reference: _tmp607 is given $t4
	  lw $t5, 32($t4) 	# load with offset
	# PushParam _tmp594
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -152($fp)	# spill _tmp606 from $t3 to $fp-152
	  lw $t3, -104($fp)	# fill _tmp594 to $t3 from $fp-104
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp606
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, -152($fp)	# fill _tmp606 to $t3 from $fp-152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp608
	# we clean all the regiser
	  sw $t1, -144($fp)	# spill _tmp604 from $t1 to $fp-144
	  sw $t2, -148($fp)	# spill _tmp605 from $t2 to $fp-148
	  sw $t4, -156($fp)	# spill _tmp607 from $t4 to $fp-156
	  sw $t5, -160($fp)	# spill _tmp608 from $t5 to $fp-160
	  lw $v0, -160($fp)	# fill _tmp608 to $v0 from $fp-160
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# we clean all the regiser
  _L74:
	# _tmp609 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp610 = i + _tmp609
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  add $t1, $v0, $t0	
	# i = _tmp610
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L72
	# we clean all the regiser
	  sw $t0, -164($fp)	# spill _tmp609 from $t0 to $fp-164
	  sw $t1, -168($fp)	# spill _tmp610 from $t1 to $fp-168
	  b _L72		# unconditional branch
	# we clean all the regiser
  _L73:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _House.PrintAllMoney:
	# BeginFunc 88
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 88	# decrement sp to make space for locals/temps
	# _tmp611 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp611 from $v0 to $fp-12
	# i = _tmp611
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -12($fp)	# fill _tmp611 to $v0 from $fp-12
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# we clean all the regiser
  _L77:
	# _tmp612 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp612 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 4($t4) 	# load with offset
	# _tmp613 = *(_tmp612 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp613 register is given $t1
	# the reference: _tmp612 is given $t0
	  lw $t1, -4($t0) 	# load with offset
	# _tmp614 = i < _tmp613
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t2, $v0, $t1	
	# IfZ _tmp614 Goto _L78
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp612 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp613 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp614 from $t2 to $fp-24
	  lw $t2, -24($fp)	# fill _tmp614 to $t2 from $fp-24
	  beqz $t2, _L78	# branch if _tmp614 is zero 
	# _tmp615 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp615 register is given $t6
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t6, 4($t4) 	# load with offset
	# _tmp616 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp617 = i < _tmp616
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t3	
	# _tmp618 = *(_tmp615 + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp618 register is given $t7
	# the reference: _tmp615 is given $t6
	  lw $t7, -4($t6) 	# load with offset
	# _tmp619 = i < _tmp618
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $spill
	# the op2 is $t7
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $s0, $v0, $t7	
	# _tmp620 = _tmp619 == _tmp616
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t3
	  seq $s1, $s0, $t3	
	# _tmp621 = _tmp617 || _tmp620
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t5
	# the op2 is $s1
	  or $s2, $t5, $s1	
	# IfZ _tmp621 Goto _L79
	# we clean all the regiser
	  sw $t3, -32($fp)	# spill _tmp616 from $t3 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp617 from $t5 to $fp-36
	  sw $t6, -28($fp)	# spill _tmp615 from $t6 to $fp-28
	  sw $t7, -40($fp)	# spill _tmp618 from $t7 to $fp-40
	  sw $s0, -44($fp)	# spill _tmp619 from $s0 to $fp-44
	  sw $s1, -48($fp)	# spill _tmp620 from $s1 to $fp-48
	  sw $s2, -52($fp)	# spill _tmp621 from $s2 to $fp-52
	  lw $s2, -52($fp)	# fill _tmp621 to $s2 from $fp-52
	  beqz $s2, _L79	# branch if _tmp621 is zero 
	# _tmp622 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string61: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string61
	  la $s3, _string61	# load label
	# PushParam _tmp622
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -56($fp)	# spill _tmp622 from $s3 to $fp-56
	  lw $s3, -56($fp)	# fill _tmp622 to $s3 from $fp-56
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
  _L79:
	# _tmp623 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp624 = _tmp623 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $t1, $t0, $v1	
	# _tmp625 = _tmp615 + _tmp624
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t6
	# the op2 is $t1
	  lw $t6, -28($fp)	# fill _tmp615 to $t6 from $fp-28
	  add $t2, $t6, $t1	
	# _tmp626 = *(_tmp625)
	# We are in the EmitLoad
	# so, the dst: _tmp626 register is given $t3
	# the reference: _tmp625 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp627 = *(_tmp626)
	# We are in the EmitLoad
	# so, the dst: _tmp627 register is given $t4
	# the reference: _tmp626 is given $t3
	  lw $t4, 0($t3) 	# load with offset
	# _tmp628 = *(_tmp627 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp628 register is given $t5
	# the reference: _tmp627 is given $t4
	  lw $t5, 20($t4) 	# load with offset
	# PushParam _tmp626
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -72($fp)	# spill _tmp626 from $t3 to $fp-72
	  lw $t3, -72($fp)	# fill _tmp626 to $t3 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp628
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp623 from $t0 to $fp-60
	  sw $t1, -64($fp)	# spill _tmp624 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp625 from $t2 to $fp-68
	  sw $t4, -76($fp)	# spill _tmp627 from $t4 to $fp-76
	  sw $t5, -80($fp)	# spill _tmp628 from $t5 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp628 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp629 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -84($fp)	# spill _tmp629 from $v0 to $fp-84
	# _tmp630 = i + _tmp629
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -84($fp)	# fill _tmp629 to $v1 from $fp-84
	  add $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp630 from $v0 to $fp-88
	# i = _tmp630
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $spill
	  lw $v0, -88($fp)	# fill _tmp630 to $v0 from $fp-88
	  move $v0, $v0		# copy value from $v0 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L77
	# we clean all the regiser
	  b _L77		# unconditional branch
	# we clean all the regiser
  _L78:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _House.PlayOneGame:
	# BeginFunc 112
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 112	# decrement sp to make space for locals/temps
	# _tmp631 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp631 register is given $t6
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t6, 12($t4) 	# load with offset
	# _tmp632 = *(_tmp631)
	# We are in the EmitLoad
	# so, the dst: _tmp632 register is given $t7
	# the reference: _tmp631 is given $t6
	  lw $t7, 0($t6) 	# load with offset
	# _tmp633 = *(_tmp632 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp633 register is given $s0
	# the reference: _tmp632 is given $t7
	  lw $s0, 12($t7) 	# load with offset
	# PushParam _tmp631
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -8($fp)	# spill _tmp631 from $t6 to $fp-8
	  lw $t6, -8($fp)	# fill _tmp631 to $t6 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# _tmp634 = ACall _tmp633
	# we clean all the regiser
	  sw $t7, -12($fp)	# spill _tmp632 from $t7 to $fp-12
	  sw $s0, -16($fp)	# spill _tmp633 from $s0 to $fp-16
	  lw $v0, -16($fp)	# fill _tmp633 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	  move $s1, $v0		# copy function return value from $v0
	  sw $s1, -20($fp)	# spill _tmp634 from $s1 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp635 = 26
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 26
	  li $t0, 26		# load constant value 26 into $t0
	# _tmp636 = _tmp634 < _tmp635
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $s1
	# the op2 is $t0
	  slt $t1, $s1, $t0	
	# IfZ _tmp636 Goto _L80
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp635 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp636 from $t1 to $fp-28
	  lw $t1, -28($fp)	# fill _tmp636 to $t1 from $fp-28
	  beqz $t1, _L80	# branch if _tmp636 is zero 
	# _tmp637 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp637 register is given $t2
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t2, 12($t4) 	# load with offset
	# _tmp638 = *(_tmp637)
	# We are in the EmitLoad
	# so, the dst: _tmp638 register is given $t3
	# the reference: _tmp637 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp639 = *(_tmp638 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp639 register is given $t5
	# the reference: _tmp638 is given $t3
	  lw $t5, 8($t3) 	# load with offset
	# PushParam _tmp637
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -32($fp)	# spill _tmp637 from $t2 to $fp-32
	  lw $t2, -32($fp)	# fill _tmp637 to $t2 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp639
	# we clean all the regiser
	  sw $t3, -36($fp)	# spill _tmp638 from $t3 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp639 from $t5 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp639 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L80:
	# _tmp640 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp640 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 0($t4) 	# load with offset
	# _tmp641 = *(_tmp640 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp641 register is given $t1
	# the reference: _tmp640 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp641
	# we clean all the regiser
	  sw $t0, -44($fp)	# spill _tmp640 from $t0 to $fp-44
	  sw $t1, -48($fp)	# spill _tmp641 from $t1 to $fp-48
	  lw $v0, -48($fp)	# fill _tmp641 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp642 = "\nDealer starts. "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\nDealer starts. "
	  .data			# create string constant marked with label
	  _string62: .asciiz "\nDealer starts. "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string62
	  la $t0, _string62	# load label
	# PushParam _tmp642
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -52($fp)	# spill _tmp642 from $t0 to $fp-52
	  lw $t0, -52($fp)	# fill _tmp642 to $t0 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp643 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp644 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp644 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  sw $t0, -56($fp)	# spill _tmp643 from $t0 to $fp-56
	  lw $t0, 8($t4) 	# load with offset
	# _tmp645 = *(_tmp644)
	# We are in the EmitLoad
	# so, the dst: _tmp645 register is given $t1
	# the reference: _tmp644 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp646 = *(_tmp645)
	# We are in the EmitLoad
	# so, the dst: _tmp646 register is given $t2
	# the reference: _tmp645 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam _tmp643
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp644 from $t0 to $fp-60
	  lw $t0, -56($fp)	# fill _tmp643 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp644
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -60($fp)	# fill _tmp644 to $t0 from $fp-60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp646
	# we clean all the regiser
	  sw $t1, -64($fp)	# spill _tmp645 from $t1 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp646 from $t2 to $fp-68
	  lw $v0, -68($fp)	# fill _tmp646 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp647 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp647 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 12($t4) 	# load with offset
	# _tmp648 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp648 register is given $t0
	# the reference: this is given $t4
	  sw $t0, -72($fp)	# spill _tmp647 from $t0 to $fp-72
	  lw $t0, 8($t4) 	# load with offset
	# _tmp649 = *(_tmp648)
	# We are in the EmitLoad
	# so, the dst: _tmp649 register is given $t1
	# the reference: _tmp648 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp650 = *(_tmp649 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp650 register is given $t2
	# the reference: _tmp649 is given $t1
	  lw $t2, 4($t1) 	# load with offset
	# PushParam _tmp647
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -76($fp)	# spill _tmp648 from $t0 to $fp-76
	  lw $t0, -72($fp)	# fill _tmp647 to $t0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp648
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -76($fp)	# fill _tmp648 to $t0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp650
	# we clean all the regiser
	  sw $t1, -80($fp)	# spill _tmp649 from $t1 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp650 from $t2 to $fp-84
	  lw $v0, -84($fp)	# fill _tmp650 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp651 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp651 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 0($t4) 	# load with offset
	# _tmp652 = *(_tmp651 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp652 register is given $t1
	# the reference: _tmp651 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp652
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp651 from $t0 to $fp-88
	  sw $t1, -92($fp)	# spill _tmp652 from $t1 to $fp-92
	  lw $v0, -92($fp)	# fill _tmp652 to $v0 from $fp-92
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp653 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp653 register is given $t0
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t0, 12($t4) 	# load with offset
	# _tmp654 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp654 register is given $t0
	# the reference: this is given $t4
	  sw $t0, -96($fp)	# spill _tmp653 from $t0 to $fp-96
	  lw $t0, 8($t4) 	# load with offset
	# _tmp655 = *(_tmp654)
	# We are in the EmitLoad
	# so, the dst: _tmp655 register is given $t1
	# the reference: _tmp654 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp656 = *(_tmp655 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp656 register is given $t2
	# the reference: _tmp655 is given $t1
	  lw $t2, 12($t1) 	# load with offset
	# PushParam _tmp653
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -100($fp)	# spill _tmp654 from $t0 to $fp-100
	  lw $t0, -96($fp)	# fill _tmp653 to $t0 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp654
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -100($fp)	# fill _tmp654 to $t0 from $fp-100
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp656
	# we clean all the regiser
	  sw $t1, -104($fp)	# spill _tmp655 from $t1 to $fp-104
	  sw $t2, -108($fp)	# spill _tmp656 from $t2 to $fp-108
	  lw $v0, -108($fp)	# fill _tmp656 to $v0 from $fp-108
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp657 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp657 register is given $t3
	# the reference: this is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  lw $t3, 0($t4) 	# load with offset
	# _tmp658 = *(_tmp657 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp658 register is given $spill
	# the reference: _tmp657 is given $t3
	  lw $v0, 16($t3) 	# load with offset
	  sw $v0, -116($fp)	# spill _tmp658 from $v0 to $fp-116
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, 4($fp)	# fill this to $t4 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp658
	# we clean all the regiser
	  sw $t3, -112($fp)	# spill _tmp657 from $t3 to $fp-112
	  lw $v0, -116($fp)	# fill _tmp658 to $v0 from $fp-116
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class House
	  .data
	  .align 2
	  House:		# label for class House vtable
	  .word _House.SetupGame
	  .word _House.SetupPlayers
	  .word _House.TakeAllBets
	  .word _House.TakeAllTurns
	  .word _House.ResolveAllPlayers
	  .word _House.PrintAllMoney
	  .word _House.PlayOneGame
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _GetYesOrNo:
	# BeginFunc 28
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 28	# decrement sp to make space for locals/temps
	# PushParam prompt
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill prompt to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp659 = " (y/n) "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " (y/n) "
	  .data			# create string constant marked with label
	  _string63: .asciiz " (y/n) "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string63
	  la $t0, _string63	# load label
	# PushParam _tmp659
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp659 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp659 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp660 = LCall _ReadLine
	# we clean all the regiser
	  jal _ReadLine      	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -16($fp)	# spill _tmp660 from $t1 to $fp-16
	# answer = _tmp660
	# We are in the EmitCopy
	# so, the dst register is given $t2
	# the src is $t1
	  move $t2, $t1		# copy value from $t1 to $t2
	# _tmp661 = "y"
	# We are in the LoadString
	# so, the dst register is given $t3
	# the String is "y"
	  .data			# create string constant marked with label
	  _string64: .asciiz "y"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t3
	# the label is _string64
	  la $t3, _string64	# load label
	# PushParam _tmp661
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -20($fp)	# spill _tmp661 from $t3 to $fp-20
	  lw $t3, -20($fp)	# fill _tmp661 to $t3 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam answer
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -8($fp)	# spill answer from $t2 to $fp-8
	  lw $t2, -8($fp)	# fill answer to $t2 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp662 = LCall _StringEqual
	# we clean all the regiser
	  jal _StringEqual   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -24($fp)	# spill _tmp662 from $t0 to $fp-24
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp663 = "Y"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Y"
	  .data			# create string constant marked with label
	  _string65: .asciiz "Y"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string65
	  la $t0, _string65	# load label
	# PushParam _tmp663
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -28($fp)	# spill _tmp663 from $t0 to $fp-28
	  lw $t0, -28($fp)	# fill _tmp663 to $t0 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam answer
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -8($fp)	# fill answer to $t2 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp664 = LCall _StringEqual
	# we clean all the regiser
	  jal _StringEqual   	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -32($fp)	# spill _tmp664 from $t4 to $fp-32
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp665 = _tmp662 || _tmp664
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t0
	# the op2 is $t4
	  lw $t0, -24($fp)	# fill _tmp662 to $t0 from $fp-24
	  or $t5, $t0, $t4	
	# Return _tmp665
	  move $v0, $t5		# assign return value into $v0
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
	# BeginFunc 80
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp666 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# keepPlaying = _tmp666
	# We are in the EmitCopy
	# so, the dst register is given $t3
	# the src is $t2
	  move $t3, $t2		# copy value from $t2 to $t3
	# _tmp667 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 16
	  li $t4, 16		# load constant value 16 into $t4
	# PushParam _tmp667
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -20($fp)	# spill _tmp667 from $t4 to $fp-20
	  lw $t4, -20($fp)	# fill _tmp667 to $t4 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp668 = LCall _Alloc
	# we clean all the regiser
	  sw $t2, -16($fp)	# spill _tmp666 from $t2 to $fp-16
	  sw $t3, -8($fp)	# spill keepPlaying from $t3 to $fp-8
	  jal _Alloc         	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -24($fp)	# spill _tmp668 from $t5 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp669 = House
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is House
	  la $t0, House	# load label
	# *(_tmp668) = _tmp669
	# We are in the EmitStore
	# so, the reference: _tmp668 register is given $t5
	# the value: _tmp669 is given $t0
	  sw $t0, 0($t5) 	# store with offset
	# house = _tmp668
	# We are in the EmitCopy
	# so, the dst register is given $t2
	# the src is $t5
	  move $t2, $t5		# copy value from $t5 to $t2
	# _tmp670 = *(house)
	# We are in the EmitLoad
	# so, the dst: _tmp670 register is given $t1
	# the reference: house is given $t2
	  lw $t1, 0($t2) 	# load with offset
	# _tmp671 = *(_tmp670)
	# We are in the EmitLoad
	# so, the dst: _tmp671 register is given $t3
	# the reference: _tmp670 is given $t1
	  lw $t3, 0($t1) 	# load with offset
	# PushParam house
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -12($fp)	# spill house from $t2 to $fp-12
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp671
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp669 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp670 from $t1 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp671 from $t3 to $fp-36
	  lw $v0, -36($fp)	# fill _tmp671 to $v0 from $fp-36
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp672 = *(house)
	# We are in the EmitLoad
	# so, the dst: _tmp672 register is given $t0
	# the reference: house is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  lw $t0, 0($t2) 	# load with offset
	# _tmp673 = *(_tmp672 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp673 register is given $t1
	# the reference: _tmp672 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam house
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp673
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp672 from $t0 to $fp-40
	  sw $t1, -44($fp)	# spill _tmp673 from $t1 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp673 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L81:
	# IfZ keepPlaying Goto _L82
	# we clean all the regiser
	  lw $t3, -8($fp)	# fill keepPlaying to $t3 from $fp-8
	  beqz $t3, _L82	# branch if keepPlaying is zero 
	# _tmp674 = *(house)
	# We are in the EmitLoad
	# so, the dst: _tmp674 register is given $t0
	# the reference: house is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  lw $t0, 0($t2) 	# load with offset
	# _tmp675 = *(_tmp674 + 24)
	# We are in the EmitLoad
	# so, the dst: _tmp675 register is given $t1
	# the reference: _tmp674 is given $t0
	  lw $t1, 24($t0) 	# load with offset
	# PushParam house
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp675
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp674 from $t0 to $fp-48
	  sw $t1, -52($fp)	# spill _tmp675 from $t1 to $fp-52
	  lw $v0, -52($fp)	# fill _tmp675 to $v0 from $fp-52
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp676 = "\nDo you want to play another hand?"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\nDo you want to play another hand?"
	  .data			# create string constant marked with label
	  _string66: .asciiz "\nDo you want to play another hand?"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string66
	  la $t0, _string66	# load label
	# PushParam _tmp676
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -56($fp)	# spill _tmp676 from $t0 to $fp-56
	  lw $t0, -56($fp)	# fill _tmp676 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp677 = LCall _GetYesOrNo
	# we clean all the regiser
	  jal _GetYesOrNo    	# jump to function
	  move $t1, $v0		# copy function return value from $v0
	  sw $t1, -60($fp)	# spill _tmp677 from $t1 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# keepPlaying = _tmp677
	# We are in the EmitCopy
	# so, the dst register is given $t3
	# the src is $t1
	  move $t3, $t1		# copy value from $t1 to $t3
	# Goto _L81
	# we clean all the regiser
	  sw $t3, -8($fp)	# spill keepPlaying from $t3 to $fp-8
	  b _L81		# unconditional branch
	# we clean all the regiser
  _L82:
	# _tmp678 = *(house)
	# We are in the EmitLoad
	# so, the dst: _tmp678 register is given $t0
	# the reference: house is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  lw $t0, 0($t2) 	# load with offset
	# _tmp679 = *(_tmp678 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp679 register is given $t1
	# the reference: _tmp678 is given $t0
	  lw $t1, 20($t0) 	# load with offset
	# PushParam house
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -12($fp)	# fill house to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp679
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp678 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp679 from $t1 to $fp-68
	  lw $v0, -68($fp)	# fill _tmp679 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp680 = "Thank you for playing...come again soon.\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Thank you for playing...come again soon.\n"
	  .data			# create string constant marked with label
	  _string67: .asciiz "Thank you for playing...come again soon.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string67
	  la $t0, _string67	# load label
	# PushParam _tmp680
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -72($fp)	# spill _tmp680 from $t0 to $fp-72
	  lw $t0, -72($fp)	# fill _tmp680 to $t0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp681 = "\nCS143 BlackJack Copyright (c) 1999 by Peter Mor..."
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .data			# create string constant marked with label
	  _string68: .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string68
	  la $t0, _string68	# load label
	# PushParam _tmp681
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -76($fp)	# spill _tmp681 from $t0 to $fp-76
	  lw $t0, -76($fp)	# fill _tmp681 to $t0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp682 = "(2001 mods by jdz)\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "(2001 mods by jdz)\n"
	  .data			# create string constant marked with label
	  _string69: .asciiz "(2001 mods by jdz)\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string69
	  la $t0, _string69	# load label
	# PushParam _tmp682
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -80($fp)	# spill _tmp682 from $t0 to $fp-80
	  lw $t0, -80($fp)	# fill _tmp682 to $t0 from $fp-80
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
