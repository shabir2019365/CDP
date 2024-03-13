// Muhammad Shabir Khan
// RISC V programming task
// written the linker file
// 13 March 2024

ENTRY(_main)

MEMORY
{
    ram (rwx) : ORIGIN = 0x80000000, LENGTH = 16K
}

SECTIONS
{
    .text : { *(.text) } > ram
    .data : { *(.data) } > ram
    .tohost : { *(.tohost) } > ram
}
