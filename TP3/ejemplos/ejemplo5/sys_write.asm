
section .text

GLOBAL sys_write

ALIGN 4
sys_write:
	push	ebp
	mov		ebp,esp
	
	push	ebx   ; preservo ebx
	mov		eax,4	; sys_write
	mov		ebx,[ebp+8]  ; argumento fd
	mov		ecx,[ebp+12] ; argumento buffer
	mov		edx,[ebp+16] ; argumento size
	int		80h

	pop		ebx  ; recupero ebx

	mov		esp,ebp
	pop		ebp
	ret
