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
import domain.Customer;
import domain.Order;
import domain.OrderList;
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
public class OrderRecordControl extends HttpServlet {

    private OrderDA orderDa;
    private OrderListDA orderListDa;
    private CustomerDA cusDa;
    private ShoesDA shoesDa;
    private ColorDA colorDa;

    public void init() throws ServletException {
        orderDa = new OrderDA();
        orderListDa = new OrderListDA();
        cusDa = new CustomerDA();
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
        String orderOption = request.getParameter("ordOpt");
        switch (orderOption) {
            case "1":
                showRecentOrderList(request, response);
                break;
            case "2":
                showPkgOrderList(request, response);
                break;
            case "3":
                showShippingOrderList(request, response);
                break;
            case "4":
                showDeliveredOrderList(request, response);
                break;
            case "5":
                searchOrderByID(request, response);
                break;
            case "6":
                showOrderDetails(request, response);
                break;
            default:
                showRecentOrderList(request, response);
        }
    }

    private void showRecentOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> recentOrderList = new ArrayList<Order>();
        try {
            HttpSession session = request.getSession(false);
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            recentOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (recentOrderList.isEmpty() ? true : false);

            if (!checkIsEmpty) {

                //filter Packaging and Delivery Status
                for (int i = 0; i < recentOrderList.size(); i++) {
                    if (recentOrderList.get(i).getStatus().equals("Delivered")) {
                        recentOrderList.remove(i);
                        i--;
                    }
                }
                if (!recentOrderList.isEmpty()) {
                    filterTitle = "Recent";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }
            request.setAttribute("orderList", recentOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void showPkgOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> prssOrderList = new ArrayList<Order>();
        try {
            HttpSession session = request.getSession(false);
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            prssOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (prssOrderList.isEmpty() ? true : false);

            if (!checkIsEmpty) {

                //filter Packaging Status
                for (int i = 0; i < prssOrderList.size(); i++) {

                    if (prssOrderList.get(i).getStatus().equals("Delivered") || prssOrderList.get(i).getStatus().equals("Shipping")) {
                        prssOrderList.remove(i);
                        i--;
                    }
                }
                if (prssOrderList.size() != 0) {
                    filterTitle = "Packaging";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", prssOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void showShippingOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> deliveryOrderList = new ArrayList<Order>();
        try {
            HttpSession session = request.getSession(false);
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            deliveryOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (deliveryOrderList.isEmpty() ? true : false);

            if (!checkIsEmpty) {
                //filter Shipping Status
                for (int i = 0; i < deliveryOrderList.size(); i++) {
                    if (deliveryOrderList.get(i).getStatus().equals("Delivered") || deliveryOrderList.get(i).getStatus().equals("Packaging")) {
                        deliveryOrderList.remove(i);
                        i--;
                    }
                }
                //after filter the arraylist check again inside is empty or not
                if (!deliveryOrderList.isEmpty()) {
                    filterTitle = "Shipping";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", deliveryOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }
    }

    private void showDeliveredOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> completedOrderList = new ArrayList<Order>();
        try {
            HttpSession session = request.getSession(false);
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            completedOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (completedOrderList.isEmpty() ? true : false);
            if (!checkIsEmpty) {
                //filter Delivered Status
                for (int i = 0; i < completedOrderList.size(); i++) {
                    if (completedOrderList.get(i).getStatus().equals("Packaging") || completedOrderList.get(i).getStatus().equals("Shipping")) {
                        completedOrderList.remove(i);
                        i--;
                    }
                }
                if (!completedOrderList.isEmpty()) {
                    filterTitle = "Delivered";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", completedOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }
    }

    private void searchOrderByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> order = new ArrayList<Order>();
        Order orderObj = null;
        String url = "clientMyOrder.jsp";
        String filterTitle = "";
        String orderID = request.getParameter("orderID");
        Boolean[] validateArr = new Boolean[5];
        validateArr = validation(orderID);
        //if validateArr[0] == true that mean it contain SpeacialCharacter
        //if validateArr[1] == true that mean it contain Digits
        //if validateArr[2] == true that mean it contain Space
        //if validateArr[3] == true that mean it contain Letters
        if (!validateArr[0] && validateArr[1] && !validateArr[2] && !validateArr[3]) {
            try {
                HttpSession session = request.getSession(false);
                Integer cusID = (Integer) session.getAttribute("activeCustomer");
                orderObj = orderDa.getCusOrder(cusID, Integer.parseInt(orderID));
            } catch (SQLException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }
        } else {
            orderObj = null;
        }

        if (orderObj != null) {
            filterTitle = "Showing order for key word \"" + orderID + "\"";
            order.add(orderObj);
        } else {
            filterTitle = "No order found for key word \"" + orderID + "\"";
        }
        Boolean checkIsEmpty = (order.isEmpty() ? true : false);
        request.setAttribute("orderList", order);
        request.setAttribute("filterTitle", filterTitle);
        request.setAttribute("checkNotFound", checkIsEmpty);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            Integer cusID = (Integer) session.getAttribute("activeCustomer");
            //Declaration and initial
            String orderID = request.getParameter("ordID");
            String deliveryDate = request.getParameter("diliveryDate");
            ArrayList<OrderList> orderList = new ArrayList<OrderList>();
            ArrayList<Shoes> shoesList = new ArrayList<Shoes>();
            ArrayList<Color> colorList = new ArrayList<Color>();
            Shoes shoes = null;
            Color color = null;
            String url = "clientOrderDetails.jsp";

            //getOrderRecord and assign to orderObj
            Order orderDetails = orderDa.getCusOrder(cusID, Integer.parseInt(orderID));

            //getCustomer and assign to cusobj
            Customer cusDetails = cusDa.getCustomer(cusID);

            //getOrderListRecord and assign to orderList ArrayList
            orderList = orderListDa.getCusOrderList(Integer.parseInt(orderID));

            //loop orderList that we get and take the prodID to search for the shoes details
            //after get the shoes details and assign to shoesObj then add to arrayList
            //This will filter the shoes that are in the order summary
            for (int i = 0; i < orderList.size(); i++) {
                shoes = shoesDa.getShoes(orderList.get(i).getProdID());
                shoesList.add(shoes);
            }

            //loop shoesList that we get and take the colorID to search for the color details
            //after get the color details and assign to colorObj then add to colorArrayList
            //this to filter the color we need for the shoes in shoesArrayList
            for (int i = 0; i < shoesList.size(); i++) {
                color = colorDa.getColor(shoesList.get(i).getColorID());
                colorList.add(color);
            }

            request.setAttribute("deliveryDate", deliveryDate);
            request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("cusDetails", cusDetails);
            request.setAttribute("orderList", orderList);
            request.setAttribute("shoesList", shoesList);
            request.setAttribute("colorList", colorList);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
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
        if (digits > 0 && digits < 7) {
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

}
