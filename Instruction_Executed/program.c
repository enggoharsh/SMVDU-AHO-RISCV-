/*The equivalent C program we want to execute using our Machine Code which 
is based on RV32I ISA
*/

#include <stdint.h>

int main() {
    int32_t x[32] = {0};

    // Immediate arithmetic
    x[1]  = 1;
    x[2]  = 16;
    x[3]  = -3;
    x[4]  = 0;
    x[5]  = x[3] + 12;
    x[6]  = x[2] << 2;
    x[7]  = ((uint32_t)x[2] < (uint32_t)-16);
    x[8]  = ((uint32_t)x[2] < (uint32_t)-16);
    x[9]  = x[2] ^ 18;
    x[10] = ((uint32_t)x[3]) >> 3;
    x[11] = x[3] >> 3;
    x[12] = x[3] | 3;
    x[13] = x[3] & 3;

    // ALU ops
    x[14] = x[2] + x[1];
    x[15] = x[2] - x[1];
    x[16] = x[2] << x[1];
    x[17] = (x[2] < x[3]);
    x[18] = ((uint32_t)x[2] < (uint32_t)x[3]);
    x[19] = x[2] ^ x[1];
    x[20] = ((uint32_t)x[2]) >> x[1];
    x[21] = x[2] >> x[1];
    x[22] = x[2] | x[1];
    x[23] = x[2] & x[1];

    // Memory tests (conceptual)
    uint8_t memory[1024] = {0};

    memory[x[2] + 17] = x[1];
    *(int16_t*)&memory[x[2] + 54] = x[3];
    *(int32_t*)&memory[x[2] + 56] = x[2];

    x[26] = *(int8_t*)&memory[x[3] + 36];
    x[27] = *(int16_t*)&memory[x[3] + 41];
    x[28] = *(int32_t*)&memory[x[3] + 43];
    x[29] = *(uint8_t*)&memory[x[3] + 36];
    x[30] = *(uint16_t*)&memory[x[3] + 41];

    // BLT test
    x[4] = 0;
    x[6] = -5;
    x[7] = 5;

    while (x[6] < x[7]) {
        x[4]++;
        x[6]++;
    }

    // BGE test
    x[4] = 0;
    x[8] = -5;
    x[9] = 5;

    while (x[9] >= x[8]) {
        x[4]++;
        x[9]--;
    }

    // BLTU
    x[4] = 0;
    x[10] = 1;
    x[11] = 5;

    while ((uint32_t)x[10] < (uint32_t)x[11]) {
        x[4]++;
        x[10]++;
    }

    // BGEU
    x[4] = 0;
    x[12] = 1;
    x[13] = 5;

    while ((uint32_t)x[13] >= (uint32_t)x[12]) {
        x[4]++;
        x[13]--;
    }

    // BNE
    x[4] = 0;
    x[14] = 5;
    x[15] = 0;

    while (x[15] != x[14]) {
        x[4]++;
        x[15]++;
    }

    // BEQ
    x[4] = 0;
    x[16] = 2;
    x[17] = 3;

    do {
        x[4]++;
        x[16]++;
    } while (x[16] != x[17]);

    while (1);   // halt
}