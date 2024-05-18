org 100h
bits 16

section .code
    mov ax, 4fd3h
    shr ax, 3

    mov ax, 3bcch
    ror ax, 5

    mov ax, 7720h
    rol ax, 7

    mov ax, 0fd2ch
    shl ax, 3

    mov ah, 4ch
    int 21h
