section .text

GLOBAL _start

EXTERN exit
EXTERN printChar
EXTERN print
EXTERN printNum

_start:
	mov		ebp,esp
	mov		ebx,cadena
	call	print
	mov 	eax,[esp]
	call 	printNum
	mov		eax,10
	call	printChar
	call	exit

section .rodata
	cadena	db	"Cantidad de argumentos: ", 10, 0
