/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.StaffDA;
import domain.Staff;
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
 * @author j.chong
 */
public class StaffLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("activeStaff");
        response.sendRedirect("/hoot9gui/staff_login.jsp");
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

        String email = request.getParameter("staff_email");
        String pw = request.getParameter("staff_pw");
        StaffDA staffDA = new StaffDA();
        try {
            Staff staff = staffDA.getStaff(email);
            if (staff == null) {
                errorMsg.append("Invalid Staff Email.\n");
                request.setAttribute("errorMsg", errorMsg);
            } else if (!staff.getPassword().equals(pw)) {
                errorMsg.append("Incorrect Staff Password.\n");
                request.setAttribute("errorMsg", errorMsg);
            } else {
                session.setAttribute("activeStaff", email);
            }
        } catch (SQLException ex) {

        }

        if (session.getAttribute("activeStaff") == null) {
            RequestDispatcher rd = request.getRequestDispatcher("staff_login.jsp");
            rd.include(request, response);
        } else {
            response.sendRedirect("dashboard.jsp");
        }
    }
}
