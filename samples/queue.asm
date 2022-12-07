	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
	# we are going to Generate another function
	# we clean all the regiser
  _QueueItem.Init:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 4) = data
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: data is given $t0
	  lw $t0, 8($fp)	# fill data to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 4($t1) 	# store with offset
	# *(this + 8) = next
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: next is given $t0
	  lw $t0, 12($fp)	# fill next to $t0 from $fp+12
	  sw $t0, 8($t1) 	# store with offset
	# *(next + 12) = this
	# We are in the EmitStore
	# so, the reference: next register is given $t0
	# the value: this is given $t1
	  sw $t1, 12($t0) 	# store with offset
	# *(this + 12) = prev
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: prev is given $t0
	  lw $t0, 16($fp)	# fill prev to $t0 from $fp+16
	  sw $t0, 12($t1) 	# store with offset
	# *(prev + 8) = this
	# We are in the EmitStore
	# so, the reference: prev register is given $t0
	# the value: this is given $t1
	  sw $t1, 8($t0) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _QueueItem.GetData:
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
  _QueueItem.GetNext:
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
	# we are going to Generate another function
	# we clean all the regiser
  _QueueItem.GetPrev:
	# BeginFunc 4
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp2 = *(this + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp2 register is given $t0
	# the reference: this is given $t1
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  lw $t0, 12($t1) 	# load with offset
	# Return _tmp2
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
  _QueueItem.SetNext:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 8) = n
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: n is given $t0
	  lw $t0, 8($fp)	# fill n to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 8($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _QueueItem.SetPrev:
	# BeginFunc 0
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	# *(this + 12) = p
	# We are in the EmitStore
	# so, the reference: this register is given $t1
	# the value: p is given $t0
	  lw $t0, 8($fp)	# fill p to $t0 from $fp+8
	  lw $t1, 4($fp)	# fill this to $t1 from $fp+4
	  sw $t0, 12($t1) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class QueueItem
	  .data
	  .align 2
	  QueueItem:		# label for class QueueItem vtable
	  .word _QueueItem.Init
	  .word _QueueItem.GetData
	  .word _QueueItem.GetNext
	  .word _QueueItem.GetPrev
	  .word _QueueItem.SetNext
	  .word _QueueItem.SetPrev
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  _Queue.Init:
	# BeginFunc 36
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 36	# decrement sp to make space for locals/temps
	# _tmp3 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp3
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -8($fp)	# spill _tmp3 from $t0 to $fp-8
	  lw $t0, -8($fp)	# fill _tmp3 to $t0 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp4 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -12($fp)	# spill _tmp4 from $t2 to $fp-12
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp5 = QueueItem
	# We are in the LoadLabel
	# so, the dst register is given $t1
	# the label is QueueItem
	  la $t1, QueueItem	# load label
	# *(_tmp4) = _tmp5
	# We are in the EmitStore
	# so, the reference: _tmp4 register is given $t2
	# the value: _tmp5 is given $t1
	  sw $t1, 0($t2) 	# store with offset
	# *(this + 4) = _tmp4
	# We are in the EmitStore
	# so, the reference: this register is given $t3
	# the value: _tmp4 is given $t2
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  sw $t2, 4($t3) 	# store with offset
	# _tmp6 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t4
	# the constant is 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp7 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp7 register is given $t5
	# the reference: this is given $t3
	  lw $t5, 4($t3) 	# load with offset
	# _tmp8 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp8 register is given $t6
	# the reference: this is given $t3
	  lw $t6, 4($t3) 	# load with offset
	# _tmp9 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp9 register is given $t7
	# the reference: this is given $t3
	  lw $t7, 4($t3) 	# load with offset
	# _tmp10 = *(_tmp9)
	# We are in the EmitLoad
	# so, the dst: _tmp10 register is given $s0
	# the reference: _tmp9 is given $t7
	  lw $s0, 0($t7) 	# load with offset
	# _tmp11 = *(_tmp10)
	# We are in the EmitLoad
	# so, the dst: _tmp11 register is given $s1
	# the reference: _tmp10 is given $s0
	  lw $s1, 0($s0) 	# load with offset
	# PushParam _tmp8
	# we are in a EmitParam
	# so, the arg register is given $t6
	  sw $t6, -28($fp)	# spill _tmp8 from $t6 to $fp-28
	  lw $t6, -28($fp)	# fill _tmp8 to $t6 from $fp-28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam _tmp7
	# we are in a EmitParam
	# so, the arg register is given $t5
	  sw $t5, -24($fp)	# spill _tmp7 from $t5 to $fp-24
	  lw $t5, -24($fp)	# fill _tmp7 to $t5 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# PushParam _tmp6
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -20($fp)	# spill _tmp6 from $t4 to $fp-20
	  lw $t4, -20($fp)	# fill _tmp6 to $t4 from $fp-20
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# PushParam _tmp9
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -32($fp)	# spill _tmp9 from $t7 to $fp-32
	  lw $t7, -32($fp)	# fill _tmp9 to $t7 from $fp-32
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# ACall _tmp11
	# we clean all the regiser
	  sw $t1, -16($fp)	# spill _tmp5 from $t1 to $fp-16
	  sw $s0, -36($fp)	# spill _tmp10 from $s0 to $fp-36
	  sw $s1, -40($fp)	# spill _tmp11 from $s1 to $fp-40
	  lw $v0, -40($fp)	# fill _tmp11 to $v0 from $fp-40
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Queue.EnQueue:
	# BeginFunc 44
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 44	# decrement sp to make space for locals/temps
	# _tmp12 = 16
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 16
	  li $t0, 16		# load constant value 16 into $t0
	# PushParam _tmp12
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -12($fp)	# spill _tmp12 from $t0 to $fp-12
	  lw $t0, -12($fp)	# fill _tmp12 to $t0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp13 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -16($fp)	# spill _tmp13 from $t3 to $fp-16
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp14 = QueueItem
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is QueueItem
	  la $t0, QueueItem	# load label
	# *(_tmp13) = _tmp14
	# We are in the EmitStore
	# so, the reference: _tmp13 register is given $t3
	# the value: _tmp14 is given $t0
	  sw $t0, 0($t3) 	# store with offset
	# temp = _tmp13
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $t3
	  move $t1, $t3		# copy value from $t3 to $t1
	# _tmp15 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp15 register is given $t2
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t2, 4($t3) 	# load with offset
	# _tmp16 = *(_tmp15)
	# We are in the EmitLoad
	# so, the dst: _tmp16 register is given $t4
	# the reference: _tmp15 is given $t2
	  lw $t4, 0($t2) 	# load with offset
	# _tmp17 = *(_tmp16 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp17 register is given $t5
	# the reference: _tmp16 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam _tmp15
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -24($fp)	# spill _tmp15 from $t2 to $fp-24
	  lw $t2, -24($fp)	# fill _tmp15 to $t2 from $fp-24
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp18 = ACall _tmp17
	# we clean all the regiser
	  sw $t0, -20($fp)	# spill _tmp14 from $t0 to $fp-20
	  sw $t1, -8($fp)	# spill temp from $t1 to $fp-8
	  sw $t4, -28($fp)	# spill _tmp16 from $t4 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp17 from $t5 to $fp-32
	  lw $v0, -32($fp)	# fill _tmp17 to $v0 from $fp-32
	  jalr $v0            	# jump to function
	  move $t6, $v0		# copy function return value from $v0
	  sw $t6, -36($fp)	# spill _tmp18 from $t6 to $fp-36
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp19 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp19 register is given $t7
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t7, 4($t3) 	# load with offset
	# _tmp20 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp20 register is given $s0
	# the reference: temp is given $t1
	  lw $t1, -8($fp)	# fill temp to $t1 from $fp-8
	  lw $s0, 0($t1) 	# load with offset
	# _tmp21 = *(_tmp20)
	# We are in the EmitLoad
	# so, the dst: _tmp21 register is given $s1
	# the reference: _tmp20 is given $s0
	  lw $s1, 0($s0) 	# load with offset
	# PushParam _tmp19
	# we are in a EmitParam
	# so, the arg register is given $t7
	  sw $t7, -40($fp)	# spill _tmp19 from $t7 to $fp-40
	  lw $t7, -40($fp)	# fill _tmp19 to $t7 from $fp-40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# PushParam _tmp18
	# we are in a EmitParam
	# so, the arg register is given $t6
	  lw $t6, -36($fp)	# fill _tmp18 to $t6 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t6, 4($sp)	# copy param value to stack
	# PushParam i
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, 8($fp)	# fill i to $t0 from $fp+8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill temp to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp21
	# we clean all the regiser
	  sw $s0, -44($fp)	# spill _tmp20 from $s0 to $fp-44
	  sw $s1, -48($fp)	# spill _tmp21 from $s1 to $fp-48
	  lw $v0, -48($fp)	# fill _tmp21 to $v0 from $fp-48
	  jalr $v0            	# jump to function
	# PopParams 16
	  add $sp, $sp, 16	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# we are going to Generate another function
	# we clean all the regiser
  _Queue.DeQueue:
	# BeginFunc 132
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 132	# decrement sp to make space for locals/temps
	# _tmp22 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp22 register is given $t4
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t4, 4($t3) 	# load with offset
	# _tmp23 = *(_tmp22)
	# We are in the EmitLoad
	# so, the dst: _tmp23 register is given $t5
	# the reference: _tmp22 is given $t4
	  lw $t5, 0($t4) 	# load with offset
	# _tmp24 = *(_tmp23 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp24 register is given $t6
	# the reference: _tmp23 is given $t5
	  lw $t6, 12($t5) 	# load with offset
	# PushParam _tmp22
	# we are in a EmitParam
	# so, the arg register is given $t4
	  sw $t4, -12($fp)	# spill _tmp22 from $t4 to $fp-12
	  lw $t4, -12($fp)	# fill _tmp22 to $t4 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp25 = ACall _tmp24
	# we clean all the regiser
	  sw $t5, -16($fp)	# spill _tmp23 from $t5 to $fp-16
	  sw $t6, -20($fp)	# spill _tmp24 from $t6 to $fp-20
	  lw $v0, -20($fp)	# fill _tmp24 to $v0 from $fp-20
	  jalr $v0            	# jump to function
	  move $t7, $v0		# copy function return value from $v0
	  sw $t7, -24($fp)	# spill _tmp25 from $t7 to $fp-24
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp26 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp26 register is given $t0
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t0, 4($t3) 	# load with offset
	# _tmp27 = _tmp25 == _tmp26
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $t7
	# the op2 is $t0
	  seq $t1, $t7, $t0	
	# IfZ _tmp27 Goto _L1
	# we clean all the regiser
	  sw $t0, -28($fp)	# spill _tmp26 from $t0 to $fp-28
	  sw $t1, -32($fp)	# spill _tmp27 from $t1 to $fp-32
	  lw $t1, -32($fp)	# fill _tmp27 to $t1 from $fp-32
	  beqz $t1, _L1	# branch if _tmp27 is zero 
	# _tmp28 = "Queue Is Empty"
	# We are in the LoadString
	# so, the dst register is given $t2
	# the String is "Queue Is Empty"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Queue Is Empty"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t2
	# the label is _string1
	  la $t2, _string1	# load label
	# PushParam _tmp28
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -36($fp)	# spill _tmp28 from $t2 to $fp-36
	  lw $t2, -36($fp)	# fill _tmp28 to $t2 from $fp-36
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp29 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp29
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# Goto _L0
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp29 from $t0 to $fp-40
	  b _L0		# unconditional branch
	# we clean all the regiser
  _L1:
	# _tmp30 = *(this + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp30 register is given $t0
	# the reference: this is given $t3
	  lw $t3, 4($fp)	# fill this to $t3 from $fp+4
	  lw $t0, 4($t3) 	# load with offset
	# _tmp31 = *(_tmp30)
	# We are in the EmitLoad
	# so, the dst: _tmp31 register is given $t1
	# the reference: _tmp30 is given $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp32 = *(_tmp31 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp32 register is given $t2
	# the reference: _tmp31 is given $t1
	  lw $t2, 12($t1) 	# load with offset
	# PushParam _tmp30
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -48($fp)	# spill _tmp30 from $t0 to $fp-48
	  lw $t0, -48($fp)	# fill _tmp30 to $t0 from $fp-48
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp33 = ACall _tmp32
	# we clean all the regiser
	  sw $t1, -52($fp)	# spill _tmp31 from $t1 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp32 from $t2 to $fp-56
	  lw $v0, -56($fp)	# fill _tmp32 to $v0 from $fp-56
	  jalr $v0            	# jump to function
	  move $t4, $v0		# copy function return value from $v0
	  sw $t4, -60($fp)	# spill _tmp33 from $t4 to $fp-60
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# temp = _tmp33
	# We are in the EmitCopy
	# so, the dst register is given $t2
	# the src is $t4
	  move $t2, $t4		# copy value from $t4 to $t2
	# _tmp34 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp34 register is given $t0
	# the reference: temp is given $t2
	  lw $t0, 0($t2) 	# load with offset
	# _tmp35 = *(_tmp34 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp35 register is given $t1
	# the reference: _tmp34 is given $t0
	  lw $t1, 4($t0) 	# load with offset
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t2
	  sw $t2, -44($fp)	# spill temp from $t2 to $fp-44
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp36 = ACall _tmp35
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp34 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp35 from $t1 to $fp-68
	  lw $v0, -68($fp)	# fill _tmp35 to $v0 from $fp-68
	  jalr $v0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -72($fp)	# spill _tmp36 from $t2 to $fp-72
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# val = _tmp36
	# We are in the EmitCopy
	# so, the dst register is given $t0
	# the src is $t2
	  move $t0, $t2		# copy value from $t2 to $t0
	# _tmp37 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp37 register is given $t0
	# the reference: temp is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  sw $t0, -8($fp)	# spill val from $t0 to $fp-8
	  lw $t0, 0($t2) 	# load with offset
	# _tmp38 = *(_tmp37 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp38 register is given $t1
	# the reference: _tmp37 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp39 = ACall _tmp38
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp37 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp38 from $t1 to $fp-80
	  lw $v0, -80($fp)	# fill _tmp38 to $v0 from $fp-80
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -84($fp)	# spill _tmp39 from $t0 to $fp-84
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp40 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp40 register is given $t0
	# the reference: temp is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  lw $t0, 0($t2) 	# load with offset
	# _tmp41 = *(_tmp40 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp41 register is given $t1
	# the reference: _tmp40 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp42 = ACall _tmp41
	# we clean all the regiser
	  sw $t0, -88($fp)	# spill _tmp40 from $t0 to $fp-88
	  sw $t1, -92($fp)	# spill _tmp41 from $t1 to $fp-92
	  lw $v0, -92($fp)	# fill _tmp41 to $v0 from $fp-92
	  jalr $v0            	# jump to function
	  move $t2, $v0		# copy function return value from $v0
	  sw $t2, -96($fp)	# spill _tmp42 from $t2 to $fp-96
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp43 = *(_tmp42)
	# We are in the EmitLoad
	# so, the dst: _tmp43 register is given $t0
	# the reference: _tmp42 is given $t2
	  lw $t0, 0($t2) 	# load with offset
	# _tmp44 = *(_tmp43 + 16)
	# We are in the EmitLoad
	# so, the dst: _tmp44 register is given $t1
	# the reference: _tmp43 is given $t0
	  lw $t1, 16($t0) 	# load with offset
	# PushParam _tmp39
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -100($fp)	# spill _tmp43 from $t0 to $fp-100
	  lw $t0, -84($fp)	# fill _tmp39 to $t0 from $fp-84
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp42
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -96($fp)	# fill _tmp42 to $t2 from $fp-96
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp44
	# we clean all the regiser
	  sw $t1, -104($fp)	# spill _tmp44 from $t1 to $fp-104
	  lw $v0, -104($fp)	# fill _tmp44 to $v0 from $fp-104
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp45 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp45 register is given $t0
	# the reference: temp is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  lw $t0, 0($t2) 	# load with offset
	# _tmp46 = *(_tmp45 + 12)
	# We are in the EmitLoad
	# so, the dst: _tmp46 register is given $t1
	# the reference: _tmp45 is given $t0
	  lw $t1, 12($t0) 	# load with offset
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp47 = ACall _tmp46
	# we clean all the regiser
	  sw $t0, -108($fp)	# spill _tmp45 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp46 from $t1 to $fp-112
	  lw $v0, -112($fp)	# fill _tmp46 to $v0 from $fp-112
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -116($fp)	# spill _tmp47 from $t0 to $fp-116
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp48 = *(temp)
	# We are in the EmitLoad
	# so, the dst: _tmp48 register is given $t0
	# the reference: temp is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  lw $t0, 0($t2) 	# load with offset
	# _tmp49 = *(_tmp48 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp49 register is given $t1
	# the reference: _tmp48 is given $t0
	  lw $t1, 8($t0) 	# load with offset
	# PushParam temp
	# we are in a EmitParam
	# so, the arg register is given $t2
	  lw $t2, -44($fp)	# fill temp to $t2 from $fp-44
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp50 = ACall _tmp49
	# we clean all the regiser
	  sw $t0, -120($fp)	# spill _tmp48 from $t0 to $fp-120
	  sw $t1, -124($fp)	# spill _tmp49 from $t1 to $fp-124
	  lw $v0, -124($fp)	# fill _tmp49 to $v0 from $fp-124
	  jalr $v0            	# jump to function
	  move $t3, $v0		# copy function return value from $v0
	  sw $t3, -128($fp)	# spill _tmp50 from $t3 to $fp-128
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp51 = *(_tmp50)
	# We are in the EmitLoad
	# so, the dst: _tmp51 register is given $spill
	# the reference: _tmp50 is given $t3
	  lw $v0, 0($t3) 	# load with offset
	  sw $v0, -132($fp)	# spill _tmp51 from $v0 to $fp-132
	# _tmp52 = *(_tmp51 + 20)
	# We are in the EmitLoad
	# so, the dst: _tmp52 register is given $spill
	# the reference: _tmp51 is given $spill
	  lw $v0, -132($fp)	# fill _tmp51 to $v0 from $fp-132
	  lw $v0, 20($v0) 	# load with offset
	  sw $v0, -136($fp)	# spill _tmp52 from $v0 to $fp-136
	# PushParam _tmp47
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -116($fp)	# fill _tmp47 to $t0 from $fp-116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# PushParam _tmp50
	# we are in a EmitParam
	# so, the arg register is given $t3
	  lw $t3, -128($fp)	# fill _tmp50 to $t3 from $fp-128
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# ACall _tmp52
	# we clean all the regiser
	  lw $v0, -136($fp)	# fill _tmp52 to $v0 from $fp-136
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# we clean all the regiser
  _L0:
	# Return val
	  lw $t0, -8($fp)	# fill val to $t0 from $fp-8
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
	# VTable for class Queue
	  .data
	  .align 2
	  Queue:		# label for class Queue vtable
	  .word _Queue.Init
	  .word _Queue.EnQueue
	  .word _Queue.DeQueue
	  .text
	# we are going to Generate another function
	# we clean all the regiser
  main:
	# BeginFunc 212
	# we clean all the regiser
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 212	# decrement sp to make space for locals/temps
	# _tmp53 = 8
	# We are in the LoadConstant
	# so, the dst register is given $spill
	# the constant is 8
	  li $v0, 8		# load constant value 8 into $v0
	  sw $v0, -16($fp)	# spill _tmp53 from $v0 to $fp-16
	# PushParam _tmp53
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -16($fp)	# fill _tmp53 to $v0 from $fp-16
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# _tmp54 = LCall _Alloc
	# we clean all the regiser
	  jal _Alloc         	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -20($fp)	# spill _tmp54 from $v0 to $fp-20
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp55 = Queue
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is Queue
	  la $t0, Queue	# load label
	# *(_tmp54) = _tmp55
	# We are in the EmitStore
	# so, the reference: _tmp54 register is given $spill
	# the value: _tmp55 is given $t0
	  lw $v1, -20($fp)	# fill _tmp54 to $v1 from $fp-20
	  sw $t0, 0($v1) 	# store with offset
	# q = _tmp54
	# We are in the EmitCopy
	# so, the dst register is given $t1
	# the src is $spill
	  lw $v0, -20($fp)	# fill _tmp54 to $v0 from $fp-20
	  move $t1, $v0		# copy value from $v0 to $t1
	# _tmp56 = *(q)
	# We are in the EmitLoad
	# so, the dst: _tmp56 register is given $t2
	# the reference: q is given $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp57 = *(_tmp56)
	# We are in the EmitLoad
	# so, the dst: _tmp57 register is given $t3
	# the reference: _tmp56 is given $t2
	  lw $t3, 0($t2) 	# load with offset
	# PushParam q
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -8($fp)	# spill q from $t1 to $fp-8
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp57
	# we clean all the regiser
	  sw $t0, -24($fp)	# spill _tmp55 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp56 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp57 from $t3 to $fp-32
	  lw $v0, -32($fp)	# fill _tmp57 to $v0 from $fp-32
	  jalr $v0            	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp58 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp58
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# we clean all the regiser
	  sw $t0, -36($fp)	# spill _tmp58 from $t0 to $fp-36
  _L2:
	# _tmp59 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp60 = i == _tmp59
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  seq $t1, $v0, $t0	
	# _tmp61 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp62 = _tmp60 == _tmp61
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  seq $t3, $t1, $t2	
	# IfZ _tmp62 Goto _L3
	# we clean all the regiser
	  sw $t0, -40($fp)	# spill _tmp59 from $t0 to $fp-40
	  sw $t1, -44($fp)	# spill _tmp60 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp61 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp62 from $t3 to $fp-52
	  lw $t3, -52($fp)	# fill _tmp62 to $t3 from $fp-52
	  beqz $t3, _L3	# branch if _tmp62 is zero 
	# _tmp63 = *(q)
	# We are in the EmitLoad
	# so, the dst: _tmp63 register is given $t4
	# the reference: q is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  lw $t4, 0($t1) 	# load with offset
	# _tmp64 = *(_tmp63 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp64 register is given $t5
	# the reference: _tmp63 is given $t4
	  lw $t5, 4($t4) 	# load with offset
	# PushParam i
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam q
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp64
	# we clean all the regiser
	  sw $t4, -56($fp)	# spill _tmp63 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp64 from $t5 to $fp-60
	  lw $v0, -60($fp)	# fill _tmp64 to $v0 from $fp-60
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp65 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp66 = i + _tmp65
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  add $t1, $v0, $t0	
	# i = _tmp66
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L2
	# we clean all the regiser
	  sw $t0, -64($fp)	# spill _tmp65 from $t0 to $fp-64
	  sw $t1, -68($fp)	# spill _tmp66 from $t1 to $fp-68
	  b _L2		# unconditional branch
	# we clean all the regiser
  _L3:
	# _tmp67 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp67
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# we clean all the regiser
	  sw $t0, -72($fp)	# spill _tmp67 from $t0 to $fp-72
  _L4:
	# _tmp68 = 4
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp69 = i == _tmp68
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  seq $t1, $v0, $t0	
	# _tmp70 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp71 = _tmp69 == _tmp70
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  seq $t3, $t1, $t2	
	# IfZ _tmp71 Goto _L5
	# we clean all the regiser
	  sw $t0, -76($fp)	# spill _tmp68 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp69 from $t1 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp70 from $t2 to $fp-84
	  sw $t3, -88($fp)	# spill _tmp71 from $t3 to $fp-88
	  lw $t3, -88($fp)	# fill _tmp71 to $t3 from $fp-88
	  beqz $t3, _L5	# branch if _tmp71 is zero 
	# _tmp72 = *(q)
	# We are in the EmitLoad
	# so, the dst: _tmp72 register is given $t4
	# the reference: q is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  lw $t4, 0($t1) 	# load with offset
	# _tmp73 = *(_tmp72 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp73 register is given $t5
	# the reference: _tmp72 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam q
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp74 = ACall _tmp73
	# we clean all the regiser
	  sw $t4, -92($fp)	# spill _tmp72 from $t4 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp73 from $t5 to $fp-96
	  lw $v0, -96($fp)	# fill _tmp73 to $v0 from $fp-96
	  jalr $v0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	  sw $t0, -100($fp)	# spill _tmp74 from $t0 to $fp-100
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp74
	# we are in a EmitParam
	# so, the arg register is given $t0
	  lw $t0, -100($fp)	# fill _tmp74 to $t0 from $fp-100
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp75 = " "
	# We are in the LoadString
	# so, the dst register is given $t0
	# the String is " "
	  .data			# create string constant marked with label
	  _string2: .asciiz " "
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t0
	# the label is _string2
	  la $t0, _string2	# load label
	# PushParam _tmp75
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -104($fp)	# spill _tmp75 from $t0 to $fp-104
	  lw $t0, -104($fp)	# fill _tmp75 to $t0 from $fp-104
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp76 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp77 = i + _tmp76
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  add $t1, $v0, $t0	
	# i = _tmp77
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L4
	# we clean all the regiser
	  sw $t0, -108($fp)	# spill _tmp76 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp77 from $t1 to $fp-112
	  b _L4		# unconditional branch
	# we clean all the regiser
  _L5:
	# _tmp78 = "\n"
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
	# PushParam _tmp78
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -116($fp)	# spill _tmp78 from $t0 to $fp-116
	  lw $t0, -116($fp)	# fill _tmp78 to $t0 from $fp-116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp79 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp79
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# we clean all the regiser
	  sw $t0, -120($fp)	# spill _tmp79 from $t0 to $fp-120
  _L6:
	# _tmp80 = 10
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp81 = i == _tmp80
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  seq $t1, $v0, $t0	
	# _tmp82 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp83 = _tmp81 == _tmp82
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  seq $t3, $t1, $t2	
	# IfZ _tmp83 Goto _L7
	# we clean all the regiser
	  sw $t0, -124($fp)	# spill _tmp80 from $t0 to $fp-124
	  sw $t1, -128($fp)	# spill _tmp81 from $t1 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp82 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp83 from $t3 to $fp-136
	  lw $t3, -136($fp)	# fill _tmp83 to $t3 from $fp-136
	  beqz $t3, _L7	# branch if _tmp83 is zero 
	# _tmp84 = *(q)
	# We are in the EmitLoad
	# so, the dst: _tmp84 register is given $t4
	# the reference: q is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  lw $t4, 0($t1) 	# load with offset
	# _tmp85 = *(_tmp84 + 4)
	# We are in the EmitLoad
	# so, the dst: _tmp85 register is given $t5
	# the reference: _tmp84 is given $t4
	  lw $t5, 4($t4) 	# load with offset
	# PushParam i
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# PushParam q
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# ACall _tmp85
	# we clean all the regiser
	  sw $t4, -140($fp)	# spill _tmp84 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp85 from $t5 to $fp-144
	  lw $v0, -144($fp)	# fill _tmp85 to $v0 from $fp-144
	  jalr $v0            	# jump to function
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp86 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp87 = i + _tmp86
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  add $t1, $v0, $t0	
	# i = _tmp87
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L6
	# we clean all the regiser
	  sw $t0, -148($fp)	# spill _tmp86 from $t0 to $fp-148
	  sw $t1, -152($fp)	# spill _tmp87 from $t1 to $fp-152
	  b _L6		# unconditional branch
	# we clean all the regiser
  _L7:
	# _tmp88 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp88
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t0
	  move $v0, $t0		# copy value from $t0 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# we clean all the regiser
	  sw $t0, -156($fp)	# spill _tmp88 from $t0 to $fp-156
  _L8:
	# _tmp89 = 17
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 17
	  li $t0, 17		# load constant value 17 into $t0
	# _tmp90 = i == _tmp89
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  seq $t1, $v0, $t0	
	# _tmp91 = 0
	# We are in the LoadConstant
	# so, the dst register is given $t2
	# the constant is 0
	  li $t2, 0		# load constant value 0 into $t2
	# _tmp92 = _tmp90 == _tmp91
	# We are in the EmitBinaryOp
	# so, the dst register is given $t3
	# the op1 is $t1
	# the op2 is $t2
	  seq $t3, $t1, $t2	
	# IfZ _tmp92 Goto _L9
	# we clean all the regiser
	  sw $t0, -160($fp)	# spill _tmp89 from $t0 to $fp-160
	  sw $t1, -164($fp)	# spill _tmp90 from $t1 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp91 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp92 from $t3 to $fp-172
	  lw $t3, -172($fp)	# fill _tmp92 to $t3 from $fp-172
	  beqz $t3, _L9	# branch if _tmp92 is zero 
	# _tmp93 = *(q)
	# We are in the EmitLoad
	# so, the dst: _tmp93 register is given $t4
	# the reference: q is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  lw $t4, 0($t1) 	# load with offset
	# _tmp94 = *(_tmp93 + 8)
	# We are in the EmitLoad
	# so, the dst: _tmp94 register is given $t5
	# the reference: _tmp93 is given $t4
	  lw $t5, 8($t4) 	# load with offset
	# PushParam q
	# we are in a EmitParam
	# so, the arg register is given $t1
	  lw $t1, -8($fp)	# fill q to $t1 from $fp-8
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp95 = ACall _tmp94
	# we clean all the regiser
	  sw $t4, -176($fp)	# spill _tmp93 from $t4 to $fp-176
	  sw $t5, -180($fp)	# spill _tmp94 from $t5 to $fp-180
	  lw $v0, -180($fp)	# fill _tmp94 to $v0 from $fp-180
	  jalr $v0            	# jump to function
	  move $v0, $v0		# copy function return value from $v0
	  sw $v0, -184($fp)	# spill _tmp95 from $v0 to $fp-184
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp95
	# we are in a EmitParam
	# so, the arg register is given $spill
	  lw $v0, -184($fp)	# fill _tmp95 to $v0 from $fp-184
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $v0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# we clean all the regiser
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp96 = " "
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
	# PushParam _tmp96
	# we are in a EmitParam
	# so, the arg register is given $t0
	  sw $t0, -188($fp)	# spill _tmp96 from $t0 to $fp-188
	  lw $t0, -188($fp)	# fill _tmp96 to $t0 from $fp-188
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# we clean all the regiser
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp97 = 1
	# We are in the LoadConstant
	# so, the dst register is given $t0
	# the constant is 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp98 = i + _tmp97
	# We are in the EmitBinaryOp
	# so, the dst register is given $t1
	# the op1 is $spill
	# the op2 is $t0
	  lw $v0, -12($fp)	# fill i to $v0 from $fp-12
	  add $t1, $v0, $t0	
	# i = _tmp98
	# We are in the EmitCopy
	# so, the dst register is given $spill
	# the src is $t1
	  move $v0, $t1		# copy value from $t1 to $v0
	  sw $v0, -12($fp)	# spill i from $v0 to $fp-12
	# Goto _L8
	# we clean all the regiser
	  sw $t0, -192($fp)	# spill _tmp97 from $t0 to $fp-192
	  sw $t1, -196($fp)	# spill _tmp98 from $t1 to $fp-196
	  b _L8		# unconditional branch
	# we clean all the regiser
  _L9:
	# _tmp99 = "\n"
	# We are in the LoadString
	# so, the dst register is given $t1
	# the String is "\n"
	  .data			# create string constant marked with label
	  _string5: .asciiz "\n"
	  .text
	# We are in the LoadLabel
	# so, the dst register is given $t1
	# the label is _string5
	  la $t1, _string5	# load label
	# PushParam _tmp99
	# we are in a EmitParam
	# so, the arg register is given $t1
	  sw $t1, -200($fp)	# spill _tmp99 from $t1 to $fp-200
	  lw $t1, -200($fp)	# fill _tmp99 to $t1 from $fp-200
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
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
