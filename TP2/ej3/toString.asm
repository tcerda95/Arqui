
GLOBAL toString

section .text

; eax: número a guardar en el string
; ebx: puntero a zona donde se almacenará el string

toString:
	pushad
	pushf
	mov		ecx,0 	; longitud del string
.loop:
	mov		edx,0	; borramos el resto
	div		dword [divisor]		; divido por 10 a edx:eax, el cociente queda en eax y el modulo en edx, pues divisor de 32 bits
	add		edx,'0'	; paso al ASCII del número
	push	edx		; guardo el valor ascii en el stack
	inc		ecx		; incremento el contador de longitud
	test	eax,eax	; si el cociente no es 0, sigo loopeando
	jnz		.loop
.copy_loop:     ; tomo los valores de la pila y los copio al string
	pop		eax   ; tomo el valor ascii de la pila
	mov		[ebx],al ; copio en el string
	inc		ebx 	; incremento el puntero
	loop	.copy_loop
	mov		byte [ebx],0 ;'\0' al final
	popf
	popad
	ret

section	.rodata
	divisor		dw	10

