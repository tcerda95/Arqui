	.file	"sinIniEsc.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	sub	esp, 96
	mov	DWORD PTR [ebp-84], 1
	mov	DWORD PTR [ebp-24], 5
	mov	DWORD PTR [ebp-4], 9
	mov	DWORD PTR [ebp-88], 6
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
