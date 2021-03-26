/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.OrderDA;
import domain.Order;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin-jiahie
 */
@WebServlet("OrderRecordControl")
public class OrderRecordControl extends HttpServlet {

    private OrderDA orderDa;

    public void init() throws ServletException {
        orderDa = new OrderDA();
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
        String orderOption = request.getParameter("orderOption");
        try {
            switch (orderOption) {
                case "1":
                    showRecentOrderRecords(request, response);
                    break;
                case "2":
//                    insertBook(request, response);
                    break;
                case "3":
//                    deleteBook(request, response);
                    break;
                case "4":
//                    showEditForm(request, response);
                    break;
                case "5":
//                    updateBook(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//    }
    private void showRecentOrderRecords(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        ArrayList<Order> orderList = orderDa.getOrderList();
        request.setAttribute("orderList", orderList);
        String url = "/Wen_Xin/myOrder.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}
