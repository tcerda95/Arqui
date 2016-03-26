
section .text

GLOBAL main
EXTERN hello_world

main:
	call	hello_world
	mov		eax,0
	ret
