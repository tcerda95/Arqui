
section .text
	GLOBAL 	_start
	EXTERN 	toString
	EXTERN 	print
	EXTERN 	exit

_start:
	mov		ecx,20	; primeros números naturales
	mov		ebx,cadena
	mov		eax,0	; acumulador
.loop:
	add		eax,ecx
	loop	.loop	; decrementa ecx y si no es cero salta

	call	toString
	call	print
	call	exit

section .bss
	cadena	resb   20
