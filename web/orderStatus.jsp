<%@page import="da.OrderDA"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList <Order> allOrders = (ArrayList<Order>) request.getAttribute("order");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="domain.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order Status</title>
        <link rel="stylesheet" href="console.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="overflow-auto">
            <div class="row" style="width:100%">
                <div class="col-12">
                    <div class="table-responsive" style="width:102%">
                        <table class="table table-striped table-hover ">

                        <thead class="table-success">
                            <tr>
                                <th scope="col" class="align-middle">Order ID</th>
                                <th scope="col" class="align-middle">Date</th>
                                <th scope="col" class="align-middle">Total Price</th>
                                <th scope="col" class="align-middle">Customer ID</th> 
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
                                <td>
                                    <form action="OrderControl" method="GET">
                                        <input type="hidden" name="order_id" value="<%= allOrders.get(i).getOrderID() %>"/>
                                        <input type="hidden" name="cust_id" value="<%= allOrders.get(i).getCustID() %>"/>
                                        <input type="hidden" name="date" value="<%= allOrders.get(i).getDate() %>"/>
                                        <input type="hidden" name="ttlprice" value="<%= allOrders.get(i).getTtlPrice() %>"/>
                                        <select id="available" name="orderStatus">
                                            <option value='<%= allOrders.get(i).getStatus() %>'><%= allOrders.get(i).getStatus() %></option>
                                            <option value="Processing">Processing</option>
                                            <option value="Completed">Completed</option>
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
                </div>
            </div>
        </div>
    </body>
</html>
