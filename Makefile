all:
	make extobf

extobf: extobf.asm
	nasm -f elf extobf.asm
	ld -m elf_i386 extobf.o -o extobf

