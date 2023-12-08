# Teste das syscalls
.data
	str: .string "Hello\n"
	int: .word 5
	float: .float 5.5

.text
	# Syswrite string
	li a7, 4		# reg a7 define a syscall
	la a0, str		# reg a0 define o que será printado
	ecall
	
	# Syscwrite int
	li a7, 1		# reg a7 define a syscall
	lw a0, int		# reg a0 define o que será printado
	ecall
	
	# Syswrite float
	li a7, 2		# reg a7 define a syscall
	flw fa0, float		# reg a0 define o que será printado
	ecall
	
	# Sysexit
	li a7, 10		# reg a7 define a syscall
	ecall