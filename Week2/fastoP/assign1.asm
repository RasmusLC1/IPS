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
	mv	x21, x10
# was:	mv	_let_n_31_, x10
# 	mv	_lt_L_36_,_let_n_31_
	li	x10, 1
# was:	li	_lt_R_37_, 1
	slt	x10, x21, x10
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
# 	mv	_size_46_,_let_n_31_
	bge	x21, x0, l.safe_47_
# was:	bge	_size_46_, x0, l.safe_47_
	li	x10, 15
# was:	li	x10, 15
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_47_:
	mv	x10, x3
# was:	mv	_arr_43_, x3
	slli	x11, x21, 2
# was:	slli	_tmp_52_, _size_46_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_52_, _tmp_52_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_52_
	sw	x21, 0(x10)
# was:	sw	_size_46_, 0(_arr_43_)
	addi	x12, x10, 4
# was:	addi	_addr_48_, _arr_43_, 4
	mv	x11, x0
# was:	mv	_i_49_, x0
l.loop_beg_50_:
	bge	x11, x21, l.loop_end_51_
# was:	bge	_i_49_, _size_46_, l.loop_end_51_
	sw	x11, 0(x12)
# was:	sw	_i_49_, 0(_addr_48_)
	addi	x12, x12, 4
# was:	addi	_addr_48_, _addr_48_, 4
	addi	x11, x11, 1
# was:	addi	_i_49_, _i_49_, 1
	j	l.loop_beg_50_
l.loop_end_51_:
	lw	x22, 0(x10)
# was:	lw	_size_42_, 0(_arr_43_)
	mv	x18, x3
# was:	mv	_let_arr_41_, x3
	slli	x11, x22, 2
# was:	slli	_tmp_58_, _size_42_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_58_, _tmp_58_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_58_
	sw	x22, 0(x18)
# was:	sw	_size_42_, 0(_let_arr_41_)
	addi	x19, x18, 4
# was:	addi	_addrg_53_, _let_arr_41_, 4
	mv	x20, x0
# was:	mv	_i_54_, x0
	addi	x23, x10, 4
# was:	addi	_elem_44_, _arr_43_, 4
l.loop_beg_55_:
	bge	x20, x22, l.loop_end_56_
# was:	bge	_i_54_, _size_42_, l.loop_end_56_
	lw	x10, 0(x23)
# was:	lw	_res_45_, 0(_elem_44_)
	addi	x23, x23, 4
# was:	addi	_elem_44_, _elem_44_, 4
	jal	p.getint
# was:	jal	p.getint, 
# 	mv	_fun_arg_res_57_,x10
# 	mv	_res_45_,_fun_arg_res_57_
	sw	x10, 0(x19)
# was:	sw	_res_45_, 0(_addrg_53_)
	addi	x19, x19, 4
# was:	addi	_addrg_53_, _addrg_53_, 4
	addi	x20, x20, 1
# was:	addi	_i_54_, _i_54_, 1
	j	l.loop_beg_55_
l.loop_end_56_:
# 	mv	_size_64_,_let_n_31_
	bge	x21, x0, l.safe_65_
# was:	bge	_size_64_, x0, l.safe_65_
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadSize
# was:	la	x11, m.BadSize
	j	p.RuntimeError
l.safe_65_:
	mv	x14, x3
# was:	mv	_arr_61_, x3
	slli	x10, x21, 2
# was:	slli	_tmp_70_, _size_64_, 2
	addi	x10, x10, 4
# was:	addi	_tmp_70_, _tmp_70_, 4
	add	x3, x3, x10
# was:	add	x3, x3, _tmp_70_
	sw	x21, 0(x14)
# was:	sw	_size_64_, 0(_arr_61_)
	addi	x11, x14, 4
# was:	addi	_addr_66_, _arr_61_, 4
	mv	x10, x0
# was:	mv	_i_67_, x0
l.loop_beg_68_:
	bge	x10, x21, l.loop_end_69_
# was:	bge	_i_67_, _size_64_, l.loop_end_69_
	sw	x10, 0(x11)
# was:	sw	_i_67_, 0(_addr_66_)
	addi	x11, x11, 4
# was:	addi	_addr_66_, _addr_66_, 4
	addi	x10, x10, 1
# was:	addi	_i_67_, _i_67_, 1
	j	l.loop_beg_68_
