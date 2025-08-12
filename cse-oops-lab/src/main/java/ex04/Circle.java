package ex04;

import java.util.Scanner;

class Circle extends Shape {
    void printArea() {
        System.out.println("\t\tCalculating Area of Circle");
        Scanner input = new Scanner(System.in);
        System.out.print("Enter radius: ");
        a = input.nextInt();
        double area = 3.14 * a * a;
        System.out.println("Area of Circle: " + area);
    }
}
