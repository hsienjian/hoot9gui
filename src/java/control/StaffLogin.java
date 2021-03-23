/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.StaffDA;
import domain.Staff;
import java.io.IOException;
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
        Object activeStaff = session.getAttribute("activeStaff");

        if (activeStaff == null) {
            String email = request.getParameter("staff_email");
            String pw = request.getParameter("staff_pw");
            StaffDA staffDA = new StaffDA();
            Staff staff = staffDA.getStaff(email);

            if (staff == null) {
                errorMsg.append("Invalid Staff Email.\n");
                request.setAttribute("errorMsg", errorMsg);
                RequestDispatcher rd = request.getRequestDispatcher("staff_login.jsp");
                rd.include(request, response);
            } else {
                if (!staff.getPassword().equals(pw)) {
                    errorMsg.append("Incorrect Staff Password.\n");
                    request.setAttribute("errorMsg", activeStaff);
                    RequestDispatcher rd = request.getRequestDispatcher("staff_login.jsp");
                    rd.include(request, response);
                } else {
                    session.setAttribute("activeStaff", email);
                    response.sendRedirect("staff.html");
                }
            }
        } else {
            response.sendRedirect("staff.html");
        }
    }
}
