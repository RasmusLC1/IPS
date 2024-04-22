	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_nl
f.write_nl:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_b_1_,x10
	mv	x18, x10
# was:	mv	_tmp_4_, _param_b_1_
# 	mv	_let_res_3_,_tmp_4_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x18, x0, l.wBoolF_5_
# was:	bne	_let_res_3_, x0, l.wBoolF_5_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_5_:
	jal	p.putstring
# was:	jal	p.putstring, x10
	la	x10, s.X_8_
# was:	la	_tmp_7_, s.X_8_
# s.X_8_: string "\n"
# 	mv	_let_tmp_6_,_tmp_7_
# 	mv	x10,_tmp_7_
	jal	p.putstring
# was:	jal	p.putstring, x10
	mv	x10, x18
# was:	mv	_write_nlres_2_, _let_res_3_
# 	mv	x10,_write_nlres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -16
	li	x11, 3
# was:	li	_div1_L_14_, 3
	li	x10, 2
# was:	li	_div2_R_15_, 2
	div	x10, x11, x10
# was:	div	_eq_L_12_, _div1_L_14_, _div2_R_15_
	li	x12, 1
# was:	li	_eq_R_13_, 1
	li	x11, 0
# was:	li	_arg_11_, 0
	bne	x10, x12, l.false_16_
# was:	bne	_eq_L_12_, _eq_R_13_, l.false_16_
	li	x11, 1
# was:	li	_arg_11_, 1
l.false_16_:
	mv	x10, x11
# was:	mv	x10, _arg_11_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x19, x10
# was:	mv	_let_x0_10_, x10
	li	x11, 0
# was:	li	_minus_L_23_, 0
	li	x10, 3
# was:	li	_minus_R_24_, 3
	sub	x11, x11, x10
# was:	sub	_div1_L_21_, _minus_L_23_, _minus_R_24_
	li	x10, 2
# was:	li	_div2_R_22_, 2
	div	x11, x11, x10
# was:	div	_eq_L_19_, _div1_L_21_, _div2_R_22_
	li	x12, 0
# was:	li	_minus_L_25_, 0
	li	x10, 2
# was:	li	_minus_R_26_, 2
	sub	x12, x12, x10
# was:	sub	_eq_R_20_, _minus_L_25_, _minus_R_26_
	li	x10, 0
# was:	li	_arg_18_, 0
	bne	x11, x12, l.false_27_
# was:	bne	_eq_L_19_, _eq_R_20_, l.false_27_
	li	x10, 1
# was:	li	_arg_18_, 1
l.false_27_:
# 	mv	x10,_arg_18_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x18, x10
# was:	mv	_let_x1_17_, x10
	li	x11, 3
# was:	li	_div1_L_32_, 3
	li	x12, 0
# was:	li	_minus_L_34_, 0
	li	x10, 2
# was:	li	_minus_R_35_, 2
	sub	x10, x12, x10
# was:	sub	_div2_R_33_, _minus_L_34_, _minus_R_35_
	div	x11, x11, x10
# was:	div	_eq_L_30_, _div1_L_32_, _div2_R_33_
	li	x12, 0
# was:	li	_minus_L_36_, 0
	li	x10, 2
# was:	li	_minus_R_37_, 2
	sub	x12, x12, x10
# was:	sub	_eq_R_31_, _minus_L_36_, _minus_R_37_
	li	x10, 0
# was:	li	_arg_29_, 0
	bne	x11, x12, l.false_38_
# was:	bne	_eq_L_30_, _eq_R_31_, l.false_38_
	li	x10, 1
# was:	li	_arg_29_, 1
l.false_38_:
# 	mv	x10,_arg_29_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
	mv	x20, x10
# was:	mv	_let_x2_28_, x10
	li	x11, 0
# was:	li	_minus_L_45_, 0
	li	x10, 3
# was:	li	_minus_R_46_, 3
	sub	x10, x11, x10
# was:	sub	_div1_L_43_, _minus_L_45_, _minus_R_46_
	li	x11, 0
# was:	li	_minus_L_47_, 0
	li	x12, 2
# was:	li	_minus_R_48_, 2
	sub	x11, x11, x12
# was:	sub	_div2_R_44_, _minus_L_47_, _minus_R_48_
	div	x12, x10, x11
# was:	div	_eq_L_41_, _div1_L_43_, _div2_R_44_
	li	x10, 1
# was:	li	_eq_R_42_, 1
	li	x11, 0
# was:	li	_arg_40_, 0
	bne	x12, x10, l.false_49_
# was:	bne	_eq_L_41_, _eq_R_42_, l.false_49_
	li	x11, 1
# was:	li	_arg_40_, 1
l.false_49_:
	mv	x10, x11
# was:	mv	x10, _arg_40_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_let_x3_39_,x10
# 	mv	_and_L_55_,_let_x0_10_
# 	mv	_xori_57_,_let_x1_17_
	xori	x11, x18, 1
# was:	xori	_and_R_56_, _xori_57_, 1
	and	x11, x19, x11
# was:	and	_and_L_53_, _and_L_55_, _and_R_56_
# 	mv	_xori_58_,_let_x2_28_
	xori	x12, x20, 1
# was:	xori	_and_R_54_, _xori_58_, 1
	and	x11, x11, x12
# was:	and	_and_L_51_, _and_L_53_, _and_R_54_
# 	mv	_and_R_52_,_let_x3_39_
	and	x10, x11, x10
# was:	and	_arg_50_, _and_L_51_, _and_R_52_
# 	mv	x10,_arg_50_
	jal	f.write_nl
# was:	jal	f.write_nl, x10
# 	mv	_mainres_9_,x10
# 	mv	x10,_mainres_9_
	addi	x2, x2, 16
	lw	x20, -16(x2)
	lw	x19, -12(x2)
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
s.X_8_:
	.word	1
	.asciz	"\n"
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