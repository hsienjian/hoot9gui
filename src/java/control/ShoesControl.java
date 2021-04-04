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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author KhorWenXin
 */
public class ShoesControl extends HttpServlet {

    private ShoesDA shoesDA;
    private ColorDA colorDA;

    @Override
    public void init() throws ServletException {
        shoesDA = new ShoesDA();
        colorDA = new ColorDA();
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
        int option = Integer.parseInt(request.getParameter("option"));

        switch (option) {
            case 0:
                listOfShoes(request, response);
                break;
            case 1:
                shoesDetails(request, response);
                break;
            case 2:
                brandChoosen(request, response);
                break;
            case 3:
                sortPrice(request, response);
                break;
            case 4:
                searchProd(request, response);
                break;
            case 5:
                colors(request, response);
                break;
        }
    }

    private void listOfShoes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Shoes> allshoes = null;
        ArrayList<Shoes> brands = null;
        ArrayList<Color> colors = null;
        try {
            allshoes = shoesDA.listAllShoes();
            brands = shoesDA.brands();
            colors = colorDA.listAllColor();
            request.setAttribute("allshoes", allshoes);
            request.setAttribute("brand", brands);
            request.setAttribute("color", colors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void shoesDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prodName = request.getParameter("prod_name");
        String message = request.getParameter("message");
        ArrayList<Shoes> choosen = new ArrayList<Shoes>();
        ArrayList<Color> prodColor = new ArrayList<Color>();
        ArrayList<Color> colorAvb = new ArrayList<Color>();
        Color colors = null;

        try {
            choosen = shoesDA.getRecord(prodName);
            for (int i = 0; i < choosen.size(); i++) {
                colors = colorDA.getColor(choosen.get(i).getColorID());
                prodColor.add(colors);
            }
            for (Color colorFilter : prodColor) {
                if (!colorAvb.contains(colorFilter)) {
                    System.out.println(colorFilter);
                    colorAvb.add(colorFilter);
                }
            }
            request.setAttribute("shoes", choosen);
            request.setAttribute("color", colorAvb);
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("productDetail.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(ShoesControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void brandChoosen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prodBrand = request.getParameter("department");
        ArrayList<Shoes> brand = null;
        ArrayList<Color> colors = null;
        ArrayList<Shoes> choosen = new ArrayList<Shoes>();
        ArrayList<Shoes> filtered = new ArrayList<Shoes>();
        Shoes finalResult = null;
        try {
            colors = colorDA.listAllColor();
            brand = shoesDA.brands();
            choosen = shoesDA.listAllShoes();
            for (int i = 0; i < choosen.size(); i++) {
                if (prodBrand.equals(choosen.get(i).getBrand())) {
                    finalResult = new Shoes(choosen.get(i).getProdID(), choosen.get(i).getSize(), choosen.get(i).getProdName(), choosen.get(i).getBrand(), choosen.get(i).getPrice(), choosen.get(i).getStock(), choosen.get(i).getSeason(), choosen.get(i).getImg(), choosen.get(i).getColorID(), choosen.get(i).getStaffID());
                    filtered.add(finalResult);
                }
            }
            request.setAttribute("allshoes", filtered);
            request.setAttribute("brand", brand);
            request.setAttribute("color", colors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
            dispatcher.include(request, response);

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void sortPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prodPrice = request.getParameter("sortPrice");
        ArrayList<Shoes> choosen = new ArrayList<Shoes>();
        ArrayList<Shoes> filtered = new ArrayList<Shoes>();
        ArrayList<Color> color = null;
        ArrayList<Shoes> brand = null;
        String above = "Abv450";
        String below = "Blw450";
        Shoes finalResult1 = null;
        Shoes finalResult2 = null;

        try {
            color = colorDA.listAllColor();
            brand = shoesDA.brands();
            choosen = shoesDA.listAllShoes();
            if (prodPrice.equals(above)) {
                for (int i = 0; i < choosen.size(); i++) {
                    if ((choosen.get(i).getPrice()) >= 450) {
                        finalResult1 = new Shoes(choosen.get(i).getProdID(), choosen.get(i).getSize(), choosen.get(i).getProdName(), choosen.get(i).getBrand(), choosen.get(i).getPrice(), choosen.get(i).getStock(), choosen.get(i).getSeason(), choosen.get(i).getImg(), choosen.get(i).getColorID(), choosen.get(i).getStaffID());
                        filtered.add(finalResult1);
                    }
                }
            } else if (prodPrice.equals(below)) {
                for (int i = 0; i < choosen.size(); i++) {
                    if ((choosen.get(i).getPrice()) < 450) {
                        finalResult2 = new Shoes(choosen.get(i).getProdID(), choosen.get(i).getSize(), choosen.get(i).getProdName(), choosen.get(i).getBrand(), choosen.get(i).getPrice(), choosen.get(i).getStock(), choosen.get(i).getSeason(), choosen.get(i).getImg(), choosen.get(i).getColorID(), choosen.get(i).getStaffID());
                        filtered.add(finalResult2);
                    }
                }
            }
            request.setAttribute("allshoes", filtered);
            request.setAttribute("color", color);
            request.setAttribute("brand", brand);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void searchProd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchInput = request.getParameter("wanted");
        ArrayList<Color> color = null;
        ArrayList<Shoes> brand = null;
        ArrayList<Shoes> prodResult = new ArrayList<Shoes>();
        try (PrintWriter out = response.getWriter()) {
            color = colorDA.listAllColor();
            brand = shoesDA.brands();
            if (searchInput != null) {
                prodResult = shoesDA.searchProd(searchInput);
                if (prodResult.isEmpty()) {
                    request.setAttribute("error", "No Result Found");
                }
                request.setAttribute("allshoes", prodResult);
                request.setAttribute("color", color);
                request.setAttribute("brand", brand);
                RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    private void colors(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int prodColor = Integer.parseInt(request.getParameter("department"));
        ArrayList<Color> color = null;
        ArrayList<Shoes> brand = null;
        ArrayList<Shoes> choosen = new ArrayList<Shoes>();
        ArrayList<Shoes> filtered = new ArrayList<Shoes>();
        Shoes finalResult = null;
        try {
            color = colorDA.listAllColor();
            brand = shoesDA.brands();
            choosen = shoesDA.listAllShoes();
            for (int i = 0; i < choosen.size(); i++) {
                if (prodColor == choosen.get(i).getColorID()) {
                    finalResult = new Shoes(choosen.get(i).getProdID(), choosen.get(i).getSize(), choosen.get(i).getProdName(), choosen.get(i).getBrand(), choosen.get(i).getPrice(), choosen.get(i).getStock(), choosen.get(i).getSeason(), choosen.get(i).getImg(), choosen.get(i).getColorID(), choosen.get(i).getStaffID());
                    filtered.add(finalResult);
                }
            }
            request.setAttribute("allshoes", filtered);
            request.setAttribute("color", color);
            request.setAttribute("brand", brand);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProduct.jsp");
            dispatcher.include(request, response);

        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public Boolean[] validation(String s) {
        Boolean[] validateArr = new Boolean[5];
        int specials = 0;
        int digits = 0;
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (!Character.isDigit(ch) && !Character.isLetter(ch) && !Character.isWhitespace(ch)) {
                specials++;
            } else if (Character.isDigit(ch)) {
                digits++;
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
            validateArr[1] = false;
        } else {
            validateArr[1] = true;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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
