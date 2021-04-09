<%-- 
    Document   : add_Customer_record
    Created on : 05-Apr-2021, 22:54:10
    Author     : Forge-15
--%>

<%@page import="domain.Customer"%>
<%@page import="da.CustomerDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    CustomerDA customerDa = new CustomerDA();
    Customer customer = (Customer) request.getAttribute("customer");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer Record</title>
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
        <div class="container">
            <div class="card text-dark bg-light mb-3" style="max-width: 40rem;">
                <div class="card-header ">Edit Customer record</div>
                <form class="row g-3 " action="CustomerControl" method="POST">
                    <div class="col-md-12 mb-3">
                        <label for="custId" class="form-label">Customer ID</label>
                        <input type="hidden" value="2" name="option"></input>
                        <input type="text" class="form-control" value="<%= customer.getCustID() %>"  disabled ></input>
                        <input type="hidden" class="form-control" value="<%= customer.getCustID() %>"  name="custId" ></input>

                    </div>
                    <div class="col-md-6">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%= customer.getFirstName() %>"></input>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%= customer.getLastName() %>"></input>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" name="age" value="<%= customer.getAge() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" value="<%= customer.getEmail() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password"  value="<%= customer.getPassword() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <input type="text" class="form-control" name="gender"  value="<%= customer.getGender() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" value="<%= customer.getAddress() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="phoneNo" class="form-label">Phone No</label>
                        <input type="text" class="form-control" name="phoneNo"  value="<%= customer.getPhoneNo() %>"></input>
                    </div>
                    <div class="col-12 mb-3">
                        <label for="rewardPoint" class="form-label">Reward Point</label>
                        <input type="number" class="form-control" name="rewardPoint"  value="<%= customer.getRewardPoint() %>"></input>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Confirm Edit</button>

                    </div>

                </form>
            </div>
        </div>
    </body>
</html>
