#include<stdio.h>

int main() {
    int n, temp = 0, w[20] = {0}, b[20], p[20], t2[20], j, t1, d[20], i, t3 = 0;
    float t, r;

    // Input number of processes
    printf("\nEnter number of processes: ");
    scanf("%d", &n);

    // Input burst times
    printf("\nEnter the burst times: ");
    for(i = 0; i < n; i++) {
        printf("P%d: ", i + 1);
        scanf("%d", &b[i]);
        d[i] = i + 1; // Process IDs (1-based)
    }

    // Input priorities
    printf("\nEnter the priorities: ");
    for(i = 0; i < n; i++) {
        printf("P%d: ", i + 1);
        scanf("%d", &p[i]);
    }

    // Sort processes based on priority (higher priority comes first)
    for(i = 0; i < n; i++) {
        for(j = i + 1; j < n; j++) {
            if(p[i] < p[j]) {
                // Swap priorities
                temp = p[i];
                p[i] = p[j];
                p[j] = temp;

                // Swap burst times
                temp = b[i];
                b[i] = b[j];
                b[j] = temp;

                // Swap process IDs
                temp = d[i];
                d[i] = d[j];
                d[j] = temp;
            }
        }
    }

    // Print the Gantt chart header
    printf("\nGantt Chart: ");
    for(i = 0; i < n; i++)
        printf("P%d\t", d[i]);

    printf("\nProcess\tPriority\tBurst Time\tWaiting Time\tTurnaround Time\n");

    // Calculate waiting time and turnaround time
    for(i = 0; i < n; i++) {
        w[i + 1] = w[i] + b[i];  // Calculate waiting time
        t2[i] = b[i] + w[i];     // Calculate turnaround time
        t3 += t2[i];              // Accumulate turnaround time
        printf("P%d\t\t%d\t\t%d\t\t%d\t\t%d\n", d[i], p[i], b[i], w[i], t2[i]);
    }

    // Calculate average waiting time and average turnaround time
    t = (float)w[n] / n;  // Average waiting time
    r = (float)t3 / n;     // Average turnaround time

    // Output the results
    printf("\nAverage Waiting Time: %.2f", t);
    printf("\nAverage Turnaround Time: %.2f\n", r);

    return 0;
}
