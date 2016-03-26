
section .text

GLOBAL factorial

factorial:
	push	ebp
	mov		ebp,esp
	mov		edx,[esp+8]  ; n
	mov		eax,1
	test	edx,edx
	jz		.leave
	sub		esp,16  ; reservo espacio para las variables  ¿PORQUE 16 BYTES?
	mov		[ebp-4],edx  ; guardo n en el stack
	dec		edx		; n-1
	push	edx		; paso como parámetro a la siguiente llamada de la función
	call	factorial
	mov		edx,[ebp-4]   ; n
	mul		edx    ; eax = n * factorial(n-1)
.leave:
	mov		esp,ebp
	pop		ebp
	ret
