	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	copy
	.type	copy, @function
copy:
	push	ebp
	mov	ebp, esp
	sub	esp, 72
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [ebp-60], eax
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	sub	esp, 8
	lea	eax, [ebp+12]
	push	eax
	lea	eax, [ebp-44]
	push	eax
	call	strcpy
	add	esp, 16
	sub	esp, 8
	lea	eax, [ebp+12]
	add	eax, 10
	push	eax
	lea	eax, [ebp-44]
	add	eax, 10
	push	eax
	call	strcpy
	add	esp, 16
	mov	eax, DWORD PTR [ebp+40]
	mov	DWORD PTR [ebp-16], eax
	mov	eax, DWORD PTR [ebp-60]
	mov	edx, DWORD PTR [ebp-44]
	mov	DWORD PTR [eax], edx
	mov	edx, DWORD PTR [ebp-40]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR [ebp-36]
	mov	DWORD PTR [eax+8], edx
	mov	edx, DWORD PTR [ebp-32]
	mov	DWORD PTR [eax+12], edx
	mov	edx, DWORD PTR [ebp-28]
	mov	DWORD PTR [eax+16], edx
	mov	edx, DWORD PTR [ebp-24]
	mov	DWORD PTR [eax+20], edx
	mov	edx, DWORD PTR [ebp-20]
	mov	DWORD PTR [eax+24], edx
	mov	edx, DWORD PTR [ebp-16]
	mov	DWORD PTR [eax+28], edx
	mov	eax, DWORD PTR [ebp-60]
	mov	ecx, DWORD PTR [ebp-12]
	xor	ecx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	ret	4
	.size	copy, .-copy
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 84
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	DWORD PTR [ebp-76], 1702258035
	mov	DWORD PTR [ebp-72], 28530
	mov	WORD PTR [ebp-68], 0
	mov	DWORD PTR [ebp-66], 1919248997
	mov	DWORD PTR [ebp-62], 1768122723
	mov	DWORD PTR [ebp-58], 111
	mov	DWORD PTR [ebp-54], 0
	mov	DWORD PTR [ebp-48], 420
	lea	eax, [ebp-44]
	sub	esp, 12
	push	DWORD PTR [ebp-48]
	push	DWORD PTR [ebp-52]
	push	DWORD PTR [ebp-56]
	push	DWORD PTR [ebp-60]
	push	DWORD PTR [ebp-64]
	push	DWORD PTR [ebp-68]
	push	DWORD PTR [ebp-72]
	push	DWORD PTR [ebp-76]
	push	eax
	call	copy
	add	esp, 44
	mov	edx, DWORD PTR [ebp-12]
	xor	edx, DWORD PTR gs:20
	je	.L5
	call	__stack_chk_fail
.L5:
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
