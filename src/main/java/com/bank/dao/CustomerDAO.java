package com.bank.dao;
import com.bank.model.Customer;
import com.bank.util.DBConnection;

import java.sql.*;

public class CustomerDAO {
    public static Customer getCustomerByEmail(String email) {
        Customer customer = null;
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customers WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setAccountNumber(rs.getString("account_number"));
                customer.setFirstName(rs.getString("firstname"));
                customer.setLastName(rs.getString("lastname"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setBranch(rs.getString("branch"));
                customer.setBalance(rs.getDouble("balance"));
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }
}