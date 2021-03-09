/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Color;
import java.sql.*;
import javax.swing.*;

public class ColorDA {

    private String host = "jdbc:derby://localhost:1527/collegedb";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Color";
    private Connection conn;
    private PreparedStatement stmt;

    public ColorDA() {
        createConnection();
    }

    public Color getRecord(int colorID) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE COLOR_ID = ?";
        Color color = null;
        try {
            createConnection();
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, colorID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                color = new Color(colorID, rs.getString("COLOR_NAME"), rs.getString("COLOR_CODE"), rs.getString("IMG"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return color;
    }

    public void addRecord(Color color) throws SQLException {
        String insertColor = "INSERT INTO" + tableName + "VALUES( ?, ?, ?, ?)";
        try {
            createConnection();
            stmt = conn.prepareStatement(insertColor);
            stmt.setInt(1, color.getColorID());
            stmt.setString(2, color.getColorName());
            stmt.setString(3, color.getColorCode());
            stmt.setString(4, color.getImage());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateRecord(Color color) throws SQLException {

    }

    public void deleteRecord(int colorID) throws SQLException {
        try {
            createConnection();
            String deleteProd = "DELETE FROM" + tableName + "WHERE COLOR_ID = ?";
            stmt = conn.prepareStatement(deleteProd);
            stmt.setInt(1, colorID);
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
