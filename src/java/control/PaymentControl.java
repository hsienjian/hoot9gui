/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import da.CustomerDA;
import da.OrderDA;
import da.OrderListDA;
import da.ShoesDA;
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
public class PaymentControl extends HttpServlet {

    private OrderDA orderDa;
    private OrderListDA orderListDa;
    private CustomerDA cusDa;
    private ShoesDA shoesDa;

    public void init() throws ServletException {
        orderDa = new OrderDA();
        orderListDa = new OrderListDA();
        cusDa = new CustomerDA();
        shoesDa = new ShoesDA();
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
        doPost(request, response);
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
        String paymentOption = request.getParameter("paymentAction");
        switch (paymentOption) {
            case "reviewOrder":
                reviewOrder(request, response);
                break;
            case "paymentConfirmation":
                paymentConfirmation(request, response);
                break;
        }
    }

    private void reviewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String url = "";
        double orderSubTtl = Double.parseDouble(request.getParameter("orderSubTtl"));
        double orderTtl = Double.parseDouble(request.getParameter("orderTtl"));
        double shippingFee = Double.parseDouble(request.getParameter("shippingFee"));
        ArrayList<Double> prodSubTtl = (ArrayList<Double>) session.getAttribute("prodSubTtl");
        ArrayList<OrderList> finalOrderList = new ArrayList<OrderList>();
        Customer cusInfo = null;
        Order order = null;
        OrderList orderListObj = null;

