/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.OrderDA;
import domain.Order;
import domain.OrderList;
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
 * @author Forge-15
 */
public class DashboardControl extends HttpServlet {

    private OrderDA orderDA;
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
            out.println("<title>Servlet DashboardControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashboardControl at " + request.getContextPath() + "</h1>");
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
        int display = Integer.parseInt(request.getParameter("display"));
        
         switch (display) {
            case 0:
                Revenue(request, response);
                break;
            case 1:
                TotalOrder(request, response);
                break;
            case 2:
                OrderPending(request,response);
                break;
           
            
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
        processRequest(request, response);
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

     private void Revenue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        double ttlPrice = Double.parseDouble(request.getParameter("ttlPrice"));
//        double tPrice = 0 ;
//         try (PrintWriter out = response.getWriter()) {
//            Order order = null;
//            order = orderDA.getOrder(ttlPrice);
//            
//            request.setAttribute("ttlPrice", order);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
//            dispatcher.forward(request, response);
//            
//            for (int i=0; i<orderDA.listRecord().size(); i++ ){
//                if ( orderDA.getOrder(ttlPrice) !=null ){
//                    tPrice += orderDA.getOrder(i).getTtlPrice() ;
//                }
//                
//            }
//
//        } catch (SQLException ex) {
//            ex.getMessage();
//        }
//        return (int) tPrice;

            response.sendRedirect("Sales_record.jsp");
    
}
     
       private int TotalOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int Torder = Integer.parseInt(request.getParameter("Order_ID"));
        double tOrder = 0 ;
           try (PrintWriter out = response.getWriter()) {
            
         
            Order order = null;
            order = orderDA.getOrder(Torder);
            
            request.setAttribute("Order_ID", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
            for (int i=0; i<orderDA.listRecord().size(); i++ ){
                if ( orderDA.getOrder(Torder) !=null ){
                    tOrder += orderDA.getOrder(i).getOrderID();
                }
                
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return Torder;
    }
       
         private int OrderPending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             int status = Integer.parseInt(request.getParameter("Status"));
             String tPrice = null  ;
             try (PrintWriter out = response.getWriter()) {
            
         
            Order order = null;
            order = orderDA.getOrder(status);
            
            request.setAttribute("status", order);
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
            for (int i=0; i<orderDA.listRecord().size(); i++ ){
                if ( orderDA.getOrder(status) !=null ){
                    tPrice += orderDA.getOrder(i).getStatus() ;
                }
                
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return status;
    }
         


}
