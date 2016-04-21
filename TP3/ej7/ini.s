	.file	"ini.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%s%d"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	edi
	push	ecx
	sub	esp, 96
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	edx, [ebp-104]
	mov	eax, 0
	mov	ecx, 21
	mov	edi, edx
	rep stosd
	mov	DWORD PTR [ebp-104], 4
	mov	DWORD PTR [ebp-100], 9
	mov	DWORD PTR [ebp-20], 1936614765
	mov	DWORD PTR [ebp-16], 6646369
	mov	eax, DWORD PTR [ebp-12]
	sub	esp, 4
	push	eax
	lea	eax, [ebp-20]
	push	eax
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	edx, DWORD PTR [ebp-12]
	xor	edx, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	lea	esp, [ebp-8]
	pop	ecx
	pop	edi
	pop	ebp
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
