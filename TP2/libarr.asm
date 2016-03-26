
GLOBAL findSmallestIndex
GLOBAL findSmallest
GLOBAL sort
GLOBAL printArr


EXTERN printNum
EXTERN printChar

section .text

; imprime el arreglo al q apunta ebx
printArr:
	pushad
	pushf
	mov		al,'['
	call	printChar
.loop:
	mov		eax,[ebx]
	call	printNum
	mov		al,' '
	call	printChar
	add		ebx,elem_size
	loop	.loop
	mov		al,']'
	call	printChar
	popf
	popad
	ret

; recibe en ebx el puntero al arreglo
; recibe en ecx la longitud del arreglo
; devuelve en eax el indice del menor valor
findSmallestIndex:
	pushf
	push	esi
	push	edx
	mov		eax,0	; en eax guardo el indice del menor elemento
	mov		esi,0	; en esi guardo el indice del elemento actual
	mov		edx,[ebx+4*eax] ; en edx guardo el valor del menor elemento
.loop:
	cmp		edx,[ebx+4*esi]  ; comparo los elementos  NO ME DEJO COMPARAR cmp [ebx,4*eax],[ebx+4*edi]
	jle		.continue
	mov		eax,esi		; copio el indice actual si es menor
	mov		edx,[ebx+4*eax]
.continue:
	inc		esi
	cmp		esi,ecx		; me fijo si llegue al final del arreglo
	jne		.loop
	pop		edx
	pop		esi
	popf
	ret

; recibe en ebx el puntero al arreglo
; recibe en ecx la longitud del arreglo
; devuelve en eax el menor valor
findSmallest:
	push 	esi
	call 	findSmallestIndex
	mov		esi,eax
	mov		eax,[ebx+4*esi]
	pop		esi
	ret

; recibe en ebx el puntero al arreglo
; recibe en ecx el tamaño del arreglo
sort:
	pushad
	pushf
.loop:
	call	findSmallestIndex
	mov		edx,[ebx+4*eax]  ; valor más pequeño
	push	edx				; guardo ese valor
	mov		edx,[ebx]		; valor de menor indice
	mov		[ebx+4*eax],edx ; guardo el valor del menor indice en donde estaba el menor elemento 
	pop		edx				; recupero el valor del menor elemento
	mov		[ebx],edx		; guardo el valor más pequeño al comienzo
	add		ebx,elem_size	; avanzo ebx
	loop	.loop
	popf
	popad
	ret

section .data
	elem_size equ 4  ; tamaño de cada elemento del arreglo: 4 bytes
