package da;

import domain.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class OrderDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private Connection conn;
    private PreparedStatement stmt;

    public OrderDA() {

    }

    public ArrayList<Order> listRecord() throws SQLException {
        createConnection();
        ArrayList<Order> orderList = new ArrayList<Order>();
        Order order = null;
        String orderQuery = "SELECT * FROM \"ORDER\" ";
        try {
            stmt = conn.prepareStatement(orderQuery);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
                orderList.add(order);
                System.out.println("erorro");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("erorro1");
        } finally {
            shutDown();
        }
        return orderList;
    }

    public Order getRecord(int order_id) throws SQLException {
        Order select = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM \"ORDER\" WHERE ORDER_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, order_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                select = new Order(order_id, rs.getDate(2), rs.getDouble(3), rs.getString(4), rs.getInt(5));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return select;
    }

    public void updateRecord(Order order) throws SQLException {
        createConnection();
        try {
            String updateStt = "UPDATE \"ORDER\" SET STATUS = ? WHERE ORDER_ID=? AND DATE=? AND TOTAL_PRICE=? AND CUST_ID=?";
            stmt = conn.prepareStatement(updateStt);
            stmt.setString(1, order.getStatus());
            stmt.setInt(2, order.getOrderID());
            stmt.setDate(3, order.getDate());
            stmt.setDouble(4, order.getTtlPrice());
            stmt.setInt(5, order.getCustID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            shutDown();
        }
    }

    public void deleteRecord(String id) throws SQLException {
        try {
            createConnection();
            String deleteStud = "DELETE FROM \"ORDER\" WHERE ID = ?";
            stmt = conn.prepareStatement(deleteStud);
            stmt.setString(1, id);
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
