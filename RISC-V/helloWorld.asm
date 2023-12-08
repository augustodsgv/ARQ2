.data
	str: .string "Hello World"

.text
	la a0, str
	li a7, 4
	ecall
