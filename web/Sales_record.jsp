<%--
    Document   : Sales_record
    Created on : 27-Mar-2021, 21:47:55
    Author     : Forge-15
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="domain.Customer" %>
<%@page import="da.CustomerDA" %>
<%@page import="domain.Order" %>
<%@page import="da.OrderDA" %>

<!DOCTYPE html>
<%
    //redirect user back to staff_login.jsp if no user session found
    String staffEmail = (String) session.getAttribute("activeStaff");
    response.setHeader("cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (staffEmail == null) {
        response.sendRedirect("/hoot9gui/staff_login.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Record</title>
        <!-- Backend Header -->
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <h3 class="title mb-5">Sales Record</h3>
        <%
            CustomerDA customerDa = new CustomerDA();
            OrderDA orderDa = new OrderDA();
            ArrayList<Customer> Customer = customerDa.getCustomer();
            ArrayList<Order> orderList = orderDa.listRecord();
        %>
        <div class="wrap-content ">
            <table>
                <div class="mb-3">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover ">
                                    <thead class="table-success">
                                        <tr>
                                            <th scope="col" class="align-middle">Order ID</th>
                                            <th scope="col" class="align-middle">Date</th>
                                            <th scope="col" class="align-middle">Total Price</th>
                                            <th scope="col" class="align-middle">Status</th>
                                            <th scope="col" class="align-middle">Customer ID</th>
                                            <th scope="col" class="align-middle">Customer Name</th>
                                            <th scope="col" class="align-middle">Phone Number</th>
                                            <th scope="col" class="align-middle">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (int i = 0; i < Customer.size(); i++) { %>
                                        <%for (int l = 0; l < orderList.size(); l++) {
                                        
                                        if(Customer.get(i).getCustID() == orderList.get(l).getCustID()){
                                        %>
                                        
                                        <tr>
                                            
                                            <td><%=orderList.get(l).getOrderID()%></td>
                                            <td><%=orderList.get(l).getDate()%></td>
                                            <td><%=orderList.get(l).getTtlPrice()%></td>
                                            <td><%=orderList.get(l).getStatus()%></td>
                                            <td><%=Customer.get(i).getCustID()%></td>
                                            <td><%=Customer.get(i).getFirstName()%> <%=Customer.get(i).getLastName()%></td>
                                            <td><%=Customer.get(i).getPhoneNo()%></td>
                                            <td>
                                                <a href="OrderControl?option=0" type="button" class="btn btn-primary" >View Order Details</a>
                                            </td>
                                            <% }}
                                                }%>
                                        </tr>
                                    </tbody>
                            </div>
                        </div>
                    </div>

            </table>
        </div>
    </body>
</html>