
section .start

GLOBAL _start

_start:
	mov	ebx,USER
	call print
	call exit
