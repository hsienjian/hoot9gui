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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        
        <script>
            function showMenu() {
                document.getElementById("menuNav").style.transform = "translateX(0px)";
                document.getElementById("menuBtn").style.opacity = "0";
            }
            function hideMenu() {
                document.getElementById("menuNav").style.transform = "translateX(-270px)";
                document.getElementById("menuBtn").style.opacity = "1";
            }
            function handleCollapse(element, icon) {
                console.log(event.target.getAttribute('id'));
                if (event.target.getAttribute('name') === element || event.target.getAttribute('id') === icon){
                    if ($("#" + element).css("maxHeight") === "0px") {
                        var height = document.getElementById(element).scrollHeight;
                        document.getElementById(element).style.maxHeight = height + "px";
                        document.getElementById(element).style.overflow = "auto";
                        document.getElementById(icon).style.transform = "rotate(180deg)";
                    }else {
                        document.getElementById(element).style.maxHeight = "0px";
                        document.getElementById(icon).style.transform = "rotate(0deg)";
                    }
                }
            }
        </script>
        <style>
            body {
                margin: 0px;
                background-color: whitesmoke;
            }
            .btn{
                cursor: pointer;
                outline: unset;
                border: unset;
                background-color: unset;
            }
            .menu-btn {
                position: absolute;
                font-size: 24px;
                transform: translate(20px, 15px);
            }
            .close-btn {
                font-size: 28px;
                transform: translate(48px, -40px);
            }
            .copyright {
                width: 2max-content;
                position: fixed;
                padding: 20px 15px;
                font-size: 12px;
                bottom: 0px;
            }
            .staff-nav {
                transform: translateX(-270px);
                transition: 0.4s;
                width: 270px;
                min-height: 100vh;
                height: max-content;
                background-color: rgb(224,255,255, 0.8);
            }
            .staff-nav>ul {
                list-style: none;
                margin: 0px 20px;
                padding: 25px 0px;
            }
            .staff-nav>ul>li {
                height: max-content;
                padding: 0px 10px;
                margin-bottom: 35px;
                cursor: pointer;
            }
            .staff-nav>ul i {
                float: right;
            }
            .collapse-ul{
                transition: 0.3s;
                max-height: 0px;
                overflow: hidden;
                padding-left: 35px;
            }
            .collapse-ul li{
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <%
            CustomerDA customerDa = new CustomerDA();
            ArrayList<Customer> Customer = customerDa.getCustomer();
        %>
        <div class="wrap-content">
                <table>
                    <div class="mb-3">
                        <div class="row">
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover ">
                                        <thead class="table-success">
                                            <tr>
                                                <th scope="col" class="align-middle">Customer Id</th>
                                                <th scope="col" class="align-middle">First Name</th>
                                                <th scope="col" class="align-middle">Last Name</th>
                                                <th scope="col" class="align-middle">Age</th>
                                                <th scope="col" class="align-middle">Email</th>
                                                <th scope="col" class="align-middle">Gender</th>
                                                <th scope="col" class="align-middle">Address</th>
                                                <th scope="col" class="align-middle">Phone No</th>
                                                <th scope="col" class="align-middle">Reward Point</th>
                                                <th scope="col" class="align-middle">View Customer Order</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for(int i=0; i<Customer.size(); i++) { %>
                                            <tr>

                                                <td><%=Customer.get(i).getCustID() %></td>
                                                <td><%=Customer.get(i).getFirstName() %></td>
                                                <td><%=Customer.get(i).getLastName() %></td>
                                                <td><%=Customer.get(i).getAge() %></td>
                                                <td><%=Customer.get(i).getEmail() %></td>
                                                <td><%=Customer.get(i).getGender() %></td>
                                                <td><%=Customer.get(i).getAddress() %></td>
                                                <td><%=Customer.get(i).getPhoneNo() %></td>
                                                <td><%=Customer.get(i).getRewardPoint() %></td>
                                                
                                                <td>
                                                    <a href="#" type="button" class="btn btn-primary" >View Order</a>
                                                </td>
                                            </tr>
                                                <% } %>
                                        </tbody>
                                </div>
                            </div>
                        </div>           
                        
                </table>
            </div>
        </div>
        <h1>Hello World!</h1>
        <h1>Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!</h1>
      
    </body>
</html>
