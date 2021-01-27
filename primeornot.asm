BITS 32

extern scanf
extern printf

section .data
	
	spec: db "%d",0
	a: db "%d is a prime number",10,0
	b: db "%d is not a prime number",10,0

section .text
	
	global main

main:
	push ebp
	mov ebp,esp
	sub esp,0x8

	lea eax,[ebp-0x4]  
	push eax
	push spec
	call scanf

	mov ecx,DWORD [ebp-0x4]
	mov ebx,2
	jmp solution


iscomposite:
	mov eax,DWORD[ebp-0x4] 
	xor edx,edx
	div ebx

	cmp edx,0
	je composite
	
	inc ebx
solution:
	cmp ebx,ecx
	jl iscomposite

	push DWORD[ebp-0x4]
	push a
	call printf

	jmp exit
composite:
	push DWORD[ebp-0x4]
	push b
	call printf


exit:
	mov esp,ebp
	pop ebp

	mov eax,1
	int 80h