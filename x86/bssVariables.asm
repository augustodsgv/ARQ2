section .bss        ; Aqui são declaradas variáveis 
    var resb 4

global _start

section .text
    _start:
    ; Atribuindo valores iniciais
    mov dword [var], 87              ; Variáveis do .bss devem ter [] em torno delas 

    ; Printando os valores
    mov rax, 4
    mov rbx, 1
    mov rcx, var
    mov rdx, 1
    int 0x80


    mov rax, 1
    mov rbx, 0
    int 0x80