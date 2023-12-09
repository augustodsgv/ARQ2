# Fatorial, usando somente registradores e imediate
.data
    lim: .word 5
.text
    li t0, 1                  # t0 armazena o resultado das operações
    lw t1, lim                # t1 será o iterador, que vai multiplicando t0
    
    inicioLoop:
     		mul t0, t0, t1
     		addi t1, t1, -1
     		bne t1, zero, inicioLoop
        
    
    
    fimPrograma:
    	li a7, 1		# Load 1 em a7: syswrite int
    	mv a0, t0		# Colocando como argumento o int que está em t0
    	ecall
    	
    	li a7, 10		# Load 10 em a7: sysexit
    	ecall
        
        