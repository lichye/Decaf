	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _fib:
	# BeginFunc 72
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 72	# decrement sp to make space for locals/temps
	# _tmp0 = 1
	# We are in the LoadConstant
	# so, the dst register is given $s1
	# the constant is 1
	  li $s1, 1		# load constant value 1 into $s1
	# _tmp1 = base < _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $s2
	# the op1 is $t7
	# the op2 is $s1
	  lw $t7, 4($fp)	# fill base to $t7 from $fp+4
	  slt $s2, $t7, $s1	
	# _tmp2 = base == _tmp0
	# We are in the EmitBinaryOp
	# so, the dst register is given $s3
	# the op1 is $t7
	# the op2 is $s1
	  seq $s3, $t7, $s1	
	# _tmp3 = _tmp1 || _tmp2
	# We are in the EmitBinaryOp
	# so, the dst register is given $spill
	# the op1 is $s2
	# the op2 is $s3
	  or $v0, $s2, $s3	
	  sw $v0, -20($fp)	# spill _tmp3 from $v0 to $fp-20
	# IfZ _tmp3 Goto _L1
	# we clean all the regiser
	  sw $s1, -8($fp)	# spill _tmp0 from $s1 to $fp-8
	  sw $s2, -12($fp)	# spill _tmp1 from $s2 to $fp-12
	  sw $s3, -16($fp)	# spill _tmp2 from $s3 to $fp-16
	  lw $v0, -20($fp)	# fill _tmp3 to $v0 from $fp-20
	  beqz $v0, _L1	# branch if _tmp3 is zero 
	# Return base
	  lw $t7, 4($fp)	# fill base to $t7 from $fp+4
	  move $v0, $t7		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L0
	# we clean all the regiser
	  b _L0		# unconditional branch
	# we clean all the regiser
  _L1:
	# _tmp4 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# f0 = _tmp4
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# _tmp5 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 1
	  li $t2, 1		# load constant value 1 into $t2
	# f1 = _tmp5
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t2
	  move $t7, $t2		# copy value from $t2 to $t7
	# _tmp6 = 2
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 2
	  li $t3, 2		# load constant value 2 into $t3
	# i = _tmp6
	# We are in the EmitCopy
	# so, the dst register is given $s0
	# the src is $t3
	  move $s0, $t3		# copy value from $t3 to $s0
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp4 from $t0 to $fp-40
	  sw $t1, -28($fp)	# spill f0 from $t1 to $fp-28
	  sw $t2, -44($fp)	# spill _tmp5 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp6 from $t3 to $fp-48
	  sw $t7, -32($fp)	# spill f1 from $t7 to $fp-32
	  sw $s0, -24($fp)	# spill i from $s0 to $fp-24
  _L2:
	# _tmp7 = i < base
	# We are in the EmitBinaryOp
	# so, the dst register is given $t0
	# the op1 is $s0
	# the op2 is $t7
	  lw $s0, -24($fp)	# fill i to $s0 from $fp-24
	  lw $t7, 4($fp)	# fill base to $t7 from $fp+4
	  slt $t0, $s0, $t7	
	# _tmp8 = i == base
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $s0
	# the op2 is $t7
	  seq $t1, $s0, $t7	
	# _tmp9 = _tmp7 || _tmp8
	# We are in the EmitBinaryOp
	# so, the dst register is given $t2
	# the op1 is $t0
	# the op2 is $t1
	  or $t2, $t0, $t1	
	# IfZ _tmp9 Goto _L3
	# we clean all the regiser
	  sw $t0, -52($fp)	# spill _tmp7 from $t0 to $fp-52
	  sw $t1, -56($fp)	# spill _tmp8 from $t1 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp9 from $t2 to $fp-60
	  lw $t2, -60($fp)	# fill _tmp9 to $t2 from $fp-60
	  beqz $t2, _L3	# branch if _tmp9 is zero 
	# _tmp10 = f0 + f1
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t7
	  lw $t1, -28($fp)	# fill f0 to $t1 from $fp-28
	  lw $t7, -32($fp)	# fill f1 to $t7 from $fp-32
	  add $t3, $t1, $t7	
	# f2 = _tmp10
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $t3
	  move $t4, $t3		# copy value from $t3 to $t4
	# f0 = f1
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t7
	  move $t1, $t7		# copy value from $t7 to $t1
	# f1 = f2
	# We are in the EmitCopy
	# so, the dst register is given $t7
	# the src is $t4
	  move $t7, $t4		# copy value from $t4 to $t7
	# _tmp11 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t5
	# the constant is 1
	  li $t5, 1		# load constant value 1 into $t5
	# _tmp12 = i + _tmp11
	# We are in the EmitBinaryOp
	# so, the dst register is given $t6
	# the op1 is $s0
	# the op2 is $t5
	  lw $s0, -24($fp)	# fill i to $s0 from $fp-24
	  add $t6, $s0, $t5	
	# i = _tmp12
	# We are in the EmitCopy
	# so, the dst register is given $s0
	# the src is $t6
	  move $s0, $t6		# copy value from $t6 to $s0
	# Goto _L2
	# we clean all the regiser
	  sw $t1, -28($fp)	# spill f0 from $t1 to $fp-28
	  sw $t3, -64($fp)	# spill _tmp10 from $t3 to $fp-64
	  sw $t4, -36($fp)	# spill f2 from $t4 to $fp-36
	  sw $t5, -68($fp)	# spill _tmp11 from $t5 to $fp-68
	  sw $t6, -72($fp)	# spill _tmp12 from $t6 to $fp-72
	  sw $t7, -32($fp)	# spill f1 from $t7 to $fp-32
	  sw $s0, -24($fp)	# spill i from $s0 to $fp-24
	  b _L2		# unconditional branch
	# we clean all the regiser
  _L3:
	# Return f2
	  lw $t4, -36($fp)	# fill f2 to $t4 from $fp-36
	  move $v0, $t4		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we clean all the regiser
  _L0:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 56
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp13 = "\nThis program computes Fibonacci numbers (slowly..."
	# We are in the LoadString
	# so, the dst register is given $t6
	# the String is "\nThis program computes Fibonacci numbers (slowly.. but correctly!)\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "\nThis program computes Fibonacci numbers (slowly.. but correctly!)\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t6
	# the label is _string1
	  la $t6, _string1	# load label
	# PushParam _tmp13
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -12($fp)	# spill _tmp13 from $t6 to $fp-12
	  lw $t6, -12($fp)	# fill _tmp13 to $t6 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# we clean all the regiser
  _L4:
	# _tmp14 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# IfZ _tmp14 Goto _L5
	# we clean all the regiser
	  sw $t0, -16($fp)	# spill _tmp14 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp14 to $t0 from $fp-16
	  beqz $t0, _L5	# branch if _tmp14 is zero 
	# _tmp15 = "\nEnter the fibonacci number you want: (-1 to qui..."
	# We are in the LoadString
	# so, the dst register is given $t1
	# the String is "\nEnter the fibonacci number you want: (-1 to quit) "
	  .data			# create string constant marked with label
	  _string2: .asciiz "\nEnter the fibonacci number you want: (-1 to quit) "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t1
	# the label is _string2
	  la $t1, _string2	# load label
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -20($fp)	# spill _tmp15 from $t1 to $fp-20
	  lw $t1, -20($fp)	# fill _tmp15 to $t1 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = LCall _ReadInteger
	# we clean all the regiser
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -24($fp)	# spill _tmp16 from $t0 to $fp-24
	# n = _tmp16
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t0
	  move $t1, $t0		# copy value from $t0 to $t1
	# _tmp17 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp18 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp19 = _tmp17 - _tmp18
	# We are in the EmitBinaryOp
	# so, the dst register is given $t4
	# the op1 is $t2
	# the op2 is $t3
	  sub $t4, $t2, $t3	
	# _tmp20 = n == _tmp19
	# We are in the EmitBinaryOp
	# so, the dst register is given $t5
	# the op1 is $t1
	# the op2 is $t4
	  seq $t5, $t1, $t4	
	# IfZ _tmp20 Goto _L6
	# we clean all the regiser
	  sw $t1, -8($fp)	# spill n from $t1 to $fp-8
	  sw $t2, -28($fp)	# spill _tmp17 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp18 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp19 from $t4 to $fp-36
	  sw $t5, -40($fp)	# spill _tmp20 from $t5 to $fp-40
	  lw $t5, -40($fp)	# fill _tmp20 to $t5 from $fp-40
	  beqz $t5, _L6	# branch if _tmp20 is zero 
	# Goto _L5
	# we clean all the regiser
	  b _L5		# unconditional branch
	# we clean all the regiser
  _L6:
	# _tmp21 = "Fib("
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Fib("
	  .data			# create string constant marked with label
	  _string3: .asciiz "Fib("
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string3
	  la $t0, _string3	# load label
	# PushParam _tmp21
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -44($fp)	# spill _tmp21 from $t0 to $fp-44
	  lw $t0, -44($fp)	# fill _tmp21 to $t0 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill n to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp22 = ") = "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is ") = "
	  .data			# create string constant marked with label
	  _string4: .asciiz ") = "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string4
	  la $t0, _string4	# load label
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -48($fp)	# spill _tmp22 from $t0 to $fp-48
	  lw $t0, -48($fp)	# fill _tmp22 to $t0 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam n
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill n to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp23 = LCall _fib
	# we clean all the regiser
	  jal _fib           	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -52($fp)	# spill _tmp23 from $t0 to $fp-52
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -52($fp)	# fill _tmp23 to $t0 from $fp-52
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp24 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string5
	  la $t0, _string5	# load label
	# PushParam _tmp24
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -56($fp)	# spill _tmp24 from $t0 to $fp-56
	  lw $t0, -56($fp)	# fill _tmp24 to $t0 from $fp-56
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L4
	# we clean all the regiser
	  b _L4		# unconditional branch
	# we clean all the regiser
  _L5:
	# _tmp25 = "Goodbye!\n"
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "Goodbye!\n"
	  .data			# create string constant marked with label
	  _string6: .asciiz "Goodbye!\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string6
	  la $t0, _string6	# load label
	# PushParam _tmp25
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp25 from $t0 to $fp-60
	  lw $t0, -60($fp)	# fill _tmp25 to $t0 from $fp-60
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
