#include <stdio.h>

static int mark[20];
int i, j, np, nr;

int main() {
    int alloc[10][10], request[10][10], avail[10], r[10], w[10];

    // Input: Number of processes and resources
    printf("Enter the number of processes: ");
    scanf("%d", &np);

    printf("Enter the number of resources: ");
    scanf("%d", &nr);

    // Input: Total amount of each resource
    for (i = 0; i < nr; i++) {
        printf("Total amount of Resource R%d: ", i + 1);
        scanf("%d", &r[i]);
    }

    // Input: Request matrix
    printf("Enter the Request matrix:\n");
    for (i = 0; i < np; i++)
        for (j = 0; j < nr; j++)
            scanf("%d", &request[i][j]);

    // Input: Allocation matrix
    printf("Enter the Allocation matrix:\n");
    for (i = 0; i < np; i++)
        for (j = 0; j < nr; j++)
            scanf("%d", &alloc[i][j]);

    // Calculate Available Resources
    for (j = 0; j < nr; j++) {
        avail[j] = r[j];
        for (i = 0; i < np; i++) {
            avail[j] -= alloc[i][j];
        }
    }

    // Step 1: Mark processes with zero allocation
    for (i = 0; i < np; i++) {
        int count = 0;
        for (j = 0; j < nr; j++) {
            if (alloc[i][j] == 0)
                count++;
        }
        if (count == nr)
            mark[i] = 1;  // Process has no allocation
    }

    // Initialize work array w = avail
    for (j = 0; j < nr; j++)
        w[j] = avail[j];

    // Step 2: Try to mark the remaining processes
    for (i = 0; i < np; i++) {
        if (mark[i] != 1) {
            int canbeprocessed = 1;
            for (j = 0; j < nr; j++) {
                if (request[i][j] > w[j]) {
                    canbeprocessed = 0;
                    break;
                }
            }
            if (canbeprocessed) {
                mark[i] = 1;
                for (j = 0; j < nr; j++)
                    w[j] += alloc[i][j];  // Release resources
            }
        }
    }

    // Step 3: Check for any unmarked processes
    int deadlock = 0;
    for (i = 0; i < np; i++) {
        if (mark[i] != 1)
            deadlock = 1;
    }

    if (deadlock)
        printf("\nDeadlock detected.\n");
    else
        printf("\nNo Deadlock possible.\n");

    return 0;
}
