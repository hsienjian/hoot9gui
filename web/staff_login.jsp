<%-- 
    Document   : staff_login
    Created on : Mar 17, 2021, 11:29:48 AM
    Author     : j.chong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            body {
                background-size: 100% 120%;
                background-repeat:no-repeat;
                background-image: url("images/staff_login_BG.jpg");
                color: rgba(255,255,255,0.8) !important;
            }
            .staff-login-container {
                width: 300px;
                height: 190px;
                margin: 30vh auto;
                border-radius: 20px;
                overflow: hidden;
                background-color: rgba(0,0,0,0.5);
            }
            .staff-login-img, .staff-login-img img {
                position: relative;
                padding-left: 30px;
                transform: translate(0px, -35px);
            }
            .staff-login-img img {
                transform: translate(0px, -40px);
            }
            .staff-login-form {
                transform: translateY(-55px);
                padding: 0px 10px 10px 10px;
                margin: 0px auto;
            }
            .staff-login-form .form-group{
                margin-top: 25px;
                margin-bottom: 0px;
            }
            .form-group input {
                float: right;
                border: none;
                border-radius: 5px;
                background-color: rgba(255,255,255,0.3);
            }
            input:focus {
                outline: none;
            }
            .login-btn {
                position: relative;
                height: 25px;
                width: 80px;
                border: none;
                border-radius: 10px;
                left: 100px;
                margin-top: 25px;
                background-color: rgba(255,255,255,0.3);
            }
            .login-btn:hover {
                background-color: rgba(0,0,0,0.4)!important;
            }
        </style>
        <%
            Object activeStaff = session.getAttribute("activeStaff");
            Object errorMsg = request.getAttribute("errorMsg");
        %>
    </head>
    <body
        <div class="staff-login-container">
            <div class="staff-login-img">
                <svg t="1615726873708" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2130" width="64" height="64"><path d="M856.339597 799.428571q0 62.285714-35.714286 106.857143t-86 44.571429H246.625311q-50.285714 0-86-44.571429T124.911026 799.428571q0-48.571429 4.857143-91.714285t18-86.857143 33.428571-74.857143 53.714286-50.857143T311.768169 475.428571q74.857143 73.142857 178.857142 73.142858t178.857143-73.142858q43.428571 0 76.857143 19.714286t53.714286 50.857143 33.428571 74.857143 18 86.857143 4.857143 91.714285z m-146.285714-506.857142q0 90.857143-64.285714 155.142857T490.625311 512 335.482454 447.714286 271.19674 292.571429t64.285714-155.142858T490.625311 73.142857t155.142858 64.285714T710.053883 292.571429z" p-id="2131" fill="#2c2c2c"></path></svg>
                <img src="images/hoot9elogo-01.png" alt="hoot9e-logo" style="width:160px"/>
            </div>
            <form class="staff-login-form" action="StaffLogin" method="POST">
                <div class="form-group">
                    <label>Email : </label>
                    <input name="staff_email" type="email" />
                </div>
                <% if ( activeStaff == null) { %>
                    <font style="position:absolute;font-weight:600" color="#B22222"><%= (errorMsg == null)?"":errorMsg %></font>
                <% } else { 
                    String site = "http://localhost:8080/build/staff.html";
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("location",site); 
                }%>
                <div class="form-group">
                    <label>Password : </label>
                    <input name="staff_pw" type="password" />
                </div>
                <input class="login-btn" name="login" type="submit" value="Login"/>
            </form>
        </div>
    </body>
</html>