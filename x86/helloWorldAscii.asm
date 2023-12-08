section .data
    msg db 72, 101, 108, 108, 111, 44, 32, 119, 111, 114, 108, 100, 33, 10, 0


global _start

section .text
    _start:
        mov rax, 4       ; sys_write
        mov rbx, 1       ; stdout
        mov rcx, msg     ; text to be printed
        mov rdx, 15     ; lenght of the text
        int 0x80        ; system interrupt


        mov rax, 1       ; sys_exit
        mov rbx, 0       ; code 0, success
        int 0x80        ; call of interruption