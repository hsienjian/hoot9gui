<%--<jsp:useBean id="staff" scope="session" class="domain.Staff"/>--%>
<%@page import="domain.Shoes"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList <Shoes> handle = (ArrayList<Shoes>) request.getAttribute("duty");  %>
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
        <link href="css/maintainStaff.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Profile</title>
        <style>
        .error{
            width: 100%;
            margin: 0px auto 20px;
            color: #a94442;
            background: #f2dede;
            border-radius: 5px;
            text-align: center;
        }

        .success{
            width: 100%;
            margin: 0px auto 20px;
            color: #3c763d;
            background: #dff0d8;
            border-radius: 5px;
            text-align: center;
        }
        </style>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <div class="error">${error}</div>
        <div class="success">${success}</div>
        
        <div class="staffmaintainance tabcontent" id="profile">
            
            <div id="headerForm">
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
            <div id="headerForm">
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
                    <div class="registergrp">
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
                        <button type="submit" class="btn" name="updatepswd">Save Password</button>
                        <!--<button type="submit" class="btn" name="updateprod">Reset</button>-->
                    </div>
                </div>
            </form>
        </div>
        <div class="tab" style=" text-align: center; margin-bottom: 30px">
            <button class="tablinks" onclick="openProfile(event, 'profile')" id="defaultOpen">Profile</button>
            <button class="tablinks" onclick="openProfile(event, 'setpassword')">Set Password</button>
        </div>

        <%@include  file="components/clientFooter.jsp"%>
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
