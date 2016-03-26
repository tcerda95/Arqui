
GLOBAL main
EXTERN printf

section .rodata
fmt db "Cantidad de argumentos: %d",10,  0

section .text
main:
	push	ebp		; armado de stack frame
	mov		ebp,esp

	push	dword [ebp+8]
	push	fmt
	call	printf
	add		esp,2*4

	mov		esp,ebp
	pop		ebp  ; desarmado de stack frame

	mov		eax,0 ; valor de retorno de main
	ret
