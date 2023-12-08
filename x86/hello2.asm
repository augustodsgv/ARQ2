global start

section .text
    
    start:
        mov rax, 4
        mov rbx, 1
        mov rcx, message
        mov rdx, len
        int 0x80

        mov rax, 1
        mov rbx, 0
        int 0x80

section .data
    message db "Hello world", 10
    len equ $ - message