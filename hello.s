.global _start
.global print_string

.section .text.bios

_start:

  csrr t0, mhartid
  mv a0, t0
  bnez t0, other_harts # If not Hart 0 go and be idle

  # Printing Hello World from Hart zero
  li a1, 0x10000000 # UART QEMU ADDRESS
  la a0, hello
  call print_string
  

loop:	j loop

j exit
other_harts:

  # Printing the hart's number
  call print_number
  la a0, other_hart_msg
  call print_string

  wfi
  j exit


print_string:
  li a1, 0x10000000 # UART QEMU ADDRESS
  loop_string:
    lbu a3, (a0)    # load char into a3
    sb a3, (a1)     # write char to UART I/O Mapped register
    addi a0, a0, 1
    bnez a3, loop_string
  ret

# @Todo: (add multiple digit support)
print_number:
  addi a0, a0, '0'   # Digit to Ascii
  li a1, 0x10000000  # UART QEMU ADDRESS
  sb a0, (a1)        # write char to UART I/O Mapped register
  ret


exit:

.section .rodata
hello: .ascii "Hello World Hart 0!\n"
other_hart_msg: .ascii "Other Hart\n"

