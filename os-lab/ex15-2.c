#include<stdio.h>
#include<stdlib.h>

int main() {
    int RQ[100], i, n, TotalHeadMoment = 0, initial, count = 0;

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

    // SSTF Disk Scheduling Algorithm
    while(count != n) {
        int min = 1000, d, index;

        // Find the closest request
        for(i = 0; i < n; i++) {
            d = abs(RQ[i] - initial);
            if(min > d) {
                min = d;
                index = i;
            }
        }

        // Update total head movement and head position
        TotalHeadMoment += min;
        initial = RQ[index];

        // Mark the request as processed
        RQ[index] = 1000; // You can use a flag here or any other way to mark as processed
        count++;
    }

    // Output the total head movement
    printf("Total head movement is %d\n", TotalHeadMoment);

    return 0;
}
