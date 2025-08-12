package ex03;

class AssociateProfessor extends Employee {
    AssociateProfessor() {
        System.out.println("Enter Basic pay of the Professor:");
        BP = get.nextFloat();
    }

    void display() {
        System.out.println("==============================" + "\n" + "Associate Professor Pay Slip" + "\n" + " == == == == == == == == == == == == == == == " + "\n");
        super.display();
    }
}
