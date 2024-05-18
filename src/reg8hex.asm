org 100h
bits 16

%macro sout 1
mov dx,%1
mov ah,9
int 21h
%endmacro

section .code
sout ausgabe
mov cx, 16  ; Anzahl der Schleifendurchläufe (0 bis F)
mov bl, 0   ; Initialisierung mit 0

schleife:
    push bx       ; Wert von BL auf den Stapel legen
    mov dl, bl    ; Wert von BL in DL laden
    and dl, 0Fh   ; Nur die unteren 4 Bits behalten
    add dl, 30h   ; Umwandlung in ASCII
    cmp dl, '9'   ; Überprüfen, ob es eine Ziffer ist
    jbe ziffer    ; Springen, wenn es eine Ziffer ist
    add dl, 7     ; Anpassung für Buchstaben A bis F

ziffer:
    mov ah, 2     ; DOS-Funktion für Bildschirmausgabe
    int 21h       ; Zeichen ausgeben

    pop bx        ; Wert von BL vom Stapel nehmen
    inc bl        ; BL inkrementieren für die nächste Iteration

    loop schleife ; Schleife wiederholen, bis CX = 0

mov ah, 4Ch       ; DOS-Funktion für Programmende
int 21h

section .data
ausgabe db "Ausgabe 8-Bit-Register Ziffern 0 bis F", 10, 13, "$"