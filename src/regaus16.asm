org 100h
bits 16

%macro registeraus8 1
    push %1            ; Wert des Registers auf den Stapel legen
    mov cx, 4          ; Anzahl der Bits für eine Hexadezimalziffer (4 Bits)
    shr bl, cl         ; Verschieben, um die niedrigeren 4 Bits zu isolieren
    mov dl, bl         ; Wert in DL laden (für ASCII-Umwandlung)
    add dl, 30h        ; Umwandeln in ASCII (Addieren von 30h)
    mov ah, 2          ; DOS-Funktion für Bildschirmausgabe
    int 21h            ; Zeichen ausgeben
    pop %1             ; Wert des Registers vom Stapel nehmen
    and bl, 0fh        ; Nur die niedrigeren 4 Bits behalten
    mov dl, bl         ; Wert in DL laden (für ASCII-Umwandlung)
    add dl, 30h        ; Umwandeln in ASCII (Addieren von 30h)
    int 21h            ; Zeichen ausgeben
%endmacro

%macro sout 1
    mov dx, %1         ; Adresse der Zeichenkette in DX laden
    mov ah, 9          ; DOS-Funktion für Zeichenkettenausgabe
    int 21h            ; Zeichenkette ausgeben
%endmacro


section .code
sout ausgabe         ; Ausgabe der vordefinierten Zeichenkette

mov bx, word[wortwert]  ; Wert der 16-Bit-Variable wortwert in BX laden
xchg bl, bh              ; Niedrigere und höhere Bytes von BX tauschen (für registeraus8)
registeraus8 bx          ; Makro aufrufen, um den Wert in BX als ASCII-Zeichen auszugeben

mov ah, 4ch         ; DOS-Funktion für Programmende
int 21h             ; Programmende aufrufen


section .data
ausgabe db "Ausgabe 16-Bit-Register (BX), aus 16-Bit-Variable (0 bis 9)",10,13,"$" ; Vordefinierte Zeichenkette für Ausgabe
wortwert dw 4995h   ; Vordefinierte 16-Bit-Variable
