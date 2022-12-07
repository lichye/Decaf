	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _factorial:
	# BeginFunc 36
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp1 = n < _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  slt $t2, $t0, $t1	
	# _tmp2 = n == _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t0
	# the op2 is $t1
	  seq $t3, $t0, $t1	
	# _tmp3 = _tmp1 || _tmp2
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  or $t4, $t2, $t3	
	# IfZ _tmp3 Goto _L0
	# we clean all the regiser
	  sw $t1, -8($fp)	# spill _tmp0 from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp2 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp3 from $t4 to $fp-20
	  lw $t4, -20($fp)	# fill _tmp3 to $t4 from $fp-20
	  beqz $t4, _L0	# branch if _tmp3 is zero 
	# _tmp4 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# Return _tmp4
	  move $v0, $t5		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
	  sw $t5, -24($fp)	# spill _tmp4 from $t5 to $fp-24
  _L0:
	# _tmp5 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t6
	# the constant is 1
	  li $t6, 1		# load constant value 1 into $t6
	# _tmp6 = n - _tmp5
	# We are in the EmitBinaryOp
	# so, the dst register is given $t7
	# the op1 is $t0
	# the op2 is $t6
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  sub $t7, $t0, $t6	
	# PushParam _tmp6
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -32($fp)	# spill _tmp6 from $t7 to $fp-32
	  lw $t7, -32($fp)	# fill _tmp6 to $t7 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp7 = LCall _factorial
	# we clean all the regiser
	  sw $t6, -28($fp)	# spill _tmp5 from $t6 to $fp-28
	  jal _factorial     	# jump to function
	  move $s0, $v0		# copy function return value from $v0
	  sw $s0, -36($fp)	# spill _tmp7 from $s0 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp8 = n * _tmp7
	# We are in the EmitBinaryOp
	# so, the dst register is given $s1
	# the op1 is $t0
	# the op2 is $s0
	  lw $t0, 4($fp)	# fill n to $t0 from $fp+4
	  mul $s1, $t0, $s0	
	# Return _tmp8
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
  main:
	# BeginFunc 52
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 52	# decrement sp to make space for locals/temps
	# _tmp9 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t7
	# the constant is 1
	  li $t7, 1		# load constant value 1 into $t7
	# n = _tmp9
	# We are in the EmitCopy
	# so, the dst register is given $s0
	# the src is $t7
	  move $s0, $t7		# copy value from $t7 to $s0
	# we clean all the regiser
	  sw $t7, -12($fp)	# spill _tmp9 from $t7 to $fp-12
	  sw $s0, -8($fp)	# spill n from $s0 to $fp-8
  _L1:
	# _tmp10 = 15
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 15
	  li $t0, 15		# load constant value 15 into $t0
	# _tmp11 = n < _tmp10
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $s0
	# the op2 is $t0
	  lw $s0, -8($fp)	# fill n to $s0 from $fp-8
	  slt $t1, $s0, $t0	
	# _tmp12 = n == _tmp10
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $s0
	# the op2 is $t0
	  seq $t2, $s0, $t0	
	# _tmp13 = _tmp11 || _tmp12
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  or $t3, $t1, $t2	
	# IfZ _tmp13 Goto _L2
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp10 from $t0 to $fp-16
	  sw $t1, -20($fp)	# spill _tmp11 from $t1 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp12 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp13 from $t3 to $fp-28
	  lw $t3, -28($fp)	# fill _tmp13 to $t3 from $fp-28
	  beqz $t3, _L2	# branch if _tmp13 is zero 
	# _tmp14 = "Factorial("
	# We are in the LoadString
	# so, the dst register is given $t4
	# the String is "Factorial("
	  .data			# create string constant marked with label
	  _string1: .asciiz "Factorial("
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t4
	# the label is _string1
	  la $t4, _string1	# load label
	# PushParam _tmp14
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -32($fp)	# spill _tmp14 from $t4 to $fp-32
	  lw $t4, -32($fp)	# fill _tmp14 to $t4 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	# we are in a EmitParam
	# so, the arg register is given $s0
	  lw $s0, -8($fp)	# fill n to $s0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = ") = "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ") = "
	  .data			# create string constant marked with label
	  _string2: .asciiz ") = "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string2
	  la $t0, _string2	# load label
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -36($fp)	# spill _tmp15 from $t0 to $fp-36
	  lw $t0, -36($fp)	# fill _tmp15 to $t0 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	# we are in a EmitParam
	# so, the arg register is given $s0
	  lw $s0, -8($fp)	# fill n to $s0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# _tmp16 = LCall _factorial
	# we clean all the regiser
	  jal _factorial     	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -40($fp)	# spill _tmp16 from $t0 to $fp-40
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp16
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -40($fp)	# fill _tmp16 to $t0 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string3: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string3
	  la $t0, _string3	# load label
	# PushParam _tmp17
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -44($fp)	# spill _tmp17 from $t0 to $fp-44
	  lw $t0, -44($fp)	# fill _tmp17 to $t0 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp18 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp19 = n + _tmp18
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $s0
	# the op2 is $t5
	  lw $s0, -8($fp)	# fill n to $s0 from $fp-8
	  add $t6, $s0, $t5	
	# n = _tmp19
	# We are in the EmitCopy
	# so, the dst register is given $s0
	# the src is $t6
	  move $s0, $t6		# copy value from $t6 to $s0
	# Goto _L1
	# we clean all the regiser
	  sw $t5, -48($fp)	# spill _tmp18 from $t5 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp19 from $t6 to $fp-52
	  sw $s0, -8($fp)	# spill n from $s0 to $fp-8
	  b _L1		# unconditional branch
	# we clean all the regiser
  _L2:
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
