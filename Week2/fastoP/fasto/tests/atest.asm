	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function divzero
f.divzero:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 10
# was:	li	_div1_L_2_, 10
	li	x10, 0
# was:	li	_div2_R_3_, 0
	div	x10, x11, x10
# was:	div	_divzerores_1_, _div1_L_2_, _div2_R_3_
# 	mv	x10,_divzerores_1_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function AndTest
f.AndTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 1
# was:	li	_and_L_9_, 1
	li	x10, 0
# was:	li	_and_R_10_, 0
	and	x10, x11, x10
# was:	and	_cond_8_, _and_L_9_, _and_R_10_
	bne	x10, x0, l.then_5_
# was:	bne	_cond_8_, x0, l.then_5_
	j	l.else_6_
l.then_5_:
	li	x10, 2
# was:	li	_AndTestres_4_, 2
	j	l.endif_7_
l.else_6_:
	li	x11, 0
# was:	li	_and_L_15_, 0
	li	x10, 0
# was:	li	_and_R_16_, 0
	and	x10, x11, x10
# was:	and	_cond_14_, _and_L_15_, _and_R_16_
	bne	x10, x0, l.then_11_
# was:	bne	_cond_14_, x0, l.then_11_
	j	l.else_12_
l.then_11_:
	li	x10, 3
# was:	li	_AndTestres_4_, 3
	j	l.endif_13_
l.else_12_:
	li	x11, 1
# was:	li	_and_L_21_, 1
	li	x10, 1
# was:	li	_and_R_22_, 1
	and	x10, x11, x10
# was:	and	_cond_20_, _and_L_21_, _and_R_22_
	bne	x10, x0, l.then_17_
# was:	bne	_cond_20_, x0, l.then_17_
	j	l.else_18_
l.then_17_:
	li	x10, 1
# was:	li	_AndTestres_4_, 1
	j	l.endif_19_
l.else_18_:
	li	x10, 4
# was:	li	_AndTestres_4_, 4
l.endif_19_:
l.endif_13_:
l.endif_7_:
# 	mv	x10,_AndTestres_4_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function OrTest
f.OrTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 1
# was:	li	_or_L_28_, 1
	li	x10, 0
# was:	li	_or_R_29_, 0
	or	x10, x11, x10
# was:	or	_cond_27_, _or_L_28_, _or_R_29_
	bne	x10, x0, l.then_24_
# was:	bne	_cond_27_, x0, l.then_24_
	j	l.else_25_
l.then_24_:
	li	x11, 0
# was:	li	_or_L_34_, 0
	li	x10, 1
# was:	li	_or_R_35_, 1
	or	x10, x11, x10
# was:	or	_cond_33_, _or_L_34_, _or_R_35_
	bne	x10, x0, l.then_30_
# was:	bne	_cond_33_, x0, l.then_30_
	j	l.else_31_
l.then_30_:
	li	x11, 1
# was:	li	_or_L_40_, 1
	li	x10, 1
# was:	li	_or_R_41_, 1
	or	x10, x11, x10
# was:	or	_cond_39_, _or_L_40_, _or_R_41_
	bne	x10, x0, l.then_36_
# was:	bne	_cond_39_, x0, l.then_36_
	j	l.else_37_
l.then_36_:
	li	x11, 0
# was:	li	_or_L_46_, 0
	li	x10, 0
# was:	li	_or_R_47_, 0
	or	x10, x11, x10
# was:	or	_cond_45_, _or_L_46_, _or_R_47_
	bne	x10, x0, l.then_42_
# was:	bne	_cond_45_, x0, l.then_42_
	j	l.else_43_
l.then_42_:
	li	x10, 5
# was:	li	_OrTestres_23_, 5
	j	l.endif_44_
l.else_43_:
	li	x10, 1
# was:	li	_OrTestres_23_, 1
l.endif_44_:
	j	l.endif_38_
l.else_37_:
	li	x10, 4
# was:	li	_OrTestres_23_, 4
l.endif_38_:
	j	l.endif_32_
l.else_31_:
	li	x10, 3
# was:	li	_OrTestres_23_, 3
l.endif_32_:
	j	l.endif_26_
l.else_25_:
	li	x10, 2
# was:	li	_OrTestres_23_, 2
l.endif_26_:
# 	mv	x10,_OrTestres_23_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function NotTest
f.NotTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x10, 1
# was:	li	_xori_55_, 1
	xori	x10, x10, 1
# was:	xori	_and_L_53_, _xori_55_, 1
	li	x11, 1
# was:	li	_and_R_54_, 1
	and	x10, x10, x11
# was:	and	_cond_52_, _and_L_53_, _and_R_54_
	bne	x10, x0, l.then_49_
# was:	bne	_cond_52_, x0, l.then_49_
	j	l.else_50_
l.then_49_:
	li	x10, 2
# was:	li	_NotTestres_48_, 2
	j	l.endif_51_
l.else_50_:
	li	x10, 0
# was:	li	_xori_62_, 0
	xori	x10, x10, 1
# was:	xori	_and_L_60_, _xori_62_, 1
	li	x11, 0
# was:	li	_xori_63_, 0
	xori	x11, x11, 1
# was:	xori	_and_R_61_, _xori_63_, 1
	and	x10, x10, x11
# was:	and	_cond_59_, _and_L_60_, _and_R_61_
	bne	x10, x0, l.then_56_
