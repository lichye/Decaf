	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# We rewrite such a Rsfile
  _PrintArray:
	# BeginFunc 84
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	# We are in the LoadConstant
	# so, the dst register is given $s2
	# the constant is 0
	  li $s2, 0		# load constant value 0 into $s2
	# i = _tmp0
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $s2
	  move $v0, $s2		# copy value from $s2 to $v0
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# _tmp1 = "Sorted results: "
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Sorted results: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Sorted results: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string1
	  la $v0, _string1	# load label
	  sw $v0, -16($fp)	# spill _tmp1 from $v0 to $fp-16
	# PushParam _tmp1
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -16($fp)	# fill _tmp1 to $v0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $s2, -12($fp)	# spill _tmp0 from $s2 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# We rewrite such a Rsfile
  _L0:
	# _tmp2 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp2 register is given $t0
	# the reference: arr is given $s1
	  lw $s1, 4($fp)	# fill arr to $s1 from $fp+4
	  lw $t0, -4($s1) 	# load with offset
	# _tmp3 = i < _tmp2
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t1, $v0, $t0	
	# IfZ _tmp3 Goto _L1
	# we record the Registers before _L1
	# We record such a Rsfile
	# $v0 is setted to i
	# $t0 is setted to _tmp2
	# $t1 is setted to _tmp3
	# $s1 is setted to arr
	  beqz $t1, _L1	# branch if _tmp3 is zero 
	# _tmp4 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp5 = i < _tmp4
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t3, $v0, $t2	
	# _tmp6 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp6 register is given $t4
	# the reference: arr is given $s1
	  lw $t4, -4($s1) 	# load with offset
	# _tmp7 = i < _tmp6
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  slt $t5, $v0, $t4	
	# _tmp8 = _tmp7 == _tmp4
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t2
	  seq $t6, $t5, $t2	
	# _tmp9 = _tmp5 || _tmp8
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t3
	# the op2 is $t6
	  or $t7, $t3, $t6	
	# IfZ _tmp9 Goto _L2
	# we record the Registers before _L2
	# We record such a Rsfile
	# $v0 is setted to i
	# $t0 is setted to _tmp2
	# $t1 is setted to _tmp3
	# $t2 is setted to _tmp4
	# $t3 is setted to _tmp5
	# $t4 is setted to _tmp6
	# $t5 is setted to _tmp7
	# $t6 is setted to _tmp8
	# $t7 is setted to _tmp9
	# $s1 is setted to arr
	  beqz $t7, _L2	# branch if _tmp9 is zero 
	# _tmp10 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string2
	  la $s0, _string2	# load label
	# PushParam _tmp10
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -52($fp)	# spill _tmp10 from $s0 to $fp-52
	  lw $s0, -52($fp)	# fill _tmp10 to $s0 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp2 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp3 from $t1 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp5 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp6 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp7 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp8 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp9 from $t7 to $fp-48
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to i
	# $t0 is setted to _tmp2
	# $t1 is setted to _tmp3
	# $t2 is setted to _tmp4
	# $t3 is setted to _tmp5
	# $t4 is setted to _tmp6
	# $t5 is setted to _tmp7
	# $t6 is setted to _tmp8
	# $t7 is setted to _tmp9
	# $s1 is setted to arr
  _L2:
	# _tmp11 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -20($fp)	# spill _tmp2 from $t0 to $fp-20
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp12 = _tmp11 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  sw $t1, -24($fp)	# spill _tmp3 from $t1 to $fp-24
	  mul $t1, $t0, $v1	
	# _tmp13 = arr + _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s1
	# the op2 is $t1
	  sw $t2, -28($fp)	# spill _tmp4 from $t2 to $fp-28
	  add $t2, $s1, $t1	
	# _tmp14 = *(_tmp13)
	# We are in the EmitLoad
	# so, the dst: _tmp14 register is given $t3
	# the reference: _tmp13 is given $t2
	  sw $t3, -32($fp)	# spill _tmp5 from $t3 to $fp-32
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp14
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -68($fp)	# spill _tmp14 from $t3 to $fp-68
	  lw $t3, -68($fp)	# fill _tmp14 to $t3 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  sw $t0, -56($fp)	# spill _tmp11 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp12 from $t1 to $fp-60
	  sw $t2, -64($fp)	# spill _tmp13 from $t2 to $fp-64
	  sw $t4, -36($fp)	# spill _tmp6 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp7 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp8 from $t6 to $fp-44
	  sw $t7, -48($fp)	# spill _tmp9 from $t7 to $fp-48
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string3: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string3
	  la $t0, _string3	# load label
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -72($fp)	# spill _tmp15 from $t0 to $fp-72
	  lw $t0, -72($fp)	# fill _tmp15 to $t0 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
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
	# we record the Registers before _L0
	# We record such a Rsfile
	# $v0 is setted to i
	# $t0 is setted to _tmp16
	# $t1 is setted to _tmp17
	  b _L0		# unconditional branch
	# We rewrite such a Rsfile
	# $v0 is setted to i
	# $t0 is setted to _tmp2
	# $t1 is setted to _tmp3
	# $s1 is setted to arr
  _L1:
	# _tmp18 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string4
	  sw $t0, -20($fp)	# spill _tmp2 from $t0 to $fp-20
	  la $t0, _string4	# load label
	# PushParam _tmp18
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -84($fp)	# spill _tmp18 from $t0 to $fp-84
	  lw $t0, -84($fp)	# fill _tmp18 to $t0 from $fp-84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t1, -24($fp)	# spill _tmp3 from $t1 to $fp-24
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
	# We rewrite such a Rsfile
  main:
	# BeginFunc 596
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 596	# decrement sp to make space for locals/temps
	# _tmp19 = 5
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -24($fp)	# spill _tmp19 from $v0 to $fp-24
	# _tmp20 = 1
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -28($fp)	# spill _tmp20 from $v0 to $fp-28
	# _tmp21 = _tmp19 < _tmp20
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $spill
	# the op2 is $spill
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
	  lw $v1, -28($fp)	# fill _tmp20 to $v1 from $fp-28
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp21 from $v0 to $fp-32
	# IfZ _tmp21 Goto _L3
	  lw $v0, -32($fp)	# fill _tmp21 to $v0 from $fp-32
	# we record the Registers before _L3
	# We record such a Rsfile
	# $v0 is setted to _tmp21
	# $v1 is setted to _tmp20
	  beqz $v0, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	# We are in the LoadString
	# so, the dst register is given $spill
	# the String is "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $spill
	# the label is _string5
	  la $v0, _string5	# load label
	  sw $v0, -36($fp)	# spill _tmp22 from $v0 to $fp-36
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -36($fp)	# fill _tmp22 to $v0 from $fp-36
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
	# We rewrite such a Rsfile
	# $v0 is setted to _tmp21
	# $v1 is setted to _tmp20
  _L3:
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
	  lw $v1, -24($fp)	# fill _tmp19 to $v1 from $fp-24
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
	  sw $t2, -52($fp)	# spill _tmp26 from $t2 to $fp-52
	  lw $t2, -52($fp)	# fill _tmp26 to $t2 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp23 from $t0 to $fp-40
	  sw $t1, -44($fp)	# spill _tmp24 from $t1 to $fp-44
	  sw $s0, -48($fp)	# spill _tmp25 from $s0 to $fp-48
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -56($fp)	# spill _tmp27 from $v0 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	# We are in the EmitStore
	# so, the reference: _tmp27 register is given $spill
	# the value: _tmp19 is given $spill
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
	  lw $v1, -56($fp)	# fill _tmp27 to $v1 from $fp-56
	  sw $v0, 0($v1) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $spill
	# the op2 is $s0
	  lw $v0, -56($fp)	# fill _tmp27 to $v0 from $fp-56
	  lw $s0, -48($fp)	# fill _tmp25 to $s0 from $fp-48
	  add $t0, $v0, $s0	
	# arr = _tmp28
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -8($fp)	# spill arr from $v0 to $fp-8
	# _tmp29 = 0
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -64($fp)	# spill _tmp29 from $v0 to $fp-64
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
	  lw $v0, -64($fp)	# fill _tmp29 to $v0 from $fp-64
	  slt $t2, $v0, $t1	
	# _tmp32 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp32 register is given $t3
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $t3, -4($v0) 	# load with offset
	# _tmp33 = _tmp29 < _tmp32
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -64($fp)	# fill _tmp29 to $v0 from $fp-64
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
	# IfZ _tmp35 Goto _L4
	# we record the Registers before _L4
	# We record such a Rsfile
	# $v0 is setted to _tmp29
	# $v1 is setted to _tmp27
	# $t0 is setted to _tmp28
	# $t1 is setted to _tmp30
	# $t2 is setted to _tmp31
	# $t3 is setted to _tmp32
	# $t4 is setted to _tmp33
	# $t5 is setted to _tmp34
	# $t6 is setted to _tmp35
	# $s0 is setted to _tmp25
	  beqz $t6, _L4	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string6
	  la $t7, _string6	# load label
	# PushParam _tmp36
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -92($fp)	# spill _tmp36 from $t7 to $fp-92
	  lw $t7, -92($fp)	# fill _tmp36 to $t7 from $fp-92
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -60($fp)	# spill _tmp28 from $t0 to $fp-60
	  sw $t1, -68($fp)	# spill _tmp30 from $t1 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp31 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp32 from $t3 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp33 from $t4 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp34 from $t5 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp35 from $t6 to $fp-88
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to _tmp29
	# $v1 is setted to _tmp27
	# $t0 is setted to _tmp28
	# $t1 is setted to _tmp30
	# $t2 is setted to _tmp31
	# $t3 is setted to _tmp32
	# $t4 is setted to _tmp33
	# $t5 is setted to _tmp34
	# $t6 is setted to _tmp35
	# $s0 is setted to _tmp25
  _L4:
	# _tmp37 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -60($fp)	# spill _tmp28 from $t0 to $fp-60
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp38 = _tmp37 * _tmp29
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -64($fp)	# fill _tmp29 to $v1 from $fp-64
	  sw $t1, -68($fp)	# spill _tmp30 from $t1 to $fp-68
	  mul $t1, $t0, $v1	
	# _tmp39 = arr + _tmp38
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -76($fp)	# spill _tmp32 from $t3 to $fp-76
	  add $t3, $v0, $t1	
	# _tmp40 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 5
	  sw $t2, -72($fp)	# spill _tmp31 from $t2 to $fp-72
	  li $t2, 5		# load constant value 5 into $t2
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
	  sw $v0, -112($fp)	# spill _tmp41 from $v0 to $fp-112
	# _tmp42 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -80($fp)	# spill _tmp33 from $t4 to $fp-80
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp43 = _tmp41 < _tmp42
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -112($fp)	# fill _tmp41 to $v0 from $fp-112
	  sw $t5, -84($fp)	# spill _tmp34 from $t5 to $fp-84
	  slt $t5, $v0, $t4	
	# _tmp44 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp44 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -88($fp)	# spill _tmp35 from $t6 to $fp-88
	  lw $t6, -4($v0) 	# load with offset
	# _tmp45 = _tmp41 < _tmp44
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -112($fp)	# fill _tmp41 to $v0 from $fp-112
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
	# IfZ _tmp47 Goto _L5
	# we record the Registers before _L5
	# We record such a Rsfile
	# $v0 is setted to _tmp41
	# $v1 is setted to _tmp29
	# $t0 is setted to _tmp37
	# $t1 is setted to _tmp38
	# $t2 is setted to _tmp40
	# $t3 is setted to _tmp39
	# $t4 is setted to _tmp42
	# $t5 is setted to _tmp43
	# $t6 is setted to _tmp44
	# $t7 is setted to _tmp45
	# $s0 is setted to _tmp46
	# $s1 is setted to _tmp47
	  beqz $s1, _L5	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp48
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -140($fp)	# spill _tmp48 from $s2 to $fp-140
	  lw $s2, -140($fp)	# fill _tmp48 to $s2 from $fp-140
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -96($fp)	# spill _tmp37 from $t0 to $fp-96
	  sw $t1, -100($fp)	# spill _tmp38 from $t1 to $fp-100
	  sw $t2, -108($fp)	# spill _tmp40 from $t2 to $fp-108
	  sw $t3, -104($fp)	# spill _tmp39 from $t3 to $fp-104
	  sw $t4, -116($fp)	# spill _tmp42 from $t4 to $fp-116
	  sw $t5, -120($fp)	# spill _tmp43 from $t5 to $fp-120
	  sw $t6, -124($fp)	# spill _tmp44 from $t6 to $fp-124
	  sw $t7, -128($fp)	# spill _tmp45 from $t7 to $fp-128
	  sw $s0, -132($fp)	# spill _tmp46 from $s0 to $fp-132
	  sw $s1, -136($fp)	# spill _tmp47 from $s1 to $fp-136
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to _tmp41
	# $v1 is setted to _tmp29
	# $t0 is setted to _tmp37
	# $t1 is setted to _tmp38
	# $t2 is setted to _tmp40
	# $t3 is setted to _tmp39
	# $t4 is setted to _tmp42
	# $t5 is setted to _tmp43
	# $t6 is setted to _tmp44
	# $t7 is setted to _tmp45
	# $s0 is setted to _tmp46
	# $s1 is setted to _tmp47
  _L5:
	# _tmp49 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -96($fp)	# spill _tmp37 from $t0 to $fp-96
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp50 = _tmp49 * _tmp41
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -112($fp)	# fill _tmp41 to $v1 from $fp-112
	  sw $t1, -100($fp)	# spill _tmp38 from $t1 to $fp-100
	  mul $t1, $t0, $v1	
	# _tmp51 = arr + _tmp50
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -104($fp)	# spill _tmp39 from $t3 to $fp-104
	  add $t3, $v0, $t1	
	# _tmp52 = 90
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 90
	  sw $t2, -108($fp)	# spill _tmp40 from $t2 to $fp-108
	  li $t2, 90		# load constant value 90 into $t2
	# *(_tmp51) = _tmp52
	# We are in the EmitStore
	# so, the reference: _tmp51 register is given $t3
	# the value: _tmp52 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp53 = 2
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -160($fp)	# spill _tmp53 from $v0 to $fp-160
	# _tmp54 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -116($fp)	# spill _tmp42 from $t4 to $fp-116
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp55 = _tmp53 < _tmp54
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -160($fp)	# fill _tmp53 to $v0 from $fp-160
	  sw $t5, -120($fp)	# spill _tmp43 from $t5 to $fp-120
	  slt $t5, $v0, $t4	
	# _tmp56 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp56 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -124($fp)	# spill _tmp44 from $t6 to $fp-124
	  lw $t6, -4($v0) 	# load with offset
	# _tmp57 = _tmp53 < _tmp56
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -160($fp)	# fill _tmp53 to $v0 from $fp-160
	  sw $t7, -128($fp)	# spill _tmp45 from $t7 to $fp-128
	  slt $t7, $v0, $t6	
	# _tmp58 = _tmp57 == _tmp54
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  sw $s0, -132($fp)	# spill _tmp46 from $s0 to $fp-132
	  seq $s0, $t7, $t4	
	# _tmp59 = _tmp55 || _tmp58
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  sw $s1, -136($fp)	# spill _tmp47 from $s1 to $fp-136
	  or $s1, $t5, $s0	
	# IfZ _tmp59 Goto _L6
	# we record the Registers before _L6
	# We record such a Rsfile
	# $v0 is setted to _tmp53
	# $v1 is setted to _tmp41
	# $t0 is setted to _tmp49
	# $t1 is setted to _tmp50
	# $t2 is setted to _tmp52
	# $t3 is setted to _tmp51
	# $t4 is setted to _tmp54
	# $t5 is setted to _tmp55
	# $t6 is setted to _tmp56
	# $t7 is setted to _tmp57
	# $s0 is setted to _tmp58
	# $s1 is setted to _tmp59
	  beqz $s1, _L6	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string8
	  la $s2, _string8	# load label
	# PushParam _tmp60
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -188($fp)	# spill _tmp60 from $s2 to $fp-188
	  lw $s2, -188($fp)	# fill _tmp60 to $s2 from $fp-188
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -144($fp)	# spill _tmp49 from $t0 to $fp-144
	  sw $t1, -148($fp)	# spill _tmp50 from $t1 to $fp-148
	  sw $t2, -156($fp)	# spill _tmp52 from $t2 to $fp-156
	  sw $t3, -152($fp)	# spill _tmp51 from $t3 to $fp-152
	  sw $t4, -164($fp)	# spill _tmp54 from $t4 to $fp-164
	  sw $t5, -168($fp)	# spill _tmp55 from $t5 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp56 from $t6 to $fp-172
	  sw $t7, -176($fp)	# spill _tmp57 from $t7 to $fp-176
	  sw $s0, -180($fp)	# spill _tmp58 from $s0 to $fp-180
	  sw $s1, -184($fp)	# spill _tmp59 from $s1 to $fp-184
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to _tmp53
	# $v1 is setted to _tmp41
	# $t0 is setted to _tmp49
	# $t1 is setted to _tmp50
	# $t2 is setted to _tmp52
	# $t3 is setted to _tmp51
	# $t4 is setted to _tmp54
	# $t5 is setted to _tmp55
	# $t6 is setted to _tmp56
	# $t7 is setted to _tmp57
	# $s0 is setted to _tmp58
	# $s1 is setted to _tmp59
  _L6:
	# _tmp61 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -144($fp)	# spill _tmp49 from $t0 to $fp-144
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp62 = _tmp61 * _tmp53
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -160($fp)	# fill _tmp53 to $v1 from $fp-160
	  sw $t1, -148($fp)	# spill _tmp50 from $t1 to $fp-148
	  mul $t1, $t0, $v1	
	# _tmp63 = arr + _tmp62
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -152($fp)	# spill _tmp51 from $t3 to $fp-152
	  add $t3, $v0, $t1	
	# _tmp64 = 100
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 100
	  sw $t2, -156($fp)	# spill _tmp52 from $t2 to $fp-156
	  li $t2, 100		# load constant value 100 into $t2
	# *(_tmp63) = _tmp64
	# We are in the EmitStore
	# so, the reference: _tmp63 register is given $t3
	# the value: _tmp64 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp65 = 3
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -208($fp)	# spill _tmp65 from $v0 to $fp-208
	# _tmp66 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -164($fp)	# spill _tmp54 from $t4 to $fp-164
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp67 = _tmp65 < _tmp66
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -208($fp)	# fill _tmp65 to $v0 from $fp-208
	  sw $t5, -168($fp)	# spill _tmp55 from $t5 to $fp-168
	  slt $t5, $v0, $t4	
	# _tmp68 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp68 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -172($fp)	# spill _tmp56 from $t6 to $fp-172
	  lw $t6, -4($v0) 	# load with offset
	# _tmp69 = _tmp65 < _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -208($fp)	# fill _tmp65 to $v0 from $fp-208
	  sw $t7, -176($fp)	# spill _tmp57 from $t7 to $fp-176
	  slt $t7, $v0, $t6	
	# _tmp70 = _tmp69 == _tmp66
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  sw $s0, -180($fp)	# spill _tmp58 from $s0 to $fp-180
	  seq $s0, $t7, $t4	
	# _tmp71 = _tmp67 || _tmp70
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  sw $s1, -184($fp)	# spill _tmp59 from $s1 to $fp-184
	  or $s1, $t5, $s0	
	# IfZ _tmp71 Goto _L7
	# we record the Registers before _L7
	# We record such a Rsfile
	# $v0 is setted to _tmp65
	# $v1 is setted to _tmp53
	# $t0 is setted to _tmp61
	# $t1 is setted to _tmp62
	# $t2 is setted to _tmp64
	# $t3 is setted to _tmp63
	# $t4 is setted to _tmp66
	# $t5 is setted to _tmp67
	# $t6 is setted to _tmp68
	# $t7 is setted to _tmp69
	# $s0 is setted to _tmp70
	# $s1 is setted to _tmp71
	  beqz $s1, _L7	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp72
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -236($fp)	# spill _tmp72 from $s2 to $fp-236
	  lw $s2, -236($fp)	# fill _tmp72 to $s2 from $fp-236
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -192($fp)	# spill _tmp61 from $t0 to $fp-192
	  sw $t1, -196($fp)	# spill _tmp62 from $t1 to $fp-196
	  sw $t2, -204($fp)	# spill _tmp64 from $t2 to $fp-204
	  sw $t3, -200($fp)	# spill _tmp63 from $t3 to $fp-200
	  sw $t4, -212($fp)	# spill _tmp66 from $t4 to $fp-212
	  sw $t5, -216($fp)	# spill _tmp67 from $t5 to $fp-216
	  sw $t6, -220($fp)	# spill _tmp68 from $t6 to $fp-220
	  sw $t7, -224($fp)	# spill _tmp69 from $t7 to $fp-224
	  sw $s0, -228($fp)	# spill _tmp70 from $s0 to $fp-228
	  sw $s1, -232($fp)	# spill _tmp71 from $s1 to $fp-232
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to _tmp65
	# $v1 is setted to _tmp53
	# $t0 is setted to _tmp61
	# $t1 is setted to _tmp62
	# $t2 is setted to _tmp64
	# $t3 is setted to _tmp63
	# $t4 is setted to _tmp66
	# $t5 is setted to _tmp67
	# $t6 is setted to _tmp68
	# $t7 is setted to _tmp69
	# $s0 is setted to _tmp70
	# $s1 is setted to _tmp71
  _L7:
	# _tmp73 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -192($fp)	# spill _tmp61 from $t0 to $fp-192
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp74 = _tmp73 * _tmp65
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -208($fp)	# fill _tmp65 to $v1 from $fp-208
	  sw $t1, -196($fp)	# spill _tmp62 from $t1 to $fp-196
	  mul $t1, $t0, $v1	
	# _tmp75 = arr + _tmp74
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -200($fp)	# spill _tmp63 from $t3 to $fp-200
	  add $t3, $v0, $t1	
	# _tmp76 = 80
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 80
	  sw $t2, -204($fp)	# spill _tmp64 from $t2 to $fp-204
	  li $t2, 80		# load constant value 80 into $t2
	# *(_tmp75) = _tmp76
	# We are in the EmitStore
	# so, the reference: _tmp75 register is given $t3
	# the value: _tmp76 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp77 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 4
	  sw $t5, -216($fp)	# spill _tmp67 from $t5 to $fp-216
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp78 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -212($fp)	# spill _tmp66 from $t4 to $fp-212
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp79 = _tmp77 < _tmp78
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t5
	# the op2 is $t4
	  sw $t6, -220($fp)	# spill _tmp68 from $t6 to $fp-220
	  slt $t6, $t5, $t4	
	# _tmp80 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp80 register is given $t7
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t7, -224($fp)	# spill _tmp69 from $t7 to $fp-224
	  lw $t7, -4($v0) 	# load with offset
	# _tmp81 = _tmp77 < _tmp80
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t5
	# the op2 is $t7
	  sw $s0, -228($fp)	# spill _tmp70 from $s0 to $fp-228
	  slt $s0, $t5, $t7	
	# _tmp82 = _tmp81 == _tmp78
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $s0
	# the op2 is $t4
	  sw $s1, -232($fp)	# spill _tmp71 from $s1 to $fp-232
	  seq $s1, $s0, $t4	
	# _tmp83 = _tmp79 || _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t6
	# the op2 is $s1
	  or $s2, $t6, $s1	
	# IfZ _tmp83 Goto _L8
	# we record the Registers before _L8
	# We record such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp73
	# $t1 is setted to _tmp74
	# $t2 is setted to _tmp76
	# $t3 is setted to _tmp75
	# $t4 is setted to _tmp78
	# $t5 is setted to _tmp77
	# $t6 is setted to _tmp79
	# $t7 is setted to _tmp80
	# $s0 is setted to _tmp81
	# $s1 is setted to _tmp82
	# $s2 is setted to _tmp83
	  beqz $s2, _L8	# branch if _tmp83 is zero 
	# _tmp84 = "Decaf runtime error: Array subscript out of bound..."
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
	# PushParam _tmp84
	# we are in a EmitParam
	# so, the arg register is given $s3
	  sw $s3, -284($fp)	# spill _tmp84 from $s3 to $fp-284
	  lw $s3, -284($fp)	# fill _tmp84 to $s3 from $fp-284
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -240($fp)	# spill _tmp73 from $t0 to $fp-240
	  sw $t1, -244($fp)	# spill _tmp74 from $t1 to $fp-244
	  sw $t2, -252($fp)	# spill _tmp76 from $t2 to $fp-252
	  sw $t3, -248($fp)	# spill _tmp75 from $t3 to $fp-248
	  sw $t4, -260($fp)	# spill _tmp78 from $t4 to $fp-260
	  sw $t5, -256($fp)	# spill _tmp77 from $t5 to $fp-256
	  sw $t6, -264($fp)	# spill _tmp79 from $t6 to $fp-264
	  sw $t7, -268($fp)	# spill _tmp80 from $t7 to $fp-268
	  sw $s0, -272($fp)	# spill _tmp81 from $s0 to $fp-272
	  sw $s1, -276($fp)	# spill _tmp82 from $s1 to $fp-276
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp73
	# $t1 is setted to _tmp74
	# $t2 is setted to _tmp76
	# $t3 is setted to _tmp75
	# $t4 is setted to _tmp78
	# $t5 is setted to _tmp77
	# $t6 is setted to _tmp79
	# $t7 is setted to _tmp80
	# $s0 is setted to _tmp81
	# $s1 is setted to _tmp82
	# $s2 is setted to _tmp83
  _L8:
	# _tmp85 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -240($fp)	# spill _tmp73 from $t0 to $fp-240
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp86 = _tmp85 * _tmp77
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  sw $t1, -244($fp)	# spill _tmp74 from $t1 to $fp-244
	  mul $t1, $t0, $t5	
	# _tmp87 = arr + _tmp86
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -248($fp)	# spill _tmp75 from $t3 to $fp-248
	  add $t3, $v0, $t1	
	# _tmp88 = 59
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 59
	  sw $t2, -252($fp)	# spill _tmp76 from $t2 to $fp-252
	  li $t2, 59		# load constant value 59 into $t2
	# *(_tmp87) = _tmp88
	# We are in the EmitStore
	# so, the reference: _tmp87 register is given $t3
	# the value: _tmp88 is given $t2
	  sw $t2, 0($t3) 	# store with offset
	# _tmp89 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  sw $t4, -260($fp)	# spill _tmp78 from $t4 to $fp-260
	  li $t4, 1		# load constant value 1 into $t4
	# i = _tmp89
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# We rewrite such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp85
	# $t1 is setted to _tmp86
	# $t2 is setted to _tmp88
	# $t3 is setted to _tmp87
	# $t4 is setted to _tmp89
	# $t5 is setted to _tmp77
	# $t6 is setted to _tmp79
	# $t7 is setted to _tmp80
	# $s0 is setted to _tmp81
	# $s1 is setted to _tmp82
	# $s2 is setted to _tmp83
  _L9:
	# _tmp90 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp90 register is given $t0
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t0, -288($fp)	# spill _tmp85 from $t0 to $fp-288
	  lw $t0, -4($v0) 	# load with offset
	# _tmp91 = i < _tmp90
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $t1, -292($fp)	# spill _tmp86 from $t1 to $fp-292
	  slt $t1, $v0, $t0	
	# IfZ _tmp91 Goto _L10
	# we record the Registers before _L10
	# We record such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp90
	# $t1 is setted to _tmp91
	# $t2 is setted to _tmp88
	# $t3 is setted to _tmp87
	# $t4 is setted to _tmp89
	# $t5 is setted to _tmp77
	# $t6 is setted to _tmp79
	# $t7 is setted to _tmp80
	# $s0 is setted to _tmp81
	# $s1 is setted to _tmp82
	# $s2 is setted to _tmp83
	  beqz $t1, _L10	# branch if _tmp91 is zero 
	# _tmp92 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  sw $t2, -300($fp)	# spill _tmp88 from $t2 to $fp-300
	  li $t2, 1		# load constant value 1 into $t2
	# _tmp93 = i - _tmp92
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $t3, -296($fp)	# spill _tmp87 from $t3 to $fp-296
	  sub $t3, $v0, $t2	
	# j = _tmp93
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t3
	  move $v0, $t3		# copy value from $t3 to $v0
	  sw $v0, -16($fp)	# spill j from $v0 to $fp-16
	# _tmp94 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -304($fp)	# spill _tmp89 from $t4 to $fp-304
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp95 = i < _tmp94
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $t5, -256($fp)	# spill _tmp77 from $t5 to $fp-256
	  slt $t5, $v0, $t4	
	# _tmp96 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp96 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -264($fp)	# spill _tmp79 from $t6 to $fp-264
	  lw $t6, -4($v0) 	# load with offset
	# _tmp97 = i < _tmp96
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $t7, -268($fp)	# spill _tmp80 from $t7 to $fp-268
	  slt $t7, $v0, $t6	
	# _tmp98 = _tmp97 == _tmp94
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  sw $s0, -272($fp)	# spill _tmp81 from $s0 to $fp-272
	  seq $s0, $t7, $t4	
	# _tmp99 = _tmp95 || _tmp98
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  sw $s1, -276($fp)	# spill _tmp82 from $s1 to $fp-276
	  or $s1, $t5, $s0	
	# IfZ _tmp99 Goto _L11
	# we record the Registers before _L11
	# We record such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp90
	# $t1 is setted to _tmp91
	# $t2 is setted to _tmp92
	# $t3 is setted to _tmp93
	# $t4 is setted to _tmp94
	# $t5 is setted to _tmp95
	# $t6 is setted to _tmp96
	# $t7 is setted to _tmp97
	# $s0 is setted to _tmp98
	# $s1 is setted to _tmp99
	# $s2 is setted to _tmp83
	  beqz $s1, _L11	# branch if _tmp99 is zero 
	# _tmp100 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string11
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
	  la $s2, _string11	# load label
	# PushParam _tmp100
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -348($fp)	# spill _tmp100 from $s2 to $fp-348
	  lw $s2, -348($fp)	# fill _tmp100 to $s2 from $fp-348
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -308($fp)	# spill _tmp90 from $t0 to $fp-308
	  sw $t1, -312($fp)	# spill _tmp91 from $t1 to $fp-312
	  sw $t2, -316($fp)	# spill _tmp92 from $t2 to $fp-316
	  sw $t3, -320($fp)	# spill _tmp93 from $t3 to $fp-320
	  sw $t4, -324($fp)	# spill _tmp94 from $t4 to $fp-324
	  sw $t5, -328($fp)	# spill _tmp95 from $t5 to $fp-328
	  sw $t6, -332($fp)	# spill _tmp96 from $t6 to $fp-332
	  sw $t7, -336($fp)	# spill _tmp97 from $t7 to $fp-336
	  sw $s0, -340($fp)	# spill _tmp98 from $s0 to $fp-340
	  sw $s1, -344($fp)	# spill _tmp99 from $s1 to $fp-344
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp90
	# $t1 is setted to _tmp91
	# $t2 is setted to _tmp92
	# $t3 is setted to _tmp93
	# $t4 is setted to _tmp94
	# $t5 is setted to _tmp95
	# $t6 is setted to _tmp96
	# $t7 is setted to _tmp97
	# $s0 is setted to _tmp98
	# $s1 is setted to _tmp99
	# $s2 is setted to _tmp83
  _L11:
	# _tmp101 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -308($fp)	# spill _tmp90 from $t0 to $fp-308
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp102 = _tmp101 * i
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -12($fp)	# fill i to $v1 from $fp-12
	  sw $t1, -312($fp)	# spill _tmp91 from $t1 to $fp-312
	  mul $t1, $t0, $v1	
	# _tmp103 = arr + _tmp102
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t2, -316($fp)	# spill _tmp92 from $t2 to $fp-316
	  add $t2, $v0, $t1	
	# _tmp104 = *(_tmp103)
	# We are in the EmitLoad
	# so, the dst: _tmp104 register is given $t3
	# the reference: _tmp103 is given $t2
	  sw $t3, -320($fp)	# spill _tmp93 from $t3 to $fp-320
	  lw $t3, 0($t2) 	# load with offset
	# val = _tmp104
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t3
	  sw $t7, -336($fp)	# spill _tmp97 from $t7 to $fp-336
	  move $t7, $t3		# copy value from $t3 to $t7
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to i
	# $t0 is setted to _tmp101
	# $t1 is setted to _tmp102
	# $t2 is setted to _tmp103
	# $t3 is setted to _tmp104
	# $t4 is setted to _tmp94
	# $t5 is setted to _tmp95
	# $t6 is setted to _tmp96
	# $t7 is setted to val
	# $s0 is setted to _tmp98
	# $s1 is setted to _tmp99
	# $s2 is setted to _tmp83
  _L12:
	# _tmp105 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  sw $t0, -352($fp)	# spill _tmp101 from $t0 to $fp-352
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp106 = _tmp105 < j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  sw $t1, -356($fp)	# spill _tmp102 from $t1 to $fp-356
	  slt $t1, $t0, $v1	
	# _tmp107 = j == _tmp105
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t2, -360($fp)	# spill _tmp103 from $t2 to $fp-360
	  seq $t2, $v0, $t0	
	# _tmp108 = _tmp106 || _tmp107
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  sw $t3, -364($fp)	# spill _tmp104 from $t3 to $fp-364
	  or $t3, $t1, $t2	
	# IfZ _tmp108 Goto _L13
	# we record the Registers before _L13
	# We record such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp105
	# $t1 is setted to _tmp106
	# $t2 is setted to _tmp107
	# $t3 is setted to _tmp108
	# $t4 is setted to _tmp94
	# $t5 is setted to _tmp95
	# $t6 is setted to _tmp96
	# $t7 is setted to val
	# $s0 is setted to _tmp98
	# $s1 is setted to _tmp99
	# $s2 is setted to _tmp83
	  beqz $t3, _L13	# branch if _tmp108 is zero 
	# _tmp109 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  sw $t4, -324($fp)	# spill _tmp94 from $t4 to $fp-324
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp110 = j < _tmp109
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t5, -328($fp)	# spill _tmp95 from $t5 to $fp-328
	  slt $t5, $v0, $t4	
	# _tmp111 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp111 register is given $t6
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -332($fp)	# spill _tmp96 from $t6 to $fp-332
	  lw $t6, -4($v0) 	# load with offset
	# _tmp112 = j < _tmp111
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $spill
	# the op2 is $t6
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t7, -20($fp)	# spill val from $t7 to $fp-20
	  slt $t7, $v0, $t6	
	# _tmp113 = _tmp112 == _tmp109
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t7
	# the op2 is $t4
	  sw $s0, -340($fp)	# spill _tmp98 from $s0 to $fp-340
	  seq $s0, $t7, $t4	
	# _tmp114 = _tmp110 || _tmp113
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t5
	# the op2 is $s0
	  sw $s1, -344($fp)	# spill _tmp99 from $s1 to $fp-344
	  or $s1, $t5, $s0	
	# IfZ _tmp114 Goto _L15
	# we record the Registers before _L15
	# We record such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp105
	# $t1 is setted to _tmp106
	# $t2 is setted to _tmp107
	# $t3 is setted to _tmp108
	# $t4 is setted to _tmp109
	# $t5 is setted to _tmp110
	# $t6 is setted to _tmp111
	# $t7 is setted to _tmp112
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
	  beqz $s1, _L15	# branch if _tmp114 is zero 
	# _tmp115 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s2
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s2
	# the label is _string12
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
	  la $s2, _string12	# load label
	# PushParam _tmp115
	# we are in a EmitParam
	# so, the arg register is given $s2
	  sw $s2, -408($fp)	# spill _tmp115 from $s2 to $fp-408
	  lw $s2, -408($fp)	# fill _tmp115 to $s2 from $fp-408
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -368($fp)	# spill _tmp105 from $t0 to $fp-368
	  sw $t1, -372($fp)	# spill _tmp106 from $t1 to $fp-372
	  sw $t2, -376($fp)	# spill _tmp107 from $t2 to $fp-376
	  sw $t3, -380($fp)	# spill _tmp108 from $t3 to $fp-380
	  sw $t4, -384($fp)	# spill _tmp109 from $t4 to $fp-384
	  sw $t5, -388($fp)	# spill _tmp110 from $t5 to $fp-388
	  sw $t6, -392($fp)	# spill _tmp111 from $t6 to $fp-392
	  sw $t7, -396($fp)	# spill _tmp112 from $t7 to $fp-396
	  sw $s0, -400($fp)	# spill _tmp113 from $s0 to $fp-400
	  sw $s1, -404($fp)	# spill _tmp114 from $s1 to $fp-404
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp105
	# $t1 is setted to _tmp106
	# $t2 is setted to _tmp107
	# $t3 is setted to _tmp108
	# $t4 is setted to _tmp109
	# $t5 is setted to _tmp110
	# $t6 is setted to _tmp111
	# $t7 is setted to _tmp112
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
  _L15:
	# _tmp116 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -368($fp)	# spill _tmp105 from $t0 to $fp-368
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp117 = _tmp116 * j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  sw $t1, -372($fp)	# spill _tmp106 from $t1 to $fp-372
	  mul $t1, $t0, $v1	
	# _tmp118 = arr + _tmp117
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t2, -376($fp)	# spill _tmp107 from $t2 to $fp-376
	  add $t2, $v0, $t1	
	# _tmp119 = *(_tmp118)
	# We are in the EmitLoad
	# so, the dst: _tmp119 register is given $t3
	# the reference: _tmp118 is given $t2
	  sw $t3, -380($fp)	# spill _tmp108 from $t3 to $fp-380
	  lw $t3, 0($t2) 	# load with offset
	# _tmp120 = _tmp119 < val
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t3
	# the op2 is $t7
	  sw $t7, -396($fp)	# spill _tmp112 from $t7 to $fp-396
	  lw $t7, -20($fp)	# fill val to $t7 from $fp-20
	  sw $t4, -384($fp)	# spill _tmp109 from $t4 to $fp-384
	  slt $t4, $t3, $t7	
	# _tmp121 = val == _tmp119
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t7
	# the op2 is $t3
	  sw $t5, -388($fp)	# spill _tmp110 from $t5 to $fp-388
	  seq $t5, $t7, $t3	
	# _tmp122 = _tmp120 || _tmp121
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t5
	  sw $t6, -392($fp)	# spill _tmp111 from $t6 to $fp-392
	  or $t6, $t4, $t5	
	# IfZ _tmp122 Goto _L14
	# we record the Registers before _L14
	# We record such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp116
	# $t1 is setted to _tmp117
	# $t2 is setted to _tmp118
	# $t3 is setted to _tmp119
	# $t4 is setted to _tmp120
	# $t5 is setted to _tmp121
	# $t6 is setted to _tmp122
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
	  beqz $t6, _L14	# branch if _tmp122 is zero 
	# Goto _L13
	# we record the Registers before _L13
	# We record such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp116
	# $t1 is setted to _tmp117
	# $t2 is setted to _tmp118
	# $t3 is setted to _tmp119
	# $t4 is setted to _tmp120
	# $t5 is setted to _tmp121
	# $t6 is setted to _tmp122
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
	  b _L13		# unconditional branch
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp116
	# $t1 is setted to _tmp117
	# $t2 is setted to _tmp118
	# $t3 is setted to _tmp119
	# $t4 is setted to _tmp120
	# $t5 is setted to _tmp121
	# $t6 is setted to _tmp122
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
  _L14:
	# _tmp123 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  sw $t0, -412($fp)	# spill _tmp116 from $t0 to $fp-412
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp124 = j + _tmp123
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
	  add $s2, $v0, $t0	
	# _tmp125 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  sw $t1, -416($fp)	# spill _tmp117 from $t1 to $fp-416
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp126 = _tmp124 < _tmp125
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s2
	# the op2 is $t1
	  sw $t2, -420($fp)	# spill _tmp118 from $t2 to $fp-420
	  slt $t2, $s2, $t1	
	# _tmp127 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp127 register is given $t3
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -424($fp)	# spill _tmp119 from $t3 to $fp-424
	  lw $t3, -4($v0) 	# load with offset
	# _tmp128 = _tmp124 < _tmp127
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $s2
	# the op2 is $t3
	  sw $t4, -428($fp)	# spill _tmp120 from $t4 to $fp-428
	  slt $t4, $s2, $t3	
	# _tmp129 = _tmp128 == _tmp125
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t4
	# the op2 is $t1
	  sw $t5, -432($fp)	# spill _tmp121 from $t5 to $fp-432
	  seq $t5, $t4, $t1	
	# _tmp130 = _tmp126 || _tmp129
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t2
	# the op2 is $t5
	  sw $t6, -436($fp)	# spill _tmp122 from $t6 to $fp-436
	  or $t6, $t2, $t5	
	# IfZ _tmp130 Goto _L16
	# we record the Registers before _L16
	# We record such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp123
	# $t1 is setted to _tmp125
	# $t2 is setted to _tmp126
	# $t3 is setted to _tmp127
	# $t4 is setted to _tmp128
	# $t5 is setted to _tmp129
	# $t6 is setted to _tmp130
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp124
	  beqz $t6, _L16	# branch if _tmp130 is zero 
	# _tmp131 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $t7
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t7
	# the label is _string13
	  la $t7, _string13	# load label
	# PushParam _tmp131
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -472($fp)	# spill _tmp131 from $t7 to $fp-472
	  lw $t7, -472($fp)	# fill _tmp131 to $t7 from $fp-472
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -440($fp)	# spill _tmp123 from $t0 to $fp-440
	  sw $t1, -448($fp)	# spill _tmp125 from $t1 to $fp-448
	  sw $t2, -452($fp)	# spill _tmp126 from $t2 to $fp-452
	  sw $t3, -456($fp)	# spill _tmp127 from $t3 to $fp-456
	  sw $t4, -460($fp)	# spill _tmp128 from $t4 to $fp-460
	  sw $t5, -464($fp)	# spill _tmp129 from $t5 to $fp-464
	  sw $t6, -468($fp)	# spill _tmp130 from $t6 to $fp-468
	  sw $s0, -400($fp)	# spill _tmp113 from $s0 to $fp-400
	  sw $s1, -404($fp)	# spill _tmp114 from $s1 to $fp-404
	  sw $s2, -444($fp)	# spill _tmp124 from $s2 to $fp-444
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp123
	# $t1 is setted to _tmp125
	# $t2 is setted to _tmp126
	# $t3 is setted to _tmp127
	# $t4 is setted to _tmp128
	# $t5 is setted to _tmp129
	# $t6 is setted to _tmp130
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp124
  _L16:
	# _tmp132 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -440($fp)	# spill _tmp123 from $t0 to $fp-440
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp133 = _tmp132 * _tmp124
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $s2
	  sw $t1, -448($fp)	# spill _tmp125 from $t1 to $fp-448
	  mul $t1, $t0, $s2	
	# _tmp134 = arr + _tmp133
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t6, -468($fp)	# spill _tmp130 from $t6 to $fp-468
	  add $t6, $v0, $t1	
	# _tmp135 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  sw $t2, -452($fp)	# spill _tmp126 from $t2 to $fp-452
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp136 = j < _tmp135
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $spill
	# the op2 is $t2
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t3, -456($fp)	# spill _tmp127 from $t3 to $fp-456
	  slt $t3, $v0, $t2	
	# _tmp137 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp137 register is given $t4
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t4, -460($fp)	# spill _tmp128 from $t4 to $fp-460
	  lw $t4, -4($v0) 	# load with offset
	# _tmp138 = j < _tmp137
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t5, -464($fp)	# spill _tmp129 from $t5 to $fp-464
	  slt $t5, $v0, $t4	
	# _tmp139 = _tmp138 == _tmp135
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t5
	# the op2 is $t2
	  seq $t7, $t5, $t2	
	# _tmp140 = _tmp136 || _tmp139
	# We are in the EmitBinaryOp
	# so, the dst register is given $s0
	# the op1 is $t3
	# the op2 is $t7
	  sw $s0, -400($fp)	# spill _tmp113 from $s0 to $fp-400
	  or $s0, $t3, $t7	
	# IfZ _tmp140 Goto _L17
	# we record the Registers before _L17
	# We record such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp132
	# $t1 is setted to _tmp133
	# $t2 is setted to _tmp135
	# $t3 is setted to _tmp136
	# $t4 is setted to _tmp137
	# $t5 is setted to _tmp138
	# $t6 is setted to _tmp134
	# $t7 is setted to _tmp139
	# $s0 is setted to _tmp140
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp124
	  beqz $s0, _L17	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s1
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s1
	# the label is _string14
	  sw $s1, -404($fp)	# spill _tmp114 from $s1 to $fp-404
	  la $s1, _string14	# load label
	# PushParam _tmp141
	# we are in a EmitParam
	# so, the arg register is given $s1
	  sw $s1, -512($fp)	# spill _tmp141 from $s1 to $fp-512
	  lw $s1, -512($fp)	# fill _tmp141 to $s1 from $fp-512
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -476($fp)	# spill _tmp132 from $t0 to $fp-476
	  sw $t1, -480($fp)	# spill _tmp133 from $t1 to $fp-480
	  sw $t2, -488($fp)	# spill _tmp135 from $t2 to $fp-488
	  sw $t3, -492($fp)	# spill _tmp136 from $t3 to $fp-492
	  sw $t4, -496($fp)	# spill _tmp137 from $t4 to $fp-496
	  sw $t5, -500($fp)	# spill _tmp138 from $t5 to $fp-500
	  sw $t6, -484($fp)	# spill _tmp134 from $t6 to $fp-484
	  sw $t7, -504($fp)	# spill _tmp139 from $t7 to $fp-504
	  sw $s0, -508($fp)	# spill _tmp140 from $s0 to $fp-508
	  sw $s2, -444($fp)	# spill _tmp124 from $s2 to $fp-444
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp132
	# $t1 is setted to _tmp133
	# $t2 is setted to _tmp135
	# $t3 is setted to _tmp136
	# $t4 is setted to _tmp137
	# $t5 is setted to _tmp138
	# $t6 is setted to _tmp134
	# $t7 is setted to _tmp139
	# $s0 is setted to _tmp140
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp124
  _L17:
	# _tmp142 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -476($fp)	# spill _tmp132 from $t0 to $fp-476
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp143 = _tmp142 * j
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $spill
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  sw $t1, -480($fp)	# spill _tmp133 from $t1 to $fp-480
	  mul $t1, $t0, $v1	
	# _tmp144 = arr + _tmp143
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t2, -488($fp)	# spill _tmp135 from $t2 to $fp-488
	  add $t2, $v0, $t1	
	# _tmp145 = *(_tmp144)
	# We are in the EmitLoad
	# so, the dst: _tmp145 register is given $t3
	# the reference: _tmp144 is given $t2
	  sw $t3, -492($fp)	# spill _tmp136 from $t3 to $fp-492
	  lw $t3, 0($t2) 	# load with offset
	# *(_tmp134) = _tmp145
	# We are in the EmitStore
	# so, the reference: _tmp134 register is given $t6
	# the value: _tmp145 is given $t3
	  sw $t3, 0($t6) 	# store with offset
	# _tmp146 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  sw $t4, -496($fp)	# spill _tmp137 from $t4 to $fp-496
	  li $t4, 1		# load constant value 1 into $t4
	# _tmp147 = j - _tmp146
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t4
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t5, -500($fp)	# spill _tmp138 from $t5 to $fp-500
	  sub $t5, $v0, $t4	
	# j = _tmp147
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t5
	  move $v0, $t5		# copy value from $t5 to $v0
	  sw $v0, -16($fp)	# spill j from $v0 to $fp-16
	# Goto _L12
	# we record the Registers before _L12
	# We record such a Rsfile
	# $v0 is setted to j
	# $v1 is setted to j
	# $t0 is setted to _tmp142
	# $t1 is setted to _tmp143
	# $t2 is setted to _tmp144
	# $t3 is setted to _tmp145
	# $t4 is setted to _tmp146
	# $t5 is setted to _tmp147
	# $t6 is setted to _tmp134
	# $t7 is setted to _tmp139
	# $s0 is setted to _tmp140
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp124
	  b _L12		# unconditional branch
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp116
	# $t1 is setted to _tmp117
	# $t2 is setted to _tmp118
	# $t3 is setted to _tmp119
	# $t4 is setted to _tmp120
	# $t5 is setted to _tmp121
	# $t6 is setted to _tmp122
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
  _L13:
	# _tmp148 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  sw $t0, -412($fp)	# spill _tmp116 from $t0 to $fp-412
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp149 = j + _tmp148
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  sw $t5, -432($fp)	# spill _tmp121 from $t5 to $fp-432
	  add $t5, $v0, $t0	
	# _tmp150 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  sw $t1, -416($fp)	# spill _tmp117 from $t1 to $fp-416
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp151 = _tmp149 < _tmp150
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t5
	# the op2 is $t1
	  sw $t2, -420($fp)	# spill _tmp118 from $t2 to $fp-420
	  slt $t2, $t5, $t1	
	# _tmp152 = *(arr + -4)
	# We are in the EmitLoad
	# so, the dst: _tmp152 register is given $t3
	# the reference: arr is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t3, -424($fp)	# spill _tmp119 from $t3 to $fp-424
	  lw $t3, -4($v0) 	# load with offset
	# _tmp153 = _tmp149 < _tmp152
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t5
	# the op2 is $t3
	  sw $t4, -428($fp)	# spill _tmp120 from $t4 to $fp-428
	  slt $t4, $t5, $t3	
	# _tmp154 = _tmp153 == _tmp150
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $t4
	# the op2 is $t1
	  sw $t6, -436($fp)	# spill _tmp122 from $t6 to $fp-436
	  seq $t6, $t4, $t1	
	# _tmp155 = _tmp151 || _tmp154
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t2
	# the op2 is $t6
	  or $t7, $t2, $t6	
	# IfZ _tmp155 Goto _L18
	# we record the Registers before _L18
	# We record such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp148
	# $t1 is setted to _tmp150
	# $t2 is setted to _tmp151
	# $t3 is setted to _tmp152
	# $t4 is setted to _tmp153
	# $t5 is setted to _tmp149
	# $t6 is setted to _tmp154
	# $t7 is setted to _tmp155
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
	  beqz $t7, _L18	# branch if _tmp155 is zero 
	# _tmp156 = "Decaf runtime error: Array subscript out of bound..."
	# We are in the LoadString
	# so, the dst register is given $s0
	# the String is "Decaf runtime error: Array subscript out of bounds\n"
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $s0
	# the label is _string15
	  sw $s0, -400($fp)	# spill _tmp113 from $s0 to $fp-400
	  la $s0, _string15	# load label
	# PushParam _tmp156
	# we are in a EmitParam
	# so, the arg register is given $s0
	  sw $s0, -572($fp)	# spill _tmp156 from $s0 to $fp-572
	  lw $s0, -572($fp)	# fill _tmp156 to $s0 from $fp-572
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  sw $t0, -540($fp)	# spill _tmp148 from $t0 to $fp-540
	  sw $t1, -548($fp)	# spill _tmp150 from $t1 to $fp-548
	  sw $t2, -552($fp)	# spill _tmp151 from $t2 to $fp-552
	  sw $t3, -556($fp)	# spill _tmp152 from $t3 to $fp-556
	  sw $t4, -560($fp)	# spill _tmp153 from $t4 to $fp-560
	  sw $t5, -544($fp)	# spill _tmp149 from $t5 to $fp-544
	  sw $t6, -564($fp)	# spill _tmp154 from $t6 to $fp-564
	  sw $t7, -568($fp)	# spill _tmp155 from $t7 to $fp-568
	  sw $s1, -404($fp)	# spill _tmp114 from $s1 to $fp-404
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	# we clean all the regiser
	  jal _Halt          	# jump to function
	# We rewrite such a Rsfile
	# $v0 is setted to arr
	# $v1 is setted to j
	# $t0 is setted to _tmp148
	# $t1 is setted to _tmp150
	# $t2 is setted to _tmp151
	# $t3 is setted to _tmp152
	# $t4 is setted to _tmp153
	# $t5 is setted to _tmp149
	# $t6 is setted to _tmp154
	# $t7 is setted to _tmp155
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
  _L18:
	# _tmp157 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  sw $t0, -540($fp)	# spill _tmp148 from $t0 to $fp-540
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp158 = _tmp157 * _tmp149
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t0
	# the op2 is $t5
	  sw $t1, -548($fp)	# spill _tmp150 from $t1 to $fp-548
	  mul $t1, $t0, $t5	
	# _tmp159 = arr + _tmp158
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $spill
	# the op2 is $t1
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $t2, -552($fp)	# spill _tmp151 from $t2 to $fp-552
	  add $t2, $v0, $t1	
	# *(_tmp159) = val
	# We are in the EmitStore
	# so, the reference: _tmp159 register is given $t2
	# the value: val is given $t7
	  sw $t7, -568($fp)	# spill _tmp155 from $t7 to $fp-568
	  lw $t7, -20($fp)	# fill val to $t7 from $fp-20
	  sw $t7, 0($t2) 	# store with offset
	# _tmp160 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  sw $t3, -556($fp)	# spill _tmp152 from $t3 to $fp-556
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp161 = i + _tmp160
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $spill
	# the op2 is $t3
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  sw $t4, -560($fp)	# spill _tmp153 from $t4 to $fp-560
	  add $t4, $v0, $t3	
	# i = _tmp161
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t4
	  move $v0, $t4		# copy value from $t4 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L9
	# we record the Registers before _L9
	# We record such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to j
	# $t0 is setted to _tmp157
	# $t1 is setted to _tmp158
	# $t2 is setted to _tmp159
	# $t3 is setted to _tmp160
	# $t4 is setted to _tmp161
	# $t5 is setted to _tmp149
	# $t6 is setted to _tmp154
	# $t7 is setted to val
	# $s0 is setted to _tmp113
	# $s1 is setted to _tmp114
	# $s2 is setted to _tmp83
	  b _L9		# unconditional branch
	# We rewrite such a Rsfile
	# $v0 is setted to i
	# $v1 is setted to _tmp65
	# $t0 is setted to _tmp90
	# $t1 is setted to _tmp91
	# $t2 is setted to _tmp88
	# $t3 is setted to _tmp87
	# $t4 is setted to _tmp89
	# $t5 is setted to _tmp77
	# $t6 is setted to _tmp79
	# $t7 is setted to _tmp80
	# $s0 is setted to _tmp81
	# $s1 is setted to _tmp82
	# $s2 is setted to _tmp83
  _L10:
	# PushParam arr
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
	# we clean all the regiser
	  sw $t0, -308($fp)	# spill _tmp90 from $t0 to $fp-308
	  sw $t1, -312($fp)	# spill _tmp91 from $t1 to $fp-312
	  sw $t2, -300($fp)	# spill _tmp88 from $t2 to $fp-300
	  sw $t3, -296($fp)	# spill _tmp87 from $t3 to $fp-296
	  sw $t4, -304($fp)	# spill _tmp89 from $t4 to $fp-304
	  sw $t5, -256($fp)	# spill _tmp77 from $t5 to $fp-256
	  sw $t6, -264($fp)	# spill _tmp79 from $t6 to $fp-264
	  sw $t7, -268($fp)	# spill _tmp80 from $t7 to $fp-268
	  sw $s0, -272($fp)	# spill _tmp81 from $s0 to $fp-272
	  sw $s1, -276($fp)	# spill _tmp82 from $s1 to $fp-276
	  sw $s2, -280($fp)	# spill _tmp83 from $s2 to $fp-280
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
