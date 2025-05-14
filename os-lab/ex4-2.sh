#include<stdio.h>

int main() {
    int n, w[100], tot[100], i, j, awt = 0, atot = 0;
    float avwt, avtot;

    struct {
        int p, bt;
    } sjf[10], temp;

    // Input the number of processes
    printf("Enter the number of Processes: ");
    scanf("%d", &n);

    // Input burst times for each process
    for(i = 0; i < n; i++) {
        printf("Enter the Burst time for Process %d: ", i + 1);
        scanf("%d", &sjf[i].bt);
        sjf[i].p = i + 1;  // Process ID (1-based)
    }

    // Sort processes based on burst time (ascending order)
    for(i = 0; i < n - 1; i++) {
        for(j = i + 1; j < n; j++) {
            if(sjf[j].bt < sjf[i].bt) {  // Swap if burst time of j < burst time of i
                temp = sjf[i];
                sjf[i] = sjf[j];
                sjf[j] = temp;
            }
        }
    }

    // Initialize waiting and turnaround times
    w[0] = 0;  // First process has no waiting time
    tot[0] = sjf[0].bt;  // Turnaround time of first process is its burst time

    // Calculate waiting and turnaround times
    for(i = 1; i < n; i++) {
        tot[i] = tot[i - 1] + sjf[i].bt;  // Turnaround time of each process
        w[i] = tot[i] - sjf[i].bt;  // Waiting time of each process
        awt += w[i];  // Total waiting time
        atot += tot[i];  // Total turnaround time
    }

    // Calculate average waiting time and average turnaround time
    avwt = (float)awt / n;
    avtot = (float)atot / n;

    // Output the results
    printf("\n\nProcessId\tWaiting time\tTurnaroundTime\n");
    for(i = 0; i < n; i++) {
        printf("\t%d\t\t%d\t\t%d\n", sjf[i].p, w[i], tot[i]);
    }

    printf("\nTotal Waiting Time: %d", awt);
    printf("\nTotal Turnaround Time: %d", atot);
    printf("\nAverage Waiting Time: %.2f", avwt);
    printf("\nAverage Turnaround Time: %.2f\n", avtot);

    return 0;
}
