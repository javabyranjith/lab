package ex03;

import java.util.Scanner;

class Payslip {
    public static void main(String[] args) {
        char ans;
        Scanner sc = new Scanner(System.in);
        do {
            System.out.println("Main Menu");
            System.out.println("1. Programmer \n2. Assistant Professor \n3. Associate Professor \n4.Professor");
            System.out.println("Enter your choice: ");
            int choice = sc.nextInt();
            switch (choice) {
                case 1:
                    Programmer p = new Programmer();
                    p.display();
                    break;
                case 2:
                    AssistantProfessor ap = new AssistantProfessor();
                    ap.display();
                    break;
                case 3:
                    AssociateProfessor asp = new AssociateProfessor();
                    asp.display();
                    break;
                case 4:
                    Professor PR = new Professor();
                    PR.display();
                    break;
            }
            System.out.println("Do you want to go to Main Menu?(y/n): ");
            ans = sc.next().charAt(0);
        } while (ans == 'y' || ans == 'Y');
        sc.close();
    }
}

