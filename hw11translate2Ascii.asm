; hw11translate2Ascii.asm
; Converts bytes in inputBuf to uppercase hex and prints to screen.
; Example output: 83 6A 88 DE 9A C3 54 9A

section .data
inputBuf:
    db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A

hexChars:
    db '0123456789ABCDEF'

section .bss
outputBuf:
    resb 80

section .text
global _start

_start:
    mov esi, inputBuf        ; input buffer pointer
    mov edi, outputBuf       ; output buffer pointer
    mov ecx, 8               ; number of bytes to process

translate_loop:
    mov al, [esi]            ; load byte from input
    inc esi

    ; upper nibble
    mov bl, al
    shr bl, 4
    and bl, 0x0F
    movzx ebx, bl
    mov dl, [hexChars + ebx]
    mov [edi], dl
    inc edi

    ; lower nibble
    mov bl, al
    and bl, 0x0F
    movzx ebx, bl
    mov dl, [hexChars + ebx]
    mov [edi], dl
    inc edi

    ; add space
    mov byte [edi], ' '
    inc edi

    loop translate_loop

    ; replace final space with newline
    dec edi
    mov byte [edi], 0x0A

    ; calculate output length
    mov eax, 4               ; sys_write
    mov ebx, 1               ; stdout
    mov ecx, outputBuf       ; message to write
    lea edx, [edi + 1]       ; edi points to last byte (newline), so add 1
    sub edx, outputBuf       ; length = end - start
    int 0x80

    ; exit
    mov eax, 1               ; sys_exit
    xor ebx, ebx
    int 0x80
