
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/maintainStaff.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <title>Staff Details</title>
    </head>
    <body>
        <div class="staffmaintainance">
            <div class="header">
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
                        <label>Gender</label><br>
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
                        <a href="StaffControl?option=0" class="btn" name="cancel">Back to Staff Page</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
    $(document).ready(function(){
        $("#submitBtn").click(function(){ 
            if(confirm("CONFIRM TO UPDATE THE STAFF INFORMATION ?")){
                $("#editForm").submit();
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
