org 0x100
bits 16

%macro stringaus 1
    mov dx, %1
    mov ah, 9
    int 0x21
%endmacro


section .code
    start:
        stringaus header
        mov ah, 8
        int 0x21

        mov ah, 2
        mov cx, 5

        cmp al, '1'
        je case1
        cmp al, '2'
        je case2
        cmp al, '3'
        je case3
        cmp al, '4'
        je case4

        jmp start

    case1:
        mov dl, 'A'
        jmp loop1

    case2:
        mov dl, 'a'
        jmp loop1

    case3:
        mov dl, 'A'
        jmp loop2

    case4:
        mov dl, 'a'
        jmp loop2

    loop1:
        int 0x21
        inc dl
        loop loop1
    jmp end

    loop2:
        int 0x21
        inc dl
        push dx
        stringaus linebreak
        pop dx
        mov ah, 2
        loop loop2

    end:
        mov ah, 0x4c
        int 0x21


section .data
    header db "Upper (1), Lower (2), Upper + Br (3), Lower + Br (4): ",10,13,"$"
    linebreak db 10,13,"$"
