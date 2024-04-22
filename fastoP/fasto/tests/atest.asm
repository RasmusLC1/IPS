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
	li	x12, 10
# was:	li	_div1_L_2_, 10
	li	x10, 0
# was:	li	_divzerores_1_, 0
	beq	x12, x10, l.divzero_4_
# was:	beq	_div1_L_2_, _divzerores_1_, l.divzero_4_
	li	x11, 0
# was:	li	_div2_R_3_, 0
	beq	x11, x10, l.divzero_4_
# was:	beq	_div2_R_3_, _divzerores_1_, l.divzero_4_
	div	x10, x12, x11
# was:	div	_divzerores_1_, _div1_L_2_, _div2_R_3_
l.divzero_4_:
# 	mv	x10,_divzerores_1_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function AndTest
f.AndTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 1
# was:	li	_and_L_10_, 1
	li	x10, 0
# was:	li	_cond_9_, 0
	beq	x11, x10, l.false_12_
# was:	beq	_and_L_10_, _cond_9_, l.false_12_
	li	x11, 0
# was:	li	_and_R_11_, 0
	beq	x11, x10, l.false_12_
# was:	beq	_and_R_11_, _cond_9_, l.false_12_
	li	x10, 1
# was:	li	_cond_9_, 1
l.false_12_:
	bne	x10, x0, l.then_6_
# was:	bne	_cond_9_, x0, l.then_6_
	j	l.else_7_
l.then_6_:
	li	x10, 2
# was:	li	_AndTestres_5_, 2
	j	l.endif_8_
l.else_7_:
	li	x11, 0
# was:	li	_and_L_17_, 0
	li	x10, 0
# was:	li	_cond_16_, 0
	beq	x11, x10, l.false_19_
# was:	beq	_and_L_17_, _cond_16_, l.false_19_
	li	x11, 0
# was:	li	_and_R_18_, 0
	beq	x11, x10, l.false_19_
# was:	beq	_and_R_18_, _cond_16_, l.false_19_
	li	x10, 1
# was:	li	_cond_16_, 1
l.false_19_:
	bne	x10, x0, l.then_13_
# was:	bne	_cond_16_, x0, l.then_13_
	j	l.else_14_
l.then_13_:
	li	x10, 3
# was:	li	_AndTestres_5_, 3
	j	l.endif_15_
l.else_14_:
	li	x11, 1
# was:	li	_and_L_24_, 1
	li	x10, 0
# was:	li	_cond_23_, 0
	beq	x11, x10, l.false_26_
# was:	beq	_and_L_24_, _cond_23_, l.false_26_
	li	x11, 1
# was:	li	_and_R_25_, 1
	beq	x11, x10, l.false_26_
# was:	beq	_and_R_25_, _cond_23_, l.false_26_
	li	x10, 1
# was:	li	_cond_23_, 1
l.false_26_:
	bne	x10, x0, l.then_20_
# was:	bne	_cond_23_, x0, l.then_20_
	j	l.else_21_
l.then_20_:
	li	x10, 1
# was:	li	_AndTestres_5_, 1
	j	l.endif_22_
l.else_21_:
	li	x10, 4
# was:	li	_AndTestres_5_, 4
l.endif_22_:
l.endif_15_:
l.endif_8_:
# 	mv	x10,_AndTestres_5_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function OrTest
f.OrTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 1
# was:	li	_or_L_32_, 1
	li	x10, 1
# was:	li	_cond_31_, 1
	beq	x11, x10, l.true_34_
# was:	beq	_or_L_32_, _cond_31_, l.true_34_
	li	x11, 0
# was:	li	_or_R_33_, 0
	beq	x11, x10, l.true_34_
# was:	beq	_or_R_33_, _cond_31_, l.true_34_
	li	x10, 1
# was:	li	_cond_31_, 1
l.true_34_:
	bne	x10, x0, l.then_28_
# was:	bne	_cond_31_, x0, l.then_28_
	j	l.else_29_
l.then_28_:
	li	x11, 0
# was:	li	_or_L_39_, 0
	li	x10, 1
# was:	li	_cond_38_, 1
	beq	x11, x10, l.true_41_
# was:	beq	_or_L_39_, _cond_38_, l.true_41_
	li	x11, 1
# was:	li	_or_R_40_, 1
	beq	x11, x10, l.true_41_
# was:	beq	_or_R_40_, _cond_38_, l.true_41_
	li	x10, 1
# was:	li	_cond_38_, 1
l.true_41_:
	bne	x10, x0, l.then_35_
# was:	bne	_cond_38_, x0, l.then_35_
	j	l.else_36_
l.then_35_:
	li	x11, 1
# was:	li	_or_L_46_, 1
	li	x10, 1
# was:	li	_cond_45_, 1
	beq	x11, x10, l.true_48_
# was:	beq	_or_L_46_, _cond_45_, l.true_48_
	li	x11, 1
# was:	li	_or_R_47_, 1
	beq	x11, x10, l.true_48_
# was:	beq	_or_R_47_, _cond_45_, l.true_48_
	li	x10, 1
# was:	li	_cond_45_, 1
l.true_48_:
	bne	x10, x0, l.then_42_
# was:	bne	_cond_45_, x0, l.then_42_
	j	l.else_43_
l.then_42_:
	li	x11, 0
# was:	li	_or_L_53_, 0
	li	x10, 1
# was:	li	_cond_52_, 1
	beq	x11, x10, l.true_55_
# was:	beq	_or_L_53_, _cond_52_, l.true_55_
	li	x11, 0
# was:	li	_or_R_54_, 0
	beq	x11, x10, l.true_55_
# was:	beq	_or_R_54_, _cond_52_, l.true_55_
	li	x10, 1
