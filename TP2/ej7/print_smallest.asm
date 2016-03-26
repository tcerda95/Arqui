
section .text

GLOBAL _start

EXTERN	findSmallest
EXTERN	printNum
EXTERN  print
EXTERN	exit

_start:
	mov		ecx,array_size	; guarda en ecx el tamaño*4
	shr		ecx,2	; divido por 4
	mov		ebx,array
	call	findSmallest
	call	printNum
	mov		ebx,new_line
	call	print
	call	exit

section .data
	array	dd	1234,800,3,7,5,3,45,900
	array_size	equ	$-array
	new_line	db	10,0
