# Programa para cálculo de fibonacci
.data
    fibo:    .word 10

.text
    lw t0, fibo     # O registrador t0 servirá como o contador
                    # O contador será contado regressivamente
    li t1, 1        # O elemento n - 2 será o t0
    li t2, 1        # O elemento n - 1 será o t1
    
    loop: bne t0, zero, printResultado
    
        

    
    printResultado:
            