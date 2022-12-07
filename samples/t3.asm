	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Cow.Init:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = w
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: w is given $t0
	  lw $t0, 8($fp)	# fill w to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 8($t1) 	# store with offset
	# *(this + 4) = h
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: h is given $t0
	  lw $t0, 12($fp)	# fill h to $t0 from $fp+12
	  sw $t0, 4($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Cow.Moo:
	# BeginFunc 16
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 16	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp0 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# PushParam _tmp0
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp0 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp0 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string1: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string1
	  la $t0, _string1	# load label
	# PushParam _tmp1
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp1 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp1 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp2 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp2 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 8($t1) 	# load with offset
	# PushParam _tmp2
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp2 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp2 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp3 = "\n"
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
	# PushParam _tmp3
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -20($fp)	# spill _tmp3 from $t0 to $fp-20
	  lw $t0, -20($fp)	# fill _tmp3 to $t0 from $fp-20
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Cow.Init
	  .word _Cow.Moo
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 40
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 40	# decrement sp to make space for locals/temps
	# _tmp4 = 12
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 12
	  li $t0, 12		# load constant value 12 into $t0
	# PushParam _tmp4
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp4 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp4 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp5 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -16($fp)	# spill _tmp5 from $t6 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp6 = Cow
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Cow
	  la $t0, Cow	# load label
	# *(_tmp5) = _tmp6
	# We are in the EmitStore
	# so, the reference: _tmp5 register is given $t6
	# the value: _tmp6 is given $t0
	  sw $t0, 0($t6) 	# store with offset
	# betsy = _tmp5
	# We are in the EmitCopy
	# so, the dst register is given $t2
	# the src is $t6
	  move $t2, $t6		# copy value from $t6 to $t2
	# _tmp7 = 100
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 100
	  li $t1, 100		# load constant value 100 into $t1
	# _tmp8 = 122
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 122
	  li $t3, 122		# load constant value 122 into $t3
	# _tmp9 = *(betsy)
	# We are in the EmitLoad
	# so, the dst: _tmp9 register is given $t4
	# the reference: betsy is given $t2
	  lw $t4, 0($t2) 	# load with offset
	# _tmp10 = *(_tmp9)
	# We are in the EmitLoad
	# so, the dst: _tmp10 register is given $t5
	# the reference: _tmp9 is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -28($fp)	# spill _tmp8 from $t3 to $fp-28
	  lw $t3, -28($fp)	# fill _tmp8 to $t3 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -24($fp)	# spill _tmp7 from $t1 to $fp-24
	  lw $t1, -24($fp)	# fill _tmp7 to $t1 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam betsy
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -8($fp)	# spill betsy from $t2 to $fp-8
	  lw $t2, -8($fp)	# fill betsy to $t2 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp10
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp6 from $t0 to $fp-20
	  sw $t4, -32($fp)	# spill _tmp9 from $t4 to $fp-32
	  sw $t5, -36($fp)	# spill _tmp10 from $t5 to $fp-36
	  lw $v0, -36($fp)	# fill _tmp10 to $v0 from $fp-36
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# _tmp11 = *(betsy)
	# We are in the EmitLoad
	# so, the dst: _tmp11 register is given $t0
	# the reference: betsy is given $t2
	  lw $t2, -8($fp)	# fill betsy to $t2 from $fp-8
	  lw $t0, 0($t2) 	# load with offset
	# _tmp12 = *(_tmp11 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp12 register is given $t1
	# the reference: _tmp11 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam betsy
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -8($fp)	# fill betsy to $t2 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp12
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp11 from $t0 to $fp-40
	  sw $t1, -44($fp)	# spill _tmp12 from $t1 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp12 to $v0 from $fp-44
	  jalr $v0            	# jump to function
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
