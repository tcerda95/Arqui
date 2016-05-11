
GLOBAL month
GLOBAL seconds
GLOBAL minutes
GLOBAL hour

section .text

extract:
	push eax
	mov al, 0Bh
	out 70h, al
	in al, 71h
	or al, byte 00000100b
	out 71h, al 
	pop eax
	out 70h, al
	in  al, 71h
	movzx eax, al
	ret

seconds:
	mov al, 0
	call extract
	ret

month:
	mov al, 8
	call extract
	ret

minutes:
	mov al, 2
	call extract
	ret

hour:
	mov al, 4
	call extract
	ret
