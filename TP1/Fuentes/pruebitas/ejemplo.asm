section .text
	global _start

_start:
	Mov 	DX,0FFh
	Mov 	BX,20h
	Add 	DX,BX
	Push	DX
	Push 	4
	Pop 	CX

Ciclo:
	Inc		BX
	Dec		CX
	Jnz		Ciclo

	Mov		EAX,parametros

	Mov		AH,[parametros]
	Mov		BL,[parametros+1]
	Add		AH,BL
	Mov		[salida], AH

	mov 	eax,1 ; el syscall para exit (sys_exit)
	mov		ebx,0 ; exit con codigo 0 (no error)
	int		80h   ; llama al kernel

section .data
parametros		db		11h, 12h, 13h
salida			db		0
