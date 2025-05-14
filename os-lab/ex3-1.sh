#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>  // Include this for wait()

void main(int argc, char *arg[])
{
    int pid;

    pid = fork();  // Create a child process

    if(pid < 0) {
        printf("fork failed\n");
        exit(1);
    }
    else if(pid == 0) {
        // This block is executed by the child process
        execlp("whoami", "whoami", NULL);  // Execute the 'whoami' command
        exit(0);  // In case execlp fails, exit the child process
    }
    else {
        // This block is executed by the parent process
        printf("\nParent process id is - %d\n", getpid());
        wait(NULL);  // Wait for the child process to finish
        exit(0);
    }
}
