	.text	0x00400000
	la	x3, d.heap
	jal	f.main
l.stop:
	li	x17, 10
	ecall
# Function mul
f.mul:
	sw	x1, -4(x2)
	sw	x18, -8(x2)
	addi	x2, x2, -8
# 	mv	_param_x_1_,x10
# 	mv	_param_y_2_,x11
	li	x12, 0
# was:	li	_lt_L_8_, 0
# 	mv	_lt_R_9_,_param_y_2_
	slt	x12, x12, x11
# was:	slt	_cond_7_, _lt_L_8_, _lt_R_9_
	bne	x12, x0, l.then_4_
# was:	bne	_cond_7_, x0, l.then_4_
	j	l.else_5_
l.then_4_:
	mv	x18, x10
# was:	mv	_plus_L_10_, _param_x_1_
# 	mv	_arg_12_,_param_x_1_
	mv	x12, x11
# was:	mv	_minus_L_14_, _param_y_2_
	li	x11, 1
# was:	li	_minus_R_15_, 1
	sub	x11, x12, x11
# was:	sub	_arg_13_, _minus_L_14_, _minus_R_15_
# 	mv	x10,_arg_12_
# 	mv	x11,_arg_13_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_11_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_10_, _plus_R_11_
	j	l.endif_6_
l.else_5_:
# 	mv	_lt_L_20_,_param_y_2_
	li	x12, 0
# was:	li	_lt_R_21_, 0
	slt	x12, x11, x12
# was:	slt	_cond_19_, _lt_L_20_, _lt_R_21_
	bne	x12, x0, l.then_16_
# was:	bne	_cond_19_, x0, l.then_16_
	j	l.else_17_
l.then_16_:
	li	x12, 0
# was:	li	_minus_L_24_, 0
# 	mv	_minus_R_25_,_param_x_1_
	sub	x18, x12, x10
# was:	sub	_plus_L_22_, _minus_L_24_, _minus_R_25_
# 	mv	_arg_26_,_param_x_1_
# 	mv	_plus_L_28_,_param_y_2_
	li	x12, 1
# was:	li	_plus_R_29_, 1
	add	x11, x11, x12
# was:	add	_arg_27_, _plus_L_28_, _plus_R_29_
# 	mv	x10,_arg_26_
# 	mv	x11,_arg_27_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_plus_R_23_,x10
	add	x10, x18, x10
# was:	add	_mulres_3_, _plus_L_22_, _plus_R_23_
	j	l.endif_18_
l.else_17_:
	li	x10, 0
# was:	li	_mulres_3_, 0
l.endif_18_:
l.endif_6_:
# 	mv	x10,_mulres_3_
	addi	x2, x2, 8
	lw	x18, -8(x2)
	lw	x1, -4(x2)
	jr	x1
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
	mv	x11, x10
# was:	mv	_let_n_31_, x10
# 	mv	_lt_L_36_,_let_n_31_
	li	x10, 1
# was:	li	_lt_R_37_, 1
	slt	x10, x11, x10
# was:	slt	_cond_35_, _lt_L_36_, _lt_R_37_
	bne	x10, x0, l.then_32_
# was:	bne	_cond_35_, x0, l.then_32_
	j	l.else_33_
l.then_32_:
	la	x10, s.Incorre_40_
# was:	la	_tmp_39_, s.Incorre_40_
# s.Incorre_40_: string "Incorrect Input!"
# 	mv	_let_error_38_,_tmp_39_
# 	mv	x10,_tmp_39_
	jal	p.putstring
# was:	jal	p.putstring, x10
	li	x18, 0
# was:	li	_mainres_30_, 0
	j	l.endif_34_
l.else_33_:
# 	mv	_size_42_,_let_n_31_
	bge	x11, x0, l.safe_43_
# was:	bge	_size_42_, x0, l.safe_43_
	li	x10, 17
# was:	li	x10, 17
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_43_:
	mv	x23, x3
# was:	mv	_let_arr_41_, x3
	slli	x10, x11, 2
# was:	slli	_tmp_48_, _size_42_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_48_, _tmp_48_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_48_
	sw	x11, 0(x23)
# was:	sw	_size_42_, 0(_let_arr_41_)
	addi	x10, x23, 4
# was:	addi	_addr_44_, _let_arr_41_, 4
	mv	x12, x0
# was:	mv	_i_45_, x0
l.loop_beg_46_:
	bge	x12, x11, l.loop_end_47_
# was:	bge	_i_45_, _size_42_, l.loop_end_47_
	sw	x12, 0(x10)
# was:	sw	_i_45_, 0(_addr_44_)
	addi	x10, x10, 4
# was:	addi	_addr_44_, _addr_44_, 4
	addi	x12, x12, 1
# was:	addi	_i_45_, _i_45_, 1
	j	l.loop_beg_46_
l.loop_end_47_:
# 	mv	_arr_51_,_let_arr_41_
	lw	x20, 0(x23)
