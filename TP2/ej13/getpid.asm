section .text

GLOBAL _start

EXTERN printNum
EXTERN exit

_start:
	mov		eax,20
	int		80h
	call	printNum
	call	exit
