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
    private Integer cusID;

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
        String orderOption = request.getParameter("ordOpt");
        switch (orderOption) {
            case "1":
                showRecentOrderList(request, response);
                break;
            case "2":
                showPrssOrderList(request, response);
                break;
            case "3":
                showDeliveryOrderList(request, response);
                break;
            case "4":
                showCompletedOrderList(request, response);
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
            recentOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (recentOrderList.isEmpty() ? true : false);
            Integer countPrss = 0;

            if (!checkIsEmpty) {

                //filter Processing and Delivery Status
                for (int i = 0; i < recentOrderList.size(); i++) {
                    if (recentOrderList.get(i).getStatus().equals("Processing")) {
                        countPrss++;
                    }
                    if (recentOrderList.get(i).getStatus().equals("Completed")) {
                        recentOrderList.remove(i);
                        i--;
                    }
                }
                if (!recentOrderList.isEmpty()) {
                    filterTitle = "Recent";
                    checkIsEmpty = false;
                }
            }

            request.setAttribute("orderList", recentOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("countPrss", countPrss);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void showPrssOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> prssOrderList = new ArrayList<Order>();
        try {
            prssOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (prssOrderList.isEmpty() ? true : false);
            Integer countPrss = 0;

            if (!checkIsEmpty) {
                filterTitle = "Processing";
                //filter Processing Status
                for (int i = 0; i < prssOrderList.size(); i++) {
                    if (prssOrderList.get(i).getStatus().equals("Processing")) {
                        countPrss++;
                    }

                    if (prssOrderList.get(i).getStatus().equals("Completed") || prssOrderList.get(i).getStatus().equals("Delivery")) {
                        prssOrderList.remove(i);
                        i--;
                    }
                }
                if (!prssOrderList.isEmpty()) {
                    filterTitle = "Processing";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", prssOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            request.setAttribute("countPrss", countPrss);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void showDeliveryOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> deliveryOrderList = new ArrayList<Order>();
        try {
            deliveryOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (deliveryOrderList.isEmpty() ? true : false);
            Integer countPrss = 0;

            if (!checkIsEmpty) {
                //filter Delivery Status
                for (int i = 0; i < deliveryOrderList.size(); i++) {
                    if (deliveryOrderList.get(i).getStatus().equals("Processing")) {
                        countPrss++;
                    }
                    if (deliveryOrderList.get(i).getStatus().equals("Completed") || deliveryOrderList.get(i).getStatus().equals("Processing")) {
                        deliveryOrderList.remove(i);
                        i--;
                    }
                }
                //after filter the arraylist check again inside is empty or not
                if (!deliveryOrderList.isEmpty()) {
                    filterTitle = "Delivery";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", deliveryOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("countPrss", countPrss);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }
    }

    private void showCompletedOrderList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Order> completedOrderList = new ArrayList<Order>();
        try {
            completedOrderList = orderDa.getCusOrderList(cusID);
            String filterTitle = "";
            String url = "clientMyOrder.jsp";
            Boolean checkIsEmpty = (completedOrderList.isEmpty() ? true : false);
            Integer countPrss = 0;
            if (!checkIsEmpty) {
                //filter Completed Status
                for (int i = 0; i < completedOrderList.size(); i++) {
                    if (completedOrderList.get(i).getStatus().equals("Processing") || completedOrderList.get(i).getStatus().equals("Delivery")) {
                        completedOrderList.remove(i);
                        i--;
                    }
                }
                if (!completedOrderList.isEmpty()) {
                    filterTitle = "Completed";
                    checkIsEmpty = false;
                } else {
                    checkIsEmpty = true;
                }
            }

            request.setAttribute("orderList", completedOrderList);
            request.setAttribute("filterTitle", filterTitle);
            request.setAttribute("checkIsEmpty", checkIsEmpty);
            request.setAttribute("countPrss", countPrss);
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
        String orderID = request.getParameter("orderID");
        Boolean[] validateArr = new Boolean[5];
        validateArr = validation(orderID);
        String filterTitle = "";
        String url = "clientMyOrder.jsp";
        Order orderObj = null;
        Integer countPrss = 0;
        //if validateArr[0] == true that mean it contain SpeacialCharacter
        //if validateArr[1] == true that mean it contain Digits
        //if validateArr[2] == true that mean it contain Space
        //if validateArr[3] == true that mean it contain Letters
        if (validateArr[0] && validateArr[1] && validateArr[2] && validateArr[3]) {
            orderObj = null;
        } else if (validateArr[1] && validateArr[0] || validateArr[1] && validateArr[2] || validateArr[1] && validateArr[3]) {
            orderObj = null;
        } else if (validateArr[0] || validateArr[2] || validateArr[3]) {
            orderObj = null;
        } else {
            try {
                orderObj = orderDa.getCusOrder(cusID, Integer.parseInt(orderID));
            } catch (SQLException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }
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
        request.setAttribute("countPrss", countPrss);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
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

            //getOrderRecord and assign to orderObj
            Customer cusDetails = cusDa.getCustomer(cusID);

            //getOrderListRecord and assign to orderList ArrayList
            orderList = orderListDa.getCusOrderList(Integer.parseInt(orderID));

            //loop orderList that we get and take the prodID to search for the shoes details
            //after get the shoes details and assign to shoesObj then add to arrayList
            //This will filter the shoes that are in the order summary
            for (int i = 0; i < orderList.size(); i++) {
                shoes = shoesDa.getOrderShoes(orderList.get(i).getProdID());
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

//    private Integer checkSessionID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession(false);
//        if (session != null) {
//            Integer activeUserID = (Integer) session.getAttribute("activeUserID");
//            if (activeUserID != null) {
//                return activeUserID;
//            }
//        } else {
//            return
//        }
//
//    }
}
