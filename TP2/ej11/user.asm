
section .text

GLOBAL _start

EXTERN exit
EXTERN print
EXTERN printChar

_start:
	mov		ebp,esp
	mov		edx,[ebp]
	mov		ebx,[ebp+44h+4*edx]
	call	print
	mov		eax,10
	call	printChar
	call	exit
	ret
