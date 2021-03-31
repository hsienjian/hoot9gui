/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ColorDA;
import da.ShoesDA;
import domain.Color;
import domain.Shoes;
import java.io.IOException;
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
public class ShoesControl extends HttpServlet {

    private ShoesDA shoesDA;
    private ColorDA colorDA;

    @Override
    public void init() throws ServletException {
        shoesDA = new ShoesDA();
        colorDA = new ColorDA();
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
        String prodName = request.getParameter("prod_name");
        int colorID = Integer.parseInt(request.getParameter("color_id"));
        ArrayList<Shoes> choosen = new ArrayList<Shoes>();
        try {
            Color color = colorDA.getRecord(colorID);
            choosen = shoesDA.getRecord(prodName);
            request.setAttribute("shoes", choosen);
            request.setAttribute("color", color);
            RequestDispatcher dispatcher = request.getRequestDispatcher("productDetail.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

}
