
GLOBAL _start
EXTERN printNum
EXTERN exit

section .text

_start:
	mov		dword [esp-4],1819043176
	lea		eax,[esp-4]
	movzx	eax, byte [eax]
	call	printNum
	call	exit
