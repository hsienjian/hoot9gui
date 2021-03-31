<%-- 
    Document   : productManagement
    Created on : Mar 23, 2021, 11:20:00 PM
    Author     : j.chong
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="domain.Staff"%>
<%@page import="domain.Color"%>
<%@page import="domain.Shoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Shoes> shoes = (ArrayList<Shoes>)request.getAttribute("shoes");
    ArrayList<Color> colors = (ArrayList<Color>)request.getAttribute("colors");
    ArrayList<Staff> staffs = (ArrayList<Staff>)request.getAttribute("staffs");
    
    String staff = (String)session.getAttribute("activeStaff");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management Page</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
        <style>
            .product-control-panel {
                display: flex;
                float: right;
                transform: translateY(-25px);
                margin-right: 25px;
            }
            .product-table {
                min-width: 100%;
                padding: 0px !important;
                margin: 0px !important;
                transform: translateY(-8px);
            }
            .modal-body {
                margin: 0px 55px;
            }
            .modal-body input {
                float: right;
            }
            input[type=color] {
                width: 175px;
                background-color: unset;
                padding: 0.5px 1px;
            }
        </style>
        <script>
            function modal_toggle(component, action){
                if (action === "show"){
                    $("#"+component).css("display", "block");
                    $("#"+component).css("backgroundColor", "rgba(0,0,0,0.6");
                    $("#"+component).css("opacity", "1");
                }
                if (action === "close"){
                    $("#"+component).css("display", "none");
                    $("#"+component).css("opacity", "0");
                }
            }
        </script>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <h3 class="title">Products Management</h3>
        
        <div class="product-control-panel">
            <button type="button" class="mr-2 btn btn-primary" onClick="modal_toggle('addShoes_modal','show')"><i class="fas fa-plus"></i> Product</button>
            <form class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        <div class="product-table px-0 mx-0 mb-3 overflow-auto">
            <div class="table-responsive">
                <table class="table table-striped table-hover ">
                    <thead class="table-success">
                        <tr>
                            <th scope="col" class="align-middle">Product ID</th>
                            <th scope="col" class="align-middle">Product Name</th>
                            <th scope="col" class="align-middle">Season</th>
                            <th scope="col" class="align-middle">Brand Name</th>
                            <th scope="col" class="align-middle">Color</th>
                            <th scope="col" class="align-middle">Size</th>
                            <th scope="col" class="align-middle">Stocks</th>
                            <th scope="col" class="align-middle">Price</th>
                            <th scope="col" class="align-middle">Insert By</th>
                            <th scope="col" class="align-middle">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i= 0;
                            for (Shoes s : shoes) {
                        %>
                            <tr>
                                <td><%= s.getProdID() %></td>
                                <td><%= s.getProdName() %></td>
                                <td><%= s.getSeason() %></td>
                                <td><%= s.getBrand() %></td>
                                <td><%= colors.get(i).getColorName() %></td>
                                <td><%= s.getSize() %></td>
                                <td><%= s.getStock() %></td>
                                <td><%= s.getPrice() %></td>
                                <td><%= staffs.get(i).getEmail() %></td>
                                <td>
                                    <a href="productManagement?action=shoesDetails&id=<%= s.getProdID()%>&destination=restockProduct.jsp" type="button" class="btn btn-secondary">Restock</a> 
                                    <a href="productManagement?action=shoesDetails&id=<%= s.getProdID()%>&destination=editProduct.jsp" type="button" class="btn btn-primary">Edit</a> 
                                    <a href="productManagement?action=deleteShoes&id=<%= s.getProdID()%>" type="button" class="btn btn-danger">Delete</a> 
                                </td>
                            </tr>
                        <% i++;} %>
                    </tbody>
                </table>
            </div>   
        </div>
                    
        <!-- Add Shoes Modal -->
        <div class="modal fade" id="addShoes_modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Insert New Shoes</h5>
                        <button onClick="modal_toggle('addShoes_modal','close')" type="button" class="close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="productManagement" method="GET">
                            <label>Product Name : </label>
                            <input name="product_name" type="text" />
                            </br>
                            <label>Brand : </label>
                            <input name="brand" type="text" />
                            </br>
                            <label>Season : </label>
                            <input name="season" type="text" />
                            </br>
                            <label>Size : </label>
                            <input name="size" type="float" min="5" step="0.5"/>
                            </br>
                            <label>Price / unit : </label>
                            <input name="price" type="float" min="1"/>
                            </br>
                            <label>Stocks Amount : </label>
                            <input name="stock" type="float" min="1" step="100"/>
                            </br>
                            <label>Color : </label>
                            <input name="color" type="color" value="#ff0000"/>
                            </br>
                            <label>Image : </label>
                            <input name="img" type="password" />
                            </br>
                            <input name="staff" type="hidden" value=<%= staff %>/>
                            <input name="action" type="hidden" value="addShoes"/>
                            <div class="modal-footer">
                                <button onClick="modal_toggle('addShoes_modal','close')" class="btn btn-secondary">Cancel</button>
                                <input type="submit" class="btn btn-primary" value="submit"></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>