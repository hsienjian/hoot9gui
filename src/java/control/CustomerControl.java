/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.CustomerDA;
import da.OrderDA;
import da.OrderListDA;
import domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class CustomerControl extends HttpServlet {

    private CustomerDA customerDA;
    private OrderDA orderDA;
    private OrderListDA orderlistDA;

    @Override
    public void init() throws ServletException {
        customerDA = new CustomerDA();
        orderDA = new OrderDA();
        orderlistDA = new OrderListDA();
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int option = Integer.parseInt(request.getParameter("option"));

        switch (option) {
            case 0:
                listOfCustomer(request, response);
                break;
            case 1:
                retrieveCustomer(request, response);
                break;
            case 2:
                editCustomer(request,response);
                break;
            case 3:
                toCustomerReport(request,response);
                break; 
               
                

        }
        
    }

    private void toCustomerReport (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
            
            response.sendRedirect("Sales_record.jsp");
                
}
    
      private void listOfCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try  {
            ArrayList<Customer> customer = new ArrayList<Customer>();
            customer = customerDA.getCustomer();
            request.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Cust_record.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }
    
        private void retrieveCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int custID = Integer.parseInt(request.getParameter("custID"));
        try  {
             
             Customer customer = null;
            customer = customerDA.getCustomer(custID);
            request.setAttribute("customer", customer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("edit_Customer_record.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
        
    }
    
    
    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
        
        int custId = Integer.parseInt(request.getParameter("custId"));      
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phoneNo = request.getParameter("phoneNo");
        int rewardPoint = Integer.parseInt(request.getParameter("rewardPoint"));
        
            try {

                Customer addCustomerR = new Customer(custId, firstName, lastName, age, email, password, gender, address, phoneNo, rewardPoint);
                customerDA.updateCustomer(addCustomerR);
                request.setAttribute("success", "Edit is successfully added.");
                
                
        } catch (Exception ex) {
             try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }
           
          RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerControl?option=0");
                dispatcher.forward(request, response);   
        
    }
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        doGet(request,response);
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
