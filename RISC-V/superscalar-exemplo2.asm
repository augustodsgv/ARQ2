# superscalar-exemplo2.asm
# Apenas mudou a ordem de algumas instruções no corpo do loop, em relação ao exemplo 1


.data


.text
inicializa:
	li t1, 0   # contador p/ loop for
	li t2, 1000   # limite do loop for
	
	li t3, 0
	li t4, 0
	li t5, 0
	
	li a3, 0
	li a4, 0
	li a5, 0
	
for:   beq t1, t2, fimLoop 
       addi t1, t1, 1
       
       addi t3, t3, 1
       addi t4, t4, 10
       
       addi a3, a3, 1
       addi a4, a4, 100
       
       #apenas atrasou uma instrução, para criar 3 blocos de 2 instruções independentes --> melhoria de 10% !!
       add t5, t3, t4   # t5= 11* (nro interações)
       add a5, a3, a4   # a5= 101* (nro interações)
       
       j for
fimLoop:
    nop

#soma= resultado final:
  	add s7, t5, a5


#imprimir resultado:
	mv a0, s7
	li, a7,1
	ecall
	
	
#fimPrograma:
       li a7, 10
       ecall