l.loop_end_69_:
	lw	x11, 0(x14)
# was:	lw	_size_60_, 0(_arr_61_)
	mv	x10, x3
# was:	mv	_let_difs_59_, x3
	slli	x12, x11, 2
# was:	slli	_tmp_102_, _size_60_, 2
	addi	x12, x12, 4
# was:	addi	_tmp_102_, _tmp_102_, 4
	add	x3, x3, x12
# was:	add	x3, x3, _tmp_102_
	sw	x11, 0(x10)
# was:	sw	_size_60_, 0(_let_difs_59_)
	addi	x13, x10, 4
# was:	addi	_addrg_71_, _let_difs_59_, 4
	mv	x12, x0
# was:	mv	_i_72_, x0
	addi	x14, x14, 4
# was:	addi	_elem_62_, _arr_61_, 4
l.loop_beg_73_:
	bge	x12, x11, l.loop_end_74_
# was:	bge	_i_72_, _size_60_, l.loop_end_74_
	lw	x16, 0(x14)
# was:	lw	_res_63_, 0(_elem_62_)
	addi	x14, x14, 4
# was:	addi	_elem_62_, _elem_62_, 4
# 	mv	_eq_L_80_,_res_63_
	li	x17, 0
# was:	li	_eq_R_81_, 0
	li	x15, 0
# was:	li	_cond_79_, 0
	bne	x16, x17, l.false_82_
# was:	bne	_eq_L_80_, _eq_R_81_, l.false_82_
	li	x15, 1
# was:	li	_cond_79_, 1
l.false_82_:
	bne	x15, x0, l.then_76_
# was:	bne	_cond_79_, x0, l.then_76_
	j	l.else_77_
l.then_76_:
	li	x15, 0
# was:	li	_arr_ind_83_, 0
	addi	x16, x18, 4
# was:	addi	_arr_data_84_, _let_arr_41_, 4
	lw	x17, 0(x18)
# was:	lw	_size_85_, 0(_let_arr_41_)
	bge	x15, x0, l.nonneg_87_
# was:	bge	_arr_ind_83_, x0, l.nonneg_87_
l.error_86_:
	li	x10, 19
# was:	li	x10, 19
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_87_:
	bge	x15, x17, l.error_86_
# was:	bge	_arr_ind_83_, _size_85_, l.error_86_
	slli	x15, x15, 2
# was:	slli	_arr_ind_83_, _arr_ind_83_, 2
	add	x16, x16, x15
# was:	add	_arr_data_84_, _arr_data_84_, _arr_ind_83_
	lw	x16, 0(x16)
# was:	lw	_fun_arg_res_75_, 0(_arr_data_84_)
	j	l.endif_78_
l.else_77_:
	mv	x17, x16
# was:	mv	_arr_ind_90_, _res_63_
	addi	x15, x18, 4
# was:	addi	_arr_data_91_, _let_arr_41_, 4
	lw	x19, 0(x18)
# was:	lw	_size_92_, 0(_let_arr_41_)
	bge	x17, x0, l.nonneg_94_
# was:	bge	_arr_ind_90_, x0, l.nonneg_94_
l.error_93_:
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_94_:
	bge	x17, x19, l.error_93_
# was:	bge	_arr_ind_90_, _size_92_, l.error_93_
	slli	x17, x17, 2
# was:	slli	_arr_ind_90_, _arr_ind_90_, 2
	add	x15, x15, x17
# was:	add	_arr_data_91_, _arr_data_91_, _arr_ind_90_
	lw	x15, 0(x15)
# was:	lw	_minus_L_88_, 0(_arr_data_91_)
# 	mv	_minus_L_96_,_res_63_
	li	x17, 1
# was:	li	_minus_R_97_, 1
	sub	x17, x16, x17
# was:	sub	_arr_ind_95_, _minus_L_96_, _minus_R_97_
	addi	x16, x18, 4
# was:	addi	_arr_data_98_, _let_arr_41_, 4
	lw	x19, 0(x18)
# was:	lw	_size_99_, 0(_let_arr_41_)
	bge	x17, x0, l.nonneg_101_
# was:	bge	_arr_ind_95_, x0, l.nonneg_101_
l.error_100_:
	li	x10, 21
# was:	li	x10, 21
	la	x11, m.BadIndex
