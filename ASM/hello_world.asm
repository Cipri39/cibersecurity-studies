; Primeiro Codigo em ASSEMBLY

section .text

section .data
	msg db "hello world", 0x00
	msglen equ $ - msg

global _start
_start:
	mov eax,0x04
	mov ebx,0x01
	mov ecx,msg
	mov edx,msglen
	int 0x80

	mov eax,0x01
	mov ebx,0
	int 0x80
