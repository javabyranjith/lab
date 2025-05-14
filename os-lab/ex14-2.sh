#include<stdio.h>

void main()
{
    char a[10];
    int i, sb, eb, fb1[5]; // Change fb1 size to 5 since you're using only 5 blocks.

    printf("\nEnter the file name: ");
    scanf("%s", a);

    printf("\nEnter the starting block: ");
    scanf("%d", &sb);

    printf("Enter the ending block: ");
    scanf("%d", &eb);

    for(i = 0; i < 5; i++)
    {
        printf("Enter the free block %d: ", i + 1);
        scanf("%d", &fb1[i]);
    }

    // Display the results with proper formatting
    printf("\nFile name \t Starting block \t Ending block \n");
    printf("%s \t\t %d \t\t %d\n", a, sb, eb);

    printf("\n%s File Utilization of Linked type of following blocks:\n", a);
    printf("%d -> ", sb);

    for(i = 0; i < 5; i++)
    {
        printf("%d -> ", fb1[i]);
    }

    // Print the ending block
    printf("%d\n", eb);
}
