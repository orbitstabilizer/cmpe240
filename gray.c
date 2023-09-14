#include <stdio.h>
#include <stdlib.h>

typedef unsigned int uint;

// This function converts an unsigned binary number to reflected binary Gray code.
uint BinaryToGray(uint num)
{
    return num ^ (num >> 1); // The operator >> is shift right. The operator ^ is exclusive or.
}

// This function converts a reflected binary Gray code number to a binary number.
uint GrayToBinary(uint num)
{
    uint mask = num;
    while (mask) {           // Each Gray code bit is exclusive-ored with all more significant bits.
        mask >>= 1;
        num   ^= mask;
    }
    return num;
}

// A more efficient version for Gray codes 32 bits or fewer through the use of SWAR (SIMD within a register) techniques. 
// It implements a parallel prefix XOR function. The assignment statements can be in any order.
// 
// This function can be adapted for longer Gray codes by adding steps.
void printBits(size_t const size, void const * const ptr)
{
    unsigned char *b = (unsigned char*) ptr;
    unsigned char byte;
    int i, j;
    
    for (i = size-1; i >= 0; i--) {
        for (j = 7; j >= 0; j--) {
            byte = (b[i] >> j) & 1;
            printf("%u", byte);
        }
    }
    puts("");
}


uint GrayToBinary32(uint num)
{
    num ^= num >> 16;
    num ^= num >>  8;
    num ^= num >>  4;
    num ^= num >>  2;
    num ^= num >>  1;
    return num;
}


int main(int argc, char *argv[]){

    if (argc != 3) {
        printf("Usage: gray function number\n \t function: 0 = binary to gray, 1 = gray to binary, 2 = gray to binary (32-bit)\n");
        return 1;
    }

    if (atoi(argv[1]) == 0) {
        printf("Binary to Gray: %d -> %d \n", atoi(argv[2]), BinaryToGray(atoi(argv[2])));
        int val = atoi(argv[2]);
        printBits(sizeof(atoi(argv[2])), &val);
        val = BinaryToGray(atoi(argv[2]));
        printBits(sizeof(BinaryToGray(atoi(argv[2]))), &val);
    } else if (atoi(argv[1]) == 1) {
        printf("Gray to Binary: %d -> %d \n", atoi(argv[2]), GrayToBinary(atoi(argv[2])));
        int val = atoi(argv[2]);
        printBits(sizeof(atoi(argv[2])), &val);
        val = GrayToBinary(atoi(argv[2]));
        printBits(sizeof(GrayToBinary(atoi(argv[2]))), &val);


    } else if (atoi(argv[1]) == 2) {
        printf("Gray to Binary (32-bit): %d -> %d \n", atoi(argv[2]), GrayToBinary32(atoi(argv[2])));
        int val = atoi(argv[2]);
        printBits(sizeof(atoi(argv[2])), &val);
        val = GrayToBinary32(atoi(argv[2]));
        printBits(sizeof(GrayToBinary32(atoi(argv[2]))), &val);

    } else {
        printf("Invalid function\n \t function: 0 = binary to gray, 1 = gray to binary, 2 = gray to binary (32-bit)\n");

        return 1;
    }
    return 0;

}
