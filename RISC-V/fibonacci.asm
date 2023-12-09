# Programa para cálculo de fibonacci
.data
    fibo:    .word 10
    ln: .string "\n"

.text
    lw t0, fibo     # O registrador t0 servirá como o contador
                    # O contador será contado regressivamente
    li t1, 1        # O elemento n - 2 será o t0
    li t2, 1        # O elemento n - 1 será o t1
    
    loop: beq t0, zero, fimPrograma	# Branch para o printResul
    	addi t0, t0, -1		# Decrementando o contador
    	add t3, t2, t1		# t3 servirá de variável termporária para calcular o valor de N
    	mv t1, t2
    	mv t2, t3		# Atribuindo os novos valores às variáveis
	jal printResultado
	
	
    	j loop				# Volta ao inicio do loop
    
    
    printResultado:
    	li a7, 1
    	mv a0, t2
    	ecall
    	
    	li a7, 4
    	la a0, ln
    	ecall
    	ret
    	
    fimPrograma:
    	li a7, 10
    	ecall
            
