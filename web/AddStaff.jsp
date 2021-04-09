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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/maintainStaff.css" rel="stylesheet" type="text/css"/>
        <title>Add Staff</title>
        <style>
            .errorMsg{
                width: 100%;
                margin: 0px auto;
                margin-top: 0px;
                color: #a94442;
                background: #f2dede;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <div class="staffmaintainance">
            <div class="errorMsg">${error}</div>
            <div id="headerForm">
                <h2>Add Staff</h2>
            </div>
            <form class="form-detail" action="StaffControl" method="GET" enctype="multipart/form-data" id="addForm">                       
                <div class="form-left">
                    <div class="registergrp">
                       <label for="first_name">First Name :</label>
                       <input type="text" id="fname" name="fname" required /><br>
                    </div>
                    <div class="registergrp">
                       <label for="last_name">Last Name :</label>
                       <input type="text" id="lname" name="lname" required /><br>
                    </div>
                    <div class="registergrp">
                       <label for="age">Age :</label>
                       <input type="number" id="age" name="age" min="20" max="50" required><br>
                    </div>
                   <div class="registergrp">
                        <label for="email">Email :</label>
                        <input type="email" id="email" name="email" required /><br>
                    </div>
                    <div class="registergrp" >
                       <label>Gender</label><br>
                        <select name="staffGender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="registergrp">
                        <label for="address">Address :</label>
                        <input type="text" id="address" name="address" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="phone_no">Phone Number :</label>
                        <input type="text" id="phNum" name="phNum" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="position">Position :</label>
                        <input type="text" id="position" name="position" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="password">Password :</label>
                        <input type="password" id="password" name="password" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="password">Confirm Password :</label>
                        <input type="password" id="password" name="confirmPWD" required /><br>
                    </div>
                    <div class="registergrp" style="margin-top: 30px; margin-bottom: 0px">
                        <input type="hidden" name="option" value="3">
                        <button class="btn" id="submitBtn" name="addStaff">Add Staff</button>
                        <a href="StaffControl?option=0" class="btn" name="cancel">Back to Staff Page</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
    $(document).ready(function(){
        $("#submitBtn").click(function(){
            $("#addForm").validate();
            if(confirm("CONFIRM TO ADD A NEW STAFF ?")){
                $("#addForm").submit();
                return true;
            }
            else{
                alert('Cancelled.');
                return false;
            }
        });
    });
    </script>

    <!-- Js Plugins -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
