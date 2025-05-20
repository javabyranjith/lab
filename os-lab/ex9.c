#include <stdio.h>
#include <string.h>
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>

pthread_t tid[2];
int counter = 0;
pthread_mutex_t lock;

void* doSomeThing(void *arg) {
    unsigned long i = 0;

    pthread_mutex_lock(&lock);
    counter += 1;
    int job_id = counter;
    printf("\nJob %d started\n", job_id);
    pthread_mutex_unlock(&lock);

    // Simulate heavy job
    for(i = 0; i < 0xFFFFFFFF; i++);

    printf("Job %d finished\n", job_id);

    return NULL;
}

int main(void) {
    int i = 0;
    int err;

    if (pthread_mutex_init(&lock, NULL) != 0) {
        printf("\nMutex init failed\n");
        return 1;
    }

    while(i < 2) {
        err = pthread_create(&(tid[i]), NULL, &doSomeThing, NULL);
        if (err != 0) {
            printf("\nCan't create thread :[%s]", strerror(err));
        }
        i++;
    }

    pthread_join(tid[0], NULL);
    pthread_join(tid[1], NULL);

    pthread_mutex_destroy(&lock);
    return 0;
}
