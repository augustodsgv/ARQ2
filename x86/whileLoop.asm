section .data
    msg db "Esta é uma saída do loop", 10, 0
    msgSize equ $-msg

section .bss
    cont resb 1

global _start

section .text
    printHello:
        mov rax, 4
        mov rbx, 1
        mov rcx, msg
        mov rdx, msgSize
        int 0x80
        ret

    _start:
        mov word [cont], 0      ; A variável de controle do loop inicia-se em 0 e vai até o fim do contador
        .loop:
            call printHello     ; O loop executa a função hello, somente para ter um feedback visual
            dec word [cont]
            cmp word [cont], 5
            jl .loop

        mov rax, 1
        mov rbx, 0
        int 0x80
            