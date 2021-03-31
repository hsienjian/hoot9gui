/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Order;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;

public class OrderDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "\"ORDER\"";
    private Connection conn;
    private PreparedStatement stmt;
    private CustomerDA custDA;

    public OrderDA() {
        custDA = new CustomerDA();
    }

    public Order getOrder(int orderID) throws SQLException {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID=?";
        Order order = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new Order(orderID, rs.getDate("DATE"), rs.getDouble("TOTAL_PRICE"), rs.getString("STATUS"), rs.getInt("CUST_ID"));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return order;
    }

    public void addOrder(Order order) throws SQLException {
        createConnection();
        String insertColor = "INSERT INTO " + tableName + " (DATE, TOTAL_PRICE, STATUS, CUST_ID) VALUES( ?, ?, ?, ?, ?)";
        try {
            createConnection();
            stmt = conn.prepareStatement(insertColor);
            stmt.setDate(1, order.getDate());
            stmt.setDouble(2, order.getTtlPrice());
            stmt.setString(3, order.getStatus());
            stmt.setInt(4, order.getCustID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateOrder(Order order) throws SQLException {
        createConnection();
        String insertColor = "UPDATE " + tableName + " SET DATE=?, TOTAL_PRICE=?, STATUS=?, CUST_ID=? WHERE ORDER_ID=?";
        try {
            createConnection();
            stmt = conn.prepareStatement(insertColor);
            stmt.setDate(1, order.getDate());
            stmt.setDouble(2, order.getTtlPrice());
            stmt.setString(3, order.getStatus());
            stmt.setInt(4, order.getCustID());
            stmt.setInt(5, order.getOrderID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }

    }

    public void deleteOrder(int orderID) throws SQLException {
        {
            createConnection();
            String deleteProd = "DELETE FROM " + tableName + " WHERE ORDER_ID = ?";
            try {
                stmt = conn.prepareStatement(deleteProd);
                stmt.setInt(1, orderID);
                stmt.executeUpdate();
            } catch (SQLException ex) {
                throw ex;
            } finally {
                shutDown();
            }
        }
    }

    public ArrayList<Order> getOrderList() throws SQLException {
        createConnection();
        ArrayList<Order> orderList = new ArrayList<Order>();
        Order order = null;
        String orderQuery = "SELECT * FROM " + tableName + " WHERE CUST_ID = ?";
        try {
            stmt = conn.prepareStatement(orderQuery);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
                orderList.add(order);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return orderList;
    }

    public ArrayList<Order> getCusOrderList(int cusID) throws SQLException {
        createConnection();
        ArrayList<Order> cusOrderList = new ArrayList<Order>();
        Order order = null;
        String orderQuery = "SELECT * FROM " + tableName + " WHERE CUST_ID = ?";
        try {
            stmt = conn.prepareStatement(orderQuery);
            stmt.setInt(1, cusID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
                cusOrderList.add(order);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return cusOrderList;
    }

    public Order getCusOrder(int cusID, int orderID) throws SQLException {
        createConnection();
        Order order = null;
        String orderQuery = "SELECT * FROM " + tableName + " WHERE CUST_ID = ? AND ORDER_ID = ?";
        try {
            stmt = conn.prepareStatement(orderQuery);
            stmt.setInt(1, cusID);
            stmt.setInt(2, orderID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return order;
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
