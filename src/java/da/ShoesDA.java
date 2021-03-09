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
import javax.swing.*;

public class ShoesDA {

    private String host = "jdbc:derby://localhost:1527/collegedb";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Shoes";
    private Connection conn;
    private PreparedStatement stmt;
    private ColorDA colorDA;
    private StaffDA staffDA;

    public ShoesDA() {
        colorDA = new ColorDA();
        staffDA = new StaffDA();
    }

    public Shoes getRecord(int prodID) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID= ?";
        Shoes shoes = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Color color = colorDA.getRecord(rs.getInt("COLOR_ID"));
                Staff staff = colorDA.getRecord(rs.getInt("STAFF_ID"));
                shoes = new Shoes(prodID, rs.getString("Size"), rs.getString("Product Name"), rs.getString("Brand"), rs.getDouble("Price"), rs.getString("Stock"), rs.getString("Season"), color, staff);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return shoes;
    }

    public void addRecord(Shoes shoes) throws SQLException {
        String insertColor = "INSERT INTO" + tableName + "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            createConnection();
            stmt = conn.prepareStatement(insertColor);
            stmt.setInt(1, shoes.getProdID());
            stmt.setString(2, shoes.getSize());
            stmt.setString(3, shoes.getProdName());
            stmt.setString(4, shoes.getBrand());
            stmt.setDouble(5, shoes.getPrice());
            stmt.setString(6, shoes.getStock());
            stmt.setString(7, shoes.getSeason());
            stmt.setString(8, shoes.getColorID().getColorCode());
            stmt.setString(9, shoes.getStaffID().getStaffID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateRecord(Color color) throws SQLException {

    }

    public void deleteRecord(int prodID) throws SQLException {
        try {
            createConnection();
            String deleteProd = "DELETE FROM" + tableName + "WHERE PROD_ID = ?";
            stmt = conn.prepareStatement(deleteProd);
            stmt.setInt(1, prodID);
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
