;Data transfer examples

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
	val1 WORD 1000h
	val2 WORD 2000h
	arrayB BYTE 10h,20h,30h,40h,50h
	arrayW WORD 100h,200h,300h
	arrayD DWORD 10000h,20000h

.code
	main PROC
	;Demonstrating MOVZX instruction
	mov bx,0A69Bh		
	movzx eax,bx		; EAX = 0000A69Bh
	movzx edx,bl		; EDX = 0000009Bh
	movzx cx,bl			; CX = 009Bh

	;Demonstrating MOVSX instruction
	mov bx,0A69Bh
	movsx eax,bx
	movsx edx,bl
	mov bl,7Bh
	movsx cx,bl

	;Memory to memory exchange
	mov ax,val1			;ax = 1000h
	xchg ax,val2		;ax = 2000h, val2 = 1000h
	mov val1,ax			;val1 = 2000h

	;Direct offset adressing (byte)
	mov al,arrayB			;al = 10h
	mov al,[arrayB+1]		;al = 20h
	mov al,[arrayB+2]		;al = 30h

	;Direct offset adressing (word)
	mov ax,arrayW			;ax = 100h
	mov ax,[arrayW+2]		;ax = 200h

	;Direct offset adressing (dword)
	mov eax,arrayD			;eax = 10000h
	mov eax,[arrayD+4]		;eax = 20000h
	mov eax,[arrayD+4]		;eax = 20000h




	INVOKE ExitProcess,0
main ENDP
END main