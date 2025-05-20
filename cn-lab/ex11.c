#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main() {
    int i, j, k, count, err_pos = 0, flag = 0;
    char dw[13], cw[13], data[20]; // Changed array sizes to fit 12 bits code
    printf("Enter data as binary bit stream (7 bits):\n");
    scanf("%s", data);

    // Create the Hamming code with parity bits inserted
    for (i = 1, j = 0, k = 0; i < 13; i++) {
        if (i == (int)pow(2, j)) {
            dw[i] = '?';  // Placeholders for parity bits
            j++;
        } else {
            dw[i] = data[k];
            k++;
        }
    }

    // Calculate parity bits
    for (i = 0; i < 4; i++) {
        count = 0;
        for (j = (int)pow(2, i); j < 13; j += (int)pow(2, i)) {
            for (k = 0; k < (int)pow(2, i); k++) {
                if (dw[j] == '1') count++;
                j++;
            }
        }
        if (count % 2 == 0)
            dw[(int)pow(2, i)] = '0';
        else
            dw[(int)pow(2, i)] = '1';
    }

    // Print the code word
    printf("\nCode word is:\n");
    for (i = 1; i < 13; i++) {
        printf("%c", dw[i]);
    }

    // Enter received Hamming code
    printf("\n\nEnter the received Hamming code:\n");
    scanf("%s", cw);

    // Shift the received code word for 1-based indexing
    for (i = 12; i > 0; i--) {
        cw[i] = cw[i - 1];
    }

    // Check for errors in the received code word
    for (i = 0; i < 4; i++) {
        count = 0;
        for (j = (int)pow(2, i); j < 13; j += (int)pow(2, i)) {
            for (k = 0; k < (int)pow(2, i); k++) {
                if (cw[j] == '1') count++;
                j++;
            }
        }
        if (count % 2 != 0)
            err_pos = err_pos + (int)pow(2, i);
    }

    if (err_pos == 0) {
        printf("\nThere is no error in the received code word.\n");
    } else {
        // If there's an error, correct it
        printf("\nThere is an error in bit position %d of received code word.\n", err_pos);

        // Check if the error is correctable (only 1 error)
        if (cw[err_pos] == dw[err_pos]) {
            printf("There are 2 or more errors in received code...\n");
            printf("Sorry, Hamming code cannot correct 2 or more errors...\n");
            flag = 1;
        } else {
            // Correct the error
            cw[err_pos] = (cw[err_pos] == '1') ? '0' : '1';
            printf("\nCorrected code word is:\n");
            for (i = 1; i < 13; i++) {
                printf("%c", cw[i]);
            }
        }
    }

    return 0;
}