# was:	bne	_cond_59_, x0, l.then_56_
	j	l.else_57_
l.then_56_:
	li	x10, 1
# was:	li	_NotTestres_48_, 1
	j	l.endif_58_
l.else_57_:
	li	x10, 3
# was:	li	_NotTestres_48_, 3
l.endif_58_:
l.endif_51_:
# 	mv	x10,_NotTestres_48_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function NegateTest
f.NegateTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 0
# was:	li	_minus_L_71_, 0
	li	x10, 5
# was:	li	_minus_R_72_, 5
	sub	x11, x11, x10
# was:	sub	_lt_L_69_, _minus_L_71_, _minus_R_72_
	li	x10, 2
# was:	li	_lt_R_70_, 2
	slt	x10, x11, x10
# was:	slt	_cond_68_, _lt_L_69_, _lt_R_70_
	bne	x10, x0, l.then_65_
# was:	bne	_cond_68_, x0, l.then_65_
	j	l.else_66_
l.then_65_:
	li	x10, 1
# was:	li	_NegateTestres_64_, 1
	j	l.endif_67_
l.else_66_:
	li	x10, 2
# was:	li	_NegateTestres_64_, 2
l.endif_67_:
# 	mv	x10,_NegateTestres_64_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function Negate0Test
f.Negate0Test:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 0
# was:	li	_minus_L_80_, 0
	li	x10, 0
# was:	li	_minus_R_81_, 0
	sub	x11, x11, x10
# was:	sub	_eq_L_78_, _minus_L_80_, _minus_R_81_
	li	x10, 0
# was:	li	_eq_R_79_, 0
	li	x12, 0
# was:	li	_cond_77_, 0
	bne	x11, x10, l.false_82_
# was:	bne	_eq_L_78_, _eq_R_79_, l.false_82_
	li	x12, 1
# was:	li	_cond_77_, 1
l.false_82_:
	bne	x12, x0, l.then_74_
# was:	bne	_cond_77_, x0, l.then_74_
	j	l.else_75_
l.then_74_:
	li	x10, 1
# was:	li	_Negate0Testres_73_, 1
	j	l.endif_76_
l.else_75_:
	li	x10, 2
# was:	li	_Negate0Testres_73_, 2
l.endif_76_:
# 	mv	x10,_Negate0Testres_73_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function times0test
f.times0test:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 5
# was:	li	_mult1_L_90_, 5
	li	x10, 0
# was:	li	_mult2_R_91_, 0
	mul	x11, x11, x10
# was:	mul	_eq_L_88_, _mult1_L_90_, _mult2_R_91_
	li	x10, 0
# was:	li	_eq_R_89_, 0
	li	x12, 0
# was:	li	_cond_87_, 0
	bne	x11, x10, l.false_92_
# was:	bne	_eq_L_88_, _eq_R_89_, l.false_92_
	li	x12, 1
# was:	li	_cond_87_, 1
l.false_92_:
	bne	x12, x0, l.then_84_
# was:	bne	_cond_87_, x0, l.then_84_
	j	l.else_85_
l.then_84_:
	li	x10, 1
# was:	li	_times0testres_83_, 1
	j	l.endif_86_
l.else_85_:
	li	x10, 2
# was:	li	_times0testres_83_, 2
l.endif_86_:
# 	mv	x10,_times0testres_83_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	jal	f.times0test
# was:	jal	f.times0test, 
# 	mv	_tmp_94_,x10
	mv	x18, x10
# was:	mv	_mainres_93_, _tmp_94_
	mv	x10, x18
# was:	mv	x10, _mainres_93_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_93_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
f.ord:
	mv	x10, x10
	jr	x1
f.chr:
	andi	x10, x10, 255
	jr	x1
p.putint:
	li	x17, 1
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getint:
	li	x17, 5
	ecall
	jr	x1
p.putchar:
	li	x17, 11
	ecall
	li	x17, 4
	la	x10, m.space
	ecall
	jr	x1
p.getchar:
	li	x17, 12
	ecall
	jr	x1
p.putstring:
	lw	x7, 0(x10)
	addi	x6, x10, 4
	add	x7, x6, x7
	li	x17, 11
l.ps_begin:
	bge	x6, x7, l.ps_done
	lbu	x10, 0(x6)
	ecall
	addi	x6, x6, 1
	j	l.ps_begin
l.ps_done:
	jr	x1
p.RuntimeError:
	mv	x6, x10
	li	x17, 4
	la	x10, m.RunErr
	ecall
	li	x17, 1
	mv	x10, x6
	ecall
	li	x17, 4
	la	x10, m.colon_space
	ecall
	mv	x10, x11
	ecall
	la	x10, m.nl
	ecall
	j	l.stop
	.data	
# Fixed strings for runtime I/O
m.RunErr:
	.asciz	"Runtime error at line "
m.colon_space:
	.asciz	": "
m.nl:
	.asciz	"\n"
m.space:
	.asciz	" "
# Message strings for specific errors
m.BadSize:
	.asciz	"negative array size"
m.BadIndex:
	.asciz	"array index out of bounds"
m.DivZero:
	.asciz	"division by zero"
# String literals (including lengths) from program
	.align	2
s.true:
	.word	4
	.asciz	"true"
	.align	2
s.false:
	.word	5
	.asciz	"false"
	.align	2
# Space for Fasto heap
d.heap:
	.space	100000