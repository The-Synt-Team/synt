nasm -f elf32 src/boot.asm -o boot.o
clang --target=i386-unknown-linux-gnu -c src/kernel.c -o kernel.o
gcc -m elf_i386 -T src/linker.ld -o synt.bin boot.o kernel.o
rm -f boot.o kernel.o
mv synt.bin isodir/boot
# qemu-system-i386 -kernel synt.bin