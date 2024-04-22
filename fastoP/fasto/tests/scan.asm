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
	li	x12, 3
# was:	li	_size_3_, 3
	mv	x10, x3
# was:	mv	_let_a_2_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_6_, _size_3_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_6_, _tmp_6_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_6_
	sw	x12, 0(x10)
# was:	sw	_size_3_, 0(_let_a_2_)
	addi	x12, x10, 4
# was:	addi	_addr_4_, _let_a_2_, 4
	li	x11, 1
# was:	li	_tmp_5_, 1
	sw	x11, 0(x12)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x12, x12, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x11, 2
# was:	li	_tmp_5_, 2
	sw	x11, 0(x12)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x12, x12, 4
# was:	addi	_addr_4_, _addr_4_, 4
	li	x11, 3
# was:	li	_tmp_5_, 3
	sw	x11, 0(x12)
# was:	sw	_tmp_5_, 0(_addr_4_)
	addi	x12, x12, 4
# was:	addi	_addr_4_, _addr_4_, 4
# 	mv	_arr_reg_8_,_let_a_2_
	lw	x12, 0(x10)
# was:	lw	_size_reg_13_, 0(_arr_reg_8_)
	mv	x11, x3
# was:	mv	_let_b_7_, x3
	slli	x13, x12, 2
# was:	slli	_tmp_16_, _size_reg_13_, 2
	addi	x13, x13, 4
# was:	addi	_tmp_16_, _tmp_16_, 4
	add	x3, x3, x13
# was:	add	x3, x3, _tmp_16_
	sw	x12, 0(x11)
# was:	sw	_size_reg_13_, 0(_let_b_7_)
	addi	x14, x11, 4
# was:	addi	_res_reg_10_, _let_b_7_, 4
	addi	x10, x10, 4
# was:	addi	_arr_reg_8_, _arr_reg_8_, 4
	mv	x13, x0
# was:	mv	_i_reg_12_, x0
l.loop_beg_14_:
	sub	x15, x13, x12
# was:	sub	_temp_reg_9_, _i_reg_12_, _size_reg_13_
	addi	x13, x13, 1
# was:	addi	_i_reg_12_, _i_reg_12_, 1
	bge	x15, x0, l.loop_end_15_
# was:	bge	_temp_reg_9_, x0, l.loop_end_15_
	lw	x15, 0(x10)
# was:	lw	_temp_reg_9_, 0(_arr_reg_8_)
	addi	x10, x10, 4
# was:	addi	_arr_reg_8_, _arr_reg_8_, 4
# 	mv	_plus_L_18_,_acc_reg_11_
# 	mv	_plus_R_19_,_temp_reg_9_
	add	x16, x16, x15
# was:	add	_fun_arg_res_17_, _plus_L_18_, _plus_R_19_
# 	mv	_acc_reg_11_,_fun_arg_res_17_
	sw	x16, 0(x14)
# was:	sw	_acc_reg_11_, 0(_res_reg_10_)
	addi	x14, x14, 4
# was:	addi	_res_reg_10_, _res_reg_10_, 4
	j	l.loop_beg_14_
l.loop_end_15_:
# 	mv	_arr_21_,_let_b_7_
	lw	x18, 0(x11)
# was:	lw	_size_20_, 0(_arr_21_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_30_, _size_20_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_30_, _tmp_30_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_30_
	sw	x18, 0(x19)
# was:	sw	_size_20_, 0(_mainres_1_)
	addi	x20, x19, 4
# was:	addi	_addrg_24_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_25_, x0
	addi	x22, x11, 4
# was:	addi	_elem_22_, _arr_21_, 4
l.loop_beg_26_:
	bge	x21, x18, l.loop_end_27_
# was:	bge	_i_25_, _size_20_, l.loop_end_27_
	lw	x23, 0(x22)
# was:	lw	_res_23_, 0(_elem_22_)
	addi	x22, x22, 4
# was:	addi	_elem_22_, _elem_22_, 4
# 	mv	_tmp_29_,_res_23_
# 	mv	_fun_arg_res_28_,_tmp_29_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_28_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_23_,_fun_arg_res_28_
	sw	x23, 0(x20)
# was:	sw	_res_23_, 0(_addrg_24_)
	addi	x20, x20, 4
# was:	addi	_addrg_24_, _addrg_24_, 4
	addi	x21, x21, 1
# was:	addi	_i_25_, _i_25_, 1
	j	l.loop_beg_26_
l.loop_end_27_:
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