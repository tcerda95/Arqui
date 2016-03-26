GLOBAL _start

section .text

_start:
	mov		eax,162
	mov		ebx,timeval
	mov		dword [tv_sec],5 ; va  esperar 5 segundos
	mov		dword [tv_usec],0
	mov		ecx,0
	int		80h
	mov		eax,1
	mov		ebx,0
	int		80h

section .data
	timeval:
		tv_sec	dd	0  ; podria directamente poner la cantidad de segundos aca
		tv_usec	dd	0
