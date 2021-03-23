<%-- 
    Document   : backendHeader
    Created on : Mar 17, 2021, 11:37:16 AM
    Author     : j.chong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/backendHeader.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
        <script src="../js/backendHeader.js"></script>
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
