package ex03;

class AssistantProfessor extends Employee {
    AssistantProfessor() {
        System.out.println("Enter Basic pay of the Assistant Professor:");
        BP = get.nextFloat();
    }

    void display() {
        System.out.println("==============================" + "\n" + "Assistant ProfessorPay Slip" + "\n" + "==============================" + "\n");
        super.display();
    }
}
