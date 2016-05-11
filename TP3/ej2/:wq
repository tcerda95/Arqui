	.file	"args.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"Cantidad de argumentos %d"
	.text
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]  ; mov ecx,esp+4
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 4
	mov	eax, ecx
	sub	esp, 8
	push	DWORD PTR [eax]
	push	OFFSET FLAT:.LC0
	call	printf
	add	esp, 16
	mov	eax, 0
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.3-8ubuntu2~14.04) 4.9.3"
	.section	.note.GNU-stack,"",@progbits
