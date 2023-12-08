.data
	str: .string "Deu bom, parSero"
	str2: .string "Deu bom bom"

.global _start
.text	
	_start:
		jal ra, print
		jal ra, fimPrograma
		
	print:
		la, a0, str	# Setando o registrador a0 com o endereço alocado para a string
		li a7, 4	# Setando o registrador a7 para a syscall 4, syswrite
		ecall
	fimPrograma:
		li a7, 10
		ecall
	