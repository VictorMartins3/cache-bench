#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#define MATRIX_SIZE 10000

int main(void) {
    int **matrix = malloc(MATRIX_SIZE * sizeof(*matrix));
    for (int i = 0; i < MATRIX_SIZE; i++) {
        matrix[i] = malloc(MATRIX_SIZE * sizeof(**matrix));
        for (int j = 0; j < MATRIX_SIZE; j++) {
            matrix[i][j] = i + j;
        }
    }

    uint64_t sum = 0;
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            sum += matrix[i][j];
        }
    }

    printf("%llu\n", sum);

    for (int i = 0; i < MATRIX_SIZE; i++) {
        free(matrix[i]);
    }
    free(matrix);

    return 0;
}
