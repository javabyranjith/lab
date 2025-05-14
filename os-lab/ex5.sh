#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/wait.h>  // ✅ for wait()

#define SHM_SIZE 1024

int main() {
    int shmid;
    char *shmaddr;
    key_t key = 5678;

    // Create shared memory segment
    if ((shmid = shmget(key, SHM_SIZE, IPC_CREAT | 0666)) < 0) {
        perror("shmget");
        exit(1);
    }

    // Attach shared memory
    if ((shmaddr = shmat(shmid, NULL, 0)) == (char *) -1) {
        perror("shmat");
        exit(1);
    }

    // Write message to shared memory
    strncpy(shmaddr, "Hello, world!", SHM_SIZE);
    shmaddr[SHM_SIZE - 1] = '\0';  // Just to be safe

    // Fork process
    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        exit(1);
    } else if (pid == 0) {
        // Child process
        printf("Child process reading from shared memory: %s\n", shmaddr);
        exit(0);
    } else {
        // Parent process
        wait(NULL);
        printf("Parent process wrote to shared memory: %s\n", shmaddr);

        // Detach shared memory
        if (shmdt(shmaddr) == -1) {
            perror("shmdt");
            exit(1);
        }

        // Remove shared memory segment
        if (shmctl(shmid, IPC_RMID, NULL) == -1) {
            perror("shmctl");
            exit(1);
        }
    }

    return 0;
}
