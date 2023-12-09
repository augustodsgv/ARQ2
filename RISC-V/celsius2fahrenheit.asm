# Programa de converter celsius para farheinheit
# A conta é F = (9 / 5) * c + 32
.data
	celsius: .word 0	# Converser 25ºC para 
	
.text
	_start:
		lw t0, celsius		# Atribuindo ao t0 o valor em celsius
		li t2, 9		# t2 será a variável auxiliar
		mul t1, t0, t2		# C * 9
		li t2, 5
		div t1, t1, t2		# (C * 9) / 5
		addi t1, t1, 32		# C * (9 / 5) + 32
	print:
		li a7, 1
		mv a0, t1
		ecall
	fimPrograma:
		li a7, 10
		ecall	
	