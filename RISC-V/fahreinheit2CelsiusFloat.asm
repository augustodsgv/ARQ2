# fahrenheit para celsius, mas usando float
# A conta é C = (F - 32) * (5 / 9)
## !!! Não entendi o por que do t2 aqui
.data
	fahreinheit: 	.float 100.0
	float_32: 	.float 32.0
	float_5: 	.float 5.0
	float_9: 	.float 9.0

.text
	_start:
		flw ft0, fahreinheit, t2	# ft0, o ponteiro de float, armazena o valor em F
		
		flw ft2, float_32, t2		# Carregando o valor float do .data, já que não há immediate
		fsub.s ft1, ft0, ft2 		# (F - 32)
		
		flw ft2, float_5, t2
		fmul.s ft1, ft1, ft2		# (F - 32) * 5
		
		flw ft2, float_9, t2
		fdiv.s ft1, ft1, ft2		# (F - 32) * (5 / 9)
		
	print:
		li a7, 2			# a7 <- 2, ou seja, syswrite 2 (float)
		fmv.s fa0, ft1			# Aqui também há um registrador especial para a syscall
		ecall
	
	fimPrograma:
		li a7, 10			# sysexit 0
		ecall
	