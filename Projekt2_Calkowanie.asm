format PE Console 4.0
entry start
include 'win32ax.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
	wyswietl txt0
	wysw_znak 13
	wysw_znak 10
	;clrscr
	wyswietl txt1
	cinvoke scanf, <"%lf">, zm1
	;%lf - long float, %f, %3f
	;%d - double
	wyswietl txt2
	cinvoke scanf, <"%lf">, zm2

	wyswietl txt3
	cinvoke scanf, <"%d">, zm3     
	; kolejna zmienna calkowita %d 

;wyn = zm1 + zm2
	finit
	fld [zm2] ;pobierz zmienna zm1
	fsub [zm1] 
	;fld [zm2] ;pobierz zmienna zm2
	;faddp ;dodaj
	fstp [przed] ;zapisz st0 do wyn

	fld [przed]
	fidiv [zm3]
	fstp [krok]
	fld [zm1]
	fadd [krok]
	fstp [obecna]
       ; cinvoke printf, <'Obecna  = %.3lf ',0>, dword [obecna], dword [obecna+4]
	cinvoke printf, <'Przedzial  = %.3lf ',0>, dword [przed], dword [przed+4]
	wysw_znak 13
	wysw_znak 10
	cinvoke printf, <'Krok  = %.3lf ',0>, dword [krok], dword [krok+4]
	wysw_znak 13
	wysw_znak 10


zwieksz:
	fld [obecna]
	fadd [krok]
	fstp [obecna]
	cinvoke printf, <'Suma  = %.3lf ',0>, dword [suma], dword [suma+4]
	wysw_znak 13
	wysw_znak 10
	;fcom [zm2]
	fld [zm2]
	fcom [obecna]
	fstsw ax
	sahf
	jb dodane

	

sumuj:
	fld [obecna]
	fcos
	fdiv [obecna]
	fadd [suma]
	fstp [suma]
	jmp zwieksz



dodane:
	fld [zm1]
	fcos
	fdiv [zm1]
	fstp [zm1]
	
	fld [zm2]
	fcos
	fdiv [zm2]
	fadd [zm1]
	fidiv [dwa]
	fadd [suma]
	fstp [wyn]
	

;kod policzenia przedzialu i kroku, wartosci w funkcji
;wynik do zmienej typu double i wyswietlic w taki sposób jak poniżej na 2x 32 bit
;wyswietlenie wyniku - spos�b 2


	wysw_znak 13
	wysw_znak 10
	cinvoke printf, <'Wynik  = %.3lf ',0>, dword [wyn], dword [wyn+4] 

	;dzielimy na dwie czesci 64 bit / 2 = 32 bit na kazde wyswietlenie

; zako�czenie programu lub powr�t
koniec:
	pob_znak

wyjdz:
	end_prog

		    
section '.data' data readable writeable
	zm1  dq 0
	zm2  dq 0
	zm3  dw 0
	przed dq 0
	wyn  dq 0
	krok dq 0
	obecna dq 0
	suma dq 0
	dwa  dw 2 
	jeden dw 1
	zero dw 0
	dz   dw 10


	txt0 db 'Calkowanie metoda trapezow funkcji cos(x)/x z przedzialu a do b',0
	txt1 db 'Podaj poczatek przedzialu calkowania (a): ',0
	txt2 db 'Podaj koniec przedzialu calkowania (b): ',0
	txt3 db 'Podaj ilosc krokow (n): ',0

