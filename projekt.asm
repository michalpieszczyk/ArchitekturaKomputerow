format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
	wyswietl txt
	mov eax, 0
wczyt_pierw:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, '0'
	jb wczyt_pierw
	cmp al, '1'
	ja wczyt_pierw
	wysw_znak al
	mov [tab], al
	
wczyt_drug:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, 08h
	je backspace1
	cmp al, '0'
	jb wczyt_drug
	cmp al, '7'
	ja wczyt_drug
	wysw_znak al
	mov [tab+1], al

wczyt_trzec:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, 08h
	je backspace2
	cmp al, '0'
	jb wczyt_trzec
	cmp al, '7'
	ja wczyt_trzec
	wysw_znak al
	mov [tab+2], al

wczyt_czwart:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, 08h
	je backspace3
	cmp al, '0'
	jb wczyt_czwart
	cmp al, '7'
	ja wczyt_czwart
	wysw_znak al
	mov [tab+3], al

wczyt_piat:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, 08h
	je backspace4
	cmp al, '0'
	jb wczyt_piat
	cmp al, '7'
	ja wczyt_piat
	wysw_znak al
	mov [tab+4], al

wczyt_szost:
	pob_znak
	cmp al, 1Bh
	je esc
	cmp al, 08h
	je backspace5
	cmp al, '0'
	jb wczyt_szost
	cmp al, '7'
	ja wczyt_szost
	wysw_znak al
	mov [tab+5], al


wyswietlanie:
	wysw_znak 13
	wysw_znak 10
	wyswietl txt2

	mov bl, [tab]
	wysw_znak bl
	mov bl, [tab+1]
	wysw_znak bl
	mov bl, [tab+2]
	wysw_znak bl
	mov bl, [tab+3]
	wysw_znak bl
	mov bl, [tab+4]
	wysw_znak bl
	mov bl, [tab+5]
	wysw_znak bl

	

 ;konwersja na dec
    mov bx, 4096
    movzx ax, [tab+1]
    sub ax, 48
    mul bx
    mov [pom], ax

    mov bx, 512
    movzx ax, [tab+2]
    sub ax, 48
    mul bx
    add ax, [pom]
    mov [pom], ax

    mov bx, 64
    movzx ax, [tab+3]
    sub ax, 48
    mul bx
    add ax, [pom]
    mov [pom], ax

    mov bx, 8
    movzx ax, [tab+4]
    sub ax, 48
    mul bx
    add ax, [pom]
    mov [pom], ax

    movzx ax, [tab+5]
    sub ax, 48
    add ax, [pom]
    mov [pom], ax

    mov [pom2], ax
    mov al, [tab]
    cmp al, '0'
    je dodatnia
    movzx ax, [tab]
    sub ax, 48
    mov bx, 32768
    mul ax
    add bx, [pom] ;zmienilem sub na add
    mov [pom2], bx
    jmp binarnie

dodatnia:
	mov bx, [pom]

binarnie:
wyswietl txt1

	mov ecx,16
ety1:
	push ecx
	rcl bx, 1
	jc ety2
	mov dl, '0'
	jmp ety3
ety2:
	mov dl, '1'
ety3:
	wysw_znak dl
	pop ecx
	loop ety1

wysw_dec:
      wyswietl txt3

      mov al, [tab]
      cmp al, '1'
      je decUjemna

wyswietlajReszte:
      mov ax, [pom2]
      xor dx, dx
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


       pob_znak
       end_prog

;makra na ponowne wprowadzanie danych
backspace1:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp wczyt_pierw

backspace2:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp wczyt_drug

backspace3:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp wczyt_trzec

backspace4:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp wczyt_czwart

backspace5:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp wczyt_piat

decUjemna:
	wysw_znak '-'
	mov bx, 32768
	mul ax
	sub bx, [pom] ;zmienilem sub na add
	mov [pom2], bx
	jmp wyswietlajReszte


esc: 
    end_prog

section '.data' data readable writeable
	txt db 'Wprowadz wartosc osemkowa w kodzie U2 (100 000 - 77 777): ',NULL
	txt1 db 13,10,'wartosc BIN (U2): ',NULL
	txt2 db 13,10,'wartosc OCT (U2): ',NULL
	txt3 db 13,10,'wartosc DEC: ',NULL
	txt4 db 13,10,'wartosc HEX (U2): ',NULL
	tab db 0, 0, 0, 0, 0, 0
	pom dw 0
	pom2 dw 0
	tabDec db 0, 0, 0, 0, 0