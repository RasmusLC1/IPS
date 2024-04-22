	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -28
	li	x12, 7
# was:	li	_n_reg_3_, 7
	li	x11, 0
# was:	li	_a_reg_5_, 0
	mv	x10, x3
# was:	mv	_let_fs_2_, x3
	addi	x13, x12, 3
# was:	addi	_tmp_7_, _n_reg_3_, 3
	andi	x13, x13, -4
# was:	andi	_tmp_7_, _tmp_7_, -4
	addi	x13, x13, 4
# was:	addi	_tmp_7_, _tmp_7_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_7_
	sw	x12, 0(x10)
# was:	sw	_n_reg_3_, 0(_let_fs_2_)
	mv	x14, x0
# was:	mv	_i_reg_4_, x0
	addi	x13, x10, 4
# was:	addi	_arr_6_, _let_fs_2_, 4
l.loop_beg_8_:
	beq	x14, x12, l.loop_end_9_
# was:	beq	_i_reg_4_, _n_reg_3_, l.loop_end_9_
	addi	x14, x14, 1
# was:	addi	_i_reg_4_, _i_reg_4_, 1
	sb	x11, 0(x13)
# was:	sb	_a_reg_5_, 0(_arr_6_)
	addi	x13, x13, 1
# was:	addi	_arr_6_, _arr_6_, 1
	j	l.loop_beg_8_
l.loop_end_9_:
# 	mv	_arr_11_,_let_fs_2_
	lw	x18, 0(x10)
# was:	lw	_size_10_, 0(_arr_11_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	addi	x11, x18, 3
# was:	addi	_tmp_21_, _size_10_, 3
	andi	x11, x11, -4
# was:	andi	_tmp_21_, _tmp_21_, -4
	addi	x11, x11, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_21_
	sw	x18, 0(x19)
# was:	sw	_size_10_, 0(_mainres_1_)
	addi	x20, x19, 4
# was:	addi	_addrg_14_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_15_, x0
	addi	x22, x10, 4
# was:	addi	_elem_12_, _arr_11_, 4
l.loop_beg_16_:
	bge	x21, x18, l.loop_end_17_
# was:	bge	_i_15_, _size_10_, l.loop_end_17_
	lbu	x23, 0(x22)
# was:	lbu	_res_13_, 0(_elem_12_)
	addi	x22, x22, 1
# was:	addi	_elem_12_, _elem_12_, 1
# 	mv	_tmp_19_,_res_13_
# 	mv	_fun_arg_res_18_,_tmp_19_
	la	x10, s.true
# was:	la	x10, s.true
	bne	x23, x0, l.wBoolF_20_
# was:	bne	_fun_arg_res_18_, x0, l.wBoolF_20_
	la	x10, s.false
# was:	la	x10, s.false
l.wBoolF_20_:
	jal	p.putstring
# was:	jal	p.putstring, x10
# 	mv	_res_13_,_fun_arg_res_18_
	sb	x23, 0(x20)
# was:	sb	_res_13_, 0(_addrg_14_)
	addi	x20, x20, 1
# was:	addi	_addrg_14_, _addrg_14_, 1
	addi	x21, x21, 1
# was:	addi	_i_15_, _i_15_, 1
	j	l.loop_beg_16_
l.loop_end_17_:
	mv	x10, x19
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 28
	lw	x23, -28(x2)
	lw	x22, -24(x2)
	lw	x21, -20(x2)
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