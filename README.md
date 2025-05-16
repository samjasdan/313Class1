# hw11translate2Ascii

## Description

This program reads a fixed-size array of bytes and prints them to the terminal as uppercase hexadecimal values. Each byte is translated into two-character hex format and printed with a space between each pair.

---

### Sample Output

83 6A 88 DE 9A C3 54 9A

## Compiling and Running

nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2Ascii.o

ld -m elf_i386 hw11translate2Ascii.o -o hw11translate2Ascii

./hw11translate2Ascii

