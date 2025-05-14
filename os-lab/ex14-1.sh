#include<stdio.h>

void main()
{
    char a[10];
    int i, ib, cib[5]; // Change to 5 because you want 5 child blocks
    printf("\n Enter the file name: ");
    scanf("%s", a);

    printf("\n Enter the index block: ");
    scanf("%d", &ib);

    for(i = 0; i < 5; i++) // Adjusted to iterate over the correct array size
    {
        printf("\n Enter the child of index block %d: ", i + 1); // Displaying child block correctly
        scanf("%d", &cib[i]);
    }

    // Output the file and its index block
    printf("\n The list of files\tIndex Block\n");
    printf("%s\t\t %d\n", a, ib);

    // Output the child blocks
    printf("\n The above file utilization index block of child blocks following:\n");
    for(i = 0; i < 5; i++) // Iterate through the child blocks
    {
        printf("%d\t\t", cib[i]);
    }
    printf("\n");
}
