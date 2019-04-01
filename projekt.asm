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
	jmp wczyt_drug

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
	jb wczyt_drug
	cmp al, '7'
	ja wczyt_drug
	wysw_znak al
	mov [tab+2], al

wczyt_czwart:
	pob_znak
    cmp al, 1Bh
    je esc
	cmp al, 08h
	je backspace3
	cmp al, '0'
	jb wczyt_drug
	cmp al, '7'
	ja wczyt_drug
	wysw_znak al
	mov [tab+3], al

wczyt_piat:
	pob_znak
    cmp al, 1Bh
    je esc
	cmp al, 08h
	je backspace4
	cmp al, '0'
	jb wczyt_drug
	cmp al, '7'
	ja wczyt_drug
	wysw_znak al
	mov [tab+4], al

wczyt_szost:
	pob_znak
    cmp al, 1Bh
    je esc
	cmp al, 08h
	je backspace5
	cmp al, '0'
	jb wczyt_drug
	cmp al, '7'
	ja wczyt_drug
	wysw_znak al
	mov [tab+5], al


wyswietlanie:
	wysw_znak ' '

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

	pob_znak
	end_prog

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

esc: 
    end_prog

section '.data' data readable writeable
	txt db 'Wprowadz wartosc osemkowa w kodzie U2 (100 000 - 77 777)',NULL
	txt1 db 13,10,'wartosc BIN: ',NULL
	txt2 db 13,10,'wartosc OCT: ',NULL
	txt3 db 13,10,'wartosc DEC: ',NULL
	txt4 db 13,10,'wartosc HEX: ',NULL
	tab db 0, 0, 0, 0, 0, 0