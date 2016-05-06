	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	sub	esp, 80
	mov	DWORD PTR [ebp-68], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR [ebp-68]
	mov	DWORD PTR [ebp-64+eax*4], 6
	add	DWORD PTR [ebp-68], 1
.L2:
	cmp	DWORD PTR [ebp-68], 15
	jle	.L3
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
