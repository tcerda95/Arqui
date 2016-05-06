
GLOBAL main
EXTERN printf

section .rodata
	cadenaCant 	db 	"Cantidad de args: %d",10,0
	cadena		db	"argv[%d]:%s",10,0

section .text
main:
	push ebp
	mov ebp,esp
	push dword [ebp+8]
	push cadenaCant
	call printf
	add esp,8
	mov ecx, [ebp+8]
	mov edx, [ebp+12]
	mov eax, 0
.loop:
	pushad
	push dword [edx+eax*4]
	push eax
	push cadena
	call printf
	add esp,12
	popad
	inc eax
	loop .loop
	mov esp,ebp
	pop ebp
	mov eax,0
	ret
