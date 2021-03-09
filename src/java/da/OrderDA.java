/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Customer;
import domain.Order;
import java.sql.*;
import javax.swing.*;

public class OrderDA {

    private String host = "jdbc:derby://localhost:1527/collegedb";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Order";
    private Connection conn;
    private PreparedStatement stmt;
    private CustomerDA custDA;

    public OrderDA() {
        custDA = new CustomerDA();
    }

    public Order getRecord(int orderID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID = ?";
        Order order = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Customer customer = custDA.getRecord(rs.getString("CUST_ID"));
                order = new Order(orderID, rs.getString("DATE"), rs.getString("TOTAL_PRICE"), rs.getString("STATUS"), customer);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return order;
    }

    public void addRecord(Order order) throws SQLException {
        String insertColor = "INSERT INTO" + tableName + "VALUES( ?, ?, ?, ?, ?)";
        try {
            createConnection();
            stmt = conn.prepareStatement(insertColor);
            stmt.setInt(1, order.getOrderID());
            stmt.setString(2, order.getDate());
            stmt.setDouble(3, order.getTtlPrice());
            stmt.setString(4, order.getStatus());
            stmt.setDouble(5, order.getCustID.getCustID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateRecord(Order order) throws SQLException {

    }

    public void deleteRecord(int orderID) throws SQLException {
        try {
            createConnection();
            String deleteProd = "DELETE FROM" + tableName + "WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(deleteProd);
            stmt.setInt(1, orderID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
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
