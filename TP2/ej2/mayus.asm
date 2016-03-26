
section .text
	GLOBAL _start
	GLOBAL toUpperString

_start:
	mov		ecx,cadena
	mov		edx,longitud
	call 	print
	mov		ebx,cadena
	call 	toUpperString
	call	print
	call	exit

; en ebx debe estar la dirección del string
; en ebx se econtrará el string modificado a mayusculas
toUpperString:
	push 	eax 	; guardo los valores de eax, ebx y los flags porq se modificarán
	push 	ebx
	pushf
.loop:
	mov		al,[ebx]
	test	al,al	; si no encontramos con \0 termina
	jz		.exit
	call 	toUpperChar
	inc		ebx
	jmp 	.loop
.exit:
	popf
	pop 	ebx
	pop		eax
	ret

; en al debe estar el caracter
toUpperChar:
	pushf
	call	isAlphaLower  ; si es minuscula el flag Z vale 0
	jnz		.exit
	sub		al, 'a' - 'A' ; pasa el caracter a mayusculas
	mov		[ebx], al	  ; reemplazamos el caracter por la mayuscula
.exit:
	popf
	ret

; en al debe estar el caracter
isAlphaLower:
	mov		ah,1
	test	ah, ah	; setteamos el flag Z a 1 para indicar q no es un alpha minus
	cmp		al, 'a'	; si al < 'a' salimos
	jl		.exit	
	cmp		al, 'z'	; si al > 'z' salimos
	jg		.exit
	mov		ah,0
	test	ah,ah 	; setteamos el flag Z a cero para indicar q es un alpha minus
.exit:
	ret

print:
	push	eax
	push	ebx
	mov		eax,4 ; SYSCALL WIRTE
	mov		ebx,1
	int 	80h
	pop 	ebx
	pop		eax
	ret

exit:
	mov		eax,1 ; SYSCALL EXIT
	mov		ebx,0
	int		80h

section .data
cadena	db	"h4ppy c0d1ng", 10, 0
longitud equ $-cadena
