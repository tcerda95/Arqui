
section .text

GLOBAL _start

EXTERN print
EXTERN toUpperString
EXTERN exit

_start:
	mov		eax,3
	mov		ebx,0
	mov		ecx,cadena
	mov		edx,500
	mov		byte [cadena+5],80  ; SE PISA O NO SE PISA POR '\0' SI PONGO "1234\n" con el debugger imprime "1234\nP", sin él "1234\n" ??
	int		80h
	mov		ebx,cadena
	call	toUpperString
	call	print
	call	exit

section .bss
	cadena	resb  500
