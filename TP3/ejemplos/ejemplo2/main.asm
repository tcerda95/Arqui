
GLOBAL main
EXTERN puts, sprintf

section .rodata
fmt db "%d", 0
number dd 1234567890

section .text
main:
	push	dword [number]  ; los argumentos se pushean de derecha a izquierda
	push	fmt
	push	buffer
	call	sprintf    ; sprintf(char *str, cont char *ftm, ...)
	add		esp,3*4  ; "borramos" los datos ya usados de la pila
	push	buffer
	call	puts
	add		esp,4 ; "borramos" los datos ya usados de la pila
	mov		eax,0 ; valor de retorno de main
	ret
	
section .bss
buffer	resb  40
