
section .text

GLOBAL _start
EXTERN print
EXTERN exit

_start:
	call	get_pid ; sys_call para obtener pid
	push	eax	  ; guardo el pid del padre
	mov		eax,2 ; sys_call fork
	int 	80h
	pop		ecx
	call	get_pid ; sys_call para obtener pid
	mov		ebx,cadena
	cmp		eax,ecx ; comparo los pid
	je		.es_padre
	mov		ebx,cadena2
.es_padre:
	call 	print
	call 	exit

get_pid:
	mov 	eax,20
	int		80h
	ret

section .data
cadena	db	"Soy el padre",10,0
cadena2	db	"Soy el hijo",10,0
