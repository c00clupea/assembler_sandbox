all:
	make clean
	make extobf
	make asmcallintercept
	make asmdelay
	make inwindcall

extobf: extobf.asm
	nasm -f elf extobf.asm
	ld -m elf_i386 extobf.o -o extobf

inwindcall: inwindcall.asm
	nasm -f elf inwindcall.asm
	ld -m elf_i386 inwindcall.o -o inwindcall

asmcallintercept: asmcallintercept.c
	gcc -o asmcallintercept asmcallintercept.c

asmdelay: asmdelay.c
	gcc -o asmdelay asmdelay.c

clean:
	-rm extobf inwindcall asmcallintercept asmdelay
	-rm extobf.o inwindcall.o 
