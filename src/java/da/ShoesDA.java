/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Shoes;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;

public class ShoesDA {

    private final String host = "jdbc:derby://localhost:1527/guidb";
    private final String user = "guidb";
    private final String password = "guidb";
    private final String tableName = "SHOES";
    private Connection conn;
    private PreparedStatement stmt;
    private final ColorDA colorDA;
    private final StaffDA staffDA;

    public ShoesDA() {
        colorDA = new ColorDA();
        staffDA = new StaffDA();
    }

    public Shoes getShoes(int prodID) throws SQLException {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID= ?";
        Shoes shoes = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                shoes = new Shoes(rs.getInt("prod_ID"), rs.getString("Size"), rs.getString("Prod_Name"), rs.getString("Brand"), rs.getDouble("Price"), rs.getInt("Stock"), rs.getString("Season"), rs.getString("Img"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
            }
        } catch (SQLException ex) {
            throw ex;
        }
        return shoes;
    }

    public ArrayList<Shoes> getAllShoes() throws SQLException {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName;
        ArrayList<Shoes> shoes = new ArrayList<Shoes>();
        try {
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Shoes s = new Shoes(rs.getInt("prod_ID"), rs.getString("Size"), rs.getString("Prod_Name"), rs.getString("Brand"), rs.getDouble("Price"), rs.getInt("Stock"), rs.getString("Season"), rs.getString("Img"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                shoes.add(s);
            }
        } catch (SQLException ex) {
            throw ex;
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

    public void restock(int prodID, int stock) throws SQLException {
        createConnection();
        String queryStr = "UPDATE " + tableName + " SET STOCK=? WHERE PROD_ID=?";
        try {
            createConnection();
            stmt = conn.prepareStatement(queryStr);
            stmt.setDouble(1, stock);
            stmt.setDouble(2, prodID);
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
