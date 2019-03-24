format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
    wyswietl txt1

ety1:
    pob_znak

    cmp al, 41h
    jb ety1
    cmp al, 5Ah
    ja ety1
    wysw_znak al
    jmp ety1

section '.data' data readable writeable
	txt1 db 'Wprowadz tylko duze litery',13,10,NULL