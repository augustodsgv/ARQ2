section .data
    msg db "Hello", 10, 0
    size db $-msg

section .bss
    cont resb 1

global _start

section .text
    print:
        mov rax, 4
        mov rbx, 1
        ; mov rcx, msg      // Aqui vamos considerar que a pessoa já coloca o que é para ser printado no registrador
        ; mov rdx, ??       // Mesma coisa para o tamanho da mensagem
        int 0x80
        ret

    _start:
    mov rcx, msg
    mov rdx, size
    call print

    mov rax, 1
    mov rbx, 0
    int 0x80
