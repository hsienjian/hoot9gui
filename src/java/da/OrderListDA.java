/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Order;
import domain.OrderList;
import java.sql.*;
import java.util.*;
import javax.swing.*;

public class OrderListDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "ORDERLIST";
    private Connection conn;
    private PreparedStatement stmt;
    private OrderDA orderDA;
    private ShoesDA shoesDA;

    public OrderListDA() {
        orderDA = new OrderDA();
        shoesDA = new ShoesDA();
    }

    public Order getOrderList(int orderID) throws SQLException {
        Order order = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID=?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new Order(orderID, rs.getDate("DATE"), rs.getDouble("TOTAL_PRICE"), rs.getString("STATUS"), rs.getInt("CUST_ID"));
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return order;
    }

    public void addOrderList(Order order) throws SQLException {
        try {
            createConnection();
            String insertColor = "INSERT INTO " + tableName + " (DATE, TOTAL_PRICE, STATUS, CUST_ID) VALUES( ?, ?, ?, ?)";
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

    public void updateOrderList(Order order) throws SQLException {
        try {
            createConnection();
            String insertColor = "UPDATE " + tableName + " SET DATE=?, TOTAL_PRICE=?, STATUS=?, CUST_ID=? WHERE ORDER_ID=?";
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

    public void deleteOrderList(int orderID) throws SQLException {
        try {
            createConnection();
            String deleteProd = "DELETE FROM " + tableName + " WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(deleteProd);
            stmt.setInt(1, orderID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    private void createConnection() throws SQLException {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("***TRACE: Connection established.");
        } catch (SQLException ex) {
            throw ex;
        }
    }

    private void shutDown() throws SQLException {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                throw ex;
            }
        }
    }

    public ArrayList<OrderList> getCusOrderList(int orderID) throws SQLException {
        ArrayList<OrderList> cusOrderList = new ArrayList<OrderList>();
        OrderList orderListObj = null;
        try {
            createConnection();
            String orderQuery = "SELECT * FROM " + tableName + " WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(orderQuery);
            stmt.setInt(1, orderID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                orderListObj = new OrderList(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4));
                cusOrderList.add(orderListObj);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return cusOrderList;
    }
}
