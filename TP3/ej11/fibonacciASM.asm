
section .text

GLOBAL _start
GLOBAL fibonacciASM

fibonacciASM:
	push	ebp
	mov		ebp,esp
	mov		eax,[ebp+8] ; argumento
	cmp		eax,0
	je		.exit
	cmp		eax,1
	je		.exit
	push	ebx		; preservo ebx
	mov		edx,eax
	dec		edx  ; n-1
	push	edx   ; paso como argumento
	call	fibonacciASM  ; fibonacci(n-1)
	mov		ebx,eax  ; guardo el valor de fibonacci(n-1)
	pop		edx   ; recupero el valor de edx (n-1)
	dec		edx  ; n-2
	push	edx
	call	fibonacciASM
	add		eax,ebx ; eax = fibonacci(n-1) + fibonacci(n-2)
	mov		ebx,[ebp-4]   ; recuero el valor de ebx
.exit:
	mov		esp,ebp
	pop		ebp
	ret
