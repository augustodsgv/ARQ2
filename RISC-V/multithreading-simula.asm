# multithreading-exemplo1.asm
#

.data


thread: .string "\n \n  Thread disparada: "
seta: .string " -->  "
ler: .string "Lendo Digital ->  "
verificar: .string "Verificando Banco de Dados -->  "
CPF: .string "CPF: "
abrir: .string " --> OK - Abrir Catacra:  "
fechar: .string "FECHADO - Digital Desconhecida "

.text

main:
	
inicializa:
	li t1, 0   # contador p/ loop for
	li t2, 10  # limite do loop for
	li t3, 0  # t3= thread id
	


for:    beq t1, t2, fimLoop   # simula a execução de 5 usuários passando pelas catracas
        addi t1, t1, 1
       
	jal ra, IniciaThread
	mv s9, a0  # s9= thread selecionada
	
	 	
 	### Iniciar controle de acesso do usuário:
	jal ra, SalvarContexto
	
	mv a0, s8
	jal ra, LerDigital
	
		
	jal ra, VerificarBD
	beqz a0, barrar
	jal ra, ExibirNome
liberar: jal ra, Abrir
	j proximo
	
barrar:	jal ra, Fechar

proximo:
	
	jal ra, RestaurarContexto
	
	j for
fimLoop:
	
       
	
	j fimPrograma


############################################
ExibirNome:
	la a0, CPF
	li a7,4
	ecall
	
	li a7, 30   # Syscall "Time", p/ simular o id de um usurário qualquer - retorna em a0
	ecall 

	li a7, 1 # mostrar valor lido
	ecall  
	
	ret

###########################################
IniciaThread:

	li t4, 4
 	blt t3, t4, escolher
 	li t3, 0  # reinicializar numeração de threads
 
 escolher:
 	addi t3, t3, 1  #nova thread escolhida
 	
 exibir:	
 	la a0, thread
        li a7, 4
        ecall
        
        mv a0,t3
        li a7, 1
        ecall
        
        la a0, seta
        li a7, 4
        ecall
        
        mv a0,t3  # a0= thread escolhida
        ret

###########################################
LerDigital:
 	la a0, ler
        li a7, 4
        ecall
        ret
        

        
###########################################
VerificarBD:
 	la a0, verificar
        li a7, 4
        ecall
        
        li t4, 4  # t4= usado em divisão por quatro para teste: resto= 0: não passou
        rem a0,s9,t4  # a0=resto
                        
        ret
        
###########################################
Abrir:
 	la a0, abrir
        li a7, 4
        ecall
        ret

###########################################
Fechar:
 	la a0, fechar
        li a7, 4
        ecall
        ret


###########################################
SalvarContexto:

      ## Obs: Não salvar/restaurar: X0 (sempre zero), X1(ra) e X2(sp), pois isso confunde a execução do programa, que na verdade está rodando uma única thread

      addi sp, sp, -116   # Alocar espaço na pilha p/ 29 regs (3-31) 
      sw x3, 112(sp)
      sw x4, 108(sp)
      sw x5, 104(sp)
      sw x6, 100(sp)
      sw x7, 96(sp)
      sw x8, 92(sp)
      sw x9,88(sp)
      sw x10,84 (sp)
      sw x11,80(sp)
      sw x12,76(sp)
      sw x13,72(sp)
      sw x14,68(sp)
      sw x15,64(sp)
      sw x16,60(sp)
      sw x17,56(sp)
      sw x18,52(sp)
      sw x19,48(sp)
      sw x20,44(sp)
      sw x21,40(sp)
      sw x22,36(sp)
      sw x23,32(sp)
      sw x24,28(sp)
      sw x25,24(sp)
      sw x26,20(sp)
      sw x27,16(sp)
      sw x28,12(sp)
      sw x29,8(sp)
      sw x30,4(sp)
      sw x31,0(sp)
     
          
      ret
      
###########################################
RestaurarContexto:

      lw x31, 0(sp)
      lw x30, 4(sp)
      lw x29, 8(sp)
      lw x29, 12(sp)
      lw x27, 16(sp)
      lw x26, 20(sp)
      lw x25, 24(sp)
      lw x24, 28(sp)
      lw x23, 32(sp)
      lw x22, 36(sp)
      lw x21, 40(sp)
      lw x20, 44(sp)
      lw x19, 48(sp)
      lw x18, 52(sp)
      lw x17, 56(sp)
      lw x16, 60(sp)
      lw x15, 64(sp)
      lw x14, 68(sp)
      lw x13, 72(sp)
      lw x12, 76(sp)
      lw x11, 80(sp)
      lw x10, 84(sp)
      lw x9,  88(sp)
      lw x8,  92(sp)
      lw x7,  96(sp)
      lw x6, 100(sp)
      lw x5, 104(sp)
      lw x4, 108(sp)
      lw x3, 112(sp)
      addi sp, sp, 116   # Desalocar espa�o na pilha p/ 31 regs (1-31) 
          
      ret
      



#################################		
#################################		
fimPrograma:
       li a7, 10
       ecall




