	.file	"main.c"
	.intel_syntax noprefix
	.comm	c,4,4
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	mov	eax, 0
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
