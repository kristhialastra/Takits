
package com.mvc.connection;

import java.sql.DriverManager;


public class DatabaseConnection {
        public static java.sql.Connection getConnection() {
        java.sql.Connection con = null;
        String uname="root";   //database user name
        String pass="root";    //database password
        try {
            Class.forName("com.mysql.jdbc.Driver");    //registering MySQL JDBC Driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Takits", "root", "root");
        } catch (Exception ae) {
            System.out.println(ae);
        }
        return con;
    }
}
