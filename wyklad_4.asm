format PE Console 4.0

entry start
include 'win32a.inc'
include 'win_macros.inc'

section '.text' code readable executable
start:
    mov al, 9
    mov [y+2], al

    mov bl, [y+2]
    add bl, 30h
    wysw_znak bl
	
	pob_znak
	end_prog

section '.data' data readable writeable
	ala db '123456789$'
    x dw 3
    y db 1, 2, 3, 4, 5
