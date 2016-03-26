
section .text
	GLOBAL _start

_start:
	mov ecx,cadena
	mov edx,longitud
	call print
	call exit

print:
	push eax
	push ebx
	mov	eax,4 ; SYSCALL WRITE
	mov	ebx,1 ; Standard output
	int 80h
	pop ebx
	pop eax
	ret

exit:
	mov eax,1 ; SYSCALL EXIT
	mov ebx,0 ; return 0
	int 80h

section .data
	cadena db "Hello World", 10
	longitud equ $-cadena
