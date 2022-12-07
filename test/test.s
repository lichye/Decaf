	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _PrintArray:
	# BeginFunc 80
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 80	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -12($fp)	# spill _tmp0 from $v0 to $fp-12
	# i = _tmp0
	  lw $v0, -12($fp)	# fill _tmp0 to $v0 from $fp-12
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# _tmp1 = "Sorted results: "
	  .data			# create string constant marked with label
	  _string1: .asciiz "Sorted results: "
	  .text
	  la $v0, _string1	# load label
	  sw $v0, -16($fp)	# spill _tmp1 from $v0 to $fp-16
	# PushParam _tmp1
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -16($fp)	# fill _tmp1 to $v0 from $fp-16
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L0:
	# _tmp2 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -20($fp)	# spill _tmp2 from $v0 to $fp-20
	# _tmp3 = i < _tmp2
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -20($fp)	# fill _tmp2 to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -24($fp)	# spill _tmp3 from $v0 to $fp-24
	# IfZ _tmp3 Goto _L1
	  lw $v0, -24($fp)	# fill _tmp3 to $v0 from $fp-24
	  beqz $v0, _L1	# branch if _tmp3 is zero 
	# _tmp4 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -28($fp)	# spill _tmp4 from $v0 to $fp-28
	# _tmp5 = i < _tmp4
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -28($fp)	# fill _tmp4 to $v1 from $fp-28
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp5 from $v0 to $fp-32
	# _tmp6 = *(arr + -4)
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -36($fp)	# spill _tmp6 from $v0 to $fp-36
	# _tmp7 = i < _tmp6
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -36($fp)	# fill _tmp6 to $v1 from $fp-36
	  slt $v0, $v0, $v1	
	  sw $v0, -40($fp)	# spill _tmp7 from $v0 to $fp-40
	# _tmp8 = _tmp7 == _tmp4
	  lw $v0, -40($fp)	# fill _tmp7 to $v0 from $fp-40
	  lw $v1, -28($fp)	# fill _tmp4 to $v1 from $fp-28
	  seq $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp8 from $v0 to $fp-44
	# _tmp9 = _tmp5 || _tmp8
	  lw $v0, -32($fp)	# fill _tmp5 to $v0 from $fp-32
	  lw $v1, -44($fp)	# fill _tmp8 to $v1 from $fp-44
	  or $v0, $v0, $v1	
	  sw $v0, -48($fp)	# spill _tmp9 from $v0 to $fp-48
	# IfZ _tmp9 Goto _L2
	  lw $v0, -48($fp)	# fill _tmp9 to $v0 from $fp-48
	  beqz $v0, _L2	# branch if _tmp9 is zero 
	# _tmp10 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string2	# load label
	  sw $v0, -52($fp)	# spill _tmp10 from $v0 to $fp-52
	# PushParam _tmp10
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp10 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L2:
	# _tmp11 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -56($fp)	# spill _tmp11 from $v0 to $fp-56
	# _tmp12 = _tmp11 * i
	  lw $v0, -56($fp)	# fill _tmp11 to $v0 from $fp-56
	  lw $v1, -8($fp)	# fill i to $v1 from $fp-8
	  mul $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp12 from $v0 to $fp-60
	# _tmp13 = arr + _tmp12
	  lw $v0, 4($fp)	# fill arr to $v0 from $fp+4
	  lw $v1, -60($fp)	# fill _tmp12 to $v1 from $fp-60
	  add $v0, $v0, $v1	
	  sw $v0, -64($fp)	# spill _tmp13 from $v0 to $fp-64
	# _tmp14 = *(_tmp13)
	  lw $v0, -64($fp)	# fill _tmp13 to $v0 from $fp-64
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -68($fp)	# spill _tmp14 from $v0 to $fp-68
	# PushParam _tmp14
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -68($fp)	# fill _tmp14 to $v0 from $fp-68
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp15 = " "
	  .data			# create string constant marked with label
	  _string3: .asciiz " "
	  .text
	  la $v0, _string3	# load label
	  sw $v0, -72($fp)	# spill _tmp15 from $v0 to $fp-72
	# PushParam _tmp15
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -72($fp)	# fill _tmp15 to $v0 from $fp-72
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp16 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -76($fp)	# spill _tmp16 from $v0 to $fp-76
	# _tmp17 = i + _tmp16
	  lw $v0, -8($fp)	# fill i to $v0 from $fp-8
	  lw $v1, -76($fp)	# fill _tmp16 to $v1 from $fp-76
	  add $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp17 from $v0 to $fp-80
	# i = _tmp17
	  lw $v0, -80($fp)	# fill _tmp17 to $v0 from $fp-80
	  sw $v0, -8($fp)	# spill i from $v0 to $fp-8
	# Goto _L0
	  b _L0		# unconditional branch
  _L1:
	# _tmp18 = "\n"
	  .data			# create string constant marked with label
	  _string4: .asciiz "\n"
	  .text
	  la $v0, _string4	# load label
	  sw $v0, -84($fp)	# spill _tmp18 from $v0 to $fp-84
	# PushParam _tmp18
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -84($fp)	# fill _tmp18 to $v0 from $fp-84
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  main:
	# BeginFunc 588
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 588	# decrement sp to make space for locals/temps
	# _tmp19 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -24($fp)	# spill _tmp19 from $v0 to $fp-24
	# _tmp20 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -28($fp)	# spill _tmp20 from $v0 to $fp-28
	# _tmp21 = _tmp19 < _tmp20
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
	  lw $v1, -28($fp)	# fill _tmp20 to $v1 from $fp-28
	  slt $v0, $v0, $v1	
	  sw $v0, -32($fp)	# spill _tmp21 from $v0 to $fp-32
	# IfZ _tmp21 Goto _L3
	  lw $v0, -32($fp)	# fill _tmp21 to $v0 from $fp-32
	  beqz $v0, _L3	# branch if _tmp21 is zero 
	# _tmp22 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $v0, _string5	# load label
	  sw $v0, -36($fp)	# spill _tmp22 from $v0 to $fp-36
	# PushParam _tmp22
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -36($fp)	# fill _tmp22 to $v0 from $fp-36
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L3:
	# _tmp23 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -40($fp)	# spill _tmp23 from $v0 to $fp-40
	# _tmp24 = _tmp23 + _tmp19
	  lw $v0, -40($fp)	# fill _tmp23 to $v0 from $fp-40
	  lw $v1, -24($fp)	# fill _tmp19 to $v1 from $fp-24
	  add $v0, $v0, $v1	
	  sw $v0, -44($fp)	# spill _tmp24 from $v0 to $fp-44
	# _tmp25 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -48($fp)	# spill _tmp25 from $v0 to $fp-48
	# _tmp26 = _tmp24 * _tmp25
	  lw $v0, -44($fp)	# fill _tmp24 to $v0 from $fp-44
	  lw $v1, -48($fp)	# fill _tmp25 to $v1 from $fp-48
	  mul $v0, $v0, $v1	
	  sw $v0, -52($fp)	# spill _tmp26 from $v0 to $fp-52
	# PushParam _tmp26
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -52($fp)	# fill _tmp26 to $v0 from $fp-52
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp27 = LCall _Alloc
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -56($fp)	# spill _tmp27 from $v0 to $fp-56
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp27) = _tmp19
	  lw $v0, -24($fp)	# fill _tmp19 to $v0 from $fp-24
	  lw $v1, -56($fp)	# fill _tmp27 to $v1 from $fp-56
	  sw $v0, 0($v1) 	# store with offset
	# _tmp28 = _tmp27 + _tmp25
	  lw $v0, -56($fp)	# fill _tmp27 to $v0 from $fp-56
	  lw $v1, -48($fp)	# fill _tmp25 to $v1 from $fp-48
	  add $v0, $v0, $v1	
	  sw $v0, -60($fp)	# spill _tmp28 from $v0 to $fp-60
	# arr = _tmp28
	  lw $v0, -60($fp)	# fill _tmp28 to $v0 from $fp-60
	  sw $v0, -8($fp)	# spill arr from $v0 to $fp-8
	# _tmp29 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -64($fp)	# spill _tmp29 from $v0 to $fp-64
	# _tmp30 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -68($fp)	# spill _tmp30 from $v0 to $fp-68
	# _tmp31 = _tmp29 < _tmp30
	  lw $v0, -64($fp)	# fill _tmp29 to $v0 from $fp-64
	  lw $v1, -68($fp)	# fill _tmp30 to $v1 from $fp-68
	  slt $v0, $v0, $v1	
	  sw $v0, -72($fp)	# spill _tmp31 from $v0 to $fp-72
	# _tmp32 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -76($fp)	# spill _tmp32 from $v0 to $fp-76
	# _tmp33 = _tmp29 < _tmp32
	  lw $v0, -64($fp)	# fill _tmp29 to $v0 from $fp-64
	  lw $v1, -76($fp)	# fill _tmp32 to $v1 from $fp-76
	  slt $v0, $v0, $v1	
	  sw $v0, -80($fp)	# spill _tmp33 from $v0 to $fp-80
	# _tmp34 = _tmp33 == _tmp30
	  lw $v0, -80($fp)	# fill _tmp33 to $v0 from $fp-80
	  lw $v1, -68($fp)	# fill _tmp30 to $v1 from $fp-68
	  seq $v0, $v0, $v1	
	  sw $v0, -84($fp)	# spill _tmp34 from $v0 to $fp-84
	# _tmp35 = _tmp31 || _tmp34
	  lw $v0, -72($fp)	# fill _tmp31 to $v0 from $fp-72
	  lw $v1, -84($fp)	# fill _tmp34 to $v1 from $fp-84
	  or $v0, $v0, $v1	
	  sw $v0, -88($fp)	# spill _tmp35 from $v0 to $fp-88
	# IfZ _tmp35 Goto _L4
	  lw $v0, -88($fp)	# fill _tmp35 to $v0 from $fp-88
	  beqz $v0, _L4	# branch if _tmp35 is zero 
	# _tmp36 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string6	# load label
	  sw $v0, -92($fp)	# spill _tmp36 from $v0 to $fp-92
	# PushParam _tmp36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -92($fp)	# fill _tmp36 to $v0 from $fp-92
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp37 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -96($fp)	# spill _tmp37 from $v0 to $fp-96
	# _tmp38 = _tmp37 * _tmp29
	  lw $v0, -96($fp)	# fill _tmp37 to $v0 from $fp-96
	  lw $v1, -64($fp)	# fill _tmp29 to $v1 from $fp-64
	  mul $v0, $v0, $v1	
	  sw $v0, -100($fp)	# spill _tmp38 from $v0 to $fp-100
	# _tmp39 = arr + _tmp38
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -100($fp)	# fill _tmp38 to $v1 from $fp-100
	  add $v0, $v0, $v1	
	  sw $v0, -104($fp)	# spill _tmp39 from $v0 to $fp-104
	# _tmp40 = 5
	  li $v0, 5		# load constant value 5 into $v0
	  sw $v0, -108($fp)	# spill _tmp40 from $v0 to $fp-108
	# *(_tmp39) = _tmp40
	  lw $v0, -108($fp)	# fill _tmp40 to $v0 from $fp-108
	  lw $v1, -104($fp)	# fill _tmp39 to $v1 from $fp-104
	  sw $v0, 0($v1) 	# store with offset
	# _tmp41 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -112($fp)	# spill _tmp41 from $v0 to $fp-112
	# _tmp42 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -116($fp)	# spill _tmp42 from $v0 to $fp-116
	# _tmp43 = _tmp41 < _tmp42
	  lw $v0, -112($fp)	# fill _tmp41 to $v0 from $fp-112
	  lw $v1, -116($fp)	# fill _tmp42 to $v1 from $fp-116
	  slt $v0, $v0, $v1	
	  sw $v0, -120($fp)	# spill _tmp43 from $v0 to $fp-120
	# _tmp44 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -124($fp)	# spill _tmp44 from $v0 to $fp-124
	# _tmp45 = _tmp41 < _tmp44
	  lw $v0, -112($fp)	# fill _tmp41 to $v0 from $fp-112
	  lw $v1, -124($fp)	# fill _tmp44 to $v1 from $fp-124
	  slt $v0, $v0, $v1	
	  sw $v0, -128($fp)	# spill _tmp45 from $v0 to $fp-128
	# _tmp46 = _tmp45 == _tmp42
	  lw $v0, -128($fp)	# fill _tmp45 to $v0 from $fp-128
	  lw $v1, -116($fp)	# fill _tmp42 to $v1 from $fp-116
	  seq $v0, $v0, $v1	
	  sw $v0, -132($fp)	# spill _tmp46 from $v0 to $fp-132
	# _tmp47 = _tmp43 || _tmp46
	  lw $v0, -120($fp)	# fill _tmp43 to $v0 from $fp-120
	  lw $v1, -132($fp)	# fill _tmp46 to $v1 from $fp-132
	  or $v0, $v0, $v1	
	  sw $v0, -136($fp)	# spill _tmp47 from $v0 to $fp-136
	# IfZ _tmp47 Goto _L5
	  lw $v0, -136($fp)	# fill _tmp47 to $v0 from $fp-136
	  beqz $v0, _L5	# branch if _tmp47 is zero 
	# _tmp48 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string7	# load label
	  sw $v0, -140($fp)	# spill _tmp48 from $v0 to $fp-140
	# PushParam _tmp48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -140($fp)	# fill _tmp48 to $v0 from $fp-140
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp49 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -144($fp)	# spill _tmp49 from $v0 to $fp-144
	# _tmp50 = _tmp49 * _tmp41
	  lw $v0, -144($fp)	# fill _tmp49 to $v0 from $fp-144
	  lw $v1, -112($fp)	# fill _tmp41 to $v1 from $fp-112
	  mul $v0, $v0, $v1	
	  sw $v0, -148($fp)	# spill _tmp50 from $v0 to $fp-148
	# _tmp51 = arr + _tmp50
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -148($fp)	# fill _tmp50 to $v1 from $fp-148
	  add $v0, $v0, $v1	
	  sw $v0, -152($fp)	# spill _tmp51 from $v0 to $fp-152
	# _tmp52 = 90
	  li $v0, 90		# load constant value 90 into $v0
	  sw $v0, -156($fp)	# spill _tmp52 from $v0 to $fp-156
	# *(_tmp51) = _tmp52
	  lw $v0, -156($fp)	# fill _tmp52 to $v0 from $fp-156
	  lw $v1, -152($fp)	# fill _tmp51 to $v1 from $fp-152
	  sw $v0, 0($v1) 	# store with offset
	# _tmp53 = 2
	  li $v0, 2		# load constant value 2 into $v0
	  sw $v0, -160($fp)	# spill _tmp53 from $v0 to $fp-160
	# _tmp54 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -164($fp)	# spill _tmp54 from $v0 to $fp-164
	# _tmp55 = _tmp53 < _tmp54
	  lw $v0, -160($fp)	# fill _tmp53 to $v0 from $fp-160
	  lw $v1, -164($fp)	# fill _tmp54 to $v1 from $fp-164
	  slt $v0, $v0, $v1	
	  sw $v0, -168($fp)	# spill _tmp55 from $v0 to $fp-168
	# _tmp56 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -172($fp)	# spill _tmp56 from $v0 to $fp-172
	# _tmp57 = _tmp53 < _tmp56
	  lw $v0, -160($fp)	# fill _tmp53 to $v0 from $fp-160
	  lw $v1, -172($fp)	# fill _tmp56 to $v1 from $fp-172
	  slt $v0, $v0, $v1	
	  sw $v0, -176($fp)	# spill _tmp57 from $v0 to $fp-176
	# _tmp58 = _tmp57 == _tmp54
	  lw $v0, -176($fp)	# fill _tmp57 to $v0 from $fp-176
	  lw $v1, -164($fp)	# fill _tmp54 to $v1 from $fp-164
	  seq $v0, $v0, $v1	
	  sw $v0, -180($fp)	# spill _tmp58 from $v0 to $fp-180
	# _tmp59 = _tmp55 || _tmp58
	  lw $v0, -168($fp)	# fill _tmp55 to $v0 from $fp-168
	  lw $v1, -180($fp)	# fill _tmp58 to $v1 from $fp-180
	  or $v0, $v0, $v1	
	  sw $v0, -184($fp)	# spill _tmp59 from $v0 to $fp-184
	# IfZ _tmp59 Goto _L6
	  lw $v0, -184($fp)	# fill _tmp59 to $v0 from $fp-184
	  beqz $v0, _L6	# branch if _tmp59 is zero 
	# _tmp60 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string8	# load label
	  sw $v0, -188($fp)	# spill _tmp60 from $v0 to $fp-188
	# PushParam _tmp60
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -188($fp)	# fill _tmp60 to $v0 from $fp-188
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L6:
	# _tmp61 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -192($fp)	# spill _tmp61 from $v0 to $fp-192
	# _tmp62 = _tmp61 * _tmp53
	  lw $v0, -192($fp)	# fill _tmp61 to $v0 from $fp-192
	  lw $v1, -160($fp)	# fill _tmp53 to $v1 from $fp-160
	  mul $v0, $v0, $v1	
	  sw $v0, -196($fp)	# spill _tmp62 from $v0 to $fp-196
	# _tmp63 = arr + _tmp62
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -196($fp)	# fill _tmp62 to $v1 from $fp-196
	  add $v0, $v0, $v1	
	  sw $v0, -200($fp)	# spill _tmp63 from $v0 to $fp-200
	# _tmp64 = 100
	  li $v0, 100		# load constant value 100 into $v0
	  sw $v0, -204($fp)	# spill _tmp64 from $v0 to $fp-204
	# *(_tmp63) = _tmp64
	  lw $v0, -204($fp)	# fill _tmp64 to $v0 from $fp-204
	  lw $v1, -200($fp)	# fill _tmp63 to $v1 from $fp-200
	  sw $v0, 0($v1) 	# store with offset
	# _tmp65 = 3
	  li $v0, 3		# load constant value 3 into $v0
	  sw $v0, -208($fp)	# spill _tmp65 from $v0 to $fp-208
	# _tmp66 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -212($fp)	# spill _tmp66 from $v0 to $fp-212
	# _tmp67 = _tmp65 < _tmp66
	  lw $v0, -208($fp)	# fill _tmp65 to $v0 from $fp-208
	  lw $v1, -212($fp)	# fill _tmp66 to $v1 from $fp-212
	  slt $v0, $v0, $v1	
	  sw $v0, -216($fp)	# spill _tmp67 from $v0 to $fp-216
	# _tmp68 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -220($fp)	# spill _tmp68 from $v0 to $fp-220
	# _tmp69 = _tmp65 < _tmp68
	  lw $v0, -208($fp)	# fill _tmp65 to $v0 from $fp-208
	  lw $v1, -220($fp)	# fill _tmp68 to $v1 from $fp-220
	  slt $v0, $v0, $v1	
	  sw $v0, -224($fp)	# spill _tmp69 from $v0 to $fp-224
	# _tmp70 = _tmp69 == _tmp66
	  lw $v0, -224($fp)	# fill _tmp69 to $v0 from $fp-224
	  lw $v1, -212($fp)	# fill _tmp66 to $v1 from $fp-212
	  seq $v0, $v0, $v1	
	  sw $v0, -228($fp)	# spill _tmp70 from $v0 to $fp-228
	# _tmp71 = _tmp67 || _tmp70
	  lw $v0, -216($fp)	# fill _tmp67 to $v0 from $fp-216
	  lw $v1, -228($fp)	# fill _tmp70 to $v1 from $fp-228
	  or $v0, $v0, $v1	
	  sw $v0, -232($fp)	# spill _tmp71 from $v0 to $fp-232
	# IfZ _tmp71 Goto _L7
	  lw $v0, -232($fp)	# fill _tmp71 to $v0 from $fp-232
	  beqz $v0, _L7	# branch if _tmp71 is zero 
	# _tmp72 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string9	# load label
	  sw $v0, -236($fp)	# spill _tmp72 from $v0 to $fp-236
	# PushParam _tmp72
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -236($fp)	# fill _tmp72 to $v0 from $fp-236
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L7:
	# _tmp73 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -240($fp)	# spill _tmp73 from $v0 to $fp-240
	# _tmp74 = _tmp73 * _tmp65
	  lw $v0, -240($fp)	# fill _tmp73 to $v0 from $fp-240
	  lw $v1, -208($fp)	# fill _tmp65 to $v1 from $fp-208
	  mul $v0, $v0, $v1	
	  sw $v0, -244($fp)	# spill _tmp74 from $v0 to $fp-244
	# _tmp75 = arr + _tmp74
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -244($fp)	# fill _tmp74 to $v1 from $fp-244
	  add $v0, $v0, $v1	
	  sw $v0, -248($fp)	# spill _tmp75 from $v0 to $fp-248
	# _tmp76 = 80
	  li $v0, 80		# load constant value 80 into $v0
	  sw $v0, -252($fp)	# spill _tmp76 from $v0 to $fp-252
	# *(_tmp75) = _tmp76
	  lw $v0, -252($fp)	# fill _tmp76 to $v0 from $fp-252
	  lw $v1, -248($fp)	# fill _tmp75 to $v1 from $fp-248
	  sw $v0, 0($v1) 	# store with offset
	# _tmp77 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -256($fp)	# spill _tmp77 from $v0 to $fp-256
	# _tmp78 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -260($fp)	# spill _tmp78 from $v0 to $fp-260
	# _tmp79 = _tmp77 < _tmp78
	  lw $v0, -256($fp)	# fill _tmp77 to $v0 from $fp-256
	  lw $v1, -260($fp)	# fill _tmp78 to $v1 from $fp-260
	  slt $v0, $v0, $v1	
	  sw $v0, -264($fp)	# spill _tmp79 from $v0 to $fp-264
	# _tmp80 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -268($fp)	# spill _tmp80 from $v0 to $fp-268
	# _tmp81 = _tmp77 < _tmp80
	  lw $v0, -256($fp)	# fill _tmp77 to $v0 from $fp-256
	  lw $v1, -268($fp)	# fill _tmp80 to $v1 from $fp-268
	  slt $v0, $v0, $v1	
	  sw $v0, -272($fp)	# spill _tmp81 from $v0 to $fp-272
	# _tmp82 = _tmp81 == _tmp78
	  lw $v0, -272($fp)	# fill _tmp81 to $v0 from $fp-272
	  lw $v1, -260($fp)	# fill _tmp78 to $v1 from $fp-260
	  seq $v0, $v0, $v1	
	  sw $v0, -276($fp)	# spill _tmp82 from $v0 to $fp-276
	# _tmp83 = _tmp79 || _tmp82
	  lw $v0, -264($fp)	# fill _tmp79 to $v0 from $fp-264
	  lw $v1, -276($fp)	# fill _tmp82 to $v1 from $fp-276
	  or $v0, $v0, $v1	
	  sw $v0, -280($fp)	# spill _tmp83 from $v0 to $fp-280
	# IfZ _tmp83 Goto _L8
	  lw $v0, -280($fp)	# fill _tmp83 to $v0 from $fp-280
	  beqz $v0, _L8	# branch if _tmp83 is zero 
	# _tmp84 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string10	# load label
	  sw $v0, -284($fp)	# spill _tmp84 from $v0 to $fp-284
	# PushParam _tmp84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -284($fp)	# fill _tmp84 to $v0 from $fp-284
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp85 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -288($fp)	# spill _tmp85 from $v0 to $fp-288
	# _tmp86 = _tmp85 * _tmp77
	  lw $v0, -288($fp)	# fill _tmp85 to $v0 from $fp-288
	  lw $v1, -256($fp)	# fill _tmp77 to $v1 from $fp-256
	  mul $v0, $v0, $v1	
	  sw $v0, -292($fp)	# spill _tmp86 from $v0 to $fp-292
	# _tmp87 = arr + _tmp86
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -292($fp)	# fill _tmp86 to $v1 from $fp-292
	  add $v0, $v0, $v1	
	  sw $v0, -296($fp)	# spill _tmp87 from $v0 to $fp-296
	# _tmp88 = 59
	  li $v0, 59		# load constant value 59 into $v0
	  sw $v0, -300($fp)	# spill _tmp88 from $v0 to $fp-300
	# *(_tmp87) = _tmp88
	  lw $v0, -300($fp)	# fill _tmp88 to $v0 from $fp-300
	  lw $v1, -296($fp)	# fill _tmp87 to $v1 from $fp-296
	  sw $v0, 0($v1) 	# store with offset
	# _tmp89 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -304($fp)	# spill _tmp89 from $v0 to $fp-304
	# i = _tmp89
	  lw $v0, -304($fp)	# fill _tmp89 to $v0 from $fp-304
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
  _L9:
	# _tmp90 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -308($fp)	# spill _tmp90 from $v0 to $fp-308
	# _tmp91 = i < _tmp90
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -308($fp)	# fill _tmp90 to $v1 from $fp-308
	  slt $v0, $v0, $v1	
	  sw $v0, -312($fp)	# spill _tmp91 from $v0 to $fp-312
	# IfZ _tmp91 Goto _L10
	  lw $v0, -312($fp)	# fill _tmp91 to $v0 from $fp-312
	  beqz $v0, _L10	# branch if _tmp91 is zero 
	# _tmp92 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -316($fp)	# spill _tmp92 from $v0 to $fp-316
	# _tmp93 = i - _tmp92
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -316($fp)	# fill _tmp92 to $v1 from $fp-316
	  sub $v0, $v0, $v1	
	  sw $v0, -320($fp)	# spill _tmp93 from $v0 to $fp-320
	# j = _tmp93
	  lw $v0, -320($fp)	# fill _tmp93 to $v0 from $fp-320
	  sw $v0, -16($fp)	# spill j from $v0 to $fp-16
	# _tmp94 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -324($fp)	# spill _tmp94 from $v0 to $fp-324
	# _tmp95 = i < _tmp94
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -324($fp)	# fill _tmp94 to $v1 from $fp-324
	  slt $v0, $v0, $v1	
	  sw $v0, -328($fp)	# spill _tmp95 from $v0 to $fp-328
	# _tmp96 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -332($fp)	# spill _tmp96 from $v0 to $fp-332
	# _tmp97 = i < _tmp96
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -332($fp)	# fill _tmp96 to $v1 from $fp-332
	  slt $v0, $v0, $v1	
	  sw $v0, -336($fp)	# spill _tmp97 from $v0 to $fp-336
	# _tmp98 = _tmp97 == _tmp94
	  lw $v0, -336($fp)	# fill _tmp97 to $v0 from $fp-336
	  lw $v1, -324($fp)	# fill _tmp94 to $v1 from $fp-324
	  seq $v0, $v0, $v1	
	  sw $v0, -340($fp)	# spill _tmp98 from $v0 to $fp-340
	# _tmp99 = _tmp95 || _tmp98
	  lw $v0, -328($fp)	# fill _tmp95 to $v0 from $fp-328
	  lw $v1, -340($fp)	# fill _tmp98 to $v1 from $fp-340
	  or $v0, $v0, $v1	
	  sw $v0, -344($fp)	# spill _tmp99 from $v0 to $fp-344
	# IfZ _tmp99 Goto _L11
	  lw $v0, -344($fp)	# fill _tmp99 to $v0 from $fp-344
	  beqz $v0, _L11	# branch if _tmp99 is zero 
	# _tmp100 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string11	# load label
	  sw $v0, -348($fp)	# spill _tmp100 from $v0 to $fp-348
	# PushParam _tmp100
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -348($fp)	# fill _tmp100 to $v0 from $fp-348
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp101 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -352($fp)	# spill _tmp101 from $v0 to $fp-352
	# _tmp102 = _tmp101 * i
	  lw $v0, -352($fp)	# fill _tmp101 to $v0 from $fp-352
	  lw $v1, -12($fp)	# fill i to $v1 from $fp-12
	  mul $v0, $v0, $v1	
	  sw $v0, -356($fp)	# spill _tmp102 from $v0 to $fp-356
	# _tmp103 = arr + _tmp102
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -356($fp)	# fill _tmp102 to $v1 from $fp-356
	  add $v0, $v0, $v1	
	  sw $v0, -360($fp)	# spill _tmp103 from $v0 to $fp-360
	# _tmp104 = *(_tmp103)
	  lw $v0, -360($fp)	# fill _tmp103 to $v0 from $fp-360
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -364($fp)	# spill _tmp104 from $v0 to $fp-364
	# val = _tmp104
	  lw $v0, -364($fp)	# fill _tmp104 to $v0 from $fp-364
	  sw $v0, -20($fp)	# spill val from $v0 to $fp-20
  _L12:
	# _tmp105 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -368($fp)	# spill _tmp105 from $v0 to $fp-368
	# _tmp106 = _tmp105 < j
	  lw $v0, -368($fp)	# fill _tmp105 to $v0 from $fp-368
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  slt $v0, $v0, $v1	
	  sw $v0, -372($fp)	# spill _tmp106 from $v0 to $fp-372
	# _tmp107 = _tmp105 == j
	  lw $v0, -368($fp)	# fill _tmp105 to $v0 from $fp-368
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  seq $v0, $v0, $v1	
	  sw $v0, -376($fp)	# spill _tmp107 from $v0 to $fp-376
	# _tmp108 = _tmp106 || _tmp107
	  lw $v0, -372($fp)	# fill _tmp106 to $v0 from $fp-372
	  lw $v1, -376($fp)	# fill _tmp107 to $v1 from $fp-376
	  or $v0, $v0, $v1	
	  sw $v0, -380($fp)	# spill _tmp108 from $v0 to $fp-380
	# IfZ _tmp108 Goto _L13
	  lw $v0, -380($fp)	# fill _tmp108 to $v0 from $fp-380
	  beqz $v0, _L13	# branch if _tmp108 is zero 
	# _tmp109 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -384($fp)	# spill _tmp109 from $v0 to $fp-384
	# _tmp110 = j < _tmp109
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -384($fp)	# fill _tmp109 to $v1 from $fp-384
	  slt $v0, $v0, $v1	
	  sw $v0, -388($fp)	# spill _tmp110 from $v0 to $fp-388
	# _tmp111 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -392($fp)	# spill _tmp111 from $v0 to $fp-392
	# _tmp112 = j < _tmp111
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -392($fp)	# fill _tmp111 to $v1 from $fp-392
	  slt $v0, $v0, $v1	
	  sw $v0, -396($fp)	# spill _tmp112 from $v0 to $fp-396
	# _tmp113 = _tmp112 == _tmp109
	  lw $v0, -396($fp)	# fill _tmp112 to $v0 from $fp-396
	  lw $v1, -384($fp)	# fill _tmp109 to $v1 from $fp-384
	  seq $v0, $v0, $v1	
	  sw $v0, -400($fp)	# spill _tmp113 from $v0 to $fp-400
	# _tmp114 = _tmp110 || _tmp113
	  lw $v0, -388($fp)	# fill _tmp110 to $v0 from $fp-388
	  lw $v1, -400($fp)	# fill _tmp113 to $v1 from $fp-400
	  or $v0, $v0, $v1	
	  sw $v0, -404($fp)	# spill _tmp114 from $v0 to $fp-404
	# IfZ _tmp114 Goto _L14
	  lw $v0, -404($fp)	# fill _tmp114 to $v0 from $fp-404
	  beqz $v0, _L14	# branch if _tmp114 is zero 
	# _tmp115 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string12	# load label
	  sw $v0, -408($fp)	# spill _tmp115 from $v0 to $fp-408
	# PushParam _tmp115
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -408($fp)	# fill _tmp115 to $v0 from $fp-408
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L14:
	# _tmp116 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -412($fp)	# spill _tmp116 from $v0 to $fp-412
	# _tmp117 = _tmp116 * j
	  lw $v0, -412($fp)	# fill _tmp116 to $v0 from $fp-412
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  mul $v0, $v0, $v1	
	  sw $v0, -416($fp)	# spill _tmp117 from $v0 to $fp-416
	# _tmp118 = arr + _tmp117
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -416($fp)	# fill _tmp117 to $v1 from $fp-416
	  add $v0, $v0, $v1	
	  sw $v0, -420($fp)	# spill _tmp118 from $v0 to $fp-420
	# _tmp119 = *(_tmp118)
	  lw $v0, -420($fp)	# fill _tmp118 to $v0 from $fp-420
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -424($fp)	# spill _tmp119 from $v0 to $fp-424
	# _tmp120 = _tmp119 < val
	  lw $v0, -424($fp)	# fill _tmp119 to $v0 from $fp-424
	  lw $v1, -20($fp)	# fill val to $v1 from $fp-20
	  slt $v0, $v0, $v1	
	  sw $v0, -428($fp)	# spill _tmp120 from $v0 to $fp-428
	# _tmp121 = _tmp119 == val
	  lw $v0, -424($fp)	# fill _tmp119 to $v0 from $fp-424
	  lw $v1, -20($fp)	# fill val to $v1 from $fp-20
	  seq $v0, $v0, $v1	
	  sw $v0, -432($fp)	# spill _tmp121 from $v0 to $fp-432
	# _tmp122 = _tmp120 || _tmp121
	  lw $v0, -428($fp)	# fill _tmp120 to $v0 from $fp-428
	  lw $v1, -432($fp)	# fill _tmp121 to $v1 from $fp-432
	  or $v0, $v0, $v1	
	  sw $v0, -436($fp)	# spill _tmp122 from $v0 to $fp-436
	# IfZ _tmp122 Goto _L15
	  lw $v0, -436($fp)	# fill _tmp122 to $v0 from $fp-436
	  beqz $v0, _L15	# branch if _tmp122 is zero 
	# Goto _L13
	  b _L13		# unconditional branch
  _L15:
	# _tmp123 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -440($fp)	# spill _tmp123 from $v0 to $fp-440
	# _tmp124 = j + _tmp123
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -440($fp)	# fill _tmp123 to $v1 from $fp-440
	  add $v0, $v0, $v1	
	  sw $v0, -444($fp)	# spill _tmp124 from $v0 to $fp-444
	# _tmp125 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -448($fp)	# spill _tmp125 from $v0 to $fp-448
	# _tmp126 = _tmp124 < _tmp125
	  lw $v0, -444($fp)	# fill _tmp124 to $v0 from $fp-444
	  lw $v1, -448($fp)	# fill _tmp125 to $v1 from $fp-448
	  slt $v0, $v0, $v1	
	  sw $v0, -452($fp)	# spill _tmp126 from $v0 to $fp-452
	# _tmp127 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -456($fp)	# spill _tmp127 from $v0 to $fp-456
	# _tmp128 = _tmp124 < _tmp127
	  lw $v0, -444($fp)	# fill _tmp124 to $v0 from $fp-444
	  lw $v1, -456($fp)	# fill _tmp127 to $v1 from $fp-456
	  slt $v0, $v0, $v1	
	  sw $v0, -460($fp)	# spill _tmp128 from $v0 to $fp-460
	# _tmp129 = _tmp128 == _tmp125
	  lw $v0, -460($fp)	# fill _tmp128 to $v0 from $fp-460
	  lw $v1, -448($fp)	# fill _tmp125 to $v1 from $fp-448
	  seq $v0, $v0, $v1	
	  sw $v0, -464($fp)	# spill _tmp129 from $v0 to $fp-464
	# _tmp130 = _tmp126 || _tmp129
	  lw $v0, -452($fp)	# fill _tmp126 to $v0 from $fp-452
	  lw $v1, -464($fp)	# fill _tmp129 to $v1 from $fp-464
	  or $v0, $v0, $v1	
	  sw $v0, -468($fp)	# spill _tmp130 from $v0 to $fp-468
	# IfZ _tmp130 Goto _L16
	  lw $v0, -468($fp)	# fill _tmp130 to $v0 from $fp-468
	  beqz $v0, _L16	# branch if _tmp130 is zero 
	# _tmp131 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string13	# load label
	  sw $v0, -472($fp)	# spill _tmp131 from $v0 to $fp-472
	# PushParam _tmp131
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -472($fp)	# fill _tmp131 to $v0 from $fp-472
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L16:
	# _tmp132 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -476($fp)	# spill _tmp132 from $v0 to $fp-476
	# _tmp133 = _tmp132 * _tmp124
	  lw $v0, -476($fp)	# fill _tmp132 to $v0 from $fp-476
	  lw $v1, -444($fp)	# fill _tmp124 to $v1 from $fp-444
	  mul $v0, $v0, $v1	
	  sw $v0, -480($fp)	# spill _tmp133 from $v0 to $fp-480
	# _tmp134 = arr + _tmp133
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -480($fp)	# fill _tmp133 to $v1 from $fp-480
	  add $v0, $v0, $v1	
	  sw $v0, -484($fp)	# spill _tmp134 from $v0 to $fp-484
	# _tmp135 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -488($fp)	# spill _tmp135 from $v0 to $fp-488
	# _tmp136 = j < _tmp135
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -488($fp)	# fill _tmp135 to $v1 from $fp-488
	  slt $v0, $v0, $v1	
	  sw $v0, -492($fp)	# spill _tmp136 from $v0 to $fp-492
	# _tmp137 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -496($fp)	# spill _tmp137 from $v0 to $fp-496
	# _tmp138 = j < _tmp137
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -496($fp)	# fill _tmp137 to $v1 from $fp-496
	  slt $v0, $v0, $v1	
	  sw $v0, -500($fp)	# spill _tmp138 from $v0 to $fp-500
	# _tmp139 = _tmp138 == _tmp135
	  lw $v0, -500($fp)	# fill _tmp138 to $v0 from $fp-500
	  lw $v1, -488($fp)	# fill _tmp135 to $v1 from $fp-488
	  seq $v0, $v0, $v1	
	  sw $v0, -504($fp)	# spill _tmp139 from $v0 to $fp-504
	# _tmp140 = _tmp136 || _tmp139
	  lw $v0, -492($fp)	# fill _tmp136 to $v0 from $fp-492
	  lw $v1, -504($fp)	# fill _tmp139 to $v1 from $fp-504
	  or $v0, $v0, $v1	
	  sw $v0, -508($fp)	# spill _tmp140 from $v0 to $fp-508
	# IfZ _tmp140 Goto _L17
	  lw $v0, -508($fp)	# fill _tmp140 to $v0 from $fp-508
	  beqz $v0, _L17	# branch if _tmp140 is zero 
	# _tmp141 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string14	# load label
	  sw $v0, -512($fp)	# spill _tmp141 from $v0 to $fp-512
	# PushParam _tmp141
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -512($fp)	# fill _tmp141 to $v0 from $fp-512
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp142 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -516($fp)	# spill _tmp142 from $v0 to $fp-516
	# _tmp143 = _tmp142 * j
	  lw $v0, -516($fp)	# fill _tmp142 to $v0 from $fp-516
	  lw $v1, -16($fp)	# fill j to $v1 from $fp-16
	  mul $v0, $v0, $v1	
	  sw $v0, -520($fp)	# spill _tmp143 from $v0 to $fp-520
	# _tmp144 = arr + _tmp143
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -520($fp)	# fill _tmp143 to $v1 from $fp-520
	  add $v0, $v0, $v1	
	  sw $v0, -524($fp)	# spill _tmp144 from $v0 to $fp-524
	# _tmp145 = *(_tmp144)
	  lw $v0, -524($fp)	# fill _tmp144 to $v0 from $fp-524
	  lw $v0, 0($v0) 	# load with offset
	  sw $v0, -528($fp)	# spill _tmp145 from $v0 to $fp-528
	# *(_tmp134) = _tmp145
	  lw $v0, -528($fp)	# fill _tmp145 to $v0 from $fp-528
	  lw $v1, -484($fp)	# fill _tmp134 to $v1 from $fp-484
	  sw $v0, 0($v1) 	# store with offset
	# _tmp146 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -532($fp)	# spill _tmp146 from $v0 to $fp-532
	# _tmp147 = j - _tmp146
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -532($fp)	# fill _tmp146 to $v1 from $fp-532
	  sub $v0, $v0, $v1	
	  sw $v0, -536($fp)	# spill _tmp147 from $v0 to $fp-536
	# j = _tmp147
	  lw $v0, -536($fp)	# fill _tmp147 to $v0 from $fp-536
	  sw $v0, -16($fp)	# spill j from $v0 to $fp-16
	# Goto _L12
	  b _L12		# unconditional branch
  _L13:
	# _tmp148 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -540($fp)	# spill _tmp148 from $v0 to $fp-540
	# _tmp149 = j + _tmp148
	  lw $v0, -16($fp)	# fill j to $v0 from $fp-16
	  lw $v1, -540($fp)	# fill _tmp148 to $v1 from $fp-540
	  add $v0, $v0, $v1	
	  sw $v0, -544($fp)	# spill _tmp149 from $v0 to $fp-544
	# _tmp150 = 0
	  li $v0, 0		# load constant value 0 into $v0
	  sw $v0, -548($fp)	# spill _tmp150 from $v0 to $fp-548
	# _tmp151 = _tmp149 < _tmp150
	  lw $v0, -544($fp)	# fill _tmp149 to $v0 from $fp-544
	  lw $v1, -548($fp)	# fill _tmp150 to $v1 from $fp-548
	  slt $v0, $v0, $v1	
	  sw $v0, -552($fp)	# spill _tmp151 from $v0 to $fp-552
	# _tmp152 = *(arr + -4)
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v0, -4($v0) 	# load with offset
	  sw $v0, -556($fp)	# spill _tmp152 from $v0 to $fp-556
	# _tmp153 = _tmp149 < _tmp152
	  lw $v0, -544($fp)	# fill _tmp149 to $v0 from $fp-544
	  lw $v1, -556($fp)	# fill _tmp152 to $v1 from $fp-556
	  slt $v0, $v0, $v1	
	  sw $v0, -560($fp)	# spill _tmp153 from $v0 to $fp-560
	# _tmp154 = _tmp153 == _tmp150
	  lw $v0, -560($fp)	# fill _tmp153 to $v0 from $fp-560
	  lw $v1, -548($fp)	# fill _tmp150 to $v1 from $fp-548
	  seq $v0, $v0, $v1	
	  sw $v0, -564($fp)	# spill _tmp154 from $v0 to $fp-564
	# _tmp155 = _tmp151 || _tmp154
	  lw $v0, -552($fp)	# fill _tmp151 to $v0 from $fp-552
	  lw $v1, -564($fp)	# fill _tmp154 to $v1 from $fp-564
	  or $v0, $v0, $v1	
	  sw $v0, -568($fp)	# spill _tmp155 from $v0 to $fp-568
	# IfZ _tmp155 Goto _L18
	  lw $v0, -568($fp)	# fill _tmp155 to $v0 from $fp-568
	  beqz $v0, _L18	# branch if _tmp155 is zero 
	# _tmp156 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $v0, _string15	# load label
	  sw $v0, -572($fp)	# spill _tmp156 from $v0 to $fp-572
	# PushParam _tmp156
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -572($fp)	# fill _tmp156 to $v0 from $fp-572
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L18:
	# _tmp157 = 4
	  li $v0, 4		# load constant value 4 into $v0
	  sw $v0, -576($fp)	# spill _tmp157 from $v0 to $fp-576
	# _tmp158 = _tmp157 * _tmp149
	  lw $v0, -576($fp)	# fill _tmp157 to $v0 from $fp-576
	  lw $v1, -544($fp)	# fill _tmp149 to $v1 from $fp-544
	  mul $v0, $v0, $v1	
	  sw $v0, -580($fp)	# spill _tmp158 from $v0 to $fp-580
	# _tmp159 = arr + _tmp158
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  lw $v1, -580($fp)	# fill _tmp158 to $v1 from $fp-580
	  add $v0, $v0, $v1	
	  sw $v0, -584($fp)	# spill _tmp159 from $v0 to $fp-584
	# *(_tmp159) = val
	  lw $v0, -20($fp)	# fill val to $v0 from $fp-20
	  lw $v1, -584($fp)	# fill _tmp159 to $v1 from $fp-584
	  sw $v0, 0($v1) 	# store with offset
	# _tmp160 = 1
	  li $v0, 1		# load constant value 1 into $v0
	  sw $v0, -588($fp)	# spill _tmp160 from $v0 to $fp-588
	# _tmp161 = i + _tmp160
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  lw $v1, -588($fp)	# fill _tmp160 to $v1 from $fp-588
	  add $v0, $v0, $v1	
	  sw $v0, -592($fp)	# spill _tmp161 from $v0 to $fp-592
	# i = _tmp161
	  lw $v0, -592($fp)	# fill _tmp161 to $v0 from $fp-592
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L9
	  b _L9		# unconditional branch
  _L10:
	# PushParam arr
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $v0, -8($fp)	# fill arr to $v0 from $fp-8
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintArray
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
