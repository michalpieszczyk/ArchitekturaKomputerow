format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
    wyswietl txt1
    mov bx, 0
ety1:
    pob_znak

    cmp al, 20h  ;spacja
    je ety2
    cmp al, 08h  ;backspace
    je ety3
    cmp al, 0Dh  ;enter
    je ety4

    cmp al, 61h  ;a
    jb ety1
    cmp al, 7Ah  ;z 
    ja ety1

ety2: ;spacja - wyswietl i policz
    wysw_znak al
    add bx, 1
    jmp ety1

ety3: ;backspace
    wysw_znak 08h
    wysw_znak ' '
    wysw_znak 08h
    jmp ety1

ety4: ;enter
    wyswietl txt2
    jmp ety5


ety5: ;wyswietl liczbe 16bit
      mov ax, bx
      xor dx, dx   ;?
      mov cx, 10000
      div cx
      or al, '0'
      wysw_znak al

      mov ax, dx
      xor dx, dx
      mov cx, 1000
      div cx
      or al, '0'
      wysw_znak al

      mov ax, dx
      xor dx, dx
      mov cl, 100
      div cl
      or al, '0'
      wysw_znak al

      mov al, ah
      xor ah, ah
      mov cl, 10
      div cl
      or ax, '00'
      wysw_znak al
      wysw_znak ah

    

section '.data' data readable writeable
	txt1 db 'Liczymy spacje - enter aby pokazac wynik',13,10,NULL
	txt2 db 13,10,'Ilosc spacji to: ',13,10,NULL