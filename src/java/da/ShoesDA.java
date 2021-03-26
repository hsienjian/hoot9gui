/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Color;
import domain.Shoes;
import domain.Staff;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;

public class ShoesDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "SHOES";
    private Connection conn;
    private PreparedStatement stmt;
    private ColorDA colorDA;
    private StaffDA staffDA;

    public ShoesDA() {
        colorDA = new ColorDA();
        staffDA = new StaffDA();
    }

    public Shoes getShoes(int prodID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID= ?";
        Shoes shoes = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Color color = colorDA.getColor(rs.getInt("COLOR_ID"));
                Staff staff = staffDA.getStaff(rs.getInt("STAFF_ID"));
                shoes = new Shoes(prodID, rs.getString("Size"), rs.getString("Product Name"), rs.getString("Brand"), rs.getDouble("Price"), rs.getInt("Stock"), rs.getString("Season"), rs.getString("Img"), rs.getInt("CUST_ID"), rs.getInt("STAFF_ID"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return shoes;
    }

    public void addShoes(Shoes shoes) throws SQLException {
        createConnection();
        String queryStr = "INSERT INTO " + tableName + " (SIZE, PROD_NAME, BRAND, PRICE, STOCK, SEASON, IMG, COLOR_ID, STAFF_ID) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            createConnection();
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, shoes.getSize());
            stmt.setString(2, shoes.getProdName());
            stmt.setString(3, shoes.getBrand());
            stmt.setDouble(4, shoes.getPrice());
            stmt.setInt(5, shoes.getStock());
            stmt.setString(6, shoes.getSeason());
            stmt.setString(7, shoes.getImg());
            stmt.setInt(8, shoes.getColorID());
            stmt.setInt(9, shoes.getStaffID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateShoes(Shoes shoes) throws SQLException {
        createConnection();
        String queryStr = "UPDATE " + tableName + " SET SIZE=?, PROD_NAME=?, BRAND=?, PRICE=?, STOCK=?, SEASON=?, IMG=?, COLOR_ID=?, STAFF_ID=? WHERE PROD_ID=?";
        try {
            createConnection();
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, shoes.getSize());
            stmt.setString(2, shoes.getProdName());
            stmt.setString(3, shoes.getBrand());
            stmt.setDouble(4, shoes.getPrice());
            stmt.setInt(5, shoes.getStock());
            stmt.setString(6, shoes.getSeason());
            stmt.setInt(7, shoes.getColorID());
            stmt.setInt(8, shoes.getStaffID());
            stmt.setInt(9, shoes.getProdID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void deleteShoes(int prodID) throws SQLException {
        createConnection();
        String queryStr = "DELETE FROM " + tableName + " WHERE PROD_ID = ?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public ArrayList<Shoes> getShoesList() {
        createConnection();
        ArrayList<Shoes> shoesList = new ArrayList<Shoes>();
        Shoes shoes = null;
        String orderQuery = "SELECT * FROM \"SHOES\" ";
        try {
            stmt = conn.prepareStatement(orderQuery);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                shoes = new Shoes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
                shoesList.add(shoes);
                System.out.println("erorro");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("erorro1");
        } finally {
            shutDown();
        }
        return shoesList;
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
