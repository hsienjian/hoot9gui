/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ColorDA;
import da.ShoesDA;
import da.StaffDA;
import domain.Color;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author j.chong
 */
public class productManagement extends HttpServlet {

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
        String action = request.getParameter("action");

        ShoesDA shoesDA = new ShoesDA();
        ColorDA colorDA = new ColorDA();
        StaffDA staffDA = new StaffDA();
        HttpSession session = request.getSession();
        RequestDispatcher rd;

        switch (action) {
            case "retrieveAll":
                ArrayList<Shoes> shoes = new ArrayList<Shoes>();
                ArrayList<Color> colors = new ArrayList<Color>();
                ArrayList<Staff> staffs = new ArrayList<Staff>();

                try {
                    shoes = shoesDA.getAllShoes();
                } catch (Exception ex) {
                    //handle error message here
                }

                for (Shoes s : shoes) {
                    colors.add(colorDA.getColor(s.getColorID()));
                    staffs.add(staffDA.getStaff(s.getStaffID()));
                }
                request.setAttribute("shoes", shoes);
                request.setAttribute("colors", colors);
                request.setAttribute("staffs", staffs);
                rd = request.getRequestDispatcher("productManagement.jsp");
                rd.include(request, response);
                break;
            case "addShoes":
                String product_name = request.getParameter("product_name");
                String brand = request.getParameter("brand");
                String season = request.getParameter("season");
                String size = request.getParameter("size");
                Double price = Double.parseDouble(request.getParameter("price"));
                Integer stock = Integer.parseInt(request.getParameter("stock"));
                String color = request.getParameter("color");
                String staff_id = request.getParameter("staff");
                try {
                    Shoes new_shoes = new Shoes(size, product_name, brand, price, stock, season, "img", 5002, 2002);
                    shoesDA.addShoes(new_shoes);
                    session.setAttribute("add_shoes_status", "successful");
                    response.sendRedirect("http://localhost:8080/build/productManagement?action=retrieveAll");
                } catch (SQLException ex) {
                    request.getRequestDispatcher("addShoes_error.html");
                }
                break;
            case "deleteShoes":
                Integer shoes_id = Integer.parseInt(request.getParameter("id"));

                try {
                    shoesDA.deleteShoes(shoes_id);
                    session.setAttribute("delete_shoes_status", "successful");
                    response.sendRedirect("http://localhost:8080/build/productManagement?action=retrieveAll");
                } catch (SQLException ex) {
                    request.getRequestDispatcher("deleteShoes_error.html");
                }
                break;
            case "shoesDetails":
                Integer product_id = Integer.parseInt(request.getParameter("id"));
                String destination = request.getParameter("destination");
                try {
                    Shoes selected_shoes = shoesDA.getShoes(product_id);
                    Color selected_color = colorDA.getColor(selected_shoes.getColorID());
                    Staff selected_staff = staffDA.getStaff(selected_shoes.getStaffID());
                    request.setAttribute("selected_shoes", selected_shoes);
                    request.setAttribute("selected_color", selected_color);
                    request.setAttribute("selected_staff", selected_staff);
                    rd = request.getRequestDispatcher(destination);
                    rd.forward(request, response);
                } catch (SQLException ex) {
                    request.getRequestDispatcher("showDetails_error.html");
                }
                break;
            case "updateShoes":
                Integer edited_product_id = Integer.parseInt(request.getParameter("product_id"));
                String edited_product_name = request.getParameter("product_name");
                String edited_brand = request.getParameter("brand");
                String edited_season = request.getParameter("season");
                String edited_size = request.getParameter("size");
                Double edited_price = Double.parseDouble(request.getParameter("price"));
                String edited_color = request.getParameter("color");
                String edited_staff_id = request.getParameter("staff");
                try {
                    Shoes new_shoes = new Shoes(edited_product_id, edited_size, edited_product_name, edited_brand, edited_price, shoesDA.getShoes(edited_product_id).getStock(), edited_season, "img", 5002, 2002);
                    shoesDA.updateShoes(new_shoes);
                    session.setAttribute("edit_shoes_status", "successful");
                    response.sendRedirect("http://localhost:8080/build/productManagement?action=retrieveAll");
                } catch (SQLException ex) {
                    request.getRequestDispatcher("addShoes_error.html");
                }
                break;
            case "restock":
                Integer prodID = Integer.parseInt(request.getParameter("product_id"));
                Integer new_stock = Integer.parseInt(request.getParameter("restock_amount"));
                try {
                    shoesDA.restock(prodID, new_stock);
                    response.sendRedirect("http://localhost:8080/build/productManagement?action=retrieveAll");
                } catch (SQLException ex) {
                    request.getRequestDispatcher("restock_error.html");
                }
                break;
        }
    }
}
