section .data
    msgVar db "Hello world!", 10, 0         ; Mensagem 
    msgSize equ $ - msgVar                  ; Tamanho da mensagem

global _start                               ; Como se fosse a main do programa

section .text
    _start:
        mov rax, 4                          ; Chamando a sys_call sys_write
        mov rbx, 1                          ; Mandando para o stdout
        mov rcx, msgVar                     ; Passando o texto a ser printado  
        mov rdx, msgSize                    ; Determinando o tamanho da mensagem
        int 0x80                            ; Gerando a interrupção

        mov rax, 1                          ; Chamando a sys_call sys_exit
        mov rbx, 0                          ; Setando como código de saída "0" de sucesso
        int 0x80                            ; Gerando a interrupção

