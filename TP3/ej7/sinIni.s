	.file	"sinIni.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	sub	esp, 48
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
