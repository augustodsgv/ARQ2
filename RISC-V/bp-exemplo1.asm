# bp-exemplo1.asm
#
#  t1=0;
#  t2= 10;
#  repeat
#    t1= t1 + 1;
#  until (t1 <> t2)
#
# FUNCIONA P/ CONFIG 1, 5
#

.data


.text
inicializa:
	li t1, 0 
	li t2, 10
	
repeat:
	addi t1, t1, 1
until:	bne t1, t2, repeat

fimrepeat:
    nop

#fimPrograma:
       li a7, 10
       ecall



