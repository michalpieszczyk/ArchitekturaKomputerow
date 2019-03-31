format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
	wyswietl txt
	mov cx,
wczyt_pierw:
	pob_znak
	cmp al, '0'
	jb wczyt_pierw
	cmp al, '1'
	ja wczyt_pierw
	je minus




	mov [pom], eax


wysw_oct:
	wyswietl txt2

	mov bx, [zm1]
	shr bx, 9
	add bx, 30h
	mov [zm2], bx
	wyswietl zm2

	mov bx, [zm1]  ;pierwsza cyfra oct
	shr bx, 6
	add bx, 30h
	mov [zm2], bx
	wyswietl zm2

	mov bx, [zm1]
	shl bx, 2
	shr bx, 5
	add bx, 30h
	mov [zm2], bx
	wyswietl zm2

	mov bx, [zm1]
	and bx, 7
	add bx, 30h
	mov [zm2], bx
	wyswietl zm2

minus:
	wysw_znak '-'
	jmp

backspace:
	wysw_znak 08h
	wysw_znak ' '
	wysw_znak 08h
	jmp


       ; mov bx, al
	;wysw_znak al

       ; mov bx,[zm1]  ;druga cyfra oct
      ;  shl bx,2

       ; shr bx,5
       ; add bx,30h
       ; wysw_znak bx

       ; mov bx,[zm1] ; trzecia dyfra oct
       ; and bx,7
       ; add bx,30h
       ; wysw_znak bx


	pob_znak
	end_prog


section '.data' data readable writeable
	txt db 'Wprowadz wartosc osemkowa w kodzie U2 (100 000 - 77 777)',NULL
	txt1 db 13,10,'wartosc BIN: ',NULL
	txt2 db 13,10,'wartosc OCT: ',NULL
	txt3 db 13,10,'wartosc DEC: ',NULL
	txt4 db 13,10,'wartosc HEX: ',NULL
	zm1  dw 30
	zm2 dw 0
	pom dd 0