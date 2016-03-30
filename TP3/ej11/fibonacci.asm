
section .text

GLOBAL _start

fibonacci:
	cmp		ebx,1    ; caso base
	je		.exit
	test	ebx,ebx  ; caso base, me fijo si es cero
	jz		.exit
	dec		ebx
	push	ebx  ; guardo ebx porq me lo modificara la función al ser recursiva
	call	fibonacci ; fibonacci(n-1)
	pop		ebx  ; recupero ebx
	push	eax		  ; guardo fibonacci(n-1)
	dec		ebx
	call	fibonacci ; fibonacci(n-2)
	pop		ebx		  ; recupero fibonacci(n-2)
	add		ebx,eax   ; fibonacci(n-1) + fibonacci(n-2)
.exit:
	mov		eax,ebx
	ret

_start:
	mov		ebx,10
	call 	fibonacci
	mov		ebx,eax
	mov		eax,1
	int 	80h
