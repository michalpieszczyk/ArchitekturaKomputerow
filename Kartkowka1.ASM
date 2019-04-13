;MICHAL PIESZCZYK
format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:

	ustaw_kursor 10, 2
	wyswietl witaj
	ustaw_kursor 12, 2
	mov bl, 0
	mov esi, 0

ety1:
	mov al, [txt+esi]
	cmp al, 24h
	je koniec
	cmp al, 41h
	jb ety2
	cmp al, 5Ah
	ja ety2
	add bl, 1
	wysw_znak al
	inc esi
	jmp ety1


ety2:
	inc esi
	jmp ety1

koniec:
	ustaw_kursor 15,2
	wyswietl koncowy
	mov al, bl
	;call wysw_licz
	add al, 30h
	wysw_znak al

	pob_znak


;proc wysw_licz stdcall, ; umieœciæ parametry funkcji
;add al, 30h
;wysw_znak al

;	 ret
;endp

section '.data' data readable writeable
witaj db 'Wyswietlamy liczbe duzych liter w zmiennej tekstowej', NULL
koncowy db 'napis ma dlugosc: ', NULL
txt db 'TeksT$'

