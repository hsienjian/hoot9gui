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
        Shoes shoes = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID= ?";
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
        ArrayList<Shoes> shoes = new ArrayList<Shoes>();
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName;
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
        try {
            createConnection();
            String queryStr = "INSERT INTO " + tableName + " (SIZE, PROD_NAME, BRAND, PRICE, STOCK, SEASON, IMG, COLOR_ID, STAFF_ID) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
        try {
            createConnection();
            String queryStr = "UPDATE " + tableName + " SET SIZE=?, PROD_NAME=?, BRAND=?, PRICE=?, STOCK=?, SEASON=?, IMG=?, COLOR_ID=?, STAFF_ID=? WHERE PROD_ID=?";
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
            stmt.setInt(10, shoes.getProdID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public void deleteShoes(int prodID) throws SQLException {
        try {
            createConnection();
            String queryStr = "DELETE FROM " + tableName + " WHERE PROD_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
    }

    public ArrayList<Shoes> listAllShoes() throws SQLException {
        ArrayList<Shoes> listshoes = new ArrayList<Shoes>();
        Shoes shoes = null;
        try {
            createConnection();
            String selectStt = "SELECT * FROM " + tableName + " WHERE PROD_ID IN (SELECT MAX(PROD_ID) FROM " + tableName + " GROUP BY UPPER(PROD_NAME) )";
            stmt = conn.prepareStatement(selectStt);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                shoes = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                listshoes.add(shoes);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return listshoes;
    }

    public ArrayList<Shoes> brands() throws SQLException {
        ArrayList<Shoes> brands = new ArrayList<Shoes>();
        Shoes department = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID IN (SELECT MAX(PROD_ID) FROM " + tableName + " GROUP BY UPPER(BRAND) )";
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                department = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                brands.add(department);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return brands;
    }

    public ArrayList<Shoes> colors() throws SQLException {
        ArrayList<Shoes> colors = new ArrayList<Shoes>();
        Shoes department = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE COLOR_ID IN (SELECT MAX(COLOR_ID) FROM " + tableName + " GROUP BY UPPER(PROD_NAME) )";
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                department = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                colors.add(department);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return colors;
    }

    public ArrayList<Shoes> seasons() throws SQLException {
        ArrayList<Shoes> seasons = new ArrayList<Shoes>();
        Shoes department = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID IN (SELECT MAX(PROD_ID) FROM " + tableName + " GROUP BY UPPER(SEASON) )";
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                department = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                seasons.add(department);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return seasons;
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
            throw ex;
        } finally {
            shutDown();
        }
        return shoesdetails;
    }
    
        public ArrayList<Shoes> getRecord() throws SQLException {
        Shoes choosen = null;
        ArrayList<Shoes> shoesdetails = new ArrayList<Shoes>();
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_NAME = ?";
            stmt = conn.prepareStatement(queryStr);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                choosen = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"),  rs.getString("PRODNAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
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

    public ArrayList<Shoes> searchProd(String searching) throws SQLException {
        ArrayList<Shoes> results = new ArrayList<Shoes>();
        Shoes searched = null;
        try {
            createConnection();
            String queryStr = "SELECT * FROM " + tableName + " WHERE UPPER(PROD_NAME) LIKE '%" + searching + "%' AND PROD_ID IN (SELECT MAX(PROD_ID) FROM " + tableName + " GROUP BY PROD_NAME ) ";
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                searched = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
                results.add(searched);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return results;
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

    private void shutDown() throws SQLException {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                throw ex;
            }
        }
    }

    public Shoes getOrderShoes(int prodID) throws SQLException {
        createConnection();
        Shoes orderShoes = null;
        try {
            String queryStr = "SELECT * FROM " + tableName + " WHERE PROD_ID = ?";
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, prodID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                orderShoes = new Shoes(rs.getInt("PROD_ID"), rs.getString("SIZE"), rs.getString("PROD_NAME"), rs.getString("BRAND"), rs.getDouble("PRICE"), rs.getInt("STOCK"), rs.getString("SEASON"), rs.getString("IMG"), rs.getInt("COLOR_ID"), rs.getInt("STAFF_ID"));
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            shutDown();
        }
        return orderShoes;
    }
}
