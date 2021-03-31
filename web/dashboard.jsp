<%-- 
    Document   : dashboard
    Created on : 14-Mar-2021, 18:44:46
    Author     : Forge-15
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html>
    <head>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>DashBoard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            CustomerDA customerDa = new CustomerDA();
            OrderDA orderDa = new OrderDA();
            OrderListDA orderListDa = new OrderListDA();
            ShoesDA shoesDa = new ShoesDA();
            ArrayList<Customer> Customer = customerDa.getCustomer();
            ArrayList<Order> Order = orderDa.getOrder();
            ArrayList<OrderList> OrderList = orderListDa.getOrderList();
            ArrayList<Shoes> Shoes = shoesDa.getShoes();
        %>
        <div id="wrapper">
        <div class="wrap-content">
                        
                           <div class="row ">
                              <div class="col-3 ">
                                <div class="card text-center">
                                  <div class="card-body bg-light">
                                    <h5 class="card-title">Revenue</h5>
                                    <p class="card-text">123<!-- implement result --></p>
                                    
                                        <a href="#" class="btn btn-primary b-full">View</a>
                                    
                                    
                                  </div>
                                </div>
                              </div>
                              <div class="col-3">
                                <div class="card text-center ">
                                  <div class="card-body bg-light">
                                    <h5 class="card-title">Total Order </h5>
                                    <p class="card-text">123<!-- implement result --></p>
                                    <a href="#" class="btn btn-primary b-full">View</a>
                                  </div>
                                </div>
                              </div>
                               <div class="col-3">
                                <div class="card text-center">
                                  <div class="card-body bg-light">
                                    <h5 class="card-title">Order Pending</h5>
                                    <p class="card-text">123<!-- implement result --></p>
                                    <a href="#" class="btn btn-primary b-full">View</a>
                                  </div>
                                </div>
                              </div>
                               <div class="col-3 ">
                                <div class="card text-center">
                                  <div class="card-body bg-light">
                                    <h5 class="card-title">Total Product</h5>
                                    <p class="card-text">123<!-- implement result --></p>
                                    <a href="#" class="btn btn-primary b-full" >View</a>
                                  </div>
                                </div>
                              </div>
</div>  
                
                    <div class="table-wrapper ">
                        <label for="Sort">Sort By:</label>
                        <select id="cars">
                          <option value="Sales">Sales</option>
                          <option value="Status">Status</option>
                          <option value="Price">Low to High</option>
                          <option value="Name">Name(A-Z)</option>
                        </select>
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
                                                            <th scope="col" class="align-middle">Customer Name </th>
                                                            <th scope="col" class="align-middle">Phone No</th>
                                                            <th scope="col" class="align-middle">Total Item</th>
                                                            <th scope="col" class="align-middle">Total (RM)</th>
                                                            <th scope="col" class="align-middle">Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                               <%for(int i=0; i<Customer.size(); i++) { %>
                                                               <%for( i=0; i<Order.size(); i++ ) { %>
                                                                    <tr>
                                                                        <td><%=Order.get(i).getOrderID() %></td>
                                                                        <td><%=Customer.get(i).getFirstName() %> <%=Customer.get(i).getLastName() %></td>
                                                                        <td><%=Customer.get(i).getPhoneNo() %></td>
                                                                        <td><%=OrderList.get(i).getQty() %></td>
                                                                        <td><%=Order.get(i).getTtlPrice() %></td>
                                                                        <td><%=Order.get(i).getStatus() %></td>
                                                                        
                                                                        <td><%=Customer.get(i).getRewardPoint() %></td>
                                                                        <td>
                                                                            <a href="#" type="button" class="btn btn-primary" >View Order</a>
                                                                        </td>
                                                                    </tr>
                                                    <% }  %>
                                                    </tbody>
            </div>
            </div>   
         </div>
    </body>
</html>
