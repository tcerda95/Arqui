
section .text

GLOBAL _start
EXTERN main

_start:
	call	main  ; como en [ESP] se encuentra argc y en [ESP+4] *argv[] no hace falta nada más
	mov		ebx,eax
	mov		eax,1
	int		80h
