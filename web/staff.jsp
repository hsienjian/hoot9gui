<%@page import="java.util.ArrayList"%>
<%@page import="domain.Staff"%>
<%@page import="da.StaffDA"%>
<% ArrayList <Staff> allStaffs = (ArrayList<Staff>) request.getAttribute("staff");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="console.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <title>Staff information</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .error{
                width: 40%;
                margin: 0px auto;
                /*padding: 10px;*/
                /*border: 1px solid #a94442;*/
                color: #a94442;
                background: #f2dede;
                border-radius: 5px;
                text-align: center;
/*                margin-left: 30%;
                width: fit-content*/
            }
        </style>
    </head>
    <body>
    <div id="wrapper">
        <%@include file="console.html" %>
        <div class="error">${error}</div>
        <!--<div class="overflow-auto">-->
            
            <div class="row">
                <div class="col-12">
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
                                        <form id="deleteForm" class="form-detail" action="StaffControl" method="GET" enctype="multipart/form-data" >
                                            <input type="hidden" name="option" value="4">
                                            <input type="hidden" name="staffID" value="<%= allStaffs.get(i).getStaffID() %>">
                                            <button id="submitBtn" class="btn btn-danger" style="width: 80px" name="deleteStaff">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            <%  } %>
                            </tbody>
                        </table>   
                    </div>
                </div>
            </div>           
        </div>              
    <!--</div>-->
    </body>
    <script>
    $(document).ready(function(){
        $("#submitBtn").click(function(){ 
            if(confirm("CONFIRM TO DELETE STAFF ?")){
                $("#deleteForm").submit();
                return true;
            }
            else{
                alert('Cancelled.');
                return false;
            }
        });
    });
    </script>
</html>
