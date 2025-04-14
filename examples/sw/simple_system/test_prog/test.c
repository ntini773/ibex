//volatile int tohost;

//int main() {
  //  volatile int a = 5;
    //volatile int b = 3;
    //volatile int e = 2;

    //volatile int c = a + b; // c = 8
    //volatile int d = c + e; // d = 10

    //tohost = 1; // Signal Spike that execution is done
    //while (1);
//}

// test.c

volatile int *result = (int *) 0x20000000; // Memory-mapped "debug" location

int  main() {
    int a = 2;
    int b = 3;
    int c = a + b;

    int d = 5;
    int e = d + c;

    *result = e;  // Store result at known RAM address

    while (1);  // Halt
    return 0;
}

