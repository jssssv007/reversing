BITS 32
extern scanf
extern printf
section .data
	print:db "%d",0
	x:db"fibonacci value is %d",10,0
section .txt
	global main
	main:
		push ebp
		mov ebp,esp
		sub esp,0x10
		lea eax,[ebp-0x8]
		push eax
		push print
		call scanf
		mov eax,2
		mov ebx,1
		mov dword[ebp-0xc],0
	solution:
		mov dword[ebp-0x4],ebx
		add ebx,dword[ebp-0xc]
		mov ecx,dword[ebp-0x4]
		mov dword[ebp-0xc],ecx
		add eax,1
		cmp eax,dword[ebp-0x8]
		jle solution
		push ebx
		push x
		call printf
		leave
		ret
