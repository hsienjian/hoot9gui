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

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "COLOR";
    private Connection conn;
    private PreparedStatement stmt;

    public ColorDA() {
    }

    public Color getColor(int colorID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE COLOR_ID = ?";
        Color color = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, colorID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                color = new Color(colorID, rs.getString("COLOR_NAME"), rs.getString("COLOR_CODE"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return color;
    }

    public void addColor(Color color) throws SQLException {
        createConnection();
        String queryStr = "INSERT INTO " + tableName + " (COLOR_NAME, COLOR_CODE) VALUES(?,?)";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, color.getColorName());
            stmt.setString(2, color.getColorCode());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void updateColor(Color color) throws SQLException {
        createConnection();
        String queryStr = "UPDATE " + tableName + " SET COLOR_NAME=?, COLOR_CODE=? WHERE COLOR_ID=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, color.getColorName());
            stmt.setString(2, color.getColorCode());
            stmt.setInt(3, color.getColorID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public Color getRecord(int colorID) throws SQLException {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE COLOR_ID = ?";
        Color color = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, colorID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                color = new Color(colorID, rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return color;
    }

    public void deleteColor(int colorID) throws SQLException {
        createConnection();
        String queryStr = "DELETE FROM " + tableName + " WHERE COLOR_ID = ?";
        try {
            stmt = conn.prepareStatement(queryStr);
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
