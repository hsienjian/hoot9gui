/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.CustomerDA;
import domain.Customer;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ruey
 */
public class ClientLoginControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("activeCustomer");
        response.sendRedirect("/hoot9e/clientLogin.jsp");

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
        StringBuffer errorMsg = new StringBuffer();
        HttpSession session = request.getSession();

        String email = request.getParameter("customer_email");
        String password = request.getParameter("customer_password");
        CustomerDA custDA = new CustomerDA();

        try {
            Customer customer = custDA.getCustomer(email);
            if (customer == null) {
                errorMsg.append("Invalid Customer Email.\n");
                request.setAttribute("errorMsg", errorMsg);
            } else if (!customer.getPassword().equals(password)) {
                errorMsg.append("Incorrect Customer Password.\n");
                request.setAttribute("errorMsg", errorMsg);
            } else {
                session.setAttribute("activeCustomer", email);
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

        if (session.getAttribute("activeCustomer") == null) {
            RequestDispatcher rd = request.getRequestDispatcher("clientLogin.jsp");
            rd.include(request, response);
        } else {
            response.sendRedirect("home.jsp");
        }
    }

}
