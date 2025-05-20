#include<stdio.h>
#include<stdlib.h>

int main() {
    int RQ[100], i, n, TotalHeadMovement = 0, initial;

    // Input number of requests
    printf("Enter the number of Requests\n");
    scanf("%d", &n);

    // Input the request sequence
    printf("Enter the Requests sequence\n");
    for(i = 0; i < n; i++) {
        scanf("%d", &RQ[i]);
    }

    // Input the initial head position
    printf("Enter initial head position\n");
    scanf("%d", &initial);

    // FCFS Disk Scheduling Algorithm
    for(i = 0; i < n; i++) {
        TotalHeadMovement = TotalHeadMovement + abs(RQ[i] - initial);
        initial = RQ[i];
    }

    // Output the total head movement
    printf("Total head movement is %d\n", TotalHeadMovement);

    return 0;
}
