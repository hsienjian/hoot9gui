/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.OrderList;
import java.sql.*;
import java.util.*;

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

//    public OrderList getOrderList(int prodID) throws SQLException {
//        OrderList orderlist = null;
//        try {
//            createConnection();
//            String queryStr = "SELECT * FROM " + tableName + " WHERE ORDER_ID=?";
//            stmt = conn.prepareStatement(queryStr);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                orderlist = new OrderList(prodID, rs.getInt("ORDERID"), rs.getInt("QTY"), rs.getDouble("SUBTTLPRICE"));
//            }
//        } catch (SQLException ex) {
//            throw ex;
//        } finally {
//            shutDown();
//        }
//        return orderlist;
//    }
    public void addOrderList(OrderList orderlist) throws SQLException {
        try {
            createConnection();
            String insertColor = "INSERT INTO " + tableName + " (PROD_ID, ORDER_ID, QTY, SUBTOTAL) VALUES( ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertColor);
            stmt.setInt(1, orderlist.getProdID());
            stmt.setInt(2, orderlist.getOrderID());
            stmt.setInt(3, orderlist.getQty());
            stmt.setDouble(4, orderlist.getSubTtlPrice());
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

    public ArrayList<OrderList> CusOrderList() throws SQLException {
        ArrayList<OrderList> custOrderList = new ArrayList<OrderList>();
        OrderList orderList = null;
        try {
            createConnection();
            String orderQuery = "SELECT * FROM \"ORDERLIST\" ";
            stmt = conn.prepareStatement(orderQuery);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                orderList = new OrderList(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4));
                custOrderList.add(orderList);
                System.out.println("erorr");
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return custOrderList;
    }
}
