package ex03;

class Programmer extends Employee {
    Programmer() {
        System.out.println("Enter Basic pay of the Programmer:");
        BP = get.nextFloat();
    }

    void display() {
        System.out.println("==============================" + "\n" + "Programmar Pay Slip" + "\n" + " == == == == == == == == == == == == == == == " + "\n");
        super.display();
    }
}
