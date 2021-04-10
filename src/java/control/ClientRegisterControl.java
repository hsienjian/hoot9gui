/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.CustomerDA;
import domain.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin-jiahie
 */
public class ClientRegisterControl extends HttpServlet {

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
        doPost(request, response);
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
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        Integer age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        String confirmPassword = request.getParameter("confirmPassword");
        String url = "";
        String message1 = "";
        String message2 = "";
        boolean checkSuccess = true;
        CustomerDA cusDa = new CustomerDA();

        Customer checkCus = null;
        try {
            checkCus = cusDa.getCustomer(email);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }
        if (checkCus != null) {
            url = "clientRegister.jsp";
            message1 = "email already exist!!";
            checkSuccess = false;
        }
        if (!password.equals(confirmPassword)) {
            url = "clientRegister.jsp";
            message2 = "Password is not same as the comfirm password";
            checkSuccess = false;
        }

        if (checkSuccess) {
            Customer customer = new Customer(firstName, lastName, age, email, password, gender, address, phoneNo, 0);
            try {
                cusDa.addCustomer(customer);
                url = "clientSuccessRegister.jsp";
            } catch (SQLException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }
        }

        request.setAttribute("message1", message1);
        request.setAttribute("message2", message2);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
