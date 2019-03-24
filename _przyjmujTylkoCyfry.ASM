format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
    wyswietl txt1

ety1:
    pob_znak

    cmp al,'0'
    jb ety1
    cmp al,'9'
    ja ety1
    wysw_znak al
    jmp ety1


ety2:
    wyswietl txt2

section '.data' data readable writeable
	txt1 db 'Wprowadz tylko cyfry',13,10,NULL
    txt2 db 13,10,'Wprowadzono znak - swietnie!',NULL