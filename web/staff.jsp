<%@page import="java.util.ArrayList"%>
<%@page import="domain.Staff"%>
<%@page import="da.StaffDA"%>
<% ArrayList <Staff> allStaffs = (ArrayList<Staff>) request.getAttribute("staff");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff information</title>
        <style>
            .error{
                width: 100%;
                margin: 0px auto;
                color: #a94442;
                background: #f2dede;
                text-align: center;
            }
            .success{
                width: 100%;
                margin: 0px auto;
                color: #3c763d;
                background: #dff0d8;
                border-radius: 5px;
                text-align: center;
            }
        </style>
    </head>
    <body>
    <div id="wrapper">
        <jsp:include page="/components/backendHeader.jsp" />
        <div class="error">${error}</div>
        <div class="success">${success}</div>
        
        <a href="AddStaff.jsp" style="float: right; margin: 20px" class="btn btn-primary" name="addStaff">New Employee</a>
        <div class="table-responsive">
            <table class="table table-striped table-hover ">
                <thead class="table-success">
                    <tr>
                        <th scope="col" class="align-middle">Staff ID</th>
                        <th scope="col" class="align-middle">First Name</th>
                        <th scope="col" class="align-middle">Last Name</th>
                        <th scope="col" class="align-middle">Age</th>
                        <th scope="col" class="align-middle">gender</th>
                        <th scope="col" class="align-middle">Phone No</th>
                        <th scope="col" class="align-middle">Position</th>
                        <th scope="col" class="align-middle">Address</th>
                        <th scope="col" class="align-middle" >Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for(int i=0; i<allStaffs.size(); i++)
                    {
                %>
                    <tr>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getStaffID() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getLastName() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getFirstName() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getAge() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getGender() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getPhoneNo() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getPosition() %></td>
                        <td scope="col" class="align-middle"><%= allStaffs.get(i).getAddress() %></td>  
                        <td>
                            <a href="StaffControl?option=1&staffID=<%= allStaffs.get(i).getStaffID() %>" type="button" class="btn btn-primary" style="width: 80px">Edit</a> 
                        </td>
                    </tr> 
                <%  } %>
                </tbody>
            </table>   
        </div>
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
