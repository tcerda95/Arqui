section .text
	GLOBAL 	_start
	EXTERN 	print
	EXTERN 	exit
	EXTERN 	printNum

_start:
	mov		ecx,100 ; imprimir múltiplos hasta el 100
	inc		ecx
	sub		ecx,dword [divisor]  ; ajusto el contador considerando que adelanto ax hasta el valor del divisor
	mov		eax,dword [divisor]  ; busco múltiplos a partir del divisor, debajo de él seguro q no hay
	mov		ebx,nueva_linea
.loop:
	mov		edx,0
	push	eax		; salvo el contenido de ax
	div		dword [divisor]
	pop		eax		; recupero el cnotenido de ax
	test	edx,edx	; veo si ax es múltiplo chequeando que su resto sea cero
	jnz		.continue
	call 	printNum
	call	print	; imprime una nueva linea
.continue:
	inc		eax
	loop	.loop
	call 	exit	

section .rodata
	divisor		dw	10,0	; imprimir múltiplos de 10
	nueva_linea	db	10,0
