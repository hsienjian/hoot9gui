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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin-jiahie
 */
public class CartControl extends HttpServlet {

    private ShoesDA shoesDa;
    private ColorDA colorDa;
    private final Double SHIPPING_FEE = 0.0;

    public void init() throws ServletException {
        shoesDa = new ShoesDA();
        colorDa = new ColorDA();
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
        String cartOption = request.getParameter("cartAction");
        switch (cartOption) {
            case "displayCart":
                displayCart(request, response);
                break;
            default:
                displayCart(request, response);
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
        String cartOption = request.getParameter("cartAction");
        switch (cartOption) {
            case "addToCart":
                addToCart(request, response);
                break;
            case "removeCart":
                removeCart(request, response);
                break;
            case "updateCart":
                updateCart(request, response);
                break;
            default:
                displayCart(request, response);
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Sucess or Error message
        String message = "";
        //Declaraction of getParameter and boolean for success and error condition
        String shoesName = request.getParameter("shoesName");
        String shoesSize = request.getParameter("shoesSize");
        String colorName = request.getParameter("colorName");
        boolean chkSuccessAdd = false;
        boolean chkError = false;
        //Use to check shoes stock
        Integer orderQty = Integer.parseInt(request.getParameter("shoesQty"));
        try {
            HttpSession session = request.getSession();
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            Color colorObj = colorDa.getColorByName(colorName);
            Shoes shoes = shoesDa.checkShoesStock(shoesName, shoesSize, colorObj.getColorID());

            if (shoes != null) {

                shoes.setStaffID(cusID);
                if (orderQty > shoes.getStock()) {
                    message = "Stocks ran out!Please try again later";
                    chkError = true;
                } else if (orderQty <= 0) {
                    message = "Invalid Order Quatity!!!!";
                    chkError = true;
                } else {
                    if (session.getAttribute("allCartProd") == null) {
                        ArrayList<Shoes> allCartProd = new ArrayList<Shoes>();
                        shoes.setStock(orderQty);
                        allCartProd.add(shoes);
                        message = "Success add to Cart!!";
                        chkSuccessAdd = true;
                        session.setAttribute("allCartProd", allCartProd);
                        ArrayList<Shoes> cartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");

                        //check the allprodcart arraylist have this userID's cart or not
                        for (int i = 0; i < cartProd.size(); i++) {
                            if (!cartProd.get(i).getStaffID().equals(cusID)) {
                                cartProd.remove(i);
                                i--;
                            }
                        }
                        session.setAttribute("cartProd", cartProd);
                    } else {
                        ArrayList<Shoes> allCartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");
                        int index = isExisting(shoesName, shoesSize, Integer.toString(colorObj.getColorID()), allCartProd);
                        if (index == -1) {
                            shoes.setStock(orderQty);
                            allCartProd.add(shoes);
                            message = "Success add to Cart!!";
                            chkSuccessAdd = true;
                        } else {
                            if (orderQty == allCartProd.get(index).getStock()) {
                                message = "This Product Exist in Cart!!";
                                chkError = true;
                            } else {
                                allCartProd.get(index).setStock(orderQty);
                                message = "Updated Quantity!!";
                                chkSuccessAdd = true;
                            }
                        }
                        session.setAttribute("allCartProd", allCartProd);
                        ArrayList<Shoes> cartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");

                        //check the allprodcart arraylist have this userID's cart or not
                        for (int i = 0; i < cartProd.size(); i++) {
                            if (!cartProd.get(i).getStaffID().equals(cusID)) {
                                cartProd.remove(i);
                                i--;
                            }
                        }
                        session.setAttribute("cartProd", cartProd);
                    }
                }
            } else {
                shoes = new Shoes();
                message = "This variation does not exist!!!";
                chkError = true;
            }
            session.setAttribute("chkSuccessAdd", chkSuccessAdd);
            session.setAttribute("chkError", chkError);
            String url = "ShoesControl?option=1&prod_name=" + shoesName + "&message=" + message;
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void displayCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean checkEmpty = true;
        String message = request.getParameter("message");
        String url = "clientShoppingCart.jsp";
        ArrayList<Color> prodColor = new ArrayList<Color>();
        Color color = new Color();
        ArrayList<Double> prodSubTtl = new ArrayList<Double>();
        Double orderSubTtl = 0.00;
        Double orderTtl = 0.00;
        HttpSession session = request.getSession(false);
        Integer cusID = (Integer) session.getAttribute("activeCustomer");
        ArrayList<Shoes> cartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");

        if (cartProd != null) {

            //check the allprodcart arraylist have this userID's cart or not
            for (int i = 0; i < cartProd.size(); i++) {
                if (!cartProd.get(i).getStaffID().equals(cusID)) {
                    cartProd.remove(i);
                    i--;
                }
            }

            //after calculate each prod subtotal price and get the color name by id
            try {
                for (int i = 0; i < cartProd.size(); i++) {
                    prodSubTtl.add(calProdSubTtl(cartProd.get(i).getPrice(), cartProd.get(i).getStock()));
                    color = colorDa.getColor(cartProd.get(i).getColorID());
                    prodColor.add(color);
                }
            } catch (SQLException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }

            //after calculate each prod subtotal price and get the color name by id
            for (int i = 0; i < prodSubTtl.size(); i++) {
                orderSubTtl += prodSubTtl.get(i);
            }
            orderTtl = orderSubTtl + SHIPPING_FEE;
            session.setAttribute("cartProd", cartProd);
            if (cartProd.size() > 0) {
                checkEmpty = false;
            } else {
                checkEmpty = true;
            }

        } else {
            cartProd = new ArrayList<Shoes>();
        }
        request.setAttribute("checkEmpty", checkEmpty);
        session.setAttribute("prodColor", prodColor);
        session.setAttribute("prodSubTtl", prodSubTtl);
        request.setAttribute("orderSubTtl", orderSubTtl);
        request.setAttribute("shippingFee", SHIPPING_FEE);
        request.setAttribute("orderTtl", orderTtl);
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    private void removeCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String shoesID = request.getParameter("shoesID");
        Integer cusID = (Integer) session.getAttribute("activeCustomer");
        ArrayList<Shoes> allCartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");
        int index = isExisting(shoesID, cusID, allCartProd);
        if (index >= 0) {
            allCartProd.remove(index);
        }
        session.setAttribute("allCartProd", allCartProd);
        String url = "CartControl?cartAction=displayCart&message=";
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        HttpSession session = request.getSession(false);
        try {
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            String shoesID = request.getParameter("shoesID");
            String indexProd = request.getParameter("indexProd");
            Integer updateQty = Integer.parseInt(request.getParameter("updateQty" + indexProd));
            ArrayList<Shoes> allCartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");
            int index = isExisting(shoesID, cusID, allCartProd);
            Shoes shoes = shoesDa.getShoes(Integer.parseInt(shoesID));
            if (shoes != null) {
                if (index != -1) {
                    if (shoes.getStock() < updateQty) {
                        message = "Update decline stock ran out!!!";
                        session.setAttribute("chkError", true);
                    } else if (updateQty < 0) {
                        message = "Update decline invalid quantity!!!";
                        session.setAttribute("chkError", true);
                    } else {
                        allCartProd.get(index).setStock(updateQty);
                        message = "Success Update!!!";
                        session.setAttribute("chkSuccessAdd", true);
                        session.setAttribute("allCartProd", allCartProd);
                    }
                }
            }
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        } catch (NumberFormatException e) {
            message = "Update decline invalid input!!";
            session.setAttribute("chkError", true);
        }
        String url = "CartControl?cartAction=displayCart&message=" + message;
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private Double calProdSubTtl(Double price, int qty) {
        return price * qty;
    }

    private int isExisting(String prodName, String shoesSize, String colorID, ArrayList<Shoes> allProdCart) {
        for (int i = 0; i < allProdCart.size(); i++) {
            String prodColorID = Integer.toString(allProdCart.get(i).getColorID());
            if (allProdCart.get(i).getProdName().equalsIgnoreCase(prodName) && allProdCart.get(i).getSize().equalsIgnoreCase(shoesSize) && prodColorID.equalsIgnoreCase(colorID)) {
                return i;
            }
        }
        return -1;
    }

    private int isExisting(String shoesID, Integer cartCusID, ArrayList<Shoes> allProdCart) {
        for (int i = 0; i < allProdCart.size(); i++) {
            String cusID1 = Integer.toString(allProdCart.get(i).getStaffID());
            String prodID = Integer.toString(allProdCart.get(i).getProdID());
            if (cusID1.equalsIgnoreCase(Integer.toString(cartCusID)) && prodID.equalsIgnoreCase(shoesID)) {
                return i;
            }
        }
        return -1;
    }

}
