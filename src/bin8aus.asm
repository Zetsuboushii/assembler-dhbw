org 100h
bits 16

%macro pushall 0
push ax
push bx
push cx
push dx
%endmacro

%macro popall 0
pop ax
pop bx
pop cx
pop dx
%endmacro

%macro stringaus 1
mov dx,%1
mov ah,9
int 21h
%endmacro


section .code
    stringaus ueber
    stringaus vorschub
    stringaus vorschub

    m1:
        mov al,7
        mov cx,8

    loop1:
        rcl al,1
        call dual
        loop loop1

    mov ah,4ch
    int 21h

    dual:
        pushall
        pushf
        dec cl
        mov dl,cl
        add dl,30h
        mov ah,2
        int 21h
        popf
        jc eins
        stringaus nicht
        jmp ende

    eins:
        stringaus gesetzt

    ende:
        popall
        ret


section .data
    gesetzt db ". Bit ist 1 ",10,13,"$"
    nicht db ". Bit ist 0 ",10,13,"$"
    ueber db "Binaere Ausgabe eines 8-Bit-Registerinhalts in BL$"
    vorschub db 10,13,"$"