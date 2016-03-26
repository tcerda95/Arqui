
GLOBAL main
EXTERN printf

section .rodata
fmt db "Cantidad de argumentos: %d",10,  0
fmtArgv db "argv[%d] = %s", 10, 0

section .text
main:
	push	ebp		; armado de stack frame
	mov		ebp,esp

	push	dword[ebp+8]		; argumento variable --> valor del %d
	push	fmt
	call	printf
	add		esp,2*4

	mov		ecx, dword[ebp+8] ; cantidad de argumentos
	mov		ebx,0	; argv[ebx]
	mov		esi,[ebp+12]	; argv  estamos pasando el arreglo
	cld		; autoincremento de ESI
.loop:
	lodsd   ; eax = [ESI]  ESI = ESI + 4
			; en este caso, eax = *argv   argv = argv + 1

	push	ecx  ; salvo el valor de ecx pues printf me lo modificará

	push	eax  ; *argv
	push	ebx		; indice
	push	fmtArgv ; formato
	call 	printf
	add		esp,4*3 ; borramos los datos usados de la pila

	pop		ecx ; recuperamos el valor de ecx

	inc		eax
	loop	.loop

	mov		esp,ebp
	pop		ebp  ; desarmado de stack frame

	mov		eax,0 ; valor de retorno de main
	ret

