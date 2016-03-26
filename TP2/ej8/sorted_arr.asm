
GLOBAL _start

EXTERN sort
EXTERN printArr
EXTERN exit

section .text

_start:
	mov		ebx,arr
	mov		ecx,arr_size
	shr		ecx,2
	call	sort
	call	printArr
	call 	exit

section .data
	arr		dd	657,234,5,34,7,8,9,236,6,7489,5
	arr_size	equ		$-arr
