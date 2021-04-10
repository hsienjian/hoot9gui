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

        <link href="css/maintainStaff.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Staff</title>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <div class="staffmaintainance">
            <div id="headerForm">
                <h2>Edit Staff</h2>
            </div>
            <form class="form-detail" action="StaffControl" method="GET" enctype="multipart/form-data" id="editForm">
                <div class="form-left">
                    <div class="registergrp">
                        <label for="staff_id">Staff ID :</label>
                        <label name="id">${staff.staffID}</label>
                    </div>
                    <div class="registergrp">
                        <label>First Name :</label>
                        <input type="text" name="fname" value="${staff.firstName}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Last Name :</label>
                        <input type="text" name="lname" value="${staff.lastName}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Age :</label>
                        <input type="number" name="age" min="20" max="50" value="${staff.age}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Email :</label>
                        <input type="email" name="email" value="${staff.email}" required /><br>
                    </div>
                    <div class="registergrp" style="display: flex" >
                        <label>Gender : &nbsp;</label><br>
                        <select name="staffGender" required>
                            <option value='${staff.gender}'>${staff.gender}</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="registergrp">
                        <label>Address :</label>
                        <input type="text" name="address" value="${staff.address}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Phone Number :</label>
                        <input type="text" name="phNum" value="${staff.phoneNo}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Position :</label>
                        <input type="text" name="position" value="${staff.position}" required /><br>
                    </div>
                    <div class="registergrp">
                        <label>Current Password :</label>
                        <input type="password" name="password" required /><br>
                    </div>
                    <div class="registergrp" >
                        <input type="hidden" name="staffID" value="${staff.staffID}">
                        <input type="hidden" name="option" value="2">
                        <button class="btn" id="submitBtn" name="updateStaff">Update Staff</button>
                        <a href="StaffControl?option=4&staffID=${staff.staffID}" style="text-decoration: none" id="deleteBtn" class="btn btn-danger" style="width: 80px">Delete</a>
                    </div>
                    <div class="registergrp" >
                        <a href="StaffControl?option=0" class="btn" style="text-decoration: none" name="cancel">Back to Staff Page</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <!-- Js Plugins -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $("#submitBtn").click(function () {
                if (confirm("CONFIRM TO UPDATE THE STAFF INFORMATION ?")) {
                    $("#editForm").validate();
                    $("#editForm").submit();
                    return true;
                } else {
                    alert('Cancelled.');
                    return false;
                }
            });
            $("#deleteBtn").click(function () {
                if (confirm("CONFIRM TO DELETE THE STAFF PERMANENTLY ?")) {
                    $("#editForm").submit();
                    return true;
                } else {
                    alert('Cancelled.');
                    return false;
                }
            });
        });
    </script>


</html>
