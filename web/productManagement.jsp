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
    ArrayList<Shoes> shoes = (ArrayList<Shoes>) request.getAttribute("shoes");
    ArrayList<Color> colors = (ArrayList<Color>) request.getAttribute("colors");
    ArrayList<Staff> staffs = (ArrayList<Staff>) request.getAttribute("staffs");
    ArrayList<Color> colorsType = (ArrayList<Color>) request.getAttribute("colorsType");

    String staffEmail = (String) session.getAttribute("activeStaff");
    response.setHeader("cache-Control", "no-cache,no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (staffEmail == null) {
        response.sendRedirect("/hoot9gui/staff_login.jsp");
    }

    String msg = "";
    if ((String) session.getAttribute("addShoes_status") != null) {
        msg = (String) session.getAttribute("addShoes_status");
        session.removeAttribute("addShoes_status");
    } else if ((String) session.getAttribute("deleteShoes_status") != null) {
        msg = (String) session.getAttribute("deleteShoes_status");
        session.removeAttribute("deleteShoes_status");
    } else if ((String) session.getAttribute("getShoesDetails_status") != null) {
        msg = (String) session.getAttribute("getShoesDetails_status");
        session.removeAttribute("getShoesDetails_status");
    } else if ((String) session.getAttribute("editShoes_status") != null) {
        msg = (String) session.getAttribute("editShoes_status");
        session.removeAttribute("editShoes_status");
    } else if ((String) session.getAttribute("restock_status") != null) {
        msg = (String) session.getAttribute("restock_status");
        session.removeAttribute("restock_status");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Management Page</title>
        <link rel="stylesheet" href="./css/backendHeader.css">
        <script src="./js/backendHeader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        input[type=text],input[type=number], select {
            border:1px solid black;
        }
        input[type=text],input[type=number], input[type=file], select{
            border-radius: 0.15rem;
            float: right;
            width: 210px;
            background-color: unset;
            padding: 0.5px 1px;
        }
        .modal-body select {
            height: 30px;
        }
        .createColorLink {
            position: absolute;
            transform: translateY(-15px);
            font-size: 13px;
        }
        .modal-footer {
            margin-top: 15px;
            width: 496px;
            transform: translateX(-70px);
            padding-right: 65px;
        }
    </style>
    <script>
        function modal_toggle(component, action) {
            if (action === "show") {
                $("#" + component).css("display", "block");
                $("#" + component).css("backgroundColor", "rgba(0,0,0,0.6");
                $("#" + component).css("opacity", "1");
            }
            if (action === "close") {
                $("#" + component).css("display", "none");
                $("#" + component).css("opacity", "0");
            }
        }
        function search(e) {
            var i = 0;
            var rowID = new Array();
            var hittedRowID = new Array();
            var search = e.target.value;
            search = search.replaceAll(" ", "_");
            //search = search.toUpperCase();

            $("#recordTable tr").each(function () {
                var id = (this.id).split("-");
                rowID[i] = id;
                i++;
            });

            if (search.length > 0) {
                for (i = 0; i < rowID.length; i++) {
                    var x = rowID[i];
                    var exist;
                    for (var l = 0; l < x.length; l++) {
                        var y = x[l];
                        for (var j = 0; j < search.length; j++) {
                            var z = y[j];
                            if (z === search[j]) {
                                exist = 1;
                            } else {
                                exist = 0;
                                break;
                            }
                        }
                        if (exist === 1) {
                            break;
                        }
                    }

                    // check if the hittedRow is already listed or not
                    for (var l = 0; l < hittedRowID.length; l++) {
                        if (rowID[i] === hittedRowID[l]) {
                            exist = 0;
                            break;
                        }
                    }
                    // if the hittedRow is not listed yet, then will pust to the listed array
                    if (exist === 1) {
                        hittedRowID.push(rowID[i]);
                    }
                }
            } else {
                hittedRowID = rowID;
            }

            //check the hittedRowID to be displayed
            if (hittedRowID.length > 0) {
                for (i = 0; i < rowID.length; i++) {
                    var row = rowID[i].join("-");
                    for (var l = 0; l < hittedRowID.length; l++) {
                        var hittedID = hittedRowID[l].join("-");
                        if (hittedID === row) {
                            $("#" + row).css("display", "table-row");
                            break;
                        } else {
                            $("#" + row).css("display", "none");
                        }
                    }
                }
            }
            //console.log(hittedRowID);
        }
    </script>
    <body>
        <jsp:include page="/components/backendHeader.jsp" />
        <h3 class="title">Products Management</h3>
        <% if (msg != "") {%>
        <script>
            alert("<%=msg%>");
            <% msg = "";%>
        </script>
        <% } %>
        <div class="product-control-panel">
            <button type="button" class="mr-2 btn btn-primary" onClick="modal_toggle('addShoes_modal', 'show')"><i class="fas fa-plus"></i> Product</button>
            <form class="form-inline my-2 my-lg-0">
                <input onKeyUp="search(event)" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
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
                    <tbody id="recordTable">
                        <%
                            int i = 0;
                            for (Shoes s : shoes) {
                                String name, brand, season;
                                name = s.getProdName();
                                brand = s.getBrand();
                                season = s.getSeason();
                                name = name.replaceAll(" ", "_");
                                brand = brand.replaceAll(" ", "_");
                                season = season.replaceAll(" ", "_");
                        %>
                        <tr id="<%= s.getProdID()%>-<%= name%>-<%= brand%>-<%= season%>">
                            <td><%= s.getProdID()%></td>
                            <td><%= s.getProdName()%></td>
                            <td><%= s.getSeason()%></td>
                            <td><%= s.getBrand()%></td>
                            <td><%= colors.get(i).getColorName()%></td>
                            <td><%= s.getSize()%></td>
                            <td><%= s.getStock()%></td>
                            <td><%= s.getPrice()%></td>
                            <td><%= staffs.get(i).getEmail()%></td>
                            <td>
                                <a href="productManagement?action=shoesDetails&id=<%= s.getProdID()%>&destination=restockProduct.jsp" type="button" class="btn btn-secondary">Restock</a>
                                <a href="productManagement?action=shoesDetails&id=<%= s.getProdID()%>&destination=editProduct.jsp" type="button" class="btn btn-primary">Edit</a>
                                <a href="productManagement?action=deleteShoes&id=<%= s.getProdID()%>" type="button" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <% i++;
                            } %>
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
                        <button onClick="modal_toggle('addShoes_modal', 'close')" type="button" class="close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="productManagement" method="POST" enctype="multipart/form-data">
                            <label>Product Name : </label>
                            <input name="product_name" type="text"  placeholder="Product Name"/>
                            </br>
                            <label>Brand : </label>
                            <input name="brand" type="text"  placeholder="Brand"/>
                            </br>
                            <label>Season : </label>
                            <select name="season">
                                <option value="Spring">Spring</option>
                                <option value="Summer">Summer</option>
                                <option value="Fall">Fall</option>
                                <option value="Winter">Winter</option>
                                <option value="All Seasons" selected>All Seasons</option>
                            </select>
                            </br>
                            <label>Size : </label>
                            <input name="size" type="text" pattern="UK([0-9]{1,}|[0-9]{1,}.[0-9]{1})" placeholder="UK<size>"/>
                            </br>
                            <label>Price / unit : </label>
                            <input name="price" type="number" min="1" placeholder="Price (799.0)"/>
                            </br>
                            <label>Stocks Amount : </label>
                            <input name="stock" type="number" min="0" step="100" placeholder="Stock (min 0 + n(100))"/>
                            </br>
                            <label>Color : </label>
                            <select name="color">
                                <%
                                    for (Color c : colorsType) {
                                %>
                                <option style="background-color:<%= c.getColorCode()%>" value="<%= c.getColorCode()%>"><%= c.getColorName()%></option>
                                <% }%>
                            </select>
                            </br><a href="/hoot9gui/createColor.jsp" class="createColorLink">+ New Color</a>
                            <label>Image : </label>
                            <input name="img" type="file" />
                            </br>
                            <input name="staff" type="hidden" value="<%= staffEmail%>"/>
                            <input name="action" type="hidden" value="addShoes"/>
                            <div class="modal-footer">
                                <button onClick="modal_toggle('addShoes_modal', 'close')" class="btn btn-secondary">Cancel</button>
                                <input type="submit" class="btn btn-primary" value="submit"></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>