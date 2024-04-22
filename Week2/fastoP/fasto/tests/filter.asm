	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function write_int
f.write_int:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
	mv	x18, x10
# was:	mv	_tmp_3_, _param_x_1_
# 	mv	_write_intres_2_,_tmp_3_
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	jal	p.putint
# was:	jal	p.putint, x10
	mv	x10, x18
# was:	mv	x10, _write_intres_2_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function write_int_arr
f.write_int_arr:
	sw	x1, -4(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -24
# 	mv	_param_x_4_,x10
# 	mv	_arr_7_,_param_x_4_
	lw	x18, 0(x10)
# was:	lw	_size_6_, 0(_arr_7_)
	mv	x19, x3
# was:	mv	_write_int_arrres_5_, x3
	slli	x11, x18, 2
# was:	slli	_tmp_15_, _size_6_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_15_, _tmp_15_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_15_
	sw	x18, 0(x19)
# was:	sw	_size_6_, 0(_write_int_arrres_5_)
	addi	x20, x19, 4
# was:	addi	_addrg_10_, _write_int_arrres_5_, 4
	mv	x21, x0
# was:	mv	_i_11_, x0
	addi	x22, x10, 4
# was:	addi	_elem_8_, _arr_7_, 4
l.loop_beg_12_:
	bge	x21, x18, l.loop_end_13_
# was:	bge	_i_11_, _size_6_, l.loop_end_13_
	lw	x10, 0(x22)
# was:	lw	_res_9_, 0(_elem_8_)
	addi	x22, x22, 4
# was:	addi	_elem_8_, _elem_8_, 4
# 	mv	x10,_res_9_
	jal	f.write_int
# was:	jal	f.write_int, x10
# 	mv	_tmp_14_,x10
# 	mv	_res_9_,_tmp_14_
	sw	x10, 0(x20)
# was:	sw	_res_9_, 0(_addrg_10_)
	addi	x20, x20, 4
# was:	addi	_addrg_10_, _addrg_10_, 4
	addi	x21, x21, 1
# was:	addi	_i_11_, _i_11_, 1
	j	l.loop_beg_12_
l.loop_end_13_:
	mv	x10, x19
# was:	mv	x10, _write_int_arrres_5_
	addi	x2, x2, 24
	lw	x22, -24(x2)
	lw	x21, -20(x2)
	lw	x20, -16(x2)
	lw	x19, -12(x2)
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
# Function isMul16
f.isMul16:
	sw	x1, -4(x2)
	addi	x2, x2, -4
# 	mv	_param_a_16_,x10
# 	mv	_div1_L_22_,_param_a_16_
	li	x11, 16
# was:	li	_div2_R_23_, 16
	div	x12, x10, x11
# was:	div	_mult1_L_20_, _div1_L_22_, _div2_R_23_
	li	x11, 16
# was:	li	_mult2_R_21_, 16
	mul	x11, x12, x11
# was:	mul	_eq_L_18_, _mult1_L_20_, _mult2_R_21_
	mv	x12, x10
# was:	mv	_eq_R_19_, _param_a_16_
	li	x10, 0
# was:	li	_isMul16res_17_, 0
	bne	x11, x12, l.false_24_
# was:	bne	_eq_L_18_, _eq_R_19_, l.false_24_
	li	x10, 1
# was:	li	_isMul16res_17_, 1
l.false_24_:
# 	mv	x10,_isMul16res_17_
	addi	x2, x2, 4
	lw	x1, -4(x2)
	jr	x1
# Function main
f.main:
	sw	x1, -4(x2)
	sw	x24, -32(x2)
	sw	x23, -28(x2)
	sw	x22, -24(x2)
	sw	x21, -20(x2)
	sw	x20, -16(x2)
	sw	x19, -12(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -32
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_let_n_26_,x10
# 	mv	_size_38_,_let_n_26_
	bge	x10, x0, l.safe_39_
# was:	bge	_size_38_, x0, l.safe_39_
	li	x10, 10
# was:	li	x10, 10
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_39_:
	mv	x14, x3
# was:	mv	_arr_reg_28_, x3
	slli	x11, x10, 2
# was:	slli	_tmp_44_, _size_38_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_44_, _tmp_44_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_44_
	sw	x10, 0(x14)
# was:	sw	_size_38_, 0(_arr_reg_28_)
	addi	x12, x14, 4
# was:	addi	_addr_40_, _arr_reg_28_, 4
	mv	x11, x0
# was:	mv	_i_41_, x0
l.loop_beg_42_:
	bge	x11, x10, l.loop_end_43_
# was:	bge	_i_41_, _size_38_, l.loop_end_43_
	sw	x11, 0(x12)
# was:	sw	_i_41_, 0(_addr_40_)
	addi	x12, x12, 4
# was:	addi	_addr_40_, _addr_40_, 4
	addi	x11, x11, 1
# was:	addi	_i_41_, _i_41_, 1
	j	l.loop_beg_42_
l.loop_end_43_:
	lw	x13, 0(x14)
# was:	lw	_size_reg_36_, 0(_arr_reg_28_)
	mv	x12, x3
# was:	mv	_let_x_27_, x3
	slli	x10, x13, 2
# was:	slli	_tmp_37_, _size_reg_36_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_37_, _tmp_37_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_37_
	sw	x13, 0(x12)
# was:	sw	_size_reg_36_, 0(_let_x_27_)
	addi	x10, x12, 4
# was:	addi	_acc_reg_33_, _let_x_27_, 4
	mv	x11, x0
# was:	mv	_i_reg_34_, x0
	addi	x16, x14, 4
# was:	addi	_temp_reg_29_, _arr_reg_28_, 4
	mv	x14, x0
# was:	mv	_j_reg_35_, x0
l.loop_beg_45_:
	bge	x11, x13, l.loop_end_46_
# was:	bge	_i_reg_34_, _size_reg_36_, l.loop_end_46_
	lw	x15, 0(x16)
# was:	lw	_res_reg_32_, 0(_temp_reg_29_)
	lw	x17, 0(x16)
# was:	lw	_temp_reg_30_, 0(_temp_reg_29_)
	addi	x16, x16, 4
# was:	addi	_temp_reg_29_, _temp_reg_29_, 4
# 	mv	_eq_L_49_,_temp_reg_30_
	mv	x19, x17
# was:	mv	_div1_L_53_, _temp_reg_30_
	li	x18, 2
# was:	li	_div2_R_54_, 2
	div	x18, x19, x18
# was:	div	_mult1_L_51_, _div1_L_53_, _div2_R_54_
	li	x19, 2
# was:	li	_mult2_R_52_, 2
	mul	x19, x18, x19
# was:	mul	_eq_R_50_, _mult1_L_51_, _mult2_R_52_
	li	x18, 0
# was:	li	_fun_arg_res_48_, 0
	bne	x17, x19, l.false_55_
# was:	bne	_eq_L_49_, _eq_R_50_, l.false_55_
	li	x18, 1
# was:	li	_fun_arg_res_48_, 1
l.false_55_:
# 	mv	_res_reg_31_,_fun_arg_res_48_
	beq	x18, x0, l.filter_false_47_
# was:	beq	_res_reg_31_, x0, l.filter_false_47_
	sw	x15, 0(x10)
# was:	sw	_res_reg_32_, 0(_acc_reg_33_)
	addi	x14, x14, 1
# was:	addi	_j_reg_35_, _j_reg_35_, 1
	addi	x10, x10, 4
# was:	addi	_acc_reg_33_, _acc_reg_33_, 4
l.filter_false_47_:
	addi	x11, x11, 1
# was:	addi	_i_reg_34_, _i_reg_34_, 1
	j	l.loop_beg_45_
l.loop_end_46_:
	sw	x14, 0(x12)
# was:	sw	_j_reg_35_, 0(_let_x_27_)
	mv	x14, x12
# was:	mv	_arr_58_, _let_x_27_
	lw	x10, 0(x14)
# was:	lw	_size_57_, 0(_arr_58_)
	mv	x11, x3
# was:	mv	_let_y_56_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_68_, _size_57_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_68_, _tmp_68_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_68_
	sw	x10, 0(x11)
# was:	sw	_size_57_, 0(_let_y_56_)
	addi	x12, x11, 4
# was:	addi	_addrg_61_, _let_y_56_, 4
	mv	x13, x0
# was:	mv	_i_62_, x0
	addi	x14, x14, 4
# was:	addi	_elem_59_, _arr_58_, 4
l.loop_beg_63_:
	bge	x13, x10, l.loop_end_64_
# was:	bge	_i_62_, _size_57_, l.loop_end_64_
	lw	x15, 0(x14)
# was:	lw	_res_60_, 0(_elem_59_)
	addi	x14, x14, 4
# was:	addi	_elem_59_, _elem_59_, 4
# 	mv	_mult1_L_66_,_res_60_
	mv	x16, x15
# was:	mv	_mult2_R_67_, _res_60_
	mul	x15, x15, x16
# was:	mul	_fun_arg_res_65_, _mult1_L_66_, _mult2_R_67_
# 	mv	_res_60_,_fun_arg_res_65_
	sw	x15, 0(x12)
# was:	sw	_res_60_, 0(_addrg_61_)
	addi	x12, x12, 4
# was:	addi	_addrg_61_, _addrg_61_, 4
	addi	x13, x13, 1
# was:	addi	_i_62_, _i_62_, 1
	j	l.loop_beg_63_
l.loop_end_64_:
# 	mv	_arr_reg_70_,_let_y_56_
	lw	x18, 0(x11)
# was:	lw	_size_reg_78_, 0(_arr_reg_70_)
	mv	x19, x3
# was:	mv	_let_z_69_, x3
	slli	x10, x18, 2
# was:	slli	_tmp_79_, _size_reg_78_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_79_, _tmp_79_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_79_
	sw	x18, 0(x19)
# was:	sw	_size_reg_78_, 0(_let_z_69_)
	addi	x22, x19, 4
# was:	addi	_acc_reg_75_, _let_z_69_, 4
	mv	x23, x0
# was:	mv	_i_reg_76_, x0
	addi	x21, x11, 4
# was:	addi	_temp_reg_71_, _arr_reg_70_, 4
	mv	x20, x0
# was:	mv	_j_reg_77_, x0
l.loop_beg_80_:
	bge	x23, x18, l.loop_end_81_
# was:	bge	_i_reg_76_, _size_reg_78_, l.loop_end_81_
	lw	x24, 0(x21)
# was:	lw	_res_reg_74_, 0(_temp_reg_71_)
	lw	x10, 0(x21)
# was:	lw	_temp_reg_72_, 0(_temp_reg_71_)
	addi	x21, x21, 4
# was:	addi	_temp_reg_71_, _temp_reg_71_, 4
# 	mv	x10,_temp_reg_72_
	jal	f.isMul16
# was:	jal	f.isMul16, x10
# 	mv	_tmp_83_,x10
# 	mv	_res_reg_73_,_tmp_83_
	beq	x10, x0, l.filter_false_82_
# was:	beq	_res_reg_73_, x0, l.filter_false_82_
	sw	x24, 0(x22)
# was:	sw	_res_reg_74_, 0(_acc_reg_75_)
	addi	x20, x20, 1
# was:	addi	_j_reg_77_, _j_reg_77_, 1
	addi	x22, x22, 4
# was:	addi	_acc_reg_75_, _acc_reg_75_, 4
l.filter_false_82_:
	addi	x23, x23, 1
# was:	addi	_i_reg_76_, _i_reg_76_, 1
	j	l.loop_beg_80_
l.loop_end_81_:
	sw	x20, 0(x19)
# was:	sw	_j_reg_77_, 0(_let_z_69_)
	mv	x10, x19
# was:	mv	_arg_84_, _let_z_69_
# 	mv	x10,_arg_84_
	jal	f.write_int_arr
# was:	jal	f.write_int_arr, x10
# 	mv	_mainres_25_,x10
# 	mv	x10,_mainres_25_
	addi	x2, x2, 32
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