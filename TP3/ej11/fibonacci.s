	.file	"fibonacci.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"%d\n"
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
	sub	esp, 4
	sub	esp, 12
	push	10
	call	fibonacciASM
	add	esp, 16
	sub	esp, 8
	push	eax
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
	push	ebp
	mov	ebp, esp
	push	ebx
	sub	esp, 4
	cmp	DWORD PTR [ebp+8], 0
	je	.L3
	cmp	DWORD PTR [ebp+8], 1
	jne	.L4
.L3:
	mov	eax, DWORD PTR [ebp+8]
	jmp	.L5
.L4:
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 1
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp+8]
	sub	eax, 2
	sub	esp, 12
	push	eax
	call	fibonacci
	add	esp, 16
	add	eax, ebx
.L5:
	mov	ebx, DWORD PTR [ebp-4]
	leave
	ret
	.size	fibonacci, .-fibonacci
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
