

;
; +-------------------------------------------------------------------------+
; |   This file	has been generated by The Interactive Disassembler (IDA)    |
; |	      Copyright	(c) 2014 Hex-Rays, <support@hex-rays.com>	    |
; |					    |
; |	       	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	
; Input	CRC32 :	

; File Name   :	/I will not tell you my path.../assembler/asmdelay
; Format      :	ELF64 for x86-64 (Executable)
; Imagebase   :	400000
; Interpreter '/lib64/ld-linux-x86-64.so.2'
; Needed Library 'libc.so.6'
;
; Source File :	'crtstuff.c'
; Source File :	'asmdelay.c'
; Source File :	'crtstuff.c'

.686p
.mmx
.model flat
.intel_syntax noprefix


; Segment type:	Pure code
; Segment permissions: Read/Execute
_init segment dword public 'CODE' use64
assume cs:_init
;org 400370h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing



public _init_proc
_init_proc proc	near
sub	rsp, 8		; _init
mov	rax, cs:__gmon_start___ptr
test	rax, rax
jz	short loc_400385
call	___gmon_start__

loc_400385:
add	rsp, 8
retn
_init_proc endp

_init ends


; Segment type:	Pure code
; Segment permissions: Read/Execute
_plt segment para public 'CODE' use64
assume cs:_plt
;org 400390h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing
dq 2 dup(?)
; [00000006 BYTES: COLLAPSED FUNCTION ___libc_start_main. PRESS	CTRL-NUMPAD+ TO	EXPAND]
dw ?
dq ?
; [00000006 BYTES: COLLAPSED FUNCTION ___gmon_start__. PRESS CTRL-NUMPAD+ TO EXPAND]
dw ?
dq ?
_plt ends


; Segment type:	Pure code
; Segment permissions: Read/Execute
_text segment para public 'CODE' use64
assume cs:_text
;org 4003C0h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing


; Attributes: noreturn

public _start
_start proc near
xor	ebp, ebp
mov	r9, rdx		; rtld_fini
pop	rsi		; argc
mov	rdx, rsp	; ubp_av
and	rsp, 0FFFFFFFFFFFFFFF0h
push	rax
push	rsp		; stack_end
mov	r8, offset __libc_csu_fini ; fini
mov	rcx, offset __libc_csu_init ; init
mov	rdi, offset main ; main
call	___libc_start_main
hlt
_start endp

align 10h


; Attributes: bp-based frame

deregister_tm_clones proc near
mov	eax, offset unk_600937
push	rbp
sub	rax, offset __bss_start
cmp	rax, 0Eh
mov	rbp, rsp
jbe	short loc_400420
mov	eax, 0
test	rax, rax
jz	short loc_400420
pop	rbp
mov	edi, offset __bss_start
jmp	rax
align 20h

loc_400420:
pop	rbp
retn
deregister_tm_clones endp

align 10h


; Attributes: bp-based frame

register_tm_clones proc	near
mov	esi, offset __bss_start
push	rbp
sub	rsi, offset __bss_start
sar	rsi, 3
mov	rbp, rsp
mov	rax, rsi
shr	rax, 3Fh
add	rsi, rax
sar	rsi, 1
jz	short loc_400468
mov	eax, 0
test	rax, rax
jz	short loc_400468
pop	rbp
mov	edi, offset __bss_start
jmp	rax
align 8

loc_400468:
pop	rbp
retn
register_tm_clones endp

align 10h



__do_global_dtors_aux proc near
cmp	cs:__bss_start,	0
jnz	short locret_40048A
push	rbp
mov	rbp, rsp
call	deregister_tm_clones
pop	rbp
mov	cs:__bss_start,	1

locret_40048A:
rep retn
__do_global_dtors_aux endp

align 10h



frame_dummy proc near
mov	edi, offset __JCR_LIST__
cmp	qword ptr [rdi], 0
jnz	short loc_4004A0

loc_40049B:
jmp	short register_tm_clones
align 20h

loc_4004A0:
mov	eax, 0
test	rax, rax
jz	short loc_40049B
push	rbp
mov	rbp, rsp
call	rax
pop	rbp
jmp	register_tm_clones
frame_dummy endp

align 20h


; Attributes: bp-based frame

delay_loop proc	near

var_18=	qword ptr -18h
var_8= dword ptr -8
var_4= dword ptr -4

push	rbp
mov	rbp, rsp
mov	[rbp+var_18], rdi
mov	[rbp+var_4], 0
mov	eax, [rbp+var_4]
add	eax, eax
mov	[rbp+var_8], eax
mov	rax, [rbp+var_18]
test	rax, rax
jz	short loc_400505
jmp	short loc_4004F0
align 10h

loc_4004F0:
jmp	short loc_400500
align 20h

loc_400500:
dec	rax
jnz	short loc_400500

