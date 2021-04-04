<%--
    Document   : createColor
    Created on : Apr 3, 2021, 10:11:05 PM
    Author     : j.chong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Shoes selected_shoes = (Shoes) request.getAttribute("selected_shoes");
    //Color selected_color = (Color) request.getAttribute("selected_color");
    //Staff selected_staff = (Staff) request.getAttribute("selected_staff");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            .product_details_container {
                width: 480px;
                margin: 120px auto;
                border: 1px solid black;
                border-radius: 25px;
            }
            .product_details_header > h4 {
                background-color: #7386D5;
                padding: 10px 15px;
                border-radius: 25px 25px 0px 0px;
            }
            .product_details_form {
                width: 450px;
                margin: 0px 15px;
            }
            .product_details_form input {
                float:right;
            }
            .modal-footer {
                border: unset;
                padding: .75rem 0px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <h3 class="title">Create New Color</h3>

        <!-- Edit Shoes Details -->
        <div class="product_details_container">
            <div class="product_details_header">
                <h4>Color Details</h4>
            </div>
            <hr/>
            <div class="product_details_form">
                <form action="productManagement" method="GET">
                    <label>Color Name : </label>
                    <input name="name" type="text" />
                    </br>
                    <label>Color Code : </label>
                    <input name="code" type="text" placeholder="rgb(0,0,0)" pattern="^rgb?\(?([01]?\d\d?|2[0-4]\d|25[0-5]),([01]?\d\d?|2[0-4]\d|25[0-5]),(([01]?\d\d?|2[0-4]\d|25[0-5])\)?)$"/>
                    </br>
                    <input name="action" type="hidden" value="createColor"/>
                    <div class="modal-footer">
                        <a type="button" href="/hoot9gui/productManagement?action=retrieveAll" class="btn btn-secondary">Cancel</a>
                        <input type="submit" class="btn btn-primary" value="Create"></input>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
