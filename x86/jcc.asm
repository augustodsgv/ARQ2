section .data
    a db 9              ; Alocando um valor para cada constante
    b db 2      
    str1 db "A eh maior que B", 10, 0   ; Escrevendo mensagens para testar o programa
    str2 db "B eh maior que A", 10, 0

global _start

section .text
    _start:
    mov al, [a]
    mov bl, [b]
    cmp al, bl            ; Comparando A e B
    
    jg .agb             ; Vai para .agb (a greater than b) se a > b
    mov rcx, str2       ; Aqui é como se fosse um if invertido: se for false,
    jmp .fim            ; executa o código imediatamente abaixo, senão
                        ; executa o código marcado pela tag, que seria o "else"
    .agb:
    mov rcx, str1
    jmp .fim

    .fim:
    mov rax, 4
    mov rbx, 1
    mov rdx, 18
    int 0x80

    mov rax, 1
    mov rbx, 0
    int 0x80