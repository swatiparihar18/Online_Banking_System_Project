package com.bank.model;

public class Customer {
    private int id;
    private String firstName, lastName, email,phone,gender, branch, password, permanentAddress, presentAddress,
            accountNumber;
    private String dob;
    private double balance;

    // Getters and setters...
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getAccountNumber() { return accountNumber; }
    public void setAccountNumber(String accountNumber) { this.accountNumber = accountNumber; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public double getBalance() { return balance; }
    public void setBalance(double balance) { this.balance = balance; }


}