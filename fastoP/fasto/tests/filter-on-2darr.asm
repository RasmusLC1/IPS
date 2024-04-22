	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x28, -48(x2)
	sw	x27, -44(x2)
	sw	x26, -40(x2)
	sw	x25, -36(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -48
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_2_,x10
# 	mv	_size_8_,_let_n_2_
	bge	x10, x0, l.safe_9_
# was:	bge	_size_8_, x0, l.safe_9_
	li	x10, 11
# was:	li	x10, 11
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_9_:
	mv	x14, x3
# was:	mv	_arr_5_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_14_, _size_8_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_14_, _tmp_14_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_14_
	sw	x10, 0(x14)
# was:	sw	_size_8_, 0(_arr_5_)
	addi	x12, x14, 4
# was:	addi	_addr_10_, _arr_5_, 4
	mv	x11, x0
# was:	mv	_i_11_, x0
l.loop_beg_12_:
	bge	x11, x10, l.loop_end_13_
# was:	bge	_i_11_, _size_8_, l.loop_end_13_
	sw	x11, 0(x12)
# was:	sw	_i_11_, 0(_addr_10_)
	addi	x12, x12, 4
# was:	addi	_addr_10_, _addr_10_, 4
	addi	x11, x11, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	lw	x10, 0(x14)
# was:	lw	_size_4_, 0(_arr_5_)
	mv	x13, x3
# was:	mv	_let_a2d_3_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_29_, _size_4_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_29_, _tmp_29_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_29_
	sw	x10, 0(x13)
# was:	sw	_size_4_, 0(_let_a2d_3_)
	addi	x12, x13, 4
# was:	addi	_addrg_15_, _let_a2d_3_, 4
	mv	x11, x0
# was:	mv	_i_16_, x0
	addi	x14, x14, 4
# was:	addi	_elem_6_, _arr_5_, 4
l.loop_beg_17_:
	bge	x11, x10, l.loop_end_18_
# was:	bge	_i_16_, _size_4_, l.loop_end_18_
	lw	x15, 0(x14)
# was:	lw	_res_7_, 0(_elem_6_)
	addi	x14, x14, 4
# was:	addi	_elem_6_, _elem_6_, 4
	mv	x16, x15
# was:	mv	_plus_L_21_, _res_7_
	li	x15, 2
# was:	li	_plus_R_22_, 2
	add	x16, x16, x15
# was:	add	_size_20_, _plus_L_21_, _plus_R_22_
	bge	x16, x0, l.safe_23_
# was:	bge	_size_20_, x0, l.safe_23_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_23_:
	mv	x15, x3
# was:	mv	_fun_arg_res_19_, x3
	slli	x17, x16, 2
# was:	slli	_tmp_28_, _size_20_, 2
	addi	x17, x17, 4
# was:	addi	_tmp_28_, _tmp_28_, 4
	add	x3, x3, x17
# was:	add	x3, x3, _tmp_28_
	sw	x16, 0(x15)
# was:	sw	_size_20_, 0(_fun_arg_res_19_)
	addi	x18, x15, 4
# was:	addi	_addr_24_, _fun_arg_res_19_, 4
	mv	x17, x0
# was:	mv	_i_25_, x0
l.loop_beg_26_:
	bge	x17, x16, l.loop_end_27_
# was:	bge	_i_25_, _size_20_, l.loop_end_27_
	sw	x17, 0(x18)
# was:	sw	_i_25_, 0(_addr_24_)
	addi	x18, x18, 4
# was:	addi	_addr_24_, _addr_24_, 4
	addi	x17, x17, 1
# was:	addi	_i_25_, _i_25_, 1
	j	l.loop_beg_26_
l.loop_end_27_:
# 	mv	_res_7_,_fun_arg_res_19_
	sw	x15, 0(x12)
# was:	sw	_res_7_, 0(_addrg_15_)
	addi	x12, x12, 4
# was:	addi	_addrg_15_, _addrg_15_, 4
	addi	x11, x11, 1
# was:	addi	_i_16_, _i_16_, 1
	j	l.loop_beg_17_
l.loop_end_18_:
	mv	x14, x13
# was:	mv	_arr_reg_31_, _let_a2d_3_
	lw	x13, 0(x14)
# was:	lw	_size_reg_39_, 0(_arr_reg_31_)
	mv	x12, x3
# was:	mv	_let_a2df_30_, x3
	slli	x10, x13, 2
# was:	slli	_tmp_40_, _size_reg_39_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_40_, _tmp_40_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_40_
	sw	x13, 0(x12)
# was:	sw	_size_reg_39_, 0(_let_a2df_30_)
	addi	x10, x12, 4
# was:	addi	_acc_reg_36_, _let_a2df_30_, 4
	mv	x11, x0
# was:	mv	_i_reg_37_, x0
	addi	x14, x14, 4
# was:	addi	_temp_reg_32_, _arr_reg_31_, 4
	mv	x15, x0
# was:	mv	_j_reg_38_, x0
l.loop_beg_41_:
	bge	x11, x13, l.loop_end_42_
# was:	bge	_i_reg_37_, _size_reg_39_, l.loop_end_42_
	lw	x16, 0(x14)
# was:	lw	_res_reg_35_, 0(_temp_reg_32_)
	lw	x18, 0(x14)
# was:	lw	_temp_reg_33_, 0(_temp_reg_32_)
	addi	x14, x14, 4
# was:	addi	_temp_reg_32_, _temp_reg_32_, 4
# 	mv	_arr_46_,_temp_reg_33_
	lw	x19, 0(x18)
# was:	lw	_size_47_, 0(_arr_46_)
	li	x21, 0
# was:	li	_let_r_45_, 0
	addi	x18, x18, 4
# was:	addi	_arr_46_, _arr_46_, 4
	mv	x17, x0
# was:	mv	_ind_var_48_, x0
l.loop_beg_50_:
	bge	x17, x19, l.loop_end_51_
# was:	bge	_ind_var_48_, _size_47_, l.loop_end_51_
	lw	x20, 0(x18)
# was:	lw	_tmp_49_, 0(_arr_46_)
	addi	x18, x18, 4
# was:	addi	_arr_46_, _arr_46_, 4
# 	mv	_plus_L_53_,_let_r_45_
# 	mv	_plus_R_54_,_tmp_49_
	add	x21, x21, x20
# was:	add	_fun_arg_res_52_, _plus_L_53_, _plus_R_54_
# 	mv	_let_r_45_,_fun_arg_res_52_
	addi	x17, x17, 1
# was:	addi	_ind_var_48_, _ind_var_48_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
# 	mv	_div1_L_59_,_let_r_45_
	li	x18, 0
# was:	li	_mult1_L_57_, 0
	beq	x21, x18, l.divzero_61_
# was:	beq	_div1_L_59_, _mult1_L_57_, l.divzero_61_
	li	x17, 2
# was:	li	_div2_R_60_, 2
	beq	x17, x18, l.divzero_61_
# was:	beq	_div2_R_60_, _mult1_L_57_, l.divzero_61_
	div	x18, x21, x17
# was:	div	_mult1_L_57_, _div1_L_59_, _div2_R_60_
l.divzero_61_:
	li	x17, 2
# was:	li	_mult2_R_58_, 2
	mul	x17, x18, x17
# was:	mul	_eq_L_55_, _mult1_L_57_, _mult2_R_58_
# 	mv	_eq_R_56_,_let_r_45_
	li	x18, 0
# was:	li	_fun_arg_res_44_, 0
	bne	x17, x21, l.false_62_
# was:	bne	_eq_L_55_, _eq_R_56_, l.false_62_
	li	x18, 1
# was:	li	_fun_arg_res_44_, 1
l.false_62_:
# 	mv	_res_reg_34_,_fun_arg_res_44_
	beq	x18, x0, l.filter_false_43_
# was:	beq	_res_reg_34_, x0, l.filter_false_43_
	sw	x16, 0(x10)
# was:	sw	_res_reg_35_, 0(_acc_reg_36_)
	addi	x15, x15, 1
# was:	addi	_j_reg_38_, _j_reg_38_, 1
	addi	x10, x10, 4
# was:	addi	_acc_reg_36_, _acc_reg_36_, 4
l.filter_false_43_:
	addi	x11, x11, 1
# was:	addi	_i_reg_37_, _i_reg_37_, 1
	j	l.loop_beg_41_
l.loop_end_42_:
	sw	x15, 0(x12)
# was:	sw	_j_reg_38_, 0(_let_a2df_30_)
# 	mv	_arr_64_,_let_a2df_30_
	lw	x20, 0(x12)
# was:	lw	_size_63_, 0(_arr_64_)
	mv	x21, x3
# was:	mv	_mainres_1_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_83_, _size_63_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_83_, _tmp_83_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_83_
	sw	x20, 0(x21)
# was:	sw	_size_63_, 0(_mainres_1_)
	addi	x22, x21, 4
# was:	addi	_addrg_67_, _mainres_1_, 4
	mv	x19, x0
# was:	mv	_i_68_, x0
	addi	x18, x12, 4
# was:	addi	_elem_65_, _arr_64_, 4
l.loop_beg_69_:
	bge	x19, x20, l.loop_end_70_
# was:	bge	_i_68_, _size_63_, l.loop_end_70_
	lw	x10, 0(x18)
# was:	lw	_res_66_, 0(_elem_65_)
	addi	x18, x18, 4
# was:	addi	_elem_65_, _elem_65_, 4
# 	mv	_arr_73_,_res_66_
	lw	x23, 0(x10)
# was:	lw	_size_72_, 0(_arr_73_)
	mv	x24, x3
# was:	mv	_fun_arg_res_71_, x3
	slli	x11, x23, 2
# was:	slli	_tmp_82_, _size_72_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_82_, _tmp_82_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_82_
	sw	x23, 0(x24)
# was:	sw	_size_72_, 0(_fun_arg_res_71_)
	addi	x25, x24, 4
# was:	addi	_addrg_76_, _fun_arg_res_71_, 4
	mv	x26, x0
# was:	mv	_i_77_, x0
	addi	x27, x10, 4
# was:	addi	_elem_74_, _arr_73_, 4
l.loop_beg_78_:
	bge	x26, x23, l.loop_end_79_
# was:	bge	_i_77_, _size_72_, l.loop_end_79_
	lw	x28, 0(x27)
# was:	lw	_res_75_, 0(_elem_74_)
	addi	x27, x27, 4
# was:	addi	_elem_74_, _elem_74_, 4
# 	mv	_tmp_81_,_res_75_
# 	mv	_fun_arg_res_80_,_tmp_81_
	mv	x10, x28
# was:	mv	x10, _fun_arg_res_80_
	jal	p.putint
# was:	jal	p.putint, x10
# 	mv	_res_75_,_fun_arg_res_80_
	sw	x28, 0(x25)
# was:	sw	_res_75_, 0(_addrg_76_)
	addi	x25, x25, 4
# was:	addi	_addrg_76_, _addrg_76_, 4
	addi	x26, x26, 1
# was:	addi	_i_77_, _i_77_, 1
	j	l.loop_beg_78_
l.loop_end_79_:
	mv	x10, x24
# was:	mv	_res_66_, _fun_arg_res_71_
	sw	x10, 0(x22)
# was:	sw	_res_66_, 0(_addrg_67_)
	addi	x22, x22, 4
# was:	addi	_addrg_67_, _addrg_67_, 4
	addi	x19, x19, 1
# was:	addi	_i_68_, _i_68_, 1
	j	l.loop_beg_69_
l.loop_end_70_:
	mv	x10, x21
# was:	mv	x10, _mainres_1_
	addi	x2, x2, 48
	lw	x28, -48(x2)
	lw	x27, -44(x2)
	lw	x26, -40(x2)
	lw	x25, -36(x2)
	lw	x24, -32(x2)
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