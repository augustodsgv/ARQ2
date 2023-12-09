# superscalar-exemplo1.asm
#

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
       add t5, t3, t4   # t5= 11* (nro interações)
       
       addi a3, a3, 1
       addi a4, a4, 100
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


######### Algoritmo do programa acima:
#  t1=0;
#  t2= 10;
#  t3,t4,t5,a3,a4,a5= 0;
#
#  for (t1=0; t1 < t2; t1++)
#  {
#     t3= t3+1
#     t4= t4+10
#     t5= t3+t4
#     a3= a3+1
#     a4= a4+10
#     a5= a3+a4
#  }  
#
#  s7= t5+ a5
#  printf(s7) 
#
######### 


