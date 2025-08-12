package ex05;

public class TestArea {
    public static void main(String[] args) {
        Shape obj;
        obj = new Rectangle();
        obj.printArea();
        obj = new Triangle();
        obj.printArea();
        obj = new Circle();
        obj.printArea();
    }
}
