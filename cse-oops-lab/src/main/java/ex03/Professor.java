package ex03;

class Professor extends Employee {
    Professor() {
        System.out.println("Enter Basic pay of the Professor:");
        BP = get.nextFloat();
    }

    void display() {
        System.out.println("==============================" + "\n" + "Professor Pay Slip" + "\n" + "==============================" + "\n");
        super.display();
    }
}
