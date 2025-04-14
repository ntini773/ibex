// uart.c
//#define UART_BASE 0x10000000  // Replace with the actual UART base address for Ibex

//void uart_putc(char c) {
    // Wait until the UART is ready to transmit
  //  while (*((volatile unsigned int *) (UART_BASE + 0x18)) & 0x20);  // Check UART transmit FIFO empty flag
    //*((volatile unsigned int *) (UART_BASE + 0x00)) = c;  // Write character to the UART data register
//}

//void uart_puts(const char* s) {
  //  while (*s) {
    //    uart_putc(*s++);
    //}
//}


#include <stdio.h>

void uart_putc(char c) {
    // Write character to stdout or a log file
    // For now, printing to stdout (you could redirect this to a file)
    putchar(c);  // Or you could use fprintf() to write to a file
}

void uart_puts(const char* s) {
    // Loop through the string and output each character
    while (*s) {
        uart_putc(*s++);
    }
}

