format PE Console 4.0
entry start
include 'win32ax.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
	clrscr
	ustaw_kursor 1,5
	wyswietl txt1
	cinvoke scanf, <"%lf">, zm1
	;%lf - long float, %f, %3f
	;%d - double

	ustaw_kursor 2,5
	cinvoke printf, <"+",10,13>
  
  ustaw_kursor 3,5
	cinvoke printf, <"Dana 2 = ">
	cinvoke scanf, <"%lf">, zm2
		     
			 ; kolejna zmienna calkowita %d 

;wyn = zm1 + zm2
	finit
	fld [zm1] ;pobierz zmienna zm1
	fld [zm2] ;pobierz zmienna zm2
	faddp ;dodaj
	fstp [wyn] ;zapisz st0 do wyn

;kod policzenia przedzialu i kroku, wartosci w funkcji
;wynik do zmienej typu double i wyswietlic w taki sposób jak poniżej na 2x 32 bit
;wyswietlenie wyniku - spos�b 2

	ustaw_kursor 5,5
	cinvoke printf, <'Wynik  = %.3lf ',0>, dword [wyn], dword [wyn+4] 
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
	wyn  dq 0
	dz   dw 10

	txt1 db 'Dana 1 = ',0
	txt2 db 'Dana 2 = ',0
	txt4 db 'Nastepne mnozenie (t/n)?',0



