#include<stdio.h>

void main() {
    int i, tbt = 0, nop, ts = 0, flag[20], rem[20]; 
    int from, wt[20], tt[20], b[20], twt = 0, ttt = 0; 
    int dur; 
    float awt, att;

    // Input number of processes and time slice
    printf("Enter no. of Processes: ");
    scanf("%d", &nop);

    printf("Enter the time slice: ");
    scanf("%d", &ts);

    // Input burst times for processes
    printf("Enter the Burst times..\n");
    for(i = 0; i < nop; i++) {
        wt[i] = tt[i] = 0;  // Initialize waiting and turnaround times to 0
        printf("P%d\t: ", i + 1);
        scanf("%d", &b[i]);
        rem[i] = b[i];  // Remaining burst time
        tbt += b[i];    // Total burst time
        flag[i] = 0;    // Flag to track if process is completed
    }

    from = 0;
    i = 0;
    printf("\n\t Gantt Chart");
    printf("\n ProcessID\tFrom Time\tTo Time\n");

    // Round Robin Scheduling Logic
    while(from < tbt) {
        if(!flag[i]) {
            if(rem[i] <= ts) {
                dur = rem[i]; 
                flag[i] = 1;  // Process completed
                tt[i] = dur + from;  // Turnaround time
                wt[i] = tt[i] - b[i]; // Waiting time
            } else {
                dur = ts;
            }
            printf("%7d%15d%15d\n", i + 1, from, from + dur);  // Print Gantt Chart
            rem[i] -= dur;  // Decrease remaining burst time
            from += dur;    // Update from time
        }
        i = (i + 1) % nop;  // Cycle through all processes
    }

    // Calculate total waiting time and total turnaround time
    for(i = 0; i < nop; i++) {
        twt += wt[i];
        ttt += tt[i];
    }

    // Display Results
    printf("\n\n Process ID \t Waiting Time \t Turn Around Time");
    for(i = 0; i < nop; i++) {
        printf("\n\t%d\t\t%d\t\t%d", i + 1, wt[i], tt[i]);
    }

    // Calculate and display average waiting time and average turnaround time
    awt = (float)twt / (float)nop;
    att = (float)ttt / (float)nop;
    printf("\nTotal Waiting Time: %d", twt);
    printf("\nTotal Turn Around Time: %d", ttt);
    printf("\nAverage Waiting Time: %.2f", awt);
    printf("\nAverage Turn Around Time: %.2f\n", att);
}
