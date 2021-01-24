BITS 32

extern scanf
extern printf


section .data


	print: db "%d",0
	sum:db"sum of the numbers is %d",10,0
	subtract:db "difference of the numbers is %d",10,0
	product:db "product of the numbers is %d",10,0
	division:db "division of the numbers is %d",10,0

section .text
	
	global main
	main:
		push ebp
		mov ebp,esp
		sub esp,0x10

		lea eax,[ebp-0x4]
		push eax
		push print
		call scanf

		lea ebx,[ebp-0xc]
		push ebx
		push print
		call scanf

		mov eax,DWORD[ebp-0x4]
		mov ebx,DWORD[ebp-0xc]
		add eax,ebx
		push eax
		push sum
		call printf

		mov eax,DWORD[ebp-0x4]
		mov ebx,DWORD[ebp-0xc]
		sub eax,ebx
		push eax
		push subtract
		call printf

		mov eax,DWORD[ebp-0x4]
		mov ebx,DWORD[ebp-0xc]
		imul eax,ebx
		push eax
		push product
		call printf

		xor edx,edx
		mov eax,DWORD[ebp-0x4]
		mov ebx,DWORD[ebp-0xc]
		div ebx
		push eax
		push division
		call printf
