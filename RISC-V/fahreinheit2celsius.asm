# Convertendo fahrenheit para celsius
# A conta é C = (F - 32) * (5 / 9)
.data
	fahrenheit: .word 0
	
.text
	_start:
		lw t0, fahrenheit	# t0 armazena o valor originar
		addi t1, t0, -32	# F - 32
		
		li t2, 5		
		mul t1, t1, t2		# (F - 32) * 5
		
		li t2, 9
		div t1, t1, t2		# (F - 32) * (5 / 9)
	print:
		li a7, 1
		mv a0, t1
		ecall
		
	fimPrograma:
		li a7, 10
		ecall

	