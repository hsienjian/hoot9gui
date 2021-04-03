/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.ColorDA;
import da.CustomerDA;
import da.OrderDA;
import da.OrderListDA;
import da.ShoesDA;
import domain.Color;
import domain.Shoes;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

    private OrderDA orderDa;
    private OrderListDA orderListDa;
    private CustomerDA cusDa;
    private ShoesDA shoesDa;
    private ColorDA colorDa;
    private int cusID;

    public void init() throws ServletException {
        orderDa = new OrderDA();
        orderListDa = new OrderListDA();
        cusDa = new CustomerDA();
        shoesDa = new ShoesDA();
        colorDa = new ColorDA();
        this.cusID = 1001;
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
        String orderOption = request.getParameter("cartAction");
        switch (orderOption) {
            case "addToCart":
                addToCart(request, response);
                break;
            case "2":
//                showPrssOrderList(request, response);
                break;
            case "3":
//                showDeliveryOrderList(request, response);
                break;
            case "4":
//                showCompletedOrderList(request, response);
                break;
            case "5":
//                searchOrderByID(request, response);
                break;
            case "6":
//                showOrderDetails(request, response);
                break;
            default:
//                showRecentOrderList(request, response);
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //message and url
        String url = "productDetail.jsp";
        String message = "";
        //Cart and shoes ArrayList
        ArrayList<Shoes> shoesList = new ArrayList<Shoes>();
        //Use to find specific shoes
        String shoesName = request.getParameter("shoesName");
        String shoesSize = request.getParameter("shoesSize");
        String colorID = request.getParameter("colorID");

        //Use to check shoes stock
        Integer orderQty = Integer.parseInt(request.getParameter("shoesQty"));
        try {
            Shoes shoes = shoesDa.checkShoesStock(shoesName, shoesSize, Integer.parseInt(colorID));
            if (shoes != null) {
                shoes.setStaffID(cusID);
                if (orderQty > shoes.getStock()) {
                    message = "Stocks ran out!Please try again later";
                } else {
                    HttpSession session = request.getSession();
                    if (session.getAttribute("allCartProd") == null) {
                        ArrayList<Shoes> allCartProd = new ArrayList<Shoes>();
                        allCartProd.add(shoes);
                        message = "123";
                        session.setAttribute("allCartProd", allCartProd);
                    } else {
                        ArrayList<Shoes> allCartProd = (ArrayList<Shoes>) session.getAttribute("allCartProd");
                        int index = isExisting(shoesName, shoesSize, colorID, allCartProd);
                        if (index == -1) {
                            allCartProd.add(shoes);
                        } else {
                            message = "Exist in Cart!!";
                        }
                        session.setAttribute("allCartProd", allCartProd);
                    }
                }
            } else {
                shoes = new Shoes();
                message = "Does not exist!!!";
            }

            Color color = colorDa.getColor(Integer.parseInt(colorID));
            shoesList = shoesDa.getRecord(shoesName);
            request.setAttribute("shoes", shoesList);
            request.setAttribute("message", message);
            request.setAttribute("color", color);
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {

        }

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
}
