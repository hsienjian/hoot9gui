<%@page import="java.util.ArrayList"%>
<%@page import="domain.Staff"%>
<%@page import="da.StaffDA"%>
<% ArrayList<Staff> allStaffs = (ArrayList<Staff>) request.getAttribute("staff");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            .product-control-panel{
                display: flex;
                float: right;
                transform: translateY(-15px);
                margin-right: 10px;
                margin-top: 30px;
            }
        </style>
        <script>
            function search(e) {
                var i = 0;
                var rowID = new Array();
                var hittedRowID = new Array();
                var search = e.target.value;
                search = search.replaceAll(" ", "_");
                //search = search.toUpperCase();

                $("#recordTable tr").each(function () {
                    var id = (this.id).split("-");
                    rowID[i] = id;
                    i++;
                });

                if (search.length > 0) {
                    for (i = 0; i < rowID.length; i++) {
                        var x = rowID[i];
                        var exist;
                        for (var l = 0; l < x.length; l++) {
                            var y = x[l];
                            for (var j = 0; j < search.length; j++) {
                                var z = y[j];
                                if (z === search[j]) {
                                    exist = 1;
                                } else {
                                    exist = 0;
                                    break;
                                }
                            }
                            if (exist === 1) {
                                break;
                            }
                        }

                        // check if the hittedRow is already listed or not
                        for (var l = 0; l < hittedRowID.length; l++) {
                            if (rowID[i] === hittedRowID[l]) {
                                exist = 0;
                                break;
                            }
                        }
                        // if the hittedRow is not listed yet, then will pust to the listed array
                        if (exist === 1) {
                            hittedRowID.push(rowID[i]);
                        }
                    }
                } else {
                    hittedRowID = rowID;
                }

                //check the hittedRowID to be displayed
                if (hittedRowID.length > 0) {
                    for (i = 0; i < rowID.length; i++) {
                        var row = rowID[i].join("-");
                        for (var l = 0; l < hittedRowID.length; l++) {
                            var hittedID = hittedRowID[l].join("-");
                            if (hittedID === row) {
                                $("#" + row).css("display", "table-row");
                                break;
                            } else {
                                $("#" + row).css("display", "none");
                            }
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="/components/backendHeader.jsp" />
            <div class="error">${error}</div>
            <div class="success">${success}</div>

            <div class="product-control-panel">
                <a href="AddStaff.jsp" style="margin-right: 20px" class="btn btn-primary" name="addStaff">New Employee</a>
                <input onKeyUp="search(event)" style="width: 201px" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            </div>

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
                    <tbody id="recordTable">
                        <%
                            for (int i = 0; i < allStaffs.size(); i++) {
                                String id = allStaffs.get(i).getStaffID().toString();
                                String ln = allStaffs.get(i).getLastName();
                                String fn = allStaffs.get(i).getFirstName();
                                String age = allStaffs.get(i).getAge().toString();
                                String gender = allStaffs.get(i).getGender();
                                gender = gender.replaceAll(" ", "");
                                String position = allStaffs.get(i).getPosition();
                                position = position.replaceAll(" ", "_");
                        %>
                        <tr id="<%=id%>-<%=ln%>-<%=fn%>-<%=age%>-<%=gender%>-<%=position%>">
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getStaffID()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getLastName()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getFirstName()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getAge()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getGender()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getPhoneNo()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getPosition()%></td>
                            <td scope="col" class="align-middle"><%= allStaffs.get(i).getAddress()%></td>
                            <td>
                                <a href="StaffControl?option=1&staffID=<%= allStaffs.get(i).getStaffID()%>" type="button" class="btn btn-primary" style="width: 80px">Edit</a>
                            </td>
                        </tr>
                        <%  }%>
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
