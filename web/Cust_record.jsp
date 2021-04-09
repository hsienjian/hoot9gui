<%-- 
    Document   : Cust_record
    Created on : 22-Mar-2021, 17:25:59
    Author     : Forge-15
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="domain.Customer" %>
<%@page import="da.CustomerDA" %>

<jsp:useBean id="customer" class="domain.Customer" ></jsp:useBean>
<jsp:useBean id="customerDA" class="da.CustomerDA" ></jsp:useBean>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <title>Customer Record</title>
            <link rel="stylesheet" href="./css/backendHeader.css">
            <script src="./js/backendHeader.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

        </head>
        <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <%
            CustomerDA customerDa = new CustomerDA();
            ArrayList<Customer> Customer = customerDa.getCustomer();
        %>
        <div class="wrap-content container">

            <div class="mb-3">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover ">
                                <thead class="table-success">
                                    <tr>
                                        <th scope="col" class="align-middle">Total Customer</th>
                                        <th scope="col" class="align-middle">Customer Id</th>
                                        <th scope="col" class="align-middle">First Name</th>
                                        <th scope="col" class="align-middle">Last Name</th>
                                        <th scope="col" class="align-middle">Age</th>
                                        <th scope="col" class="align-middle">Email</th>
                                        <th scope="col" class="align-middle">Gender</th>
                                        <th scope="col" class="align-middle">Address</th>
                                        <th scope="col" class="align-middle">Phone No</th>
                                        <th scope="col" class="align-middle">Reward Point</th>
                                        <th scope="col" class="align-middle">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < Customer.size(); i++) {%>
                                    <tr>
                                        <td><%= i+1 %></td>
                                        <td><%=Customer.get(i).getCustID()%></td>
                                        <td><%=Customer.get(i).getFirstName()%></td>
                                        <td><%=Customer.get(i).getLastName()%></td>
                                        <td><%=Customer.get(i).getAge()%></td>
                                        <td><%=Customer.get(i).getEmail()%></td>
                                        <td><%=Customer.get(i).getGender()%></td>
                                        <td><%=Customer.get(i).getAddress()%></td>
                                        <td><%=Customer.get(i).getPhoneNo()%></td>
                                        <td><%=Customer.get(i).getRewardPoint()%></td>

                                        <td>
                                            <a href="CustomerControl?option=1&custID=<%=Customer.get(i).getCustID()%> " type="button" class="btn btn-primary" >Edit</a>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                        </div>
                    </div>
                </div>    
            </div> 

        </table>
    </div>


</body>
</html>