loc_400505:
dec	rax
mov	eax, [rbp+var_4]
sub	[rbp+var_8], eax
pop	rbp
retn
delay_loop endp



; Attributes: bp-based frame

; int __cdecl main(int argc, const char	**argv,	const char **envp)
public main
main proc near

var_10=	qword ptr -10h
var_4= dword ptr -4

push	rbp
mov	rbp, rsp
sub	rsp, 10h
mov	[rbp+var_4], edi
mov	[rbp+var_10], rsi
mov	edi, 2Ah
call	delay_loop
leave
retn
main endp

align 10h



; void _libc_csu_init(void)
public __libc_csu_init
__libc_csu_init	proc near
push	r15
mov	r15d, edi
push	r14
mov	r14, rsi
push	r13
mov	r13, rdx
push	r12
lea	r12, __frame_dummy_init_array_entry
push	rbp
lea	rbp, __do_global_dtors_aux_fini_array_entry
push	rbx
sub	rbp, r12
xor	ebx, ebx
sar	rbp, 3
sub	rsp, 8
call	_init_proc
test	rbp, rbp
jz	short loc_400586
nop	dword ptr [rax+rax+00000000h]

loc_400570:
mov	rdx, r13
mov	rsi, r14
mov	edi, r15d
call	qword ptr [r12+rbx*8]
add	rbx, 1
cmp	rbx, rbp
jnz	short loc_400570

loc_400586:
add	rsp, 8
pop	rbx
pop	rbp
pop	r12
pop	r13
pop	r14
pop	r15
retn
__libc_csu_init	endp

align 20h



; void _libc_csu_fini(void)
public __libc_csu_fini
__libc_csu_fini	proc near
rep retn
__libc_csu_fini	endp

_text ends


; Segment type:	Pure code
; Segment permissions: Read/Execute
_fini segment dword public 'CODE' use64
assume cs:_fini
;org 4005A4h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing



public _term_proc
_term_proc proc	near
sub	rsp, 8		; _fini
add	rsp, 8
retn
_term_proc endp

_fini ends


; Segment type:	Pure data
; Segment permissions: Read
_rodata	segment	dword public 'CONST' use64
assume cs:_rodata
;org 4005B0h
public _IO_stdin_used
_IO_stdin_used db    1
db    0
db    2
db    0
_rodata	ends


; Segment type:	Pure data
; Segment permissions: Read
_eh_frame_hdr segment dword public 'CONST' use64
assume cs:_eh_frame_hdr
;org 4005B4h
db    1
db  1Bh
db    3
db  3Bh	; ;
db  38h	; 8
db    0
db    0
db    0
db    6
db    0
db    0
db    0
db 0DCh	; �
db 0FDh	; �
db 0FFh
db 0FFh
db  84h	; �
db    0
db    0
db    0
db  0Ch
db 0FEh	; �
db 0FFh
db 0FFh
db  54h	; T
db    0
db    0
db    0
db  0Ch
db 0FFh
db 0FFh
db 0FFh
db 0ACh	; �
db    0
db    0
db    0
db  5Ch	; \
db 0FFh
db 0FFh
db 0FFh
db 0CCh	; �
db    0
db    0
db    0
db  7Ch	; |
db 0FFh
db 0FFh
db 0FFh
db 0ECh	; �
db    0
db    0
db    0
db 0ECh	; �
db 0FFh
db 0FFh
db 0FFh
db  34h	; 4
db    1
db    0
db    0
_eh_frame_hdr ends


