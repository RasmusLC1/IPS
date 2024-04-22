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
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
	mv	x12, x10
# was:	mv	_size_14_, _let_n_2_
	bge	x12, x0, l.safe_15_
# was:	bge	_size_14_, x0, l.safe_15_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_15_:
	mv	x10, x3
# was:	mv	_arr_reg_4_, x3
	slli	x11, x12, 2
# was:	slli	_tmp_20_, _size_14_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_20_, _tmp_20_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_20_
	sw	x12, 0(x10)
# was:	sw	_size_14_, 0(_arr_reg_4_)
	addi	x13, x10, 4
# was:	addi	_addr_16_, _arr_reg_4_, 4
	mv	x11, x0
# was:	mv	_i_17_, x0
l.loop_beg_18_:
	bge	x11, x12, l.loop_end_19_
# was:	bge	_i_17_, _size_14_, l.loop_end_19_
	sw	x11, 0(x13)
# was:	sw	_i_17_, 0(_addr_16_)
	addi	x13, x13, 4
# was:	addi	_addr_16_, _addr_16_, 4
	addi	x11, x11, 1
# was:	addi	_i_17_, _i_17_, 1
	j	l.loop_beg_18_
l.loop_end_19_:
	lw	x14, 0(x10)
# was:	lw	_size_reg_12_, 0(_arr_reg_4_)
	mv	x13, x3
# was:	mv	_let_x_3_, x3
	slli	x11, x14, 2
# was:	slli	_tmp_13_, _size_reg_12_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_13_, _tmp_13_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_13_
	sw	x14, 0(x13)
# was:	sw	_size_reg_12_, 0(_let_x_3_)
	addi	x16, x13, 4
# was:	addi	_acc_reg_9_, _let_x_3_, 4
	mv	x15, x0
# was:	mv	_i_reg_10_, x0
	addi	x18, x10, 4
# was:	addi	_temp_reg_5_, _arr_reg_4_, 4
	mv	x17, x0
# was:	mv	_j_reg_11_, x0
l.loop_beg_21_:
	bge	x15, x14, l.loop_end_22_
# was:	bge	_i_reg_10_, _size_reg_12_, l.loop_end_22_
	lw	x12, 0(x18)
# was:	lw	_res_reg_8_, 0(_temp_reg_5_)
	lw	x11, 0(x18)
# was:	lw	_temp_reg_6_, 0(_temp_reg_5_)
	addi	x18, x18, 4
# was:	addi	_temp_reg_5_, _temp_reg_5_, 4
# 	mv	_eq_L_25_,_temp_reg_6_
	mv	x20, x11
# was:	mv	_div1_L_29_, _temp_reg_6_
	li	x10, 0
# was:	li	_mult1_L_27_, 0
	beq	x20, x10, l.divzero_31_
# was:	beq	_div1_L_29_, _mult1_L_27_, l.divzero_31_
	li	x19, 2
# was:	li	_div2_R_30_, 2
	beq	x19, x10, l.divzero_31_
# was:	beq	_div2_R_30_, _mult1_L_27_, l.divzero_31_
	div	x10, x20, x19
# was:	div	_mult1_L_27_, _div1_L_29_, _div2_R_30_
l.divzero_31_:
	li	x19, 2
# was:	li	_mult2_R_28_, 2
	mul	x19, x10, x19
# was:	mul	_eq_R_26_, _mult1_L_27_, _mult2_R_28_
	li	x10, 0
# was:	li	_fun_arg_res_24_, 0
	bne	x11, x19, l.false_32_
# was:	bne	_eq_L_25_, _eq_R_26_, l.false_32_
	li	x10, 1
# was:	li	_fun_arg_res_24_, 1
l.false_32_:
# 	mv	_res_reg_7_,_fun_arg_res_24_
	beq	x10, x0, l.filter_false_23_
# was:	beq	_res_reg_7_, x0, l.filter_false_23_
	sw	x12, 0(x16)
# was:	sw	_res_reg_8_, 0(_acc_reg_9_)
	addi	x17, x17, 1
# was:	addi	_j_reg_11_, _j_reg_11_, 1
	addi	x16, x16, 4
# was:	addi	_acc_reg_9_, _acc_reg_9_, 4
l.filter_false_23_:
	addi	x15, x15, 1
# was:	addi	_i_reg_10_, _i_reg_10_, 1
	j	l.loop_beg_21_
l.loop_end_22_:
	sw	x17, 0(x13)
# was:	sw	_j_reg_11_, 0(_let_x_3_)
	mv	x14, x13
# was:	mv	_arr_35_, _let_x_3_
	lw	x12, 0(x14)
# was:	lw	_size_34_, 0(_arr_35_)
	mv	x13, x3
# was:	mv	_let_y_33_, x3
	slli	x10, x12, 2
# was:	slli	_tmp_45_, _size_34_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_45_, _tmp_45_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_45_
	sw	x12, 0(x13)
# was:	sw	_size_34_, 0(_let_y_33_)
	addi	x10, x13, 4
# was:	addi	_addrg_38_, _let_y_33_, 4
	mv	x11, x0
# was:	mv	_i_39_, x0
	addi	x14, x14, 4
# was:	addi	_elem_36_, _arr_35_, 4
l.loop_beg_40_:
	bge	x11, x12, l.loop_end_41_
# was:	bge	_i_39_, _size_34_, l.loop_end_41_
	lw	x15, 0(x14)
# was:	lw	_res_37_, 0(_elem_36_)
	addi	x14, x14, 4
