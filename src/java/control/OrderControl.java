/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.OrderDA;
import domain.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class OrderControl extends HttpServlet {

    private OrderDA orderDA;

    @Override
    public void init() throws ServletException {
        orderDA = new OrderDA();
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String action = request.getParameter("orderAction");
        int option = Integer.parseInt(request.getParameter("option"));

        switch (option) {
            case 0:
                listOfOrder(request, response);
                break;
            case 1:
                updateOrder(request, response);
                break;
        }
    }

    private void listOfOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Order> order = null;
            order = orderDA.listRecord();
            request.setAttribute("order", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderStatus.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderID = Integer.parseInt(request.getParameter("order_id"));
        int custID = Integer.parseInt(request.getParameter("cust_id"));
        Date date = Date.valueOf(request.getParameter("date"));
        double ttlPrice = Double.parseDouble(request.getParameter("ttlprice"));
        String status = request.getParameter("orderStatus");

        try (PrintWriter out = response.getWriter()) {
            if (("").equals(orderID)) {
                out.println("ID value is required");
            } else {
                try {
                    Order updatestatus = new Order(orderID, date, ttlPrice, status, custID);
                    orderDA.updateRecord(updatestatus);
                    request.getRequestDispatcher("OrderControl?option=0").include(request, response);
                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                    out.println("Order" + orderID + "status doess not update to database");
                }
            }
        }
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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
