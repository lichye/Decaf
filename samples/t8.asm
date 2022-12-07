	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Vegetable.Eat:
	# BeginFunc 40
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp0 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 5
	  li $t0, 5		# load constant value 5 into $t0
	# _tmp1 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp2 = _tmp0 % _tmp1
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  rem $t2, $t0, $t1	
	# *(this + 8) = _tmp2
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp2 is given $t2
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t2, 8($t3) 	# store with offset
	# _tmp3 = "Yum! "
	# We are in the LoadString
	# so, the dst register is given $t4
	# the String is "Yum! "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Yum! "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t4
	# the label is _string1
	  la $t4, _string1	# load label
	# PushParam _tmp3
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -28($fp)	# spill _tmp3 from $t4 to $fp-28
	  lw $t4, -28($fp)	# fill _tmp3 to $t4 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp0 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp1 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp2 from $t2 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp4 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp4 register is given $t0
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t0, 8($t3) 	# load with offset
	# PushParam _tmp4
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -32($fp)	# spill _tmp4 from $t0 to $fp-32
	  lw $t0, -32($fp)	# fill _tmp4 to $t0 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = "\n"
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
	# PushParam _tmp5
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -36($fp)	# spill _tmp5 from $t0 to $fp-36
	  lw $t0, -36($fp)	# fill _tmp5 to $t0 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = *(veg)
	# We are in the EmitLoad
	# so, the dst: _tmp6 register is given $t5
	# the reference: veg is given $t0
	  lw $t0, 8($fp)	# fill veg to $t0 from $fp+8
	  lw $t5, 0($t0) 	# load with offset
	# _tmp7 = *(_tmp6 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp7 register is given $t6
	# the reference: _tmp6 is given $t5
	  lw $t6, 4($t5) 	# load with offset
	# PushParam w
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -12($fp)	# fill w to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam s
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -8($fp)	# fill s to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam veg
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill veg to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# ACall _tmp7
	# we clean all the regiser
	  sw $t5, -40($fp)	# spill _tmp6 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp7 from $t6 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp7 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# Return 
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
  _Vegetable.Grow:
	# BeginFunc 12
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp8 = "Grow, little vegetables, grow!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Grow, little vegetables, grow!\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "Grow, little vegetables, grow!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string3
	  la $t0, _string3	# load label
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp8 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp8 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp9 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp9 register is given $t1
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t1, 0($t3) 	# load with offset
	# _tmp10 = *(_tmp9)
	# We are in the EmitLoad
	# so, the dst: _tmp10 register is given $t2
	# the reference: _tmp9 is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp10
	# we clean all the regiser
	  sw $t1, -12($fp)	# spill _tmp9 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp10 from $t2 to $fp-16
	  lw $v0, -16($fp)	# fill _tmp10 to $v0 from $fp-16
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Vegetable
	  .data
	  .align 2
	  Vegetable:		# label for class Vegetable vtable
	  .word _Vegetable.Eat
	  .word _Vegetable.Grow
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Squash.Grow:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp11 = "But I don't like squash\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "But I don't like squash\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "But I don't like squash\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string4
	  la $t0, _string4	# load label
	# PushParam _tmp11
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp11 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp11 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp12 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp13 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 5
	  li $t1, 5		# load constant value 5 into $t1
	# _tmp14 = _tmp12 * _tmp13
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  mul $t2, $t0, $t1	
	# PushParam _tmp14
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -20($fp)	# spill _tmp14 from $t2 to $fp-20
	  lw $t2, -20($fp)	# fill _tmp14 to $t2 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  sw $t0, -12($fp)	# spill _tmp12 from $t0 to $fp-12
	  sw $t1, -16($fp)	# spill _tmp13 from $t1 to $fp-16
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Squash
	  .data
	  .align 2
	  Squash:		# label for class Squash vtable
	  .word _Vegetable.Eat
	  .word _Squash.Grow
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Grow:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp15 = "mmm... veggies!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "mmm... veggies!\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "mmm... veggies!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string5
	  la $t0, _string5	# load label
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp15 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp15 to $t0 from $fp-8
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
	# VTable for class Seeds
	  .data
	  .align 2
	  Seeds:		# label for class Seeds vtable
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 264
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 264	# decrement sp to make space for locals/temps
	# _tmp16 = 2
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -12($fp)	# spill _tmp16 from $v0 to $fp-12
	# _tmp17 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -16($fp)	# spill _tmp17 from $v0 to $fp-16
	# _tmp18 = _tmp16 < _tmp17
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -12($fp)	# fill _tmp16 to $v0 from $fp-12
	  lw $v1, -16($fp)	# fill _tmp17 to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -20($fp)	# spill _tmp18 from $v0 to $fp-20
	# IfZ _tmp18 Goto _L0
	# we clean all the regiser
	  lw $v0, -20($fp)	# fill _tmp18 to $v0 from $fp-20
	  beqz $v0, _L0	# branch if _tmp18 is zero 
	# _tmp19 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string6
	  la $v0, _string6	# load label
	  sw $v0, -24($fp)	# spill _tmp19 from $v0 to $fp-24
	# PushParam _tmp19
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
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
	# _tmp20 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp21 = _tmp20 + _tmp16
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill _tmp16 to $v1 from $fp-12
	  add $t1, $t0, $v1	
	# _tmp22 = 4
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp23 = _tmp21 * _tmp22
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $s1
	  mul $t2, $t1, $s1	
	# PushParam _tmp23
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -40($fp)	# spill _tmp23 from $t2 to $fp-40
	  lw $t2, -40($fp)	# fill _tmp23 to $t2 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp24 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp20 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp21 from $t1 to $fp-32
	  sw $s1, -36($fp)	# spill _tmp22 from $s1 to $fp-36
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -44($fp)	# spill _tmp24 from $v0 to $fp-44
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp24) = _tmp16
	# We are in the EmitStore
	# so, the reference: _tmp24 register is given $spill
	# the value: _tmp16 is given $spill
	  lw $v0, -12($fp)	# fill _tmp16 to $v0 from $fp-12
	  lw $v1, -44($fp)	# fill _tmp24 to $v1 from $fp-44
	  sw $v0, 0($v1) 	# store with offset
	# _tmp25 = _tmp24 + _tmp22
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $s1
	  lw $v0, -44($fp)	# fill _tmp24 to $v0 from $fp-44
	  lw $s1, -36($fp)	# fill _tmp22 to $s1 from $fp-36
	  add $t0, $v0, $s1	
	# veggies = _tmp25
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill veggies from $v0 to $fp-8
	# _tmp26 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 0
	  li $t3, 0		# load constant value 0 into $t3
	# _tmp27 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp28 = _tmp26 < _tmp27
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t3
	# the op2 is $t1
	  slt $t2, $t3, $t1	
	# _tmp29 = *(veggies + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp29 register is given $t4
	# the reference: veggies is given $spill
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $t4, -4($v0) 	# load with offset
	# _tmp30 = _tmp26 < _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t3
	# the op2 is $t4
	  slt $t5, $t3, $t4	
	# _tmp31 = _tmp30 == _tmp27
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t1
	  seq $t6, $t5, $t1	
	# _tmp32 = _tmp28 || _tmp31
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp32 Goto _L1
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp25 from $t0 to $fp-48
	  sw $t1, -56($fp)	# spill _tmp27 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp28 from $t2 to $fp-60
	  sw $t3, -52($fp)	# spill _tmp26 from $t3 to $fp-52
	  sw $t4, -64($fp)	# spill _tmp29 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp30 from $t5 to $fp-68
	  sw $t6, -72($fp)	# spill _tmp31 from $t6 to $fp-72
	  sw $t7, -76($fp)	# spill _tmp32 from $t7 to $fp-76
	  lw $t7, -76($fp)	# fill _tmp32 to $t7 from $fp-76
	  beqz $t7, _L1	# branch if _tmp32 is zero 
	# _tmp33 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp33
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -80($fp)	# spill _tmp33 from $s0 to $fp-80
	  lw $s0, -80($fp)	# fill _tmp33 to $s0 from $fp-80
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
  _L1:
	# _tmp34 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp35 = _tmp34 * _tmp26
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t3
	  lw $t3, -52($fp)	# fill _tmp26 to $t3 from $fp-52
	  mul $t1, $t0, $t3	
	# _tmp36 = veggies + _tmp35
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  add $s1, $v0, $t1	
	# _tmp37 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 12
	  li $t2, 12		# load constant value 12 into $t2
	# PushParam _tmp37
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -96($fp)	# spill _tmp37 from $t2 to $fp-96
	  lw $t2, -96($fp)	# fill _tmp37 to $t2 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp38 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -84($fp)	# spill _tmp34 from $t0 to $fp-84
	  sw $t1, -88($fp)	# spill _tmp35 from $t1 to $fp-88
	  sw $s1, -92($fp)	# spill _tmp36 from $s1 to $fp-92
	  jal _Alloc         	# jump to function
	  move $s2, $v0		# copy function return value from $v0
	  sw $s2, -100($fp)	# spill _tmp38 from $s2 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp39 = Squash
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Squash
	  la $t0, Squash	# load label
	# *(_tmp38) = _tmp39
	# We are in the EmitStore
	# so, the reference: _tmp38 register is given $s2
	# the value: _tmp39 is given $t0
	  sw $t0, 0($s2) 	# store with offset
	# *(_tmp36) = _tmp38
	# We are in the EmitStore
	# so, the reference: _tmp36 register is given $s1
	# the value: _tmp38 is given $s2
	  lw $s1, -92($fp)	# fill _tmp36 to $s1 from $fp-92
	  sw $s2, 0($s1) 	# store with offset
	# _tmp40 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp41 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp42 = _tmp40 < _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t5
	# the op2 is $t1
	  slt $t2, $t5, $t1	
	# _tmp43 = *(veggies + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp43 register is given $t3
	# the reference: veggies is given $spill
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $t3, -4($v0) 	# load with offset
	# _tmp44 = _tmp40 < _tmp43
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t5
	# the op2 is $t3
	  slt $t4, $t5, $t3	
	# _tmp45 = _tmp44 == _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t1
	  seq $t6, $t4, $t1	
	# _tmp46 = _tmp42 || _tmp45
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp46 Goto _L2
	# we clean all the regiser
	  sw $t0, -104($fp)	# spill _tmp39 from $t0 to $fp-104
	  sw $t1, -112($fp)	# spill _tmp41 from $t1 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp42 from $t2 to $fp-116
	  sw $t3, -120($fp)	# spill _tmp43 from $t3 to $fp-120
	  sw $t4, -124($fp)	# spill _tmp44 from $t4 to $fp-124
	  sw $t5, -108($fp)	# spill _tmp40 from $t5 to $fp-108
	  sw $t6, -128($fp)	# spill _tmp45 from $t6 to $fp-128
	  sw $t7, -132($fp)	# spill _tmp46 from $t7 to $fp-132
	  lw $t7, -132($fp)	# fill _tmp46 to $t7 from $fp-132
	  beqz $t7, _L2	# branch if _tmp46 is zero 
	# _tmp47 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string8
	  la $s0, _string8	# load label
	# PushParam _tmp47
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -136($fp)	# spill _tmp47 from $s0 to $fp-136
	  lw $s0, -136($fp)	# fill _tmp47 to $s0 from $fp-136
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
  _L2:
	# _tmp48 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp49 = _tmp48 * _tmp40
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  lw $t5, -108($fp)	# fill _tmp40 to $t5 from $fp-108
	  mul $t1, $t0, $t5	
	# _tmp50 = veggies + _tmp49
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp51 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 12
	  li $t3, 12		# load constant value 12 into $t3
	# PushParam _tmp51
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -152($fp)	# spill _tmp51 from $t3 to $fp-152
	  lw $t3, -152($fp)	# fill _tmp51 to $t3 from $fp-152
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp52 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -140($fp)	# spill _tmp48 from $t0 to $fp-140
	  sw $t1, -144($fp)	# spill _tmp49 from $t1 to $fp-144
	  sw $t2, -148($fp)	# spill _tmp50 from $t2 to $fp-148
	  jal _Alloc         	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -156($fp)	# spill _tmp52 from $t4 to $fp-156
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp53 = Vegetable
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Vegetable
	  la $t0, Vegetable	# load label
	# *(_tmp52) = _tmp53
	# We are in the EmitStore
	# so, the reference: _tmp52 register is given $t4
	# the value: _tmp53 is given $t0
	  sw $t0, 0($t4) 	# store with offset
	# *(_tmp50) = _tmp52
	# We are in the EmitStore
	# so, the reference: _tmp50 register is given $t2
	# the value: _tmp52 is given $t4
	  lw $t2, -148($fp)	# fill _tmp50 to $t2 from $fp-148
	  sw $t4, 0($t2) 	# store with offset
	# _tmp54 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 10
	  li $t1, 10		# load constant value 10 into $t1
	# PushParam _tmp54
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -164($fp)	# spill _tmp54 from $t1 to $fp-164
	  lw $t1, -164($fp)	# fill _tmp54 to $t1 from $fp-164
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _Grow
	# we clean all the regiser
	  sw $t0, -160($fp)	# spill _tmp53 from $t0 to $fp-160
	  jal _Grow          	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s4
	# the constant is 0
	  li $s4, 0		# load constant value 0 into $s4
	# _tmp56 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp57 = _tmp55 < _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $s4
	# the op2 is $t0
	  slt $t1, $s4, $t0	
	# _tmp58 = *(veggies + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp58 register is given $t2
	# the reference: veggies is given $spill
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $t2, -4($v0) 	# load with offset
	# _tmp59 = _tmp55 < _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $s4
	# the op2 is $t2
	  slt $t3, $s4, $t2	
	# _tmp60 = _tmp59 == _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t0
	  seq $t4, $t3, $t0	
	# _tmp61 = _tmp57 || _tmp60
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t1
	# the op2 is $t4
	  or $t5, $t1, $t4	
	# IfZ _tmp61 Goto _L3
	# we clean all the regiser
	  sw $t0, -172($fp)	# spill _tmp56 from $t0 to $fp-172
	  sw $t1, -176($fp)	# spill _tmp57 from $t1 to $fp-176
	  sw $t2, -180($fp)	# spill _tmp58 from $t2 to $fp-180
	  sw $t3, -184($fp)	# spill _tmp59 from $t3 to $fp-184
	  sw $t4, -188($fp)	# spill _tmp60 from $t4 to $fp-188
	  sw $t5, -192($fp)	# spill _tmp61 from $t5 to $fp-192
	  sw $s4, -168($fp)	# spill _tmp55 from $s4 to $fp-168
	  lw $t5, -192($fp)	# fill _tmp61 to $t5 from $fp-192
	  beqz $t5, _L3	# branch if _tmp61 is zero 
	# _tmp62 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t6
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t6
	# the label is _string9
	  la $t6, _string9	# load label
	# PushParam _tmp62
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -196($fp)	# spill _tmp62 from $t6 to $fp-196
	  lw $t6, -196($fp)	# fill _tmp62 to $t6 from $fp-196
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
  _L3:
	# _tmp63 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp64 = _tmp63 * _tmp55
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s4
	  lw $s4, -168($fp)	# fill _tmp55 to $s4 from $fp-168
	  mul $t1, $t0, $s4	
	# _tmp65 = veggies + _tmp64
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  add $t2, $v0, $t1	
	# _tmp66 = *(_tmp65)
	# We are in the EmitLoad
	# so, the dst: _tmp66 register is given $t3
	# the reference: _tmp65 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp67 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# _tmp68 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp69 = _tmp67 < _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  slt $t6, $t4, $t5	
	# _tmp70 = *(veggies + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp70 register is given $t7
	# the reference: veggies is given $spill
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $t7, -4($v0) 	# load with offset
	# _tmp71 = _tmp67 < _tmp70
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t4
	# the op2 is $t7
	  slt $s0, $t4, $t7	
	# _tmp72 = _tmp71 == _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t5
	  seq $s1, $s0, $t5	
	# _tmp73 = _tmp69 || _tmp72
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t6
	# the op2 is $s1
	  or $s2, $t6, $s1	
	# IfZ _tmp73 Goto _L4
	# we clean all the regiser
	  sw $t0, -200($fp)	# spill _tmp63 from $t0 to $fp-200
	  sw $t1, -204($fp)	# spill _tmp64 from $t1 to $fp-204
	  sw $t2, -208($fp)	# spill _tmp65 from $t2 to $fp-208
	  sw $t3, -212($fp)	# spill _tmp66 from $t3 to $fp-212
	  sw $t4, -216($fp)	# spill _tmp67 from $t4 to $fp-216
	  sw $t5, -220($fp)	# spill _tmp68 from $t5 to $fp-220
	  sw $t6, -224($fp)	# spill _tmp69 from $t6 to $fp-224
	  sw $t7, -228($fp)	# spill _tmp70 from $t7 to $fp-228
	  sw $s0, -232($fp)	# spill _tmp71 from $s0 to $fp-232
	  sw $s1, -236($fp)	# spill _tmp72 from $s1 to $fp-236
	  sw $s2, -240($fp)	# spill _tmp73 from $s2 to $fp-240
	  lw $s2, -240($fp)	# fill _tmp73 to $s2 from $fp-240
	  beqz $s2, _L4	# branch if _tmp73 is zero 
	# _tmp74 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s3
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s3
	# the label is _string10
	  la $s3, _string10	# load label
	# PushParam _tmp74
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -244($fp)	# spill _tmp74 from $s3 to $fp-244
	  lw $s3, -244($fp)	# fill _tmp74 to $s3 from $fp-244
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
  _L4:
	# _tmp75 = 4
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -248($fp)	# spill _tmp75 from $v0 to $fp-248
	# _tmp76 = _tmp75 * _tmp67
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -248($fp)	# fill _tmp75 to $v0 from $fp-248
	  lw $t4, -216($fp)	# fill _tmp67 to $t4 from $fp-216
	  mul $v0, $v0, $t4	
	  sw $v0, -252($fp)	# spill _tmp76 from $v0 to $fp-252
	# _tmp77 = veggies + _tmp76
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -8($fp)	# fill veggies to $v0 from $fp-8
	  lw $v1, -252($fp)	# fill _tmp76 to $v1 from $fp-252
	  add $v0, $v0, $v1	
	  sw $v0, -256($fp)	# spill _tmp77 from $v0 to $fp-256
	# _tmp78 = *(_tmp77)
	# We are in the EmitLoad
	# so, the dst: _tmp78 register is given $spill
	# the reference: _tmp77 is given $spill
	  lw $v0, -256($fp)	# fill _tmp77 to $v0 from $fp-256
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -260($fp)	# spill _tmp78 from $v0 to $fp-260
	# _tmp79 = *(_tmp78)
	# We are in the EmitLoad
	# so, the dst: _tmp79 register is given $spill
	# the reference: _tmp78 is given $spill
	  lw $v0, -260($fp)	# fill _tmp78 to $v0 from $fp-260
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -264($fp)	# spill _tmp79 from $v0 to $fp-264
	# _tmp80 = *(_tmp79)
	# We are in the EmitLoad
	# so, the dst: _tmp80 register is given $spill
	# the reference: _tmp79 is given $spill
	  lw $v0, -264($fp)	# fill _tmp79 to $v0 from $fp-264
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -268($fp)	# spill _tmp80 from $v0 to $fp-268
	# PushParam _tmp66
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, -212($fp)	# fill _tmp66 to $t3 from $fp-212
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp78
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -260($fp)	# fill _tmp78 to $v0 from $fp-260
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# ACall _tmp80
	# we clean all the regiser
	  lw $v0, -268($fp)	# fill _tmp80 to $v0 from $fp-268
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
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
