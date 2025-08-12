package ex09;

class MyClass<T extends Comparable<T>> {
    T[] vals;

    MyClass(T[] obj) {
        vals = obj;
    }

    public T min() {
        T v = vals[0];
        for (int i = 1; i < vals.length; i++)
            if (vals[i].compareTo(v) < 0)
                v = vals[i];
        return v;
    }

    public T max() {
        T v = vals[0];
        for (int i = 1; i < vals.length; i++)
            if (vals[i].compareTo(v) > 0)
                v = vals[i];
        return v;
    }
}

class GenericsDemo {
    public static void main(String args[]) {
        Integer num[] = {10, 2, 5, 4, 6, 1};
        Character ch[] = {'v', 'p', 's', 'a', 'n', 'h'};
        Double d[] = {20.2, 45.4, 71.6, 88.3, 54.6, 10.4};
        String str[] = {"hai", "how", "are", "you"};
        MyClass<Integer> iob = new MyClass<Integer>(num);
        MyClass<Character> cob = new MyClass<Character>(ch);
        MyClass<Double> dob = new MyClass<Double>(d);
        MyClass<String> sob = new MyClass<String>(str);
        System.out.println("Max value in num: " + iob.max());
        System.out.println("Min value in num: " + iob.min());
        System.out.println("Max value in ch: " + cob.max());
        System.out.println("Min value in ch: " + cob.min());
        System.out.println("Max value in d: " + dob.max());
        System.out.println("Min value in d: " + dob.min());
        System.out.println("Max value in str: " + sob.max());
        System.out.println("Min value in str: " + sob.min());
    }
}
