section .data

section .bss
    var1 resb 8
    var2 resb 8
    soma resb 8


section text
    global _start       ; Criando uma marcação para o compilador que este eh o início do programa
    _start:

        mov [var1], 5   ; Colocando o valor 5 na variavel var1
        mov [var2], 10  ; Colocando o valor 10 na variavel var2
        add [var1], [var2], [soma]  ; Somando os valores da var1 e var2 e colocando o resultado na variavel soma