# was:	la	x11, m.BadIndex
	j	p.RuntimeError
l.nonneg_101_:
	bge	x17, x19, l.error_100_
# was:	bge	_arr_ind_95_, _size_99_, l.error_100_
	slli	x17, x17, 2
# was:	slli	_arr_ind_95_, _arr_ind_95_, 2
	add	x16, x16, x17
# was:	add	_arr_data_98_, _arr_data_98_, _arr_ind_95_
	lw	x16, 0(x16)
# was:	lw	_minus_R_89_, 0(_arr_data_98_)
	sub	x16, x15, x16
# was:	sub	_fun_arg_res_75_, _minus_L_88_, _minus_R_89_
l.endif_78_:
# 	mv	_res_63_,_fun_arg_res_75_
	sw	x16, 0(x13)
# was:	sw	_res_63_, 0(_addrg_71_)
	addi	x13, x13, 4
# was:	addi	_addrg_71_, _addrg_71_, 4
	addi	x12, x12, 1
# was:	addi	_i_72_, _i_72_, 1
	j	l.loop_beg_73_
l.loop_end_74_:
# 	mv	_arr_111_,_let_difs_59_
	lw	x19, 0(x10)
# was:	lw	_size_110_, 0(_arr_111_)
	mv	x18, x3
# was:	mv	_arr_104_, x3
	slli	x11, x19, 2
# was:	slli	_tmp_121_, _size_110_, 2
	addi	x11, x11, 4
# was:	addi	_tmp_121_, _tmp_121_, 4
	add	x3, x3, x11
# was:	add	x3, x3, _tmp_121_
	sw	x19, 0(x18)
# was:	sw	_size_110_, 0(_arr_104_)
	addi	x20, x18, 4
# was:	addi	_addrg_114_, _arr_104_, 4
	mv	x21, x0
# was:	mv	_i_115_, x0
	addi	x22, x10, 4
# was:	addi	_elem_112_, _arr_111_, 4
l.loop_beg_116_:
	bge	x21, x19, l.loop_end_117_
# was:	bge	_i_115_, _size_110_, l.loop_end_117_
	lw	x10, 0(x22)
# was:	lw	_res_113_, 0(_elem_112_)
	addi	x22, x22, 4
# was:	addi	_elem_112_, _elem_112_, 4
# 	mv	_arg_119_,_res_113_
	mv	x11, x10
# was:	mv	_arg_120_, _res_113_
# 	mv	x10,_arg_119_
# 	mv	x11,_arg_120_
	jal	f.mul
# was:	jal	f.mul, x10 x11
# 	mv	_fun_arg_res_118_,x10
# 	mv	_res_113_,_fun_arg_res_118_
	sw	x10, 0(x20)
# was:	sw	_res_113_, 0(_addrg_114_)
	addi	x20, x20, 4
# was:	addi	_addrg_114_, _addrg_114_, 4
	addi	x21, x21, 1
# was:	addi	_i_115_, _i_115_, 1
	j	l.loop_beg_116_
l.loop_end_117_:
	lw	x10, 0(x18)
# was:	lw	_size_105_, 0(_arr_104_)
	li	x11, 0
# was:	li	_let_sum_103_, 0
	addi	x18, x18, 4
# was:	addi	_arr_104_, _arr_104_, 4
	mv	x12, x0
# was:	mv	_ind_var_106_, x0
l.loop_beg_108_:
	bge	x12, x10, l.loop_end_109_
# was:	bge	_ind_var_106_, _size_105_, l.loop_end_109_
	lw	x13, 0(x18)
# was:	lw	_tmp_107_, 0(_arr_104_)
	addi	x18, x18, 4
# was:	addi	_arr_104_, _arr_104_, 4
# 	mv	_plus_L_123_,_let_sum_103_
# 	mv	_plus_R_124_,_tmp_107_
	add	x11, x11, x13
# was:	add	_fun_arg_res_122_, _plus_L_123_, _plus_R_124_
# 	mv	_let_sum_103_,_fun_arg_res_122_
	addi	x12, x12, 1
# was:	addi	_ind_var_106_, _ind_var_106_, 1
	j	l.loop_beg_108_
l.loop_end_109_:
# 	mv	_tmp_125_,_let_sum_103_
	mv	x18, x11
# was:	mv	_mainres_30_, _tmp_125_
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