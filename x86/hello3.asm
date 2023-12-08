global start

section .text
    
    start:
        mov eax, 4
        mov ebx, 1
        mov ecx, message
        mov edx, len
        int 0x80

        mov eax, 1
        mov ebx, 0
        int 0x80

section .data
    message db "Hello world", 10
    len equ $ - message