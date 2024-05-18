org 100h
bits 16

section .code
    mov ah, 8
    int 21h

    mov cx, 26
    mov ah, 2

    cmp al, '1'
    je opt1
    cmp al, '2'
    je opt2
    cmp al, '3'
    je opt3
    cmp al, '4'
    je opt4

    opt1:
        mov dl, 'A'
        jmp loop1

    opt2:
        mov dl, 'a'
        jmp loop1

    opt3:
        mov dl, 'A'
        jmp loop2

    opt4:
        mov dl, 'a'
        jmp loop2

    loop1:
        int 21h
        inc dl
        loop loop1

    jmp end

    loop2:
        push dx
        mov dx, newline
        mov ah, 9
        int 21h
        pop dx
        mov ah, 2
        int 21h
        inc dl
        loop loop2

    end:
        mov ah, 4ch
        int 21h

section .data
    newline db 10,13,"$"