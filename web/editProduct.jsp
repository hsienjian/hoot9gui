<%-- 
    Document   : editProduct
    Created on : Mar 31, 2021, 2:34:13 PM
    Author     : j.chong
--%>

<%@page import="domain.Staff"%>
<%@page import="domain.Shoes"%>
<%@page import="domain.Color"%>
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
        <title>Edit Product</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            .product_details_container {
                width: 480px;
                margin: 40px auto;
                border: 1px solid black;
                border-radius: 25px;
            }
            .product_details_header > h4 {
                background-color: #7386D5;
                padding: 10px 15px;
                border-radius: 25px 25px 0px 0px;
            }
            .product_details_header table{
                width: 450px;
                margin: 0px 15px;
            }
            .product_details_header table tr td:nth-child(2){
                transform: translateX(15px);
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
        <h3 class="title">Edit Product Details</h3>
        
        <!-- Edit Shoes Details -->
        <div class="product_details_container">
            <div class="product_details_header">
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
                    <hr/>
            <div class="product_details_form">
                <form action="productManagement" method="GET">
                    <label>Product Name : </label>
                    <input name="product_name" type="text" value="<%=selected_shoes.getProdName()%>"/>
                    </br>
                    <label>Brand : </label>
                    <input name="brand" type="text"  value="<%=selected_shoes.getBrand()%>"/>
                    </br>
                    <label>Season : </label>
                    <input name="season" type="text"  value="<%=selected_shoes.getSeason()%>"/>
                    </br>
                    <label>Size : </label>
                    <input name="size" type="float" min="5" step="0.5" value="<%=selected_shoes.getSize()%>"/>
                    </br>
                    <label>Price / unit : </label>
                    <input name="price" type="float" min="1" value="<%=selected_shoes.getPrice()%>"/>
                    </br>
                    <label>Stocks Amount : </label>
                    <input name="stock" type="float" min="1" step="100" value="<%=selected_shoes.getStock()%>" disabled="true"/>
                    </br>
                    <label>Color : </label>
                    <input name="color" type="color" value=" value="<%=selected_color.getColorCode()%>"/>
                    </br>
                    <label>Image : </label>
                    <input name="img" type="password" />
                    </br>
                    <input name="product_id" type="hidden" value="<%=selected_shoes.getProdID()%>"/>
                    <input name="action" type="hidden" value="updateShoes"/>
                    <div class="modal-footer">
                        <a type="button" href="/build/productManagement?action=retrieveAll" class="btn btn-secondary">Cancel</a>
                        <input type="submit" class="btn btn-primary" value="Save Changes"></input>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
