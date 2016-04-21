	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 36
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	DWORD PTR [ebp-25], 1819043176
	mov	DWORD PTR [ebp-21], 1870078063
	mov	DWORD PTR [ebp-17], 174353522
	mov	BYTE PTR [ebp-13], 0
	sub	esp, 12
	lea	eax, [ebp-25]
	push	eax
	call	magia
	add	esp, 16
	sub	esp, 12
	lea	eax, [ebp-25]
	push	eax
	call	printf
	add	esp, 16
	mov	eax, 0
	mov	edx, DWORD PTR [ebp-12]
	xor	edx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail
.L3:
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.globl	magia
	.type	magia, @function
magia:
	push	ebp
	mov	ebp, esp
	jmp	.L5
.L7:
	mov	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	cmp	al, 96
	jle	.L6
	mov	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	cmp	al, 122
	jg	.L6
	mov	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	sub	eax, 32
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax], dl
.L6:
	add	DWORD PTR [ebp+8], 1
.L5:
	mov	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	test	al, al
	jne	.L7
	pop	ebp
	ret
	.size	magia, .-magia
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
