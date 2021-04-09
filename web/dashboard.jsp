<%--
    Document   : dashboard
    Created on : 14-Mar-2021, 18:44:46
    Author     : Forge-15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="domain.Customer" %>
<%@page import="da.CustomerDA" %>
<%@page import="domain.Order" %>
<%@page import="da.OrderDA" %>
<%@page import="domain.OrderList" %>
<%@page import="da.OrderListDA" %>
<%@page import="domain.Shoes" %>
<%@page import="da.ShoesDA" %>


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
        <title>Product Management Page</title>
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
        <%
            CustomerDA customerDa = new CustomerDA();
            OrderDA orderDa = new OrderDA();
            OrderListDA OrderListDa = new OrderListDA();
            Customer customer = (Customer) request.getAttribute("customer");
            ArrayList<Customer> Customer = customerDa.getCustomer();
            ArrayList<Order> orderList = orderDa.listRecord();
            ArrayList<OrderList> custOrderList = OrderListDa.CusOrderList();
            
            
        %>
        <div id="wrapper">
            <div class="wrap-content container">
<%for (int j = 4; j < orderList.size(); j++) {%>
   <% double ttlPrice = 0; 
        ttlPrice += orderList.get(j).getTtlPrice();
        LocalDate date = LocalDate.now(); 
   %>
    
                <div class="row ">
                    <div class="col-3 ">
                        <div class="card text-center">
                            <div class="card-body bg-light">
                                <h5 class="card-title">Last Order Value</h5>
                                <p class="card-text"><%= ttlPrice %> </p>
                                <a href="OrderControl?option=0" class="btn btn-primary b-full">View</a>
                            </div>
                        </div>
                    </div>
                             
                    <div class="col-3">
                        <div class="card text-center ">
                            <div class="card-body bg-light">
                                <h5 class="card-title">Last Order ID</h5>
                                <p class="card-text"><%= orderList.get(j).getOrderID()  %> </p>
                                <a href="OrderControl?option=0" class="btn btn-primary b-full">View</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card text-center">
                            <div class="card-body bg-light">
                                <h5 class="card-title">Last Order Status</h5>
                                <p class="card-text"><%= orderList.get(j).getStatus() %><!-- implement result --></p>
                                <a href="OrderControl?option=0" class="btn btn-primary b-full">View</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-3 ">
                        <div class="card text-center">
                            <div class="card-body bg-light">
                                <h5 class="card-title">Current Date</h5>
                                <p class="card-text"><%= date.getDayOfMonth()%> <%= date.getMonth()%> <%= date.getYear() %><!-- implement result --></p>
                                <a href="#" class="btn btn-primary b-full" disabled>View</a>
                            </div>
                        </div>
                    </div>
                   <% } %>
                </div>
                
                <div class="mb-3">
                    <table>
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover ">
                                            <thead class="table-light">
                                                <tr>
                                                    <th scope="col" class="align-middle">Order ID </th>
                                                    <th scope="col" class="align-middle">Order Date</th>
                                                    <th scope="col" class="align-middle">Customer Name </th>
                                                    <th scope="col" class="align-middle">Phone No</th>
                                                    <th scope="col" class="align-middle">Total (RM)</th>
                                                    <th scope="col" class="align-middle">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < Customer.size(); i++) { %>
                                                <%for (i = 0; i < orderList.size(); i++) {%>
                                                <tr>
                                                    <td><%=orderList.get(i).getOrderID()%></td>
                                                    <td><%=orderList.get(i).getDate() %></td>
                                                    <td><%=Customer.get(i).getFirstName()%> <%=Customer.get(i).getLastName()%></td>
                                                    <td><%=Customer.get(i).getPhoneNo()%></td>
                                                    <td><%=orderList.get(i).getTtlPrice() %> </td>
                                                    <td>
                                                        <a href="#" type="button" class="btn btn-secondary" style="width: 100px"><%=orderList.get(i).getStatus() %></a>
                                                    </td>
                                                </tr>
                                                <% }
                                                }%>
                                            </tbody>
                                    </div>

                                </div>
                            </div>
                        </div>
                </div>
            </div>  
        </div>
    </body>
</html>
