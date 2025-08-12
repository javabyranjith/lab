package ex05;

import java.util.Scanner;

class Circle implements Shape {
    public void printArea() {
        System.out.println("\t\tCalculating Area of Circle");
        Scanner input = new Scanner(System.in);
        System.out.print("Enter radius: ");
        int a = input.nextInt();
        double area = 3.14 * a * a;
        System.out.println("Area of Circle: " + area);
    }
}
