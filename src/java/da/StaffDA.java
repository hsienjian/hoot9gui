/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Staff;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Asus
 */
public class StaffDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "STAFF";
    private Connection conn;
    private PreparedStatement stmt;

    public StaffDA() {

    }

    public Staff getStaff(String email) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE EMAIL=?";
        Staff staff = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                staff = new Staff(rs.getInt("STAFF_ID"), rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getString("POSITION"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return staff;
    }

    public Staff getStaff(int staffID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE STAFF_ID=?";
        Staff staff = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staffID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                staff = new Staff(staffID, rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getString("POSITION"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
        return staff;
    }

    public void addStaff(Staff staff) {
        createConnection();
        String queryStr = "INSERT INTO " + tableName + " (FIRST_NAME, LAST_NAME, AGE, EMAIL, PASSWORD, GENDER, ADDRESS, PHONE_NO, POSITION) VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, staff.getFirstName());
            stmt.setString(2, staff.getLastName());
            stmt.setInt(3, staff.getAge());
            stmt.setString(4, staff.getEmail());
            stmt.setString(5, staff.getPassword());
            stmt.setString(6, staff.getGender());
            stmt.setString(7, staff.getAddress());
            stmt.setString(8, staff.getPhoneNo());
            stmt.setString(9, staff.getPosition());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
    }

    public void updateStaff(Staff staff) {
        createConnection();
        String queryStr = "UPDATE " + tableName + " SET FIRST_NAME=?, LAST_NAME=?, AGE=?, EMAIL=?, PASSWORD=?, GENDER=?, ADDRESS=?, PHONE_NO=?, POSITION=? WHERE STAFF_ID=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, staff.getFirstName());
            stmt.setString(2, staff.getLastName());
            stmt.setInt(3, staff.getAge());
            stmt.setString(4, staff.getEmail());
            stmt.setString(5, staff.getPassword());
            stmt.setString(6, staff.getGender());
            stmt.setString(7, staff.getAddress());
            stmt.setString(8, staff.getPhoneNo());
            stmt.setString(9, staff.getPosition());
            stmt.setInt(10, staff.getStaffID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally {
            shutDown();
        }
    }

    public void deleteStaff(int staffID) {
        createConnection();
        String queryStr = "DELETE FROM " + tableName + " WHERE STAFF_ID=?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staffID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
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
