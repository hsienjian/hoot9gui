<%@page import="domain.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Shoes"%>
<%@page import="da.ShoesDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList <Shoes> listRecord = (ArrayList<Shoes>) request.getAttribute("allshoes");  %>
<% ArrayList <Shoes> brand = (ArrayList<Shoes>) request.getAttribute("brand");  %>
<% ArrayList <Color> color = (ArrayList<Color>) request.getAttribute("color");  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product Page</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css"  type="text/css"/>
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/styleProduct.css" type="text/css">
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
        <script>
        function selectChange(val) {
            $('#priceID').submit();
        }
        </script>
        <style>
        .error{
            width: 100%;
            margin: 0px auto 20px;
            color: #a94442;
            background: #f2dede;
            border-radius: 5px;
            text-align: center;
        }
        </style>
    </head>
    <body>
        <jsp:include page="/components/clientHeader.jsp" />

        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar" style="position: relative">
                            <div class="sidebar__item">
                                <h4>Brand</h4>
                                <ul>    
                                    <%
                                        for (int b=0; b<brand.size(); b++) {
                                            Shoes brandlist = brand.get(b);
                                    %>
                                    <li><a href="ShoesControl?option=2&department=<%= brandlist.getBrand()%>"><%= brandlist.getBrand()%></a></li>
                                    <% } %>
                                </ul>
                            </div>
                            <div class="sidebar__item">
                                <h4>Color</h4>
                                <ul>    
                                    <%
                                        for (int c=0; c<color.size(); c++) {
                                            Color colorlist = color.get(c);
                                    %>
                                    <li><a href="ShoesControl?option=5&department=<%= colorlist.getColorID() %>"><%= colorlist.getColorName()%></a></li>
                                    <% } %>
                                </ul>
                            </div>                                                                    
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-7">
                                        <div class="error">${error}</div>

                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                        <span>Sort By</span>
                                        <form id="priceID" method="GET" action="ShoesControl" style="display: inline">
                                            <input type="hidden" name="option" value="3"/>
                                            <select name="sortPrice" onChange="selectChange(this.value)">
                                                <option value="0">Price</option>                                                
                                                <option value="Abv450">Above RM 450</option>
                                                <option value="Blw450">Below RM 450</option>
                                                <!--<option value="HighToLow">High to Low</option>-->
                                                <!--<option value="LowToHigh">Low to High</option>-->
                                            </select>
                                        </form>
                                    </div>
                                </div>
                                <div class="hero__search">
                                    <div class="hero__search__form">
                                        <form method="GET" action="ShoesControl">
                                            <input type="text" name="wanted" placeholder="Search Shoes Name"/>
                                            <input type="hidden" name="option" value="4"/>
                                            <button type="submit" class="site-btn">SEARCH</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">  
                            <%
                                for (int i = 0; i < listRecord.size(); i++) {
                                    Shoes allproduct = listRecord.get(i);
                            %>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" >
                                        <img src="<%= allproduct.getImg()%>" alt="" style="height: 100%">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h7><%= allproduct.getBrand()%></h7>
                                        <form action="ShoesControl" method="GET">
                                            <input type="hidden" id="option" name="option" value="1"/>
                                            <input type="hidden" id="prod_name" name="prod_name" value="<%= allproduct.getProdName()%>"/>
                                            <button style="background-color: LightSlateGrey; color:white" class="btn default" type="submit" name="submit"><%= allproduct.getProdName()%></button>
                                        </form>
                                        <h5>RM <%= allproduct.getPrice()%></h5>
                                    </div>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include  file="components/clientFooter.jsp"%>
    </body>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
</html>
