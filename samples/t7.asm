	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _Animal.InitAnimal:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = h
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: h is given $t0
	  lw $t0, 8($fp)	# fill h to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = mom
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: mom is given $t0
	  lw $t0, 12($fp)	# fill mom to $t0 from $fp+12
	  sw $t0, 8($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Animal.GetHeight:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp0 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 4($t1) 	# load with offset
	# Return _tmp0
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
  _Animal.GetMom:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp1 = *(this + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp1 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 8($t1) 	# load with offset
	# Return _tmp1
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
	# VTable for class Animal
	  .data
	  .align 2
	  Animal:		# label for class Animal vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Cow.InitCow:
	# BeginFunc 8
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 8	# decrement sp to make space for locals/temps
	# *(this + 12) = spot
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: spot is given $t0
	  lw $t0, 16($fp)	# fill spot to $t0 from $fp+16
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 12($t1) 	# store with offset
	# _tmp2 = *(this)
	# We are in the EmitLoad
	# so, the dst: _tmp2 register is given $t2
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t2, 0($t1) 	# load with offset
	# _tmp3 = *(_tmp2)
	# We are in the EmitLoad
	# so, the dst: _tmp3 register is given $t3
	# the reference: _tmp2 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam m
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 12($fp)	# fill m to $t0 from $fp+12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam h
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill h to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam this
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp3
	# we clean all the regiser
	  sw $t2, -8($fp)	# spill _tmp2 from $t2 to $fp-8
	  sw $t3, -12($fp)	# spill _tmp3 from $t3 to $fp-12
	  lw $v0, -12($fp)	# fill _tmp3 to $v0 from $fp-12
	  jalr $v0            	# jump to function
	# PopParams 12
	  add $sp, $sp, 12	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Cow.IsSpottedCow:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp4 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp4 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 12($t1) 	# load with offset
	# Return _tmp4
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
	# VTable for class Cow
	  .data
	  .align 2
	  Cow:		# label for class Cow vtable
	  .word _Animal.InitAnimal
	  .word _Animal.GetHeight
	  .word _Animal.GetMom
	  .word _Cow.InitCow
	  .word _Cow.IsSpottedCow
	  .text
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
	# _tmp5 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp5
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -16($fp)	# spill _tmp5 from $t0 to $fp-16
	  lw $t0, -16($fp)	# fill _tmp5 to $t0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp6 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $s0, $v0		# copy function return value from $v0
	  sw $s0, -20($fp)	# spill _tmp6 from $s0 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp7 = Cow
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Cow
	  la $t0, Cow	# load label
	# *(_tmp6) = _tmp7
	# We are in the EmitStore
	# so, the reference: _tmp6 register is given $s0
	# the value: _tmp7 is given $t0
	  sw $t0, 0($s0) 	# store with offset
	# betsy = _tmp6
	# We are in the EmitCopy
	# so, the dst register is given $t4
	# the src is $s0
	  move $t4, $s0		# copy value from $s0 to $t4
	# _tmp8 = 5
	# We are in the LoadConstant
	# so, the dst register is given $t1
	# the constant is 5
	  li $t1, 5		# load constant value 5 into $t1
	# _tmp9 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp10 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t3
	# the constant is 1
	  li $t3, 1		# load constant value 1 into $t3
	# _tmp11 = *(betsy)
	# We are in the EmitLoad
	# so, the dst: _tmp11 register is given $t5
	# the reference: betsy is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# _tmp12 = *(_tmp11 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp12 register is given $t6
	# the reference: _tmp11 is given $t5
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp10
	# we are in a EmitParam
	# so, the arg register is given $t3
	  sw $t3, -36($fp)	# spill _tmp10 from $t3 to $fp-36
	  lw $t3, -36($fp)	# fill _tmp10 to $t3 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -32($fp)	# spill _tmp9 from $t2 to $fp-32
	  lw $t2, -32($fp)	# fill _tmp9 to $t2 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -28($fp)	# spill _tmp8 from $t1 to $fp-28
	  lw $t1, -28($fp)	# fill _tmp8 to $t1 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam betsy
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -8($fp)	# spill betsy from $t4 to $fp-8
	  lw $t4, -8($fp)	# fill betsy to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# ACall _tmp12
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp7 from $t0 to $fp-24
	  sw $t5, -40($fp)	# spill _tmp11 from $t5 to $fp-40
	  sw $t6, -44($fp)	# spill _tmp12 from $t6 to $fp-44
	  lw $v0, -44($fp)	# fill _tmp12 to $v0 from $fp-44
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# b = betsy
	# We are in the EmitCopy
	# so, the dst register is given $t2
	# the src is $t4
	  lw $t4, -8($fp)	# fill betsy to $t4 from $fp-8
	  move $t2, $t4		# copy value from $t4 to $t2
	# _tmp13 = *(b)
	# We are in the EmitLoad
	# so, the dst: _tmp13 register is given $t0
	# the reference: b is given $t2
	  lw $t0, 0($t2) 	# load with offset
	# _tmp14 = *(_tmp13 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp14 register is given $t1
	# the reference: _tmp13 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam b
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -12($fp)	# spill b from $t2 to $fp-12
	  lw $t2, -12($fp)	# fill b to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp15 = ACall _tmp14
	# we clean all the regiser
	  sw $t0, -48($fp)	# spill _tmp13 from $t0 to $fp-48
	  sw $t1, -52($fp)	# spill _tmp14 from $t1 to $fp-52
	  lw $v0, -52($fp)	# fill _tmp14 to $v0 from $fp-52
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -56($fp)	# spill _tmp15 from $v0 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = "spots: "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "spots: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "spots: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string1
	  la $t0, _string1	# load label
	# PushParam _tmp16
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -60($fp)	# spill _tmp16 from $t0 to $fp-60
	  lw $t0, -60($fp)	# fill _tmp16 to $t0 from $fp-60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp17 = *(betsy)
	# We are in the EmitLoad
	# so, the dst: _tmp17 register is given $t0
	# the reference: betsy is given $t4
	  lw $t4, -8($fp)	# fill betsy to $t4 from $fp-8
	  lw $t0, 0($t4) 	# load with offset
	# _tmp18 = *(_tmp17 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp18 register is given $t1
	# the reference: _tmp17 is given $t0
	  lw $t1, 16($t0) 	# load with offset
	# PushParam betsy
	# we are in a EmitParam
	# so, the arg register is given $t4
	  lw $t4, -8($fp)	# fill betsy to $t4 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp19 = ACall _tmp18
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp17 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp18 from $t1 to $fp-68
	  lw $v0, -68($fp)	# fill _tmp18 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	  move $t7, $v0		# copy function return value from $v0
	  sw $t7, -72($fp)	# spill _tmp19 from $t7 to $fp-72
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp19
	# we are in a EmitParam
	# so, the arg register is given $t7
	  lw $t7, -72($fp)	# fill _tmp19 to $t7 from $fp-72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintBool
	# we clean all the regiser
	  jal _PrintBool     	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp20 = "    height: "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is "    height: "
	  .data			# create string constant marked with label
	  _string2: .asciiz "    height: "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string2
	  la $t0, _string2	# load label
	# PushParam _tmp20
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -76($fp)	# spill _tmp20 from $t0 to $fp-76
	  lw $t0, -76($fp)	# fill _tmp20 to $t0 from $fp-76
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp21 = *(b)
	# We are in the EmitLoad
	# so, the dst: _tmp21 register is given $t0
	# the reference: b is given $t2
	  lw $t2, -12($fp)	# fill b to $t2 from $fp-12
	  lw $t0, 0($t2) 	# load with offset
	# _tmp22 = *(_tmp21 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp22 register is given $t1
	# the reference: _tmp21 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam b
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -12($fp)	# fill b to $t2 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp23 = ACall _tmp22
	# we clean all the regiser
	  sw $t0, -80($fp)	# spill _tmp21 from $t0 to $fp-80
	  sw $t1, -84($fp)	# spill _tmp22 from $t1 to $fp-84
	  lw $v0, -84($fp)	# fill _tmp22 to $v0 from $fp-84
	  jalr $v0            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -88($fp)	# spill _tmp23 from $t3 to $fp-88
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp23
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, -88($fp)	# fill _tmp23 to $t3 from $fp-88
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
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
