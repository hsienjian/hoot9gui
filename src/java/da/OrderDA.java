package da;

import domain.Order;
import java.sql.*;
import java.util.*;

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

    public void updateOrder(Order order) throws SQLException {
        try {
            createConnection();
            String updateOrder = "UPDATE " + tableName + " SET DATE=?, TOTAL_PRICE=?, STATUS=?, CUST_ID=? WHERE ORDER_ID=?";
            stmt = conn.prepareStatement(updateOrder);
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

    public ArrayList<Order> listRecord() throws SQLException {
        ArrayList<Order> orderList = new ArrayList<Order>();
        try {
            createConnection();
            Order order = null;
            String orderQuery = "SELECT * FROM \"ORDER\" ";
            stmt = conn.prepareStatement(orderQuery);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
                orderList.add(order);
                System.out.println("erorro");
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return orderList;
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

}
