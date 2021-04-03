<%@page import="da.OrderDA"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList <Order> allOrders = (ArrayList<Order>) request.getAttribute("order");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="domain.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Backend Header -->
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <link rel="stylesheet" href="css/clientFooter.css">
        <link href="css/maintainStaff.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order Status</title>
        <style>
            #statusForm select {
                width: 45%;
                height: 50px;
                font-size: 100%;
                font-weight: bold;
                cursor: pointer;
                border-radius: 0;
                background-color: #f1b0b7;
                border: none;
                border-bottom: 2px solid #962d22;
                color: white;
                padding: 10px;
                padding-right: 38px;
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                /* Adding transition effect */
                transition: color 0.3s ease, background-color 0.3s ease, border-bottom-color 0.3s ease;
            }
            #statusForm select:hover,
            #statusForm select:focus {
              color: #c0392b;
              background-color: white;
              border-bottom-color: #DCDCDC;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <h1 style="text-align:center">O R D E R &nbsp; S T A T U S</h1>
        
        <div class="table-responsive" style="width:102%">
            <table class="table table-striped table-hover ">
                <thead class="table-success">
                    <tr>
                        <th scope="col" class="align-middle">Order ID</th>
                        <th scope="col" class="align-middle">Date</th>
                        <th scope="col" class="align-middle">Total Price</th>
                        <th scope="col" class="align-middle">Customer ID</th>
                        <th scope="col" class="align-middle">Current Status</th>
                        <th scope="col" class="align-middle">Update Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(int i=0; i< allOrders.size(); i++)
                        {
                    %>
                    <tr>
                        <td><%= allOrders.get(i).getOrderID() %></td>
                        <td><%= allOrders.get(i).getDate() %></td>
                        <td><%= allOrders.get(i).getTtlPrice() %></td>
                        <td><%= allOrders.get(i).getCustID() %></td>
                        <td><%= allOrders.get(i).getStatus() %></td>
                        <td>
                            <form action="OrderControl" method="GET" id="statusForm">
                                <input type="hidden" name="order_id" value="<%= allOrders.get(i).getOrderID() %>"/>
                                <input type="hidden" name="cust_id" value="<%= allOrders.get(i).getCustID() %>"/>
                                <input type="hidden" name="date" value="<%= allOrders.get(i).getDate() %>"/>
                                <input type="hidden" name="ttlprice" value="<%= allOrders.get(i).getTtlPrice() %>"/>
                                <select id="available" name="orderStatus">
                                    <option value='<%= allOrders.get(i).getStatus() %>'><%= allOrders.get(i).getStatus() %></option>
                                    <option value="Packaging">Packaging</option>
                                    <option value="Shipping">Shipping</option>
                                    <option value="Delivered">Delivered</option>
                                </select> &nbsp;
                                <input type="hidden" name="option" value="1">
                                <input type="submit" id="update" value="Submit">
                            </form>
                        </td>
                    </tr>  
                    <% } %>
                </tbody>
            </table>
        </div>
                
    <%@include  file="components/clientFooter.jsp"%>
    </body>
    <!-- Js Plugins -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <!--<script src="js/checkHover.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