        try {
            ArrayList<Shoes> cartProdList = (ArrayList<Shoes>) session.getAttribute("cartProd");
            ArrayList<Integer> prodIndex = orderRanOutStocks(cartProdList);
            if (prodIndex.size() == 0) {
                Integer cusID = (Integer) session.getAttribute("activeCustomer");
                Integer orderID = orderDa.countOrder() + 3001;
                java.util.Date date = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                cusInfo = cusDa.getCustomer(cusID);
                order = new Order(orderID, sqlDate, orderTtl, "Packaging", cusInfo.getCustID());
                for (int i = 0; i < cartProdList.size(); i++) {
                    orderListObj = new OrderList(cartProdList.get(i).getProdID(), orderID, cartProdList.get(i).getStock(), prodSubTtl.get(i));
                    finalOrderList.add(orderListObj);
                }
                session.setAttribute("order", order);
                session.setAttribute("finalOrderList", finalOrderList);
                url = "clientReviewOrder.jsp";
            } else {
                url = "CartControl?cartAction=displayCart&message=";
                session.setAttribute("chkRanOutStock", true);
                session.setAttribute("ranOutStockIndex", prodIndex);
            }
            request.setAttribute("cusInfo", cusInfo);
            request.setAttribute("orderSubTtl", orderSubTtl);
            request.setAttribute("shippingFee", shippingFee);
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            try (PrintWriter out = response.getWriter()) {
                out.println(ex.getMessage());
            }
        }

    }

    private void paymentConfirmation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Integer cusID = (Integer) session.getAttribute("activeCustomer");
        String cardNum = request.getParameter("cardNum");
        String userName = request.getParameter("username");
        boolean[] validateArr = new boolean[5];
        validateArr = validation(userName);
        boolean validCardNum = validateCreditCardNumber(cardNum);
        boolean validUserName = false;
        boolean invalid = false;
        String errorName = "";
        String errorCardNum = "";
        String url = "";
        //if validateArr[0] == true that mean it contain SpeacialCharacter
        //if validateArr[1] == true that mean it contain Digits
        //if validateArr[2] == true that mean it contain Space
        //if validateArr[3] == true that mean it contain Letters
        if (!validateArr[0] && !validateArr[1] && !validateArr[2] && validateArr[3]) {
            validUserName = true;
        } else {
            validUserName = false;
        }

        if (!validCardNum && !validUserName) {
            errorName = "Invalid username should not contain (space),(SpeacialCharacter),(Digits) only in letter.Example: LowJiaHie";
            errorCardNum = "Invalid cardNum";
            invalid = true;
            url = "clientPaymentForm.jsp";
        } else if (!validCardNum && validUserName) {
            errorCardNum = "Invalid cardNum";
            url = "clientPaymentForm.jsp";
            invalid = true;
        } else if (!validUserName && validCardNum) {
            errorName = "Invalid username should not contain (space),(SpeacialCharacter),(Digits) only in letter.Example: LowJiaHie";
            url = "clientPaymentForm.jsp";
            invalid = true;
        } else {
            Order order = (Order) session.getAttribute("order");
            OrderList orderListObj = null;
            ArrayList<OrderList> orderList = (ArrayList<OrderList>) session.getAttribute("finalOrderList");
            ArrayList<Shoes> allShoesList = (ArrayList<Shoes>) session.getAttribute("allCartProd");
            ArrayList<Shoes> cartList = (ArrayList<Shoes>) session.getAttribute("cartProd");
            ArrayList<Shoes> shoesStockList = new ArrayList<Shoes>();
            try {
                //add order to
                orderDa.addOrder(order);
                for (int i = 0; i < orderList.size(); i++) {
                    orderListObj = new OrderList(orderList.get(i).getProdID(), orderList.get(i).getOrderID(), orderList.get(i).getQty(), orderList.get(i).getSubTtlPrice());
                    orderListDa.addOrderList(orderListObj);
                }
                for (int i = 0; i < cartList.size(); i++) {
                    shoesStockList.add(shoesDa.getShoes(cartList.get(i).getProdID()));
                    Integer stocks = shoesStockList.get(i).getStock() - cartList.get(i).getStock();
                    shoesDa.restock(shoesStockList.get(i).getProdID(), stocks);
                }

                for (int i = 0; i < allShoesList.size(); i++) {
                    if (allShoesList.get(i).getStaffID().equals(cusID)) {
                        allShoesList.remove(i);
                        i--;
                    }
                }
                session.setAttribute("allCartProd", allShoesList);
                session.removeAttribute("cartProd");
                session.removeAttribute("prodSubTtl");
                session.removeAttribute("finalOrderList");
                session.removeAttribute("ranOutStockIndex");

            } catch (SQLException ex) {
                try (PrintWriter out = response.getWriter()) {
                    out.println(ex.getMessage());
                }
            }

            url = "completePayment.jsp";
        }

        session.setAttribute("invalid", invalid);
        request.setAttribute("errorName", errorName);
        request.setAttribute("errorCardNum", errorCardNum);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    private boolean validateCreditCardNumber(String input) {
        //A credit card number must have between 13 and 16 digits. It must start with:
        //4 for Visa cards
        //5 for Master cards
        //37 for American Express cards
        //6 for Discover cards
        //assign input length to creaditcard array
        int[] creditCardInt = new int[input.length()];

        //convert input to int
        for (int i = 0; i < input.length(); i++) {
            creditCardInt[i] = Integer.parseInt(input.substring(i, i + 1));
        }

        //Starting from the right, double each other digit, if greater than 9 mod 10 and + 1 to the reminder
        for (int i = creditCardInt.length - 2; i >= 0; i = i - 2) {
            int tempValue = creditCardInt[i];
            tempValue = tempValue * 2;
            if (tempValue > 9) {
                tempValue = tempValue % 10 + 1;
            }
            creditCardInt[i] = tempValue;
        }

        //Add up all digits
        int total = 0;
        for (int i = 0; i < creditCardInt.length; i++) {
            total += creditCardInt[i];
        }
        //if number is a multiple of 10, it is valid
        if (total % 10 == 0) {
            return true;
        } else {
            return false;
        }
    }

    private ArrayList<Integer> orderRanOutStocks(ArrayList<Shoes> cartProdList) throws SQLException {
        ArrayList<Shoes> prodStock = new ArrayList<Shoes>();
        ArrayList<Integer> prodIndex = new ArrayList<Integer>();

        //get shoes stock by id
        for (int i = 0; i < cartProdList.size(); i++) {
            Shoes shoes = shoesDa.getShoes(cartProdList.get(i).getProdID());
            prodStock.add(shoes);
        }
        //check stock if orderStock > current stock will return the index number
        for (int i = 0; i < prodStock.size(); i++) {
            if (prodStock.get(i).getProdID().equals(cartProdList.get(i).getProdID()) && cartProdList.get(i).getStock() > prodStock.get(i).getStock()) {
                prodIndex.add(i);
            }

        }
        return prodIndex;
    }

    public boolean[] validation(String s) {
        boolean[] validateArr = new boolean[5];
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
}
