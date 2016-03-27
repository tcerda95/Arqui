
GLOBAL sys_write
GLOBAL sys_read
GLOBAL sys_open
GLOBAL sys_close

; sys_open(filename, file_access_mode)
sys_open:
	push	ebp
	mov		ebp,esp

	push	ebx		; preservo ebx

	mov		eax,5	; sys_open
	mov		ebx,[ebp+8]  ; filename
	mov		ecx,[ebp+12] ; file access mode: read-only(0), write-only(1), read-write(2)
	mov		edx,0777	 ; file permission: read write excecute by all
	int		80h

	pop		ebx		; recupero ebx

	mov		esp,ebp
	pop		ebp
	ret				; en eax quedó el file descriptor

; sys_close(filename)
sys_close:
	push	ebp
	mov		ebp,esp

	push	ebx		; preservo ebx

	mov		eax,6	; sys_close
	mov		ebx,[ebp+8]
	int		80h

	pop		ebx		; recupero ebx

	mov		esp,ebp
	pop		ebp
	ret

; sys_read(buffer_pointer, bytes, file_descriptor)
sys_read:
	push	ebp
	mov		ebp,esp

	push	ebx

	mov		eax,3  ; sys_read
	mov		ebx,[ebp+16] ; file descriptor
	mov		ecx,[ebp+8]  ; buffer_pointer: puntero donde se guardaran los bytes leidos
	mov		edx,[ebp+12] ; bytes: número de bytes a leer
	int		80h

	pop		ebx

	mov		esp,ebp
	pop		ebp
	ret

; sys_write(buffer_pointer, bytes, file_descriptor)
sys_write:
	push	ebp
	mov		ebp,esp

	push	ebx

	mov		eax,4 ; sys_write
	mov		ebx,[ebp+16]  ; file_descriptor
	mov		ecx,[ebp+8]	  ; buffer_pointer: puntero donde se leerán los bytes a escribir
	mov		edx,[ebp+12]  ; bytes: número de bytes a escribir
	int		80h

	pop		ebx

	mov		esp,ebp
	pop		ebp
	ret