# was:	li	_cond_52_, 1
l.true_55_:
	bne	x10, x0, l.then_49_
# was:	bne	_cond_52_, x0, l.then_49_
	j	l.else_50_
l.then_49_:
	li	x10, 5
# was:	li	_OrTestres_27_, 5
	j	l.endif_51_
l.else_50_:
	li	x10, 1
# was:	li	_OrTestres_27_, 1
l.endif_51_:
	j	l.endif_44_
l.else_43_:
	li	x10, 4
# was:	li	_OrTestres_27_, 4
l.endif_44_:
	j	l.endif_37_
l.else_36_:
	li	x10, 3
# was:	li	_OrTestres_27_, 3
l.endif_37_:
	j	l.endif_30_
l.else_29_:
	li	x10, 2
# was:	li	_OrTestres_27_, 2
l.endif_30_:
# 	mv	x10,_OrTestres_27_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function NotTest
f.NotTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x10, 1
# was:	li	_xori_64_, 1
	xori	x11, x10, 1
# was:	xori	_and_L_61_, _xori_64_, 1
	li	x10, 0
# was:	li	_cond_60_, 0
	beq	x11, x10, l.false_63_
# was:	beq	_and_L_61_, _cond_60_, l.false_63_
	li	x11, 1
# was:	li	_and_R_62_, 1
	beq	x11, x10, l.false_63_
# was:	beq	_and_R_62_, _cond_60_, l.false_63_
	li	x10, 1
# was:	li	_cond_60_, 1
l.false_63_:
	bne	x10, x0, l.then_57_
# was:	bne	_cond_60_, x0, l.then_57_
	j	l.else_58_
l.then_57_:
	li	x10, 2
# was:	li	_NotTestres_56_, 2
	j	l.endif_59_
l.else_58_:
	li	x10, 0
# was:	li	_xori_72_, 0
	xori	x11, x10, 1
# was:	xori	_and_L_69_, _xori_72_, 1
	li	x10, 0
# was:	li	_cond_68_, 0
	beq	x11, x10, l.false_71_
# was:	beq	_and_L_69_, _cond_68_, l.false_71_
	li	x11, 0
# was:	li	_xori_73_, 0
	xori	x11, x11, 1
# was:	xori	_and_R_70_, _xori_73_, 1
	beq	x11, x10, l.false_71_
# was:	beq	_and_R_70_, _cond_68_, l.false_71_
	li	x10, 1
# was:	li	_cond_68_, 1
l.false_71_:
	bne	x10, x0, l.then_65_
# was:	bne	_cond_68_, x0, l.then_65_
	j	l.else_66_
l.then_65_:
	li	x10, 1
# was:	li	_NotTestres_56_, 1
	j	l.endif_67_
l.else_66_:
	li	x10, 3
# was:	li	_NotTestres_56_, 3
l.endif_67_:
l.endif_59_:
# 	mv	x10,_NotTestres_56_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function NegateTest
f.NegateTest:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 0
# was:	li	_minus_L_81_, 0
	li	x10, 5
# was:	li	_minus_R_82_, 5
	sub	x11, x11, x10
# was:	sub	_lt_L_79_, _minus_L_81_, _minus_R_82_
	li	x10, 2
# was:	li	_lt_R_80_, 2
	slt	x10, x11, x10
# was:	slt	_cond_78_, _lt_L_79_, _lt_R_80_
	bne	x10, x0, l.then_75_
# was:	bne	_cond_78_, x0, l.then_75_
	j	l.else_76_
l.then_75_:
	li	x10, 1
# was:	li	_NegateTestres_74_, 1
	j	l.endif_77_
l.else_76_:
	li	x10, 2
# was:	li	_NegateTestres_74_, 2
l.endif_77_:
# 	mv	x10,_NegateTestres_74_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function Negate0Test
f.Negate0Test:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 0
# was:	li	_minus_L_90_, 0
	li	x10, 0
# was:	li	_minus_R_91_, 0
	sub	x11, x11, x10
# was:	sub	_eq_L_88_, _minus_L_90_, _minus_R_91_
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
# was:	li	_Negate0Testres_83_, 1
	j	l.endif_86_
l.else_85_:
	li	x10, 2
# was:	li	_Negate0Testres_83_, 2
l.endif_86_:
# 	mv	x10,_Negate0Testres_83_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function times0test
f.times0test:
	sw	x1, -4(x2)
	addi	x2, x2, -4
	li	x11, 5
# was:	li	_mult1_L_100_, 5
	li	x10, 0
# was:	li	_mult2_R_101_, 0
	mul	x11, x11, x10
# was:	mul	_eq_L_98_, _mult1_L_100_, _mult2_R_101_
	li	x10, 0
# was:	li	_eq_R_99_, 0
	li	x12, 0
# was:	li	_cond_97_, 0
	bne	x11, x10, l.false_102_
# was:	bne	_eq_L_98_, _eq_R_99_, l.false_102_
	li	x12, 1
# was:	li	_cond_97_, 1
l.false_102_:
	bne	x12, x0, l.then_94_
# was:	bne	_cond_97_, x0, l.then_94_
	j	l.else_95_
l.then_94_:
	li	x10, 1
# was:	li	_times0testres_93_, 1
	j	l.endif_96_
l.else_95_:
	li	x10, 2
# was:	li	_times0testres_93_, 2
l.endif_96_:
# 	mv	x10,_times0testres_93_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
	jal	f.divzero
# was:	jal	f.divzero, 
# 	mv	_tmp_104_,x10
	mv	x18, x10
# was:	mv	_mainres_103_, _tmp_104_
	mv	x10, x18
# was:	mv	x10, _mainres_103_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _mainres_103_
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