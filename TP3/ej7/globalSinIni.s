	.file	"globalSinIni.c"
	.intel_syntax noprefix
	.comm	array,32,32
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
