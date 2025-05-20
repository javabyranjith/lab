#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct {
    char dname[10], fname[10][10];
    int fcnt;
} dir[10];

void createDirectory(int *dcnt) {
    if (*dcnt >= 10) {
        printf("Directory limit reached!\n");
        return;
    }
    printf("\nEnter name of directory: ");
    scanf("%s", dir[*dcnt].dname);
    dir[*dcnt].fcnt = 0;
    (*dcnt)++;
    printf("Directory created\n");
}

void createFile(int dcnt) {
    char d[30];
    printf("\nEnter name of the directory: ");
    scanf("%s", d);
    for (int i = 0; i < dcnt; i++) {
        if (strcmp(d, dir[i].dname) == 0) {
            printf("Enter name of the file: ");
            scanf("%s", dir[i].fname[dir[i].fcnt]);
            dir[i].fcnt++;
            printf("File created\n");
            return;
        }
    }
    printf("Directory %s not found\n", d);
}

void deleteFile(int dcnt) {
    char d[30], f[30];
    printf("\nEnter name of the directory: ");
    scanf("%s", d);
    for (int i = 0; i < dcnt; i++) {
        if (strcmp(d, dir[i].dname) == 0) {
            printf("Enter name of the file: ");
            scanf("%s", f);
            for (int k = 0; k < dir[i].fcnt; k++) {
                if (strcmp(f, dir[i].fname[k]) == 0) {
                    printf("File %s is deleted\n", f);
                    strcpy(dir[i].fname[k], dir[i].fname[dir[i].fcnt - 1]);
                    dir[i].fcnt--;
                    return;
                }
            }
            printf("File %s not found\n", f);
            return;
        }
    }
    printf("Directory %s not found\n", d);
}

void searchFile(int dcnt) {
    char d[30], f[30];
    printf("\nEnter name of the directory: ");
    scanf("%s", d);
    for (int i = 0; i < dcnt; i++) {
        if (strcmp(d, dir[i].dname) == 0) {
            printf("Enter the name of the file: ");
            scanf("%s", f);
            for (int k = 0; k < dir[i].fcnt; k++) {
                if (strcmp(f, dir[i].fname[k]) == 0) {
                    printf("File %s is found\n", f);
                    return;
                }
            }
            printf("File %s not found\n", f);
            return;
        }
    }
    printf("Directory %s not found\n", d);
}

void displayDirectories(int dcnt) {
    if (dcnt == 0) {
        printf("\nNo directories created\n");
        return;
    }
    printf("\nDirectory\tFiles\n");
    for (int i = 0; i < dcnt; i++) {
        printf("%s\t\t", dir[i].dname);
        for (int k = 0; k < dir[i].fcnt; k++) {
            printf("%s ", dir[i].fname[k]);
        }
        printf("\n");
    }
}

int main() {
    int dcnt = 0, ch;
    while (1) {
        printf("\n\n1. Create Directory\t2. Create File\t3. Delete File");
        printf("\n4. Search File\t\t5. Display\t6. Exit\nEnter your choice: ");
        scanf("%d", &ch);

        switch (ch) {
            case 1:
                createDirectory(&dcnt);
                break;
            case 2:
                createFile(dcnt);
                break;
            case 3:
                deleteFile(dcnt);
                break;
            case 4:
                searchFile(dcnt);
                break;
            case 5:
                displayDirectories(dcnt);
                break;
            case 6:
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    return 0;
}
