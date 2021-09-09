.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;create user defined types
PBYTE TYPEDEF PTR BYTE
PWORD TYPEDEF PTR WORD
PDWORD TYPEDEF PTR DWORD

.data
	arrayB BYTE 10h,20h,30h
	arrayW WORD 1,2,3
	arrayDW DWORD 4,5,6

;create some pointer variables
	ptr1 PBYTE arrayB
	ptr2 PWORD arrayW
	ptr3 PDWORD arrayDW

.code
main proc
	mov esi,ptr1
	mov al,[esi]
	mov esi,ptr2
	mov ax,[esi]
	mov esi,ptr3
	mov eax,[esi]
	invoke ExitProcess,0
main ENDP
END main