# was:	lw	_size_50_, 0(_arr_51_)
	mv	x18, x3
# was:	mv	_let_arrRead_49_, x3
	slli	x10, x20, 2
# was:	slli	_tmp_59_, _size_50_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_59_, _tmp_59_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_59_
	sw	x20, 0(x18)
# was:	sw	_size_50_, 0(_let_arrRead_49_)
	addi	x21, x18, 4
# was:	addi	_addrg_54_, _let_arrRead_49_, 4
	mv	x19, x0
# was:	mv	_i_55_, x0
	addi	x22, x23, 4
# was:	addi	_elem_52_, _arr_51_, 4
l.loop_beg_56_:
	bge	x19, x20, l.loop_end_57_
# was:	bge	_i_55_, _size_50_, l.loop_end_57_
	lw	x10, 0(x22)
# was:	lw	_res_53_, 0(_elem_52_)
	addi	x22, x22, 4
# was:	addi	_elem_52_, _elem_52_, 4
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_fun_arg_res_58_,x10
# 	mv	_res_53_,_fun_arg_res_58_
	sw	x10, 0(x21)
# was:	sw	_res_53_, 0(_addrg_54_)
	addi	x21, x21, 4
# was:	addi	_addrg_54_, _addrg_54_, 4
	addi	x19, x19, 1
# was:	addi	_i_55_, _i_55_, 1
	j	l.loop_beg_56_
l.loop_end_57_:
# 	mv	_arr_62_,_let_arr_41_
	lw	x10, 0(x23)
# was:	lw	_size_61_, 0(_arr_62_)
	mv	x11, x3
# was:	mv	_let_difs_60_, x3
	slli	x12, x10, 2
# was:	slli	_tmp_96_, _size_61_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_96_, _tmp_96_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_96_
	sw	x10, 0(x11)
# was:	sw	_size_61_, 0(_let_difs_60_)
	addi	x12, x11, 4
# was:	addi	_addrg_65_, _let_difs_60_, 4
	mv	x13, x0
# was:	mv	_i_66_, x0
	addi	x14, x23, 4
# was:	addi	_elem_63_, _arr_62_, 4
l.loop_beg_67_:
	bge	x13, x10, l.loop_end_68_
# was:	bge	_i_66_, _size_61_, l.loop_end_68_
	lw	x16, 0(x14)
# was:	lw	_res_64_, 0(_elem_63_)
	addi	x14, x14, 4
# was:	addi	_elem_63_, _elem_63_, 4
# 	mv	_eq_L_74_,_res_64_
	li	x15, 0
# was:	li	_eq_R_75_, 0
	li	x17, 0
# was:	li	_cond_73_, 0
	bne	x16, x15, l.false_76_
# was:	bne	_eq_L_74_, _eq_R_75_, l.false_76_
	li	x17, 1
# was:	li	_cond_73_, 1
l.false_76_:
	bne	x17, x0, l.then_70_
# was:	bne	_cond_73_, x0, l.then_70_
	j	l.else_71_
l.then_70_:
	li	x15, 0
# was:	li	_arr_ind_77_, 0
	addi	x17, x18, 4
# was:	addi	_arr_data_78_, _let_arrRead_49_, 4
	lw	x16, 0(x18)
# was:	lw	_size_79_, 0(_let_arrRead_49_)
	bge	x15, x0, l.nonneg_81_
# was:	bge	_arr_ind_77_, x0, l.nonneg_81_
l.error_80_:
	li	x10, 22
# was:	li	x10, 22
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_81_:
	bge	x15, x16, l.error_80_
# was:	bge	_arr_ind_77_, _size_79_, l.error_80_
	slli	x15, x15, 2
# was:	slli	_arr_ind_77_, _arr_ind_77_, 2
	add	x17, x17, x15
# was:	add	_arr_data_78_, _arr_data_78_, _arr_ind_77_
	lw	x16, 0(x17)
# was:	lw	_fun_arg_res_69_, 0(_arr_data_78_)
	j	l.endif_72_
l.else_71_:
	mv	x17, x16
# was:	mv	_arr_ind_84_, _res_64_
	addi	x19, x18, 4
# was:	addi	_arr_data_85_, _let_arrRead_49_, 4
	lw	x15, 0(x18)
# was:	lw	_size_86_, 0(_let_arrRead_49_)
	bge	x17, x0, l.nonneg_88_
# was:	bge	_arr_ind_84_, x0, l.nonneg_88_
l.error_87_:
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_88_:
	bge	x17, x15, l.error_87_
# was:	bge	_arr_ind_84_, _size_86_, l.error_87_
	slli	x17, x17, 2
# was:	slli	_arr_ind_84_, _arr_ind_84_, 2
	add	x19, x19, x17
# was:	add	_arr_data_85_, _arr_data_85_, _arr_ind_84_
	lw	x15, 0(x19)
# was:	lw	_minus_L_82_, 0(_arr_data_85_)
# 	mv	_minus_L_90_,_res_64_
	li	x17, 1
