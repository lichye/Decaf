	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _foo:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# IfZ c Goto _L1
	# we clean all the regiser
	  lw $t0, 8($fp)	# fill c to $t0 from $fp+8
	  beqz $t0, _L1	# branch if c is zero 
	# _tmp0 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 2
	  li $t1, 2		# load constant value 2 into $t1
	# _tmp1 = a + _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  add $t2, $t0, $t1	
	# Return _tmp1
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L0
	# we clean all the regiser
	  sw $t1, -8($fp)	# spill _tmp0 from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	  b _L0		# unconditional branch
	# we clean all the regiser
  _L1:
	# PushParam a
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 4($fp)	# fill a to $t0 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = " wacky.\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " wacky.\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz " wacky.\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string1
	  la $t0, _string1	# load label
	# PushParam _tmp2
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp2 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L0:
	# _tmp3 = 18
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 18
	  li $t1, 18		# load constant value 18 into $t1
	# Return _tmp3
	  move $v0, $t1		# assign return value into $v0
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
	# BeginFunc 84
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 84	# decrement sp to make space for locals/temps
	# _tmp4 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# a = _tmp4
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# _tmp5 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 2
	  li $t2, 2		# load constant value 2 into $t2
	# _tmp6 = a / _tmp5
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  div $t3, $t1, $t2	
	# b = _tmp6
	# We are in the EmitCopy
	# so, the dst register is given $t6
	# the src is $t3
	  move $t6, $t3		# copy value from $t3 to $t6
	# _tmp7 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 1
	  li $t4, 1		# load constant value 1 into $t4
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -24($fp)	# spill _tmp7 from $t4 to $fp-24
	  lw $t4, -24($fp)	# fill _tmp7 to $t4 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam a
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, 0($gp)	# spill a from $t1 to $gp+0
	  lw $t1, 0($gp)	# fill a to $t1 from $gp+0
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp8 = LCall _foo
	# we clean all the regiser
	  sw $t0, -12($fp)	# spill _tmp4 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp5 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp6 from $t3 to $fp-20
	  sw $t6, -8($fp)	# spill b from $t6 to $fp-8
	  jal _foo           	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -28($fp)	# spill _tmp8 from $t5 to $fp-28
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp9 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 2
	  li $t0, 2		# load constant value 2 into $t0
	# _tmp10 = b + _tmp9
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t6
	# the op2 is $t0
	  lw $t6, -8($fp)	# fill b to $t6 from $fp-8
	  add $t1, $t6, $t0	
	# _tmp11 = a < b
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t1
	# the op2 is $t6
	  sw $t1, -36($fp)	# spill _tmp10 from $t1 to $fp-36
	  lw $t1, 0($gp)	# fill a to $t1 from $gp+0
	  slt $t2, $t1, $t6	
	# _tmp12 = a == b
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t6
	  seq $t3, $t1, $t6	
	# _tmp13 = _tmp11 || _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  or $t4, $t2, $t3	
	# PushParam _tmp13
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -48($fp)	# spill _tmp13 from $t4 to $fp-48
	  lw $t4, -48($fp)	# fill _tmp13 to $t4 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp10
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -36($fp)	# fill _tmp10 to $t1 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp14 = LCall _foo
	# we clean all the regiser
	  sw $t0, -32($fp)	# spill _tmp9 from $t0 to $fp-32
	  sw $t2, -40($fp)	# spill _tmp11 from $t2 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp12 from $t3 to $fp-44
	  jal _foo           	# jump to function
	  move $t5, $v0		# copy function return value from $v0
	  sw $t5, -52($fp)	# spill _tmp14 from $t5 to $fp-52
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp15 = 3
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 3
	  li $t0, 3		# load constant value 3 into $t0
	# _tmp16 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  sw $t0, -56($fp)	# spill _tmp15 from $t0 to $fp-56
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp17 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp18 = _tmp16 && _tmp17
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  and $t2, $t0, $t1	
	# PushParam _tmp18
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -68($fp)	# spill _tmp18 from $t2 to $fp-68
	  lw $t2, -68($fp)	# fill _tmp18 to $t2 from $fp-68
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp16 from $t0 to $fp-60
	  lw $t0, -56($fp)	# fill _tmp15 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp19 = LCall _foo
	# we clean all the regiser
	  sw $t1, -64($fp)	# spill _tmp17 from $t1 to $fp-64
	  jal _foo           	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -72($fp)	# spill _tmp19 from $t4 to $fp-72
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp20 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp21 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp22 = _tmp20 == _tmp21
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  seq $t2, $t0, $t1	
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -84($fp)	# spill _tmp22 from $t2 to $fp-84
	  lw $t2, -84($fp)	# fill _tmp22 to $t2 from $fp-84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp19
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -72($fp)	# fill _tmp19 to $t4 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _foo
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp20 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp21 from $t1 to $fp-80
	  jal _foo           	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp23 from $t3 to $fp-88
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
