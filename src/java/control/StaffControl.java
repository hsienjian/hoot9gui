/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ShoesDA;
import da.StaffDA;
import domain.Shoes;
import domain.Staff;
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
public class StaffControl extends HttpServlet {

    private StaffDA staffDA;
    private ShoesDA shoesDA;

    @Override
    public void init() throws ServletException {
        staffDA = new StaffDA();
        shoesDA = new ShoesDA();
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
        response.setContentType("text/html;charset=UTF-8");

        int option = Integer.parseInt(request.getParameter("option"));

        switch (option) {
            case 0:
                listOfStaff(request, response);
                break;
            case 1:
                retrieveStaff(request, response);
                break;
            case 2:
                updateStaff(request, response);
                break;
            case 3:
                addStaff(request, response);
                break;
            case 4:
                removeStaff(request, response);
                break;
            case 5:
                staffProfile(request, response);
                break;
            case 6:
                newPassword(request, response);
                break;
        }
    }

    private void listOfStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Staff> staff = null;
            staff = staffDA.listAllStaff();
            request.setAttribute("staff", staff);
            RequestDispatcher dispatcher = request.getRequestDispatcher("staff.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void retrieveStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        try (PrintWriter out = response.getWriter()) {
            Staff staff = null;
            staff = staffDA.getRecord(staffID);
            request.setAttribute("staff", staff);
            RequestDispatcher dispatcher = request.getRequestDispatcher("EditStaff.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffID = request.getParameter("staffID");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String staffAge = request.getParameter("age");
        String email = request.getParameter("email");
        String gender = request.getParameter("staffGender");
        String address = request.getParameter("address");
        String phNum = request.getParameter("phNum");
        String position = request.getParameter("position");
        String password = request.getParameter("password");

        int id = 0, age = 0;
        try (PrintWriter out = response.getWriter()) {
            if (staffID != null && staffAge != null) {
                id = Integer.parseInt(staffID);
                age = Integer.parseInt(staffAge);
                String oldpassword = staffDA.getPassword(id);
                if (!oldpassword.equals(password)) {
                    request.setAttribute("error", "The Current Password for stuff " + staffID + " is Wrong! Please try again later.");
                    request.getRequestDispatcher("StaffControl?option=0").forward(request, response);
                } else {
                    Staff updProfile = null;
                    updProfile = new Staff(id, fname, lname, age, email, password, gender, address, phNum, position);
                    staffDA.updateRecord(updProfile);
                    response.sendRedirect("StaffControl?option=0");
                }
            } else {
                out.println("<div> no id and age </div>");
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
    }

    private void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String gender = request.getParameter("staffGender");
        String address = request.getParameter("address");
        String phNum = request.getParameter("phNum");
        String position = request.getParameter("position");
        String password = request.getParameter("password");
        String cmfPass = request.getParameter("confirmPWD");

        try {
            if (!cmfPass.equals(password)) {
                request.setAttribute("error", "Your Information is not added due to the incorrect Password and Confirmation Password! Please try again!");
                request.getRequestDispatcher("AddStaff.jsp").forward(request, response);
            } else {
                Staff addStaff = new Staff(fname, lname, age, email, password, gender, address, phNum, position);
                staffDA.addRecord(addStaff);
                request.getRequestDispatcher("StaffControl?option=0").forward(request, response);
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
    }

    private void removeStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffID = request.getParameter("staffID");
        Boolean[] validateArr;
        validateArr = new Boolean[5];
        validateArr = validation(staffID);
        try (PrintWriter out = response.getWriter()) {
            if (validateArr[0] && validateArr[1] && validateArr[2] && validateArr[3]) {
                out.println("Invalid");
            } else if (validateArr[1] && validateArr[0] || validateArr[1] && validateArr[2] || validateArr[1] && validateArr[3]) {
                out.println("Invalid");
            } else if (validateArr[0] || validateArr[2] || validateArr[3]) {
                out.println("Invalid");
            } else {
                try {
                    int delete = 0;
                    delete = Integer.parseInt(staffID);
                    staffDA.deleteStaff(delete);
                    request.getRequestDispatcher("StaffControl?option=0").forward(request, response);
                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }
            }
        }
    }

    private void staffProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        ArrayList<Shoes> duty = new ArrayList<Shoes>();
        try {
            duty = shoesDA.staffHandle(staffID);
            Staff profile = null;
            profile = staffDA.getRecord(staffID);
            request.setAttribute("profile", profile);
            request.setAttribute("duty", duty);
            RequestDispatcher dispatcher = request.getRequestDispatcher("StaffProfile.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void newPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String staffID = request.getParameter("staffID");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String staffAge = request.getParameter("age");
        String email = request.getParameter("email");
        String gender = request.getParameter("staffGender");
        String address = request.getParameter("address");
        String phNum = request.getParameter("phNum");
        String position = request.getParameter("position");
        String password = request.getParameter("password");
        String newPWD = request.getParameter("newPWD");
        String confirmPWD = request.getParameter("confirmPWD");

        int id = 0, age = 0;
        try {
            id = Integer.parseInt(staffID);
            age = Integer.parseInt(staffAge);
            String oldpassword = staffDA.getPassword(id);
            if (!oldpassword.equals(password)) {
                request.setAttribute("error", "The Current Password is not the same! Please try again later.");
                request.getRequestDispatcher("StaffControl?option=5").forward(request, response);
            } else if (newPWD.equals(password)) {
                request.setAttribute("error", "The Current Password and New Password are the same! Please try again later.");
                request.getRequestDispatcher("StaffControl?option=5").forward(request, response);
            } else if (!confirmPWD.equals(newPWD)) {
                request.setAttribute("error", "The New Password and Confirmation Password are not the same! Please try again later.");
                request.getRequestDispatcher("StaffControl?option=5").forward(request, response);
            } else {
                Staff updProfile = null;
                updProfile = new Staff(id, fname, lname, age, email, newPWD, gender, address, phNum, position);
                staffDA.updateRecord(updProfile);
                request.setAttribute("success", "Your New Password has been saved");
                request.getRequestDispatcher("StaffControl?option=5").forward(request, response);
            }

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public Boolean[] validation(String s) {
        Boolean[] validateArr = new Boolean[5];
        int specials = 0;
        int digits = 0;
        int spaces = 0;
        int letters = 0;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (!Character.isDigit(ch) && !Character.isLetter(ch) && !Character.isWhitespace(ch)) {
                specials++;
            } else if (Character.isDigit(ch)) {
                digits++;
            } else if (Character.isWhitespace(ch)) {
                spaces++;
            } else {
                letters++;
            }
        }

        //Have specials then assign to array[0]=true
        if (specials > 0) {
            validateArr[0] = true;
        } else {
            validateArr[0] = false;
        }
        //Have digits then assign to array[1]=true
        if (digits > 0) {
            validateArr[1] = true;
        } else {
            validateArr[1] = false;
        }

        //Have spaces then assign to array[2]=true
        if (spaces > 0) {
            validateArr[2] = true;
        } else {
            validateArr[2] = false;
        }
        //Have letters then assign to array[3]=true
        if (letters > 0) {
            validateArr[3] = true;
        } else {
            validateArr[3] = false;
        }

        return validateArr;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
