.global _start

.section .text.bios

_start:	addi a0, x0, 0x68
  # Printing Hello World
  li a1, 0x10000000 # UART QEMU ADDRESS
  la a0, hello
  
  print_char:
    lbu a3, (a0) # load char into a3
    sb a3, (a1)  # write char to UART mapped memory
    addi a0, a0, 1
    bnez a3, print_char
	
loop:	j loop



.section .rodata
hello: .ascii "Hello World!\n"
