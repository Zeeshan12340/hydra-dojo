.globl _start
.intel_syntax noprefix
_start:
	mov rdi, 1
	lea rsi, [rip+message]
	mov rdx, 33
	mov rax, 1
	syscall

	call vuln

	mov rdi, 0
	mov rax, 60
	syscall
	ret

vuln:
	sub rsp, 0x40
	mov rdi, 0
	lea rsi, [rsp]
	mov rdx, 0x200
	mov rax, 0
	syscall
	add rsp, 0x40
	ret

message:
.string "Hello! Hello! Give me something:\nHeres an early gift: /bin/sh"
