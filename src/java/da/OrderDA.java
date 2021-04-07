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

    public Order getOrder(int order_id) throws SQLException {
        Order order = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, order_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(order_id, rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return order;
    }

    public void addOrder(Order order) throws SQLException {
        try {
            createConnection();
            String insertColor = "INSERT INTO " + tableName + " (DATE, TOTAL_PRICE, STATUS, CUST_ID) VALUES( ?, ?, ?, ?, ?)";
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

    public void deleteRecord(int orderID) throws SQLException {
        try {
            createConnection();
            String deleteStud = "DELETE FROM " + tableName + " WHERE ID = ?";
            stmt = conn.prepareStatement(deleteStud);
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

    public void updateOrderStatus(Order order) throws SQLException {
        try {
            createConnection();
            String updateStt = "UPDATE " + tableName + " SET STATUS = ? WHERE ORDER_ID=? AND DATE=? AND TOTAL_PRICE=? AND CUST_ID=?";
            stmt = conn.prepareStatement(updateStt);
            stmt.setString(1, order.getStatus());
            stmt.setInt(2, order.getOrderID());
            stmt.setDate(3, order.getDate());
            stmt.setDouble(4, order.getTtlPrice());
            stmt.setInt(5, order.getCustID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public Order getOrder(double ttlPrice) throws SQLException {
        Order order = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setDouble(1, ttlPrice);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), ttlPrice, rs.getString(4), rs.getInt(5));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return order;
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

}
