#include <stdio.h>

int main() {
    int n = 5; // Number of processes
    int m = 3; // Number of resources

    int alloc[5][3] = {
        { 0, 1, 0 }, // P0
        { 2, 0, 0 }, // P1
        { 3, 0, 2 }, // P2
        { 2, 1, 1 }, // P3
        { 0, 0, 2 }  // P4
    };

    int max[5][3] = {
        { 7, 5, 3 }, // P0
        { 3, 2, 2 }, // P1
        { 9, 0, 2 }, // P2
        { 2, 2, 2 }, // P3
        { 4, 3, 3 }  // P4
    };

    int avail[3] = { 3, 3, 2 }; // Available resources

    int f[5], ans[5], ind = 0;
    int need[5][3];

    for (int i = 0; i < n; i++) f[i] = 0;

    // Calculate need matrix
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            need[i][j] = max[i][j] - alloc[i][j];
        }
    }

    // Banker algorithm
    for (int k = 0; k < n; k++) {
        for (int i = 0; i < n; i++) {
            if (f[i] == 0) {
                int flag = 0;
                for (int j = 0; j < m; j++) {
                    if (need[i][j] > avail[j]) {
                        flag = 1;
                        break;
                    }
                }

                if (flag == 0) {
                    ans[ind++] = i;
                    for (int y = 0; y < m; y++)
                        avail[y] += alloc[i][y];
                    f[i] = 1;
                }
            }
        }
    }

    // Check if system is in safe state
    int flag = 1;
    for (int i = 0; i < n; i++) {
        if (f[i] == 0) {
            flag = 0;
            printf("The system is not in a safe state.\n");
            break;
        }
    }

    if (flag == 1) {
        printf("The system is in a safe state.\n");
        printf("Safe sequence: ");
        for (int i = 0; i < n - 1; i++) {
            printf("P%d -> ", ans[i]);
        }
        printf("P%d\n", ans[n - 1]);
    }

    return 0;
}
