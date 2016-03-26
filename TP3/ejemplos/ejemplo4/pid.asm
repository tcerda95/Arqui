
GLOBAL pid

section .text

pid:
	push	ebp
	mov		ebp,esp
	mov		eax,20  ; sys_getpid
	int		80h
	mov		esp,ebp
	pop		ebp
	ret
