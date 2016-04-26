
section .text

GLOBAL print
GLOBAL _start
EXTERN main

_start:
	mov		eax,esp
	add		eax,4
	push	eax  ; *argv[]
	push	dword [esp+4] ; cantidad de argumentos
	call	main
	mov		ebx,eax
	mov		eax,1  ; exit
	int		80h


print:
	push ebp
	mov ebp,esp
	push ebx ; conservo ebx

	mov ecx, [ebp+8]	; cadena
	mov edx, [ebp+12]	; longitud

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	pop ebx ; restauro ebx
	mov esp,ebp
	pop ebp
	ret	
