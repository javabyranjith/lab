#include<stdio.h>

int main()
{
    int i, arr[1000], pt[100], val, pgno, offset, phymem, fs, nf;

    printf("\n--- Memory Management using Paging ---\n");

    // Input: Size of physical memory
    printf("Enter the size of physical memory (in units): ");
    scanf("%d", &phymem);

    // Input: Frame size
    printf("Enter size of frame (page size): ");
    scanf("%d", &fs);

    // Number of frames
    nf = phymem / fs;
    printf("Number of frames available: %d\n", nf);

    // Populate physical memory array (simulated)
    for(i = 0; i < phymem; i++)
        arr[i] = i;

    // Input: Page table
    printf("Enter the page table values (frame number for each page):\n");
    for(i = 0; i < nf; i++) {
        printf("Page %d -> Frame: ", i);
        scanf("%d", &pt[i]);
    }

    // Input: Page number and offset
    printf("Enter the page number: ");
    scanf("%d", &pgno);

    if(pgno >= nf || pgno < 0) {
        printf("Invalid page number!\n");
        return 1;
    }

    printf("Enter the offset: ");
    scanf("%d", &offset);

    if(offset >= fs || offset < 0) {
        printf("Invalid offset! Must be less than frame size.\n");
        return 1;
    }

    // Physical address calculation
    val = (pt[pgno] * fs) + offset;

    if(val >= phymem) {
        printf("Physical address out of bounds!\n");
        return 1;
    }

    printf("Physical Address = %d (Value at that address: %d)\n", val, arr[val]);

    return 0;
}
