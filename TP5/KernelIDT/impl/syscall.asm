
GLOBAL syscall

section .text

syscall:
	push ebp
	mov ebp, esp

	push ebx

	mov eax,[ebp+8]
	mov ebx,[ebp+12]
	mov ecx,[ebp+16]
	mov edx,[ebp+20]

	int 80h

	pop ebx

	mov esp, ebp
	pop ebp
	ret
