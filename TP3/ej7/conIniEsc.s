	.file	"conIniEsc.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 80
	lea	edx, [ebp-84]
	mov	eax, 0
	mov	ecx, 20
	mov	edi, edx
	rep stosd
	mov	DWORD PTR [ebp-84], 1
	mov	DWORD PTR [ebp-44], 10
	add	esp, 80
	pop	edi
	pop	ebp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
