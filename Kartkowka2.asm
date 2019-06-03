format PE Console 4.0
entry start
include 'win32ax.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:


     ;cinvoke scanf, <"%lf">, zm1
     ;a = (y1-y2)/(x1-x2)
     ;b = (y2 - a * x2)

    finit
    fild [y1]
    fsub [y2]
    fstp [pom1]

    fild [x1]
    fsub [x2]
    fstp [pom2]

    fld [pom1]
    fdiv [pom2]
    fstp [a]

    fld [a]
    fmul [x2]
    fstp [pom3]

    fld [y2]
    fsub [pom3]
    fstp [b]



    wysw_znak 13
    wysw_znak 10
    cinvoke printf, <'Wynik a = %.3lf ',0>, dword [a], dword [a+4]

    wysw_znak 13
    wysw_znak 10
    cinvoke printf, <'Wynik b = %.3lf ',0>, dword [b], dword [b+4]


koniec:
    pob_znak

wyjdz:
    end_prog

		    
section '.data' data readable writeable
    x1 dd 1
    x2 dq 10.3
    y1 dw -20
    y2 dq 30.4
    a dq  0
    b dq  0

    pom1 dq 0
    pom2 dq 0
    pom3 dq 0

    zm3  dw 0



    txt0 db 'Podaj wartosc x: ',0
