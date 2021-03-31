<%-- 
    Document   : restockProduct
    Created on : Mar 31, 2021, 2:51:41 PM
    Author     : j.chong
--%>

<%@page import="domain.Staff"%>
<%@page import="domain.Color"%>
<%@page import="domain.Shoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Shoes selected_shoes =(Shoes)request.getAttribute("selected_shoes");
    Color selected_color =(Color)request.getAttribute("selected_color");
    Staff selected_staff =(Staff)request.getAttribute("selected_staff");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restock Product</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            .stock_details_container {
                width: 450px;
                margin: 110px auto;
                border: 1px solid black;
                border-radius: 25px;
            }
            .stock_details_header>h4{
                background-color: #7386D5;
                padding: 10px 15px;
                border-radius: 25px 25px 0px 0px;
            }
            .stock_details_header table{
                width: 420px;
                margin: 0px 15px;
            }
            .stock_details_header table tr td:nth-child(2){
                transform: translateX(15px);
            }
            .stock_details_form {
                padding: 0px 15px;
            }
            .stock_details_form input {
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
        <h3 class="title">Restock Product</h3>
        
        <!-- Restock Product -->
        <div class="stock_details_container">
            <div class="stock_details_header">
                <h4>Product Details</h4>
                <table>
                    <tr>
                        <td><b>Product ID : </b><%=selected_shoes.getProdID()%></td>
                        <td><b>Product Name : </b><%=selected_shoes.getProdName()%></td>
                    </tr>
                    <tr>
                        <td><b>Brand : </b><%=selected_shoes.getBrand()%></td>
                        <td><b>Season : </b><%=selected_shoes.getSeason()%></td>
                    </tr>
                    <tr>
                        <td><b>Size : </b><%=selected_shoes.getSize()%></td>
                        <td><b>Color : </b><%=selected_color.getColorName()%></td>
                    </tr>
                </table>
            </div>
                    <hr>
            <div class="stock_details_form">
                <form action="productManagement" method="GET">
                    <label>Remaining Stock : </label>
                    <input name="current_stock" type="number" value="<%=selected_shoes.getStock()%>" disabled="true"/>
                    </br>
                    <label>Restock Amount : </label>
                    <input name="restock_amount" type="number" min="1" step="100"/>
                    </br>
                    <input name="product_id" type="hidden" value="<%=selected_shoes.getProdID()%>"/>
                    <input name="action" type="hidden" value="restock"/>
                    <div class="modal-footer">
                        <a type="button" href="/build/productManagement?action=retrieveAll" class="btn btn-secondary">Cancel</a>
                        <input type="submit" class="btn btn-primary" value="submit"></input>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
