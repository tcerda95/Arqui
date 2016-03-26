
section .text

GLOBAL _start
EXTERN printNum
EXTERN print
EXTERN exit
EXTERN printChar

_start:
	mov 	ebp,esp
	mov		ecx,[esp]
	mov		edx,0
.loop:
	call 	printArgFrame
	mov		eax,[ebp+4*edx+4]
	mov		ebx,eax
	call	print
	mov		eax,10
	call	printChar
	inc		edx
	loop	.loop
	call 	exit

; en edx se debe encontrar el valor del indice del arg
printArgFrame:
	push	eax
	mov		eax,edx
	mov		ebx,principio_cadena
	call	print
	call	printNum
	mov		ebx,final_cadena
	call	print
	pop		eax
	ret

section .rodata
	principio_cadena  db	"argv[",0
	final_cadena	  db	"]: ",0

section .bss
	argmuento	resb	200
