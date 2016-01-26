%macro write_to_mon 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	
%endmacro

section .text

global _start

_start:
	mov ax,08EBh		;there is some jump in it actual +8
	mov ecx,_start+2
	xor ebx,ebx		;set ebx to zero
	mov eax,31c0h		;set eax to somewhat (set eax to zero)
	xor eax,ebx		;can not be null at first
	jz alternate
	jmp ecx
	jmp obfuscated		;pseudo jump will never occur
obfuscated:
	write_to_mon obf,obfLen
	mov eax,1
	int 0x80

alternate:
	write_to_mon real,realLen
	mov	eax,1
	int 0x80
	
section .data                  
obf:	db 'obfuscated code',15
obfLen:	equ $-obf
real:	db 'ida target',15
realLen:	equ $-real

