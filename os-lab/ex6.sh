#include <stdio.h>
#include <stdlib.h>

int mutex = 1;
int full = 0;
int empty = 3;
int x = 0;

int wait(int s);
int signal(int s);
void producer();
void consumer();

int main() {
    int n;
    printf("\n1. Producer\n2. Consumer\n3. Exit\n");
    while (1) {
        printf("\nEnter your choice: ");
        scanf("%d", &n);
        switch (n) {
            case 1:
                if ((mutex == 1) && (empty != 0))
                    producer();
                else
                    printf("Buffer is full\n");
                break;
            case 2:
                if ((mutex == 1) && (full != 0))
                    consumer();
                else
                    printf("Buffer is empty\n");
                break;
            case 3:
                exit(0);
            default:
                printf("Invalid choice\n");
        }
    }
    return 0;
}

int wait(int s) {
    return --s;
}

int signal(int s) {
    return ++s;
}

void producer() {
    empty = wait(empty);
    mutex = wait(mutex);
    x++;
    printf("\nProducer produces item %d", x);
    mutex = signal(mutex);
    full = signal(full);
}

void consumer() {
    full = wait(full);
    mutex = wait(mutex);
    printf("\nConsumer consumes item %d", x);
    x--;
    mutex = signal(mutex);
    empty = signal(empty);
}
