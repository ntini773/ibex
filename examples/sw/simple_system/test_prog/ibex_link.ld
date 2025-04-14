ENTRY(_start)

MEMORY {
  ram (rwx) : ORIGIN = 0x100000, LENGTH = 512K
}

SECTIONS {
  . = 0x100080;

  .text : {
    *(.vectors)   /* Interrupt vectors */
    *(.text*)     /* Program code */
    *(.rodata*)   /* Read-only data */
  } > ram

  .data : {
    *(.data*)
    *(.sdata*)
  } > ram

  .bss : {
    *(.sbss*)
    *(.bss*)
    *(COMMON)
  } > ram
}
