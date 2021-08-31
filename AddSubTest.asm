.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
	Rval SDWORD ?
	Xval SDWORD 26
	Yval SDWORD 30
	Zval SDWORD 40
.code
main PROC
	; INC and DEC
	mov ax,1000h
	inc ax				;1001h
	dec ax				;1000h
	
	;Expression: Rval = -Xval + (Yval - Zval)
	mov eax,Xval
	neg eax				;-26
	mov ebx,Yval
	sub ebx,Zval		;-10
	mov eax,ebx
	mov Rval,eax		;-36

	;zero flag examples
	mov cx,1
	sub cx,1			;zf = 1
	mov ax,0FFFFh
	inc ax				;zf = 1
	
	;sign flag examples
	mov cx,0
	sub cx,1			;sf = 1
	mov ax,7FFFh		
	add ax,2			;sf = 1
	
	;carry flag examples
	mov al,0FFh
	add al,1			;cf = 1, al = 00

	;overflow flag examples
	mov al,+127
	add al,1			;of = 1
	mov al,-128
	add al,1			;of = 1

	INVOKE ExitProcess,0
main ENDP
END main
