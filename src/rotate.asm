org 100h
bits 16

section .code
    mov dx, 0x4fd3
    shr dl, 3

    mov cx, 0x3bcc
    ror ch, 5

    mov ax, 0x7720
    rol ax, 7

    mov ax, 0xfd2c
    shl ah, 3