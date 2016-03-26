section .text
	GLOBAL 	_start
	EXTERN 	print
	EXTERN	printNum
	EXTERN  printChar
	EXTERN 	exit

_start:
	mov		ecx,10	; factorial a calcular
	mov		eax,1 ; acumulador
	mov		edx,0 ; no puede haber parte alta de multiplicación	
	test	ecx,ecx
	jz		.exit
.loop:
	mul		ecx
	test	edx,edx
	jnz		.error_num
	loop	.loop
	call	printNum
	mov		eax,10
	call	printChar
.exit:
	call	exit
.error_num:
	mov		ebx,msg_error_big
	call	print
	mov		ebx,2
	jmp		.exit

section .rodata
	msg_error_big	db	"error: número demasiado grande", 10, 0
