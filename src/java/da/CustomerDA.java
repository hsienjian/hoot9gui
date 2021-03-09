/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package da;

import domain.Customer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Forge-15
 */
public class CustomerDA {
    private String host = "jdbc:derby://localhost:1527/guidb";
    private String user = "guidb";
    private String password = "guidb";
    private String tableName = "CUSTOMER";
    private Connection conn;
    private PreparedStatement stmt;
    
    
    public CustomerDA() {
        createConnection();
    }
        public Customer getRecord(int CustID) {
        createConnection();
        String queryStr = "SELECT * FROM " + tableName + " WHERE Code = ?";
        Customer customer = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setInt(1, CustID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                
                customer = new Customer(CustID, rs.getString("firstName"), rs.getString("lastName") ,rs.getInt("age") ,rs.getString("email") ,rs.getString("password"), rs.getString("gender") , rs.getString("address"),rs.getString("phoneNo"),rs.getInt("rewardPoint"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        } finally{
            shutDown();
        }
        return customer;
    }
    
        public void updateRecord(Customer customer){
           // to be implemented 
        }
        
        public void addRecord(Customer customer){
            // to be implemented
        }
        
        public void deleteRecord(String email){
            // to be implemented
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
        if (conn != null)
            try {
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
   
}
