
GLOBAL print
GLOBAL exit
GLOBAL toString
GLOBAL printNum
GLOBAL printChar

section .text

;-----------------------------------------------------------
; print - imprimer una cadena en la salida estandar
;-----------------------------------------------------------
; Argumentos:
;	ebx: cadena a imprimer en pantalla, terminada con 0
;-----------------------------------------------------------
print:
	pushad		; hago backup de los registros

	call strlen
	mov ecx, ebx	; la cadena esta en ebx
	mov edx, eax	; en eax viene el largo de la cadena

	mov ebx, 1		; FileDescriptor (STDOUT)
	mov eax, 4		; ID del Syscall WRITE
	int 80h
	
	popad 		; restauro los registros
	ret	
	
;-----------------------------------------------------------
; exit - termina el programa
;-----------------------------------------------------------
; Argumentos:
;	ebx: valor de retorno al sistema operativo
;-----------------------------------------------------------
exit:
	mov eax, 1		; ID del Syscall EXIT
	int 80h			; Ejecucion de la llamada


;-----------------------------------------------------------
; strlen - calcula la longitud de una cadena terminada con 0
;-----------------------------------------------------------
; Argumentos:
;	ebx: puntero a la cadena
; Retorno:
;	eax: largo de la cadena
;-----------------------------------------------------------
strlen:
	push ecx ; preservo ecx	
	push ebx ; preservo ebx
	pushf	; preservo los flags

	mov ecx, 0	; inicializo el contador en 0
.loop:			; etiqueta local a strlen
	mov al, [ebx] 	; traigo al registo AL el valor apuntado por ebx
	cmp al, 0	; lo comparo con 0 o NULL
	jz .fin 	; Si es cero, termino.
	inc ecx		; Incremento el contador
	inc ebx
	jmp .loop
.fin:				; etiqueta local a strlen
	mov eax, ecx	
	
	popf
	pop ebx ; restauro ebx	
	pop ecx ; restauro ecx
	ret

; al: ASCII del carácter a imprimir
printChar:
	pushad
	mov		[char],al
	mov		eax,4
	mov		ebx,1
	mov		ecx,char  ; dirección del caracter
	mov		edx,1	  ; longitud
	int		80h
	popad
	ret

; eax: número a guardar en el string
; ebx: puntero a zona donde se almacenará el string

toString:
	pushad
	pushf
	mov		ecx,0 	; longitud del string
.loop:
	mov		edx,0	; borramos el resto
	div		dword [divisor]		; divido por 10 a edx:eax, el cociente queda en eax y el modulo en edx, pues divisor de 32 bits
	add		edx,'0'	; paso al ASCII del número
	push	edx		; guardo el valor ascii en el stack
	inc		ecx		; incremento el contador de longitud
	test	eax,eax	; si el cociente no es 0, sigo loopeando
	jnz		.loop
.copy_loop:     ; tomo los valores de la pila y los copio al string
	pop		eax   ; tomo el valor ascii de la pila
	mov		[ebx],al ; copio en el string
	inc		ebx 	; incremento el puntero
	loop	.copy_loop
	mov		byte [ebx],0 ;'\0' al final
	popf
	popad
	ret

; imprime el número que se encuentra en eax
printNum:
	push	ebx
	mov		ebx,cadena
	call	toString
	call	print
	pop		ebx
	ret	


section	.rodata
	divisor		dd	10

section	.bss
	cadena		resb  11  ; cadena para imprimir un número
	char		resb  1	  ; reservamos 1 byte para un caracter
