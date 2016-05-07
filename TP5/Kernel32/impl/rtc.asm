
GLOBAL month
GLOBAL seconds
GLOBAL minutes
GLOBAL hour

section .text

translate:
	mov cl, 16
	div cl   ; divido por 16
	mov ch, ah  ; guardo el resto
	mov cl, 10
	mul cl   ; multiplico el cociente por 10
	add al,ch  ; sumo el resto
	movzx eax, al
	ret

extract:
	out 70h, al
	in	al, 71h
	movzx eax, al
	call translate
	ret

month:
	mov al, 8
	call extract
	ret

seconds:
	mov al, 0
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
