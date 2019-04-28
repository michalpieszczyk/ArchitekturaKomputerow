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

;kod policzenia przedzialu i kroku, wartosci w funkcji
;wynik do zmienej typu double i wyswietlic w taki sposób jak poniżej na 2x 32 bit
;wyswietlenie wyniku - spos�b 2

	ustaw_kursor 5,5
	cinvoke printf, <'Przedzial  = %.3lf ',0>, dword [przed], dword [przed+4] 
	cinvoke printf, <'Krok  = %.3lf ',0>, dword [krok], dword [krok+4] 
	;dzielimy na dwie czesci 64 bit / 2 = 32 bit na kazde wyswietlenie

; zako�czenie programu lub powr�t
ety4:
	ustaw_kursor 7,5
	wyswietl txt4
et5:
	pob_znak
	cmp al,'t'
	jz start  
	cmp al,'n'
	jne et5
wyjdz:
	end_prog

		      




section '.data' data readable writeable
	zm1  dq 0
	zm2  dq 0
	zm3  dw 0
	przed dq 0
	wyn  dq 0
	krok dq 0
	dz   dw 10

	txt0 db 'Calkowanie metoda trapezow funkcji cos(x)/x z przedzialu a do b',0
	txt1 db 'Podaj poczatek przedzialu calkowania (a): ',0
	txt2 db 'Podaj koniec przedzialu calkowania (b): ',0
	txt3 db 'Podaj ilosc krokow (n): ',0
	txt4 db 'Nastepne mnozenie (t/n)?',0


