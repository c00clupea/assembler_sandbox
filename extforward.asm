%macro write_to_mon 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	
%endmacro


section .text              

global  _start             

_start:

	
	mov	ax,08EBh	; obf jmp + 8 (+2)
	xor	ebx,ebx		;set ebx to zero
	mov	eax,31c0h	;obf jz eax,eax set eax to zero (+2o)
	xor    	eax,ebx		;must be zero the second time
	jz	$-4
	jmp	alternate
	nop
	nop
	write_to_mon obf,obfLen
	mov     eax,1             
	int     0x80         

alternate:
	write_to_mon real,realLen
	mov	eax,1
	int 0x80

section .data                  
obf:	db 'obfuscated code',15
obfLen:	equ $-obf
real:	db 'ida target',15
realLen:	equ $-real
