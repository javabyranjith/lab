#include <stdio.h>

int main() {
    int pages[50], frames[20], future[20], temp[20], n, f, i, j, k = 0, count = 0;
    int isFound, indexToReplace, maxIndex;

    printf("Enter number of pages: ");
    scanf("%d", &n);

    printf("Enter the reference string: ");
    for (i = 0; i < n; i++) {
        scanf("%d", &pages[i]);
    }

    printf("Enter number of frames: ");
    scanf("%d", &f);

    // Initialize first page
    frames[k++] = pages[0];
    count++;
    printf("\n\t%d\n", pages[0]);

    // Iterate over the rest of the pages
    for (i = 1; i < n; i++) {
        isFound = 0;

        // Check if page is already in frame
        for (j = 0; j < f; j++) {
            if (frames[j] == pages[i]) {
                isFound = 1;
                break;
            }
        }

        // If page not found, it's a fault
        if (!isFound) {
            count++;

            // If frame is not yet full
            if (k < f) {
                frames[k++] = pages[i];
            } else {
                // Calculate next use of each frame element
                for (j = 0; j < f; j++) {
                    future[j] = -1;
                    for (int m = i + 1; m < n; m++) {
                        if (frames[j] == pages[m]) {
                            future[j] = m;
                            break;
                        }
                    }
                }

                // Find the frame whose page won't be used for the longest time
                maxIndex = 0;
                for (j = 1; j < f; j++) {
                    if (future[j] == -1 || (future[maxIndex] != -1 && future[j] > future[maxIndex])) {
                        maxIndex = j;
                    }
                }

                // Replace it with the current page
                frames[maxIndex] = pages[i];
            }

            // Print current frame state
            for (j = 0; j < k; j++) {
                printf("\t%d", frames[j]);
            }
            printf("\n");
        }
    }

    printf("\nTotal number of page faults: %d\n", count);
    return 0;
}
