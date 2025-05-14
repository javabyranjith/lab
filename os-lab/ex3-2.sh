#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    int status;

    // Create a child process
    pid = fork();

    if (pid == -1) {
        perror("fork");
        exit(EXIT_FAILURE);
    }

    if (pid == 0) {
        // This is the child process
        printf("Child process running with PID %d\n", getpid());
        sleep(3);  // Simulating some work by sleeping for 3 seconds
        printf("Child process exiting\n");
        exit(EXIT_SUCCESS);  // Exit the child process successfully
    } else {
        // This is the parent process
        printf("Parent process running with PID %d\n", getpid());

        // Wait for the child process to exit
        if (wait(&status) == -1) {
            perror("wait");
            exit(EXIT_FAILURE);
        }

        // Check how the child process terminated
        if (WIFEXITED(status)) {
            printf("Child process exited with status %d\n", WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            printf("Child process terminated by signal %d\n", WTERMSIG(status));
        } else {
            printf("Child process did not terminate normally\n");
        }
    }

    return 0;
}