; Segment type:	Pure data
; Segment permissions: Read
; Segment alignment 'qword' can not be represented in assembly
_eh_frame segment para public 'CONST' use64
assume cs:_eh_frame
;org 4005F0h
db  14h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    1
db  7Ah	; z
db  52h	; R
db    0
db    1
db  78h	; x
db  10h
db    1
db  1Bh
db  0Ch
db    7
db    8
db  90h	; �
db    1
db    7
db  10h
db  14h
db    0
db    0
db    0
db  1Ch
db    0
db    0
db    0
db 0B0h	; �
db 0FDh	; �
db 0FFh
db 0FFh
db  2Ah	; *
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  14h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    1
db  7Ah	; z
db  52h	; R
db    0
db    1
db  78h	; x
db  10h
db    1
db  1Bh
db  0Ch
db    7
db    8
db  90h	; �
db    1
db    0
db    0
db  24h	; $
db    0
db    0
db    0
db  1Ch
db    0
db    0
db    0
db  50h	; P
db 0FDh	; �
db 0FFh
db 0FFh
db  30h	; 0
db    0
db    0
db    0
db    0
db  0Eh
db  10h
db  46h	; F
db  0Eh
db  18h
db  4Ah	; J
db  0Fh
db  0Bh
db  77h	; w
db    8
db  80h	; �
db    0
db  3Fh	; ?
db  1Ah
db  3Bh	; ;
db  2Ah	; *
db  33h	; 3
db  24h	; $
db  22h	; "
db    0
db    0
db    0
db    0
db  1Ch
db    0
db    0
db    0
db  44h	; D
db    0
db    0
db    0
db  58h	; X
db 0FEh	; �
db 0FFh
db 0FFh
db  50h	; P
db    0
db    0
db    0
db    0
db  41h	; A
db  0Eh
db  10h
db  86h	; �
db    2
db  43h	; C
db  0Dh
db    6
db    2
db  4Bh	; K
db  0Ch
db    7
db    8
db    0
db    0
db  1Ch
db    0
db    0
db    0
db  64h	; d
db    0
db    0
db    0
db  88h	; �
db 0FEh	; �
db 0FFh
db 0FFh
db  1Bh
db    0
db    0
db    0
db    0
db  41h	; A
db  0Eh
db  10h
db  86h	; �
db    2
db  43h	; C
db  0Dh
db    6
db  56h	; V
db  0Ch
db    7
db    8
db    0
db    0
db    0
db  44h	; D
db    0
db    0
db    0
db  84h	; �
db    0
db    0
db    0
db  88h	; �
db 0FEh	; �
db 0FFh
db 0FFh
db  65h	; e
db    0
db    0
db    0
db    0
db  42h	; B
db  0Eh
db  10h
db  8Fh	; �
db    2
db  45h	; E
db  0Eh
db  18h
db  8Eh	; �
db    3
db  45h	; E
db  0Eh
db  20h
db  8Dh	; �
db    4
db  45h	; E
db  0Eh
db  28h	; (
db  8Ch	; �
db    5
db  48h	; H
db  0Eh
db  30h	; 0
db  86h	; �
db    6
db  48h	; H
db  0Eh
db  38h	; 8
db  83h	; �
db    7
db  4Dh	; M
db  0Eh
db  40h	; @
db  6Ch	; l
db  0Eh
db  38h	; 8
db  41h	; A
db  0Eh
db  30h	; 0
db  41h	; A
db  0Eh
db  28h	; (
db  42h	; B
db  0Eh
db  20h
db  42h	; B
db  0Eh
db  18h
db  42h	; B
db  0Eh
db  10h
db  42h	; B
db  0Eh
db    8
db    0
db  14h
db    0
db    0
db    0
db 0CCh	; �
db    0
db    0
db    0
db 0B0h	; �
db 0FEh	; �
db 0FFh
db 0FFh
db    2
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
__FRAME_END__ db    0
db    0
db    0
db    0
_eh_frame ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_init_array segment para public	'DATA' use64
assume cs:_init_array
;org 600708h
__frame_dummy_init_array_entry dq offset frame_dummy ; Alternative name	is '__init_array_start'
_init_array ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_fini_array segment para public	'DATA' use64
assume cs:_fini_array
;org 600710h
__do_global_dtors_aux_fini_array_entry dq offset __do_global_dtors_aux ; Alternative name is '__init_array_end'
_fini_array ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_jcr segment para public 'DATA' use64
assume cs:_jcr
;org 600718h
__JCR_LIST__ db	   0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
_jcr ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_got segment para public 'DATA' use64
assume cs:_got
;org 6008F0h
__gmon_start___ptr dq offset __gmon_start__
_got ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_got_plt segment para public 'DATA' use64
assume cs:_got_plt
;org 6008F8h
_GLOBAL_OFFSET_TABLE_ db    ? ;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
align 10h
off_600910 dq offset __libc_start_main
off_600918 dq offset __gmon_start__
_got_plt ends


; Segment type:	Pure data
; Segment permissions: Read/Write
; Segment alignment 'qword' can not be represented in assembly
_data segment para public 'DATA' use64
assume cs:_data
;org 600920h
public __data_start ; weak
__data_start db	   0	; Alternative name is '__data_start'
			; data_start
db    0
db    0
db    0
db    0
db    0
db    0
db    0
public __dso_handle
__dso_handle db	   0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
_data ends


; Segment type:	Uninitialized
; Segment permissions: Read/Write
_bss segment byte public 'BSS' use64
assume cs:_bss
;org 600930h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing
public __bss_start
__bss_start db ?	; Alternative name is '__TMC_END__'
			; completed.6661
			; _edata
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
db    ?	;
unk_600937 db	 ? ;
_bss ends


; Segment type:	Externs
; extern
extrn __libc_start_main@@GLIBC_2_2_5:near
; int __cdecl _libc_start_main(int (__cdecl *main)(int,	char **, char **), int argc, char **ubp_av, void (*init)(void),	void (*fini)(void), void (*rtld_fini)(void), void *stack_end)
extrn __libc_start_main:near
extrn _ITM_deregisterTMCloneTable ; weak
extrn __gmon_start__ ; weak
extrn _Jv_RegisterClasses ; weak
extrn _ITM_registerTMCloneTable	; weak


end _start