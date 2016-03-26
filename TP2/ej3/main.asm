
section .text
	GLOBAL _start
	EXTERN toString
	EXTERN exit
	EXTERN print

_start:
	mov 	eax,294967295
	mov		ebx,cadena
	call	toString
	call	print
	call	exit
	ret

section .bss
cadena resb 16	; reserva 16 bytes
