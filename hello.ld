ENTRY( _start )

MEMORY {
  ram (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
}

SECTIONS {

  .text : {
    PROVIDE(_text_start = .);
    hello.o(.text.bios)
    PROVIDE(_text_end = .);
  } >ram AT>ram

  .rodata : {
    PROVIDE(_rodata_start = .);
    hello.o(.data_ro)
    PROVIDE(_rodata_end = .);
  } >ram AT>ram

}
