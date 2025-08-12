package ex06;

class NegativeAmtException extends Exception {
    String msg;

    NegativeAmtException(String msg) {
        this.msg = msg;
    }

    public String toString() {
        return msg;
    }
}
