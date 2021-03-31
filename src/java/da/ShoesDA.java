package da;

import domain.Shoes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class ShoesDA {

    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "SHOES";
    private Connection conn;
    private PreparedStatement stmt;

    public void ShoesDA() {
    }

    public ArrayList<Shoes> listAllShoes() throws SQLException {
        createConnection();
        ArrayList<Shoes> listshoes = new ArrayList<Shoes>();
        Shoes shoes = null;
        try {
            String selectStt = "SELECT DISTINCT * FROM " + tableName + " ORDER BY BRAND, PROD_NAME";
            stmt = conn.prepareStatement(selectStt);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int prod_id = rs.getInt("prod_id");
                String size = rs.getString("size");
                String prod_name = rs.getString("prod_name");
                String brand = rs.getString("brand");
                Double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                String season = rs.getString("season");
                String image = rs.getString("img");
                int color_id = rs.getInt("color_id");
                int staff_id = rs.getInt("staff_id");

                shoes = new Shoes(prod_id, size, prod_name, brand, price, stock, season, image, color_id, staff_id);
                listshoes.add(shoes);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return listshoes;
    }

    public ArrayList<Shoes> getRecord(String prod_name) throws SQLException {
        Shoes choosen = null;
        ArrayList<Shoes> shoesdetails = new ArrayList<Shoes>();
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_NAME = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, prod_name);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                choosen = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), prod_name, rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                shoesdetails.add(choosen);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return shoesdetails;
    }

    public ArrayList<Shoes> staffHandle(int staffID) throws SQLException {
        Shoes handled = null;
        ArrayList<Shoes> shoes = new ArrayList<Shoes>();
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE STAFF_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, staffID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                handled = new Shoes(staffID, rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                shoes.add(handled);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            throw ex;
        } finally {
            shutDown();
        }
        return shoes;
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
