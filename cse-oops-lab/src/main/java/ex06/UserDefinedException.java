package ex06;

import java.util.Scanner;

public class UserDefinedException {
    public static void main(String[] args) {
        int ch, amt;
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Account Number:");
        int a = sc.nextInt();
        System.out.print("Enter the initial Amount:");
        int b = sc.nextInt();
        BankAccount ac;
        try {
            ac = new BankAccount(a, b);
            while (true) {
                System.out.println("Main Menu");
                System.out.println("1.Deposit \n2.Withdraw \n3.Check Balance \n4.Display \n5.Exit");
                System.out.print("Enter your Choice: ");
                ch = sc.nextInt();
                switch (ch) {
                    case 1:
                        System.out.print("Enter the amount to deposit:");
                        amt = sc.nextInt();
                        ac.deposit(amt);
                        break;
                    case 2:
                        System.out.print("Enter the amount to Withdraw:");
                        amt = sc.nextInt();
                        ac.withdraw(amt);
                        break;
                    case 3:
                        System.out.println("Balance amount : " + ac.getBalance());
                        break;
                    case 4:

                        System.out.println("Your account details\n" + ac);
                        break;
                    case 5:
                        sc.close();
                        System.exit(0);
                    default:
                        System.out.println("Invalid Choice");
                }
            }
        } catch (NegativeAmtException e) {
            System.out.println("Exception Caught : " + e);
        }
    }
}
