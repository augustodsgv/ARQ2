global _start

section .text
    _start:
    mov rax, 4          ; Chamada de sistema sys_write
    mov rbx, 1          ; Escrevendo no stdout
    mov rcx, mensagem   ; Passando o argumeto '0', mas talvez seja o ascii 0, ou seja, \n
    mov rdx, 10          ; Tamanho 2
    int 0x80            ; Fazendo a interrupção

    mov rax, 1          ; Chamada de sistema sys_exit
    mov rbx, 0          ; Status "sucesso"
    int 0x80

section .data
    mensagem db 88, 10, 0