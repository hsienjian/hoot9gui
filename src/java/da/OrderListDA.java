/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Order;
import java.sql.*;
import javax.swing.*;

public class OrderListDA {

    private String host = "jdbc:derby://localhost:1527/collegedb";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Orderlist";
    private Connection conn;
    private PreparedStatement stmt;
    private OrderDA orderDA;
    private ShoesDA shoesDA;

    public OrderListDA() {
        orderDA = new OrderDA();
        shoesDA = new ShoesDA();
    }

    public void calSubTotal(Order order) throws SQLException {

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
