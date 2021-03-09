/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.CustomerDA;
import domain.Customer;

/**
 *
 * @author Forge-15
 */
public class CustomerControl {
    
    private CustomerDA custDA;
    
    public CustomerControl() {
        custDA = new CustomerDA();
    }
    
    
    public Customer selectRecord(int custID){
        return custDA.getRecord(custID);
    }
        
    
    
}