# was:	addi	_elem_36_, _elem_36_, 4
# 	mv	_mult1_L_43_,_res_37_
	mv	x16, x15
# was:	mv	_mult2_R_44_, _res_37_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_42_, _mult1_L_43_, _mult2_R_44_
# 	mv	_res_37_,_fun_arg_res_42_
	sw	x15, 0(x10)
# was:	sw	_res_37_, 0(_addrg_38_)
	addi	x10, x10, 4
# was:	addi	_addrg_38_, _addrg_38_, 4
	addi	x11, x11, 1
# was:	addi	_i_39_, _i_39_, 1
	j	l.loop_beg_40_
l.loop_end_41_:
	mv	x10, x13
# was:	mv	_arr_reg_47_, _let_y_33_
	lw	x14, 0(x10)
# was:	lw	_size_reg_55_, 0(_arr_reg_47_)
	mv	x13, x3
# was:	mv	_let_z_46_, x3
	slli	x11, x14, 2
# was:	slli	_tmp_56_, _size_reg_55_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_56_, _tmp_56_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_56_
	sw	x14, 0(x13)
# was:	sw	_size_reg_55_, 0(_let_z_46_)
	addi	x11, x13, 4
# was:	addi	_acc_reg_52_, _let_z_46_, 4
	mv	x12, x0
# was:	mv	_i_reg_53_, x0
	addi	x17, x10, 4
# was:	addi	_temp_reg_48_, _arr_reg_47_, 4
	mv	x16, x0
# was:	mv	_j_reg_54_, x0
l.loop_beg_57_:
	bge	x12, x14, l.loop_end_58_
# was:	bge	_i_reg_53_, _size_reg_55_, l.loop_end_58_
	lw	x15, 0(x17)
# was:	lw	_res_reg_51_, 0(_temp_reg_48_)
	lw	x10, 0(x17)
# was:	lw	_temp_reg_49_, 0(_temp_reg_48_)
	addi	x17, x17, 4
# was:	addi	_temp_reg_48_, _temp_reg_48_, 4
# 	mv	_div1_L_65_,_temp_reg_49_
	li	x19, 0
# was:	li	_mult1_L_63_, 0
	beq	x10, x19, l.divzero_67_
# was:	beq	_div1_L_65_, _mult1_L_63_, l.divzero_67_
	li	x18, 16
# was:	li	_div2_R_66_, 16
	beq	x18, x19, l.divzero_67_
# was:	beq	_div2_R_66_, _mult1_L_63_, l.divzero_67_
	div	x19, x10, x18
# was:	div	_mult1_L_63_, _div1_L_65_, _div2_R_66_
l.divzero_67_:
	li	x18, 16
# was:	li	_mult2_R_64_, 16
	mul	x18, x19, x18
# was:	mul	_eq_L_61_, _mult1_L_63_, _mult2_R_64_
	mv	x19, x10
# was:	mv	_eq_R_62_, _temp_reg_49_
	li	x10, 0
# was:	li	_fun_arg_res_60_, 0
	bne	x18, x19, l.false_68_
# was:	bne	_eq_L_61_, _eq_R_62_, l.false_68_
	li	x10, 1
# was:	li	_fun_arg_res_60_, 1
l.false_68_:
# 	mv	_res_reg_50_,_fun_arg_res_60_
	beq	x10, x0, l.filter_false_59_
# was:	beq	_res_reg_50_, x0, l.filter_false_59_
	sw	x15, 0(x11)
# was:	sw	_res_reg_51_, 0(_acc_reg_52_)
	addi	x16, x16, 1
# was:	addi	_j_reg_54_, _j_reg_54_, 1
	addi	x11, x11, 4
# was:	addi	_acc_reg_52_, _acc_reg_52_, 4
l.filter_false_59_:
	addi	x12, x12, 1
# was:	addi	_i_reg_53_, _i_reg_53_, 1
	j	l.loop_beg_57_
l.loop_end_58_:
	sw	x16, 0(x13)
# was:	sw	_j_reg_54_, 0(_let_z_46_)
# 	mv	_arr_70_,_let_z_46_
	lw	x18, 0(x13)
# was:	lw	_size_69_, 0(_arr_70_)
	mv	x19, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_79_, _size_69_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_79_, _tmp_79_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_79_
	sw	x18, 0(x19)
# was:	sw	_size_69_, 0(_mainres_1_)
	addi	x20, x19, 4
# was:	addi	_addrg_73_, _mainres_1_, 4
	mv	x21, x0
# was:	mv	_i_74_, x0
	addi	x22, x13, 4
# was:	addi	_elem_71_, _arr_70_, 4
l.loop_beg_75_:
	bge	x21, x18, l.loop_end_76_
# was:	bge	_i_74_, _size_69_, l.loop_end_76_
	lw	x23, 0(x22)
# was:	lw	_res_72_, 0(_elem_71_)
	addi	x22, x22, 4
# was:	addi	_elem_71_, _elem_71_, 4
# 	mv	_tmp_78_,_res_72_
# 	mv	_fun_arg_res_77_,_tmp_78_
	mv	x10, x23
# was:	mv	x10, _fun_arg_res_77_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_72_,_fun_arg_res_77_
	sw	x23, 0(x20)
# was:	sw	_res_72_, 0(_addrg_73_)
	addi	x20, x20, 4
# was:	addi	_addrg_73_, _addrg_73_, 4
	addi	x21, x21, 1
# was:	addi	_i_74_, _i_74_, 1
	j	l.loop_beg_75_
l.loop_end_76_:
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