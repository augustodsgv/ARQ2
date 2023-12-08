;Tentativa da implementação de um loop em assembly

section .data
    msg: DB 'iteracao', 10
    ;msgSize: 11
    cont: 0, 8

global _start

section .text
    _start:
        loopStart:
            mov rax, 4          ; Setando o registrador para a "função 4" sys_write,
                                ; ou seja, a chamada de sistema para escrever em arquivo
            mov rbx, 1          ; setando que o "arquivo" é o stdout
            mov rcx, msg        ; colocando a mensagem a ser printada no registrador
            mov rdx, 11    ; colocando o tamanho da mensagem no registrador
            int 0x80            ; Chamando a interrupção para manejar a chamada montada
                                ; acima
            je

        mov rax, 1          ; Agora fazendo a chamada da "função" 1, de exit
        mov rbx, 0         ; Definindo o código 0, de que foi tudo finalizado normalmente
        int 0x80            ; Chamando novamente a interrupção 0x80
        ret
