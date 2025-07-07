package com.bank.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost:3306/bankingdb";
    private static String username = "root";
    private static String password = "1076";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
