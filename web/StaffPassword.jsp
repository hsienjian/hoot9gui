<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/maintainStaff.css">
        <title>Set Password</title>
    </head>
    <body>
        <div class="staffmaintainance">
            <div class="header">
                <h2>Set Password</h2>
            </div>
            <form class="form-detail" action="StaffDetail" method="post" enctype="multipart/form-data">                       
                <div class="form-left">
                    <div class="registergrp">
                        <label for="position">Current Password :</label>
                        <input type="password" id="password" name="currentPWD"><br>
                    </div>
                    <div class="registergrp">
                        <label for="position">New Password :</label>
                        <input type="password" id="password" name="newPWD"><br>
                    </div>
                    <div class="registergrp">
                        <label for="position">Confirm Password :</label>
                        <input type="password" id="password" name="confirmPWD"><br>
                    </div>
                    <div class="registergrp" style="margin-bottom: 40px">
                        <button type="submit" class="btn" name="updateprod">Save</button>
                        <button type="submit" class="btn" name="updateprod">Reset</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
