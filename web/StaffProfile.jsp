<%--<jsp:useBean id="staff" scope="session" class="domain.Staff"/>--%>
<%@page import="domain.Shoes"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList <Shoes> handle = (ArrayList<Shoes>) request.getAttribute("duty");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/maintainStaff.css">        
        <link rel="stylesheet" href="css/console.css">
        <title>Staff Profile</title>
        <style>
        .error{
            width: 32%;
            margin: 0px auto 30px;
            margin-bottom: 0px;
            /*padding: 10px;*/
            /*border: 1px solid #a94442;*/
            color: #a94442;
            background: #f2dede;
            border-radius: 5px;
            text-align: center;
        /*                margin-left: 30%;
            width: fit-content*/
        }

        .success{
            width: 32%;
            margin: 0px auto;
        /*    padding: 10px;
            border: 1px solid #3c763d;*/
            color: #3c763d;
            background: #dff0d8;
            border-radius: 5px;
            text-align: center;
        }
        </style>
    </head>
    <body>
        <%@include file="console.html" %>
        <div>
            <div class="error">${error}</div>
            <div class="success">${success}</div>
        </div>
        <div class="staffmaintainance tabcontent" id="profile">
            <div class="header">
                <h2>Overview of Your Profile</h2>
            </div>
            <form class="form-detail">
                <div class="form-left">
                    <div class="registergrp">
                        <label for="staff_ID">Your ID :</label> ${profile.staffID}<br>
                    </div>
                    <div class="registergrp">
                        <label for="first_name">First Name :</label> ${profile.firstName}<br>
                    </div>
                    <div class="registergrp">
                        <label for="last_name">Last Name :</label> ${profile.lastName}<br>
                    </div>
                    <div class="registergrp">
                        <label for="age">Age :</label> ${profile.age}<br>
                    </div>
                    <div class="registergrp">
                        <label for="email">Email :</label> ${profile.email}<br>
                    </div>
                    <div class="registergrp">
                        <label for="gender">Gender :</label> ${profile.gender}<br>
                    </div>
                    <div class="registergrp">
                        <label for="address">Address :</label> ${profile.address}<br>
                    </div>
                    <div class="registergrp">
                        <label for="phone_no">Phone Number :</label> ${profile.phoneNo}<br>
                    </div>
                    <div class="registergrp">
                        <label for="position">Position :</label> ${profile.position}<br>
                    </div>
                    <div class="registergrp">
                        <label for="product">Product Handled :</label><br>
                        <% for(int i=0; i < handle.size(); i++){
                            Shoes shoes = handle.get(i); 
                        %>
                            &nbsp;<li> <%= shoes.getProdName() %> [ <%= shoes.getSize() %> ]</li> 
                        <% } %>
                                    
                    </div>
                </div>
            </form>
        </div>
        <div class="staffmaintainance tabcontent" id="setpassword">
            
            <div class="header">
                <h2>Set Password</h2>
            </div>
            <form class="form-detail" action="StaffControl" method="GET" enctype="multipart/form-data">                       
                <div class="form-left">
                    <div class="registergrp">
                        <label for="password">Current Password :</label>
                        <input type="password" name="password" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="password">New Password :</label>
                        <input type="password" name="newPWD" required /><br>
                    </div>
                    <div class="registergrp">
                        <label for="password">Confirm Password :</label>
                        <input type="password" name="confirmPWD" required /><br>
                    </div>
                    <div class="registergrp" style="margin-bottom: 40px">
                        <input type="hidden" name="staffID" value="${profile.staffID}" />
                        <input type="hidden" name="fname" value="${profile.firstName}" />
                        <input type="hidden" name="lname" value="${profile.lastName}" />
                        <input type="hidden" name="age" value="${profile.age}" />
                        <input type="hidden" name="email" value="${profile.email}" />
                        <input type="hidden" name="staffGender" value="${profile.gender}" />
                        <input type="hidden" name="address" value="${profile.address}" />
                        <input type="hidden" name="phNum" value="${profile.phoneNo}" />
                        <input type="hidden" name="position" value="${profile.position}" />
                        <input type="hidden" name="option" value="6" />
                        <button type="submit" class="btn" name="updatepswd">Save</button>
                        <!--<button type="submit" class="btn" name="updateprod">Reset</button>-->
                    </div>
                </div>
            </form>
        </div>
        <div class="tab" style=" text-align: center; margin-bottom: 30px">
            <button class="tablinks" onclick="openProfile(event, 'profile')" id="defaultOpen">Profile</button>
            <button class="tablinks" onclick="openProfile(event, 'setpassword')">Set Password</button>
        </div>
    </body>
    <script>
        function openProfile(evt, staff) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(staff).style.display = "block";
          evt.currentTarget.className += " active";
        }
        document.getElementById("defaultOpen").click();
    </script>
</html>
