<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/maintainStaff.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <title>Add Staff</title>
    </head>
    <body>
        <div class="staffmaintainance">
            <div class="errorMessage" style="text-align: center; width: fit-content">${error}</div>
            <div class="header">
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
                    <div class="registergrp" style="margin-bottom: 40px">
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
</html>
