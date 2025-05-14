#include<stdio.h>

int main() {
    int n, b[10], t = 0, i, w = 0, r = 0, a = 0;
    float avg, avg1;

    // Input number of processes
    printf("\nEnter number of processes: ");
    scanf("%d", &n);

    // Input burst times
    printf("\nEnter the burst times : \n");
    for(i = 0; i < n; i++)
        scanf("%d", &b[i]);

    // Print Gantt chart header
    printf("\nGantt chart: ");
    for(i = 0; i < n; i++)
        printf("P%d\t", i + 1);  // Process IDs start from 1

    // Print the process table with Burst Time, Waiting Time, and Turnaround Time
    printf("\n\nProcess BurstTime WaitingTime TurnaroundTime\n");

    for(i = 0; i < n; i++) {
        t = t + w;      // Total waiting time
        r = r + b[i];   // Turnaround time = Burst time + Waiting time
        printf("P%d\t\t%d\t\t%d\t\t%d\n", i + 1, b[i], w, r);
        w = w + b[i];   // Update waiting time for next process
        a = a + r;      // Accumulate turnaround time
    }

    // Calculate average waiting time and average turnaround time
    avg = (float)t / n;
    avg1 = (float)a / n;

    // Print the average waiting time and average turnaround time
    printf("\nAverage Waiting Time is %.2f", avg);
    printf("\nAverage Turnaround Time is %.2f\n", avg1);

    return 0;
}
