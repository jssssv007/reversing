BITS 32
extern printf
extern scanf
section .data
	print: db "%d",0
	ans: db "The factorial is %d",10,0
section .txt
	global main
	main:
		push ebp
		mov ebp,esp
		sub esp,0x10
		lea eax,[ebp-0x4]
		push eax
		push print
		call scanf
		mov edx,dword[ebp-0x4]
		mov ecx,1
		mov ebx,0
		sol:
			add ebx,1
			imul ecx,ebx
		cmp ebx,edx
		jl sol
		push ecx
		push ans
		call printf
		leave
		ret