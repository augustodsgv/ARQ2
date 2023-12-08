# Implementação de um for loop em RISC-V
.data
	msg1: 	.string "Iteração: "
	i: 	.word 0
	lim: 	.word 5
	
.global _start
.text
	_start:
		la t0, lim
		la t1, i
		jal ra, for
		jal ra, endOfProgram
		
	for: 
		bgt t1, t0, endFor
		li a7, 4		# syscall 4 -> syswrite	string
		la a0, msg1		# reg a0 recebe a mensagem a ser escrita
		ecall
		li a7, 1		# syscall 1 -> syswrite int
		mv a0, t1
		ecall
		addi t1, t1, 1 
		
		
	endFor:
		jal ra, endOfProgram			# Retorna?
	
	endOfProgram:
		li a7, 10		# syscall 10 -> sysexit 0
		ecall
	