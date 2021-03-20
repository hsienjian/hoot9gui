<%-- 
    Document   : backendHeader
    Created on : Mar 17, 2021, 11:37:16 AM
    Author     : j.chong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff Console Header</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
        <script>
            function showMenu() {
                document.getElementById("menuNav").style.transform = "translateX(0px)";
                document.getElementById("menuBtn").style.opacity = "0";
            }
            function hideMenu() {
                document.getElementById("menuNav").style.transform = "translateX(-270px)";
                document.getElementById("menuBtn").style.opacity = "1";
            }
            function handleCollapse(element, icon) {
                console.log(event.target.getAttribute('id'));
                if (event.target.getAttribute('name') === element || event.target.getAttribute('id') === icon){
                    if ($("#" + element).css("maxHeight") === "0px") {
                        var height = document.getElementById(element).scrollHeight;
                        document.getElementById(element).style.maxHeight = height + "px";
                        document.getElementById(element).style.overflow = "auto";
                        document.getElementById(icon).style.transform = "rotate(180deg)";
                    }else {
                        document.getElementById(element).style.maxHeight = "0px";
                        document.getElementById(icon).style.transform = "rotate(0deg)";
                    }
                }
            }
        </script>
        <style>
            body {
                margin: 0px;
                background-color: whitesmoke;
            }
            .btn{
                cursor: pointer;
                outline: unset;
                border: unset;
                background-color: unset;
            }
            .menu-btn {
                position: absolute;
                font-size: 24px;
                transform: translate(20px, 15px);
            }
            .close-btn {
                font-size: 28px;
                transform: translate(48px, -40px);
            }
            .copyright {
                width: 2max-content;
                position: fixed;
                padding: 20px 15px;
                font-size: 12px;
                bottom: 0px;
            }
            .staff-nav {
                transform: translateX(-270px);
                transition: 0.4s;
                width: 270px;
                min-height: 100vh;
                height: max-content;
                background-color: rgb(224,255,255, 0.8);
            }
            .staff-nav>ul {
                list-style: none;
                margin: 0px 20px;
                padding: 25px 0px;
            }
            .staff-nav>ul>li {
                height: max-content;
                padding: 0px 10px;
                margin-bottom: 35px;
                cursor: pointer;
            }
            .staff-nav>ul i {
                float: right;
            }
            .collapse-ul{
                transition: 0.3s;
                max-height: 0px;
                overflow: hidden;
                padding-left: 35px;
            }
            .collapse-ul li{
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <button class="btn menu-btn" id="menuBtn" onclick="showMenu()"><i class="fa fa-bars" aria-hidden="true"></i></button>
        <div class="staff-nav" id="menuNav">
            <img src="../images/hoot9elogo-01.png" alt="logo" style="transform:translate(35px, 15px);"/>
            <button class="btn close-btn" id="closeBtn" onclick="hideMenu()"><i class="fa fa-times" aria-hidden="true"></i></button>
            <ul>
                <li>Dashboard</li>
                <li>Profile</li>
                <li name="collapse-ul-1" onClick="handleCollapse('collapse-ul-1', 'fa-angle-down-1')">Staff Management<i id="fa-angle-down-1" class="fa fa-angle-down" aria-hidden="true"></i>
                    <ul class="collapse-ul" id="collapse-ul-1">
                        <a href='#'><li>Register New Staff</li></a>
                        <a href='#'><li>View Staff Info</li></a>
                    </ul>
                </li>
                <li name="collapse-ul-2" onClick="handleCollapse('collapse-ul-2', 'fa-angle-down-2')">Product Management<i id="fa-angle-down-2" class="fa fa-angle-down" aria-hidden="true"></i>
                    <ul class="collapse-ul" id="collapse-ul-2">
                        <a href='#'><li>Register New Product</li></a>
                        <a href='#'><li>Restock Product</li></a>
                        <a href='#'><li>Edit Product Details</li></a>
                    </ul>
                </li>
                <li name="collapse-ul-3" onclick="handleCollapse('collapse-ul-3', 'fa-angle-down-3')">Report<i id="fa-angle-down-3" class="fa fa-angle-down" aria-hidden="true"></i>
                    <ul class="collapse-ul" id="collapse-ul-3">
                        <a href='#'><li>Generate New Report</li></a>
                        <a href='#'><li>Generate Sales Report</li></a>
                        <a href='#'><li>Generate Customer Report</li></a>
                    </ul>
                </li>
            </ul>
            <footer class="copyright">
                <i class="fa fa-copyright" aria-hidden="true"></i>
                Website is Copyright-proctected by Hoot9e
                <i class="fa fa-copyright" aria-hidden="true"></i>
            </footer>
        </div>
    </body>
</html>