# was:	li	_minus_R_91_, 1
	sub	x17, x16, x17
# was:	sub	_arr_ind_89_, _minus_L_90_, _minus_R_91_
	addi	x19, x18, 4
# was:	addi	_arr_data_92_, _let_arrRead_49_, 4
	lw	x16, 0(x18)
# was:	lw	_size_93_, 0(_let_arrRead_49_)
	bge	x17, x0, l.nonneg_95_
# was:	bge	_arr_ind_89_, x0, l.nonneg_95_
l.error_94_:
	li	x10, 24
# was:	li	x10, 24
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_95_:
	bge	x17, x16, l.error_94_
# was:	bge	_arr_ind_89_, _size_93_, l.error_94_
	slli	x17, x17, 2
# was:	slli	_arr_ind_89_, _arr_ind_89_, 2
	add	x19, x19, x17
# was:	add	_arr_data_92_, _arr_data_92_, _arr_ind_89_
	lw	x16, 0(x19)
# was:	lw	_minus_R_83_, 0(_arr_data_92_)
	sub	x16, x15, x16
# was:	sub	_fun_arg_res_69_, _minus_L_82_, _minus_R_83_
l.endif_72_:
# 	mv	_res_64_,_fun_arg_res_69_
	sw	x16, 0(x12)
# was:	sw	_res_64_, 0(_addrg_65_)
	addi	x12, x12, 4
# was:	addi	_addrg_65_, _addrg_65_, 4
	addi	x13, x13, 1
# was:	addi	_i_66_, _i_66_, 1
	j	l.loop_beg_67_
l.loop_end_68_:
# 	mv	_arr_105_,_let_difs_60_
	lw	x19, 0(x11)
# was:	lw	_size_104_, 0(_arr_105_)
	mv	x18, x3
# was:	mv	_arr_98_, x3
	slli	x10, x19, 2
# was:	slli	_tmp_115_, _size_104_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_115_, _tmp_115_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_115_
	sw	x19, 0(x18)
# was:	sw	_size_104_, 0(_arr_98_)
	addi	x20, x18, 4
# was:	addi	_addrg_108_, _arr_98_, 4
	mv	x21, x0
# was:	mv	_i_109_, x0
	addi	x22, x11, 4
# was:	addi	_elem_106_, _arr_105_, 4
l.loop_beg_110_:
	bge	x21, x19, l.loop_end_111_
# was:	bge	_i_109_, _size_104_, l.loop_end_111_
	lw	x10, 0(x22)
# was:	lw	_res_107_, 0(_elem_106_)
	addi	x22, x22, 4
# was:	addi	_elem_106_, _elem_106_, 4
# 	mv	_arg_113_,_res_107_
	mv	x11, x10
# was:	mv	_arg_114_, _res_107_
# 	mv	x10,_arg_113_
# 	mv	x11,_arg_114_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_112_,x10
# 	mv	_res_107_,_fun_arg_res_112_
	sw	x10, 0(x20)
# was:	sw	_res_107_, 0(_addrg_108_)
	addi	x20, x20, 4
# was:	addi	_addrg_108_, _addrg_108_, 4
	addi	x21, x21, 1
# was:	addi	_i_109_, _i_109_, 1
	j	l.loop_beg_110_
l.loop_end_111_:
	lw	x10, 0(x18)
# was:	lw	_size_99_, 0(_arr_98_)
	li	x11, 0
# was:	li	_let_sum_97_, 0
	addi	x18, x18, 4
# was:	addi	_arr_98_, _arr_98_, 4
	mv	x13, x0
# was:	mv	_ind_var_100_, x0
l.loop_beg_102_:
	bge	x13, x10, l.loop_end_103_
# was:	bge	_ind_var_100_, _size_99_, l.loop_end_103_
	lw	x12, 0(x18)
# was:	lw	_tmp_101_, 0(_arr_98_)
	addi	x18, x18, 4
# was:	addi	_arr_98_, _arr_98_, 4
# 	mv	_plus_L_117_,_let_sum_97_
# 	mv	_plus_R_118_,_tmp_101_
	add	x11, x11, x12
# was:	add	_fun_arg_res_116_, _plus_L_117_, _plus_R_118_
# 	mv	_let_sum_97_,_fun_arg_res_116_
	addi	x13, x13, 1
# was:	addi	_ind_var_100_, _ind_var_100_, 1
	j	l.loop_beg_102_
l.loop_end_103_:
# 	mv	_tmp_119_,_let_sum_97_
	mv	x18, x11
# was:	mv	_mainres_30_, _tmp_119_
	mv	x10, x18
# was:	mv	x10, _mainres_30_
	jal	p.putint
# was:	jal	p.putint, x10
l.endif_34_:
	mv	x10, x18
# was:	mv	x10, _mainres_30_
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
s.Incorre_40_:
	.word	16
	.asciz	"Incorrect Input!"
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