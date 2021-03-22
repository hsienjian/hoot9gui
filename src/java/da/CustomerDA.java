/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class CustomerDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "CUSTOMER";
    private Connection conn;
    private PreparedStatement stmt;

    public CustomerDA() {
    }

    public Customer getCustomer(int custID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE CUST_ID=?";
        Customer customer = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, custID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(custID, rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getInt("REWARDPOINT"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
        return customer;
    }

    public void addCustomer(Customer customer) {
        createConnection();
        String queryStr = "INSERT INTO " + tableName + " (FIRST_NAME, LAST_NAME, AGE, EMAIL, PASSWORD, GENDER, ADDRESS, PHONE_NO, REWARD_POINT) VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, customer.getFirstName());
            stmt.setString(2, customer.getLastName());
            stmt.setInt(3, customer.getAge());
            stmt.setString(4, customer.getEmail());
            stmt.setString(5, customer.getPassword());
            stmt.setString(6, customer.getGender());
            stmt.setString(7, customer.getAddress());
            stmt.setString(8, customer.getPhoneNo());
            stmt.setInt(9, customer.getRewardPoint());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
    }

    public void updateCustomer(Customer customer) {
        createConnection();
        String queryStr = "UPDATE " + tableName + " SET FIRST_NAME=?, LAST_NAME=?, AGE=?, EMAIL=?, PASSWORD=?, GENDER=?, ADDRESS=?, PHONE_NO=?, REWARD_POINT=? WHERE CUST_ID=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, customer.getFirstName());
            stmt.setString(2, customer.getLastName());
            stmt.setInt(3, customer.getAge());
            stmt.setString(4, customer.getEmail());
            stmt.setString(5, customer.getPassword());
            stmt.setString(6, customer.getGender());
            stmt.setString(7, customer.getAddress());
            stmt.setString(8, customer.getPhoneNo());
            stmt.setInt(9, customer.getRewardPoint());
            stmt.setInt(10, customer.getCustID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
    }

    public void deleteCustomer(int custID) {
        createConnection();
        String queryStr = "DELETE FROM " + tableName + " WHERE CUST_ID=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, custID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
    }

    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("***TRACE: Connection established.");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

}
