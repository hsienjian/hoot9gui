package da;

import domain.Staff;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class StaffDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "STAFF";
    private Connection conn;
    private PreparedStatement stmt;

    public void StaffDA() {
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
        ArrayList<Staff> listStaff = new ArrayList<Staff>();
        Staff staff = null;
        try {
            String selectStt = "SELECT * FROM " + tableName + " ORDER BY STAFF_ID";
            stmt = conn.prepareStatement(selectStt);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                staff = new Staff(rs.getInt("STAFF_ID"), rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getString("POSITION"));
                listStaff.add(staff);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return listStaff;
    }

    public Staff getRecord(int staff_id) throws SQLException {
        Staff choosen = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE STAFF_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staff_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                choosen = new Staff(staff_id, rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getString("POSITION"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return choosen;
    }

    public void updateRecord(Staff staff) throws SQLException {
        createConnection();
        try {
            String updateStt = "UPDATE " + tableName + " SET FIRST_NAME=? , LAST_NAME=? , AGE=? , EMAIL=? , PASSWORD=? , GENDER=? , ADDRESS=? , PHONE_NO=? , POSITION=? WHERE STAFF_ID=?";
            stmt = conn.prepareStatement(updateStt);
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
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void addRecord(Staff staff) throws SQLException {
        createConnection();
        try {
            String insertStt = "INSERT INTO " + tableName + " (FIRST_NAME, LAST_NAME, AGE, EMAIL, PASSWORD, GENDER, ADDRESS, PHONE_NO, POSITION) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
            stmt = conn.prepareStatement(insertStt);
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
            ex.printStackTrace();
        } finally {
            shutDown();
        }
    }

    public void deleteStaff(int staffID) throws SQLException {
        createConnection();
        String queryStr = "DELETE FROM " + tableName + " WHERE STAFF_ID = ?";
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staffID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public String getPassword(int staff_id) throws SQLException {
        String oldpswd = null;
        try {
            createConnection();
            String queryStr = "SELECT PASSWORD FROM " + tableName + " WHERE STAFF_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staff_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                oldpswd = rs.getString("PASSWORD");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return oldpswd;
    }

//    public void updatePassword(String password, int id) throws SQLException {
//        createConnection();
//        try {
//            String updatePWD = "UPDATE " + tableName + " SET PASSWORD=? WHERE STAFF_ID=?";
//            stmt = conn.prepareStatement(updatePWD);
//            stmt.setString(1, password);
//            stmt.setInt(2, id);
//            stmt.executeUpdate();
//        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
//            throw ex;
//        } finally {
//            shutDown();
//        }
//    }
    public Staff searchStaff(String staffEmail, String staffPW) throws SQLException {
        Staff found = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE EMAIL = ? , PASSWORD = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, staffEmail);
            stmt.setString(2, staffPW);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                found = new Staff(rs.getInt("STAFF_ID"), rs.getString("FIRST_NAME"), rs.getString("LAST_NAME"), rs.getInt("AGE"), staffEmail, staffPW, rs.getString("GENDER"), rs.getString("ADDRESS"), rs.getString("PHONE_NO"), rs.getString("POSITION"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return found;
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
