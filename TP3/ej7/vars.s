	.file	"ini.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	DWORD PTR [ebp-16], 4
	mov	DWORD PTR [ebp-12], 1
	mov	DWORD PTR [ebp-8], 3
	mov	DWORD PTR [ebp-4], 2
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
