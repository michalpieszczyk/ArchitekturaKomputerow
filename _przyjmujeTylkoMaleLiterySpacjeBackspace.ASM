format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
    wyswietl txt1

ety1:
    pob_znak

    cmp al, 20h
    je ety2
    cmp al, 08h
    je ety3
    cmp al, 61h
    jb ety1
    cmp al, 7Ah
    ja ety1

ety2:
    wysw_znak al
    jmp ety1

ety3: ;backspace
    wysw_znak 08h
    wysw_znak ' '
    wysw_znak 08h
    jmp ety1

section '.data' data readable writeable
	txt1 db 'Wprowadz tylko male litery',13,10,NULL