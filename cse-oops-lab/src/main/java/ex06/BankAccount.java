package ex06;

class BankAccount {
    private double balance;
    private int accountNumber;

    public BankAccount(int accountNumber, double initialBalance) throws
            NegativeAmtException {
        if (initialBalance < 0)
            throw new NegativeAmtException("Initial amount should not be negative!");
        balance = initialBalance;
        this.accountNumber = accountNumber;
    }

    public void deposit(double amount) throws NegativeAmtException {
        if (amount < 0) {
            throw new NegativeAmtException("Don't deposit negative amount!");
        }
        balance = balance + amount;
        System.out.println("Amount deposited");
        System.out.println("Balance amount : " + getBalance());
    }

    public void withdraw(double amount) throws NegativeAmtException {
        if (amount < 0) {
            throw new NegativeAmtException("Don't withdraw a negative amount !");
        } else if (amount <= balance) {
            balance = balance - amount;
        } else {
            System.out.println("Insufficient amount");
        }
        System.out.println("Balance amount : " + getBalance());
    }

    public double getBalance() {
        return balance;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public String toString() {
        return "Account Number :" + accountNumber + " Balance :" + balance;
    }
}
