<%@page import="java.util.ArrayList"%>
<%@page import="domain.Shoes"%>
<%@page import="da.ShoesDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <script>
            function selectChange(val) {
                //Set the value of action in action attribute of form element.
                //Submit the form
                $('#priceID').submit();
            }   
        </script>
    </head>
    <body>
  
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar" style="overflow-y:auto; position: fixed;">
                            <div class="sidebar__item">
                                <h4>Department</h4> <!--Retrieve Brand and Season-->
                                <ul>    
                                    <%  
                                        ShoesDA shoes = new ShoesDA();
                                        ArrayList<Shoes> listBrand = shoes.listAllShoes();

                                        for(int i=0 ; i<listBrand.size(); i++)
                                        {
                                            
                                    %>
                                    <li><a href="#"><%= listBrand.get(i).getBrand()%></a></li>
                                    <% } %>
                                </ul>
                            </div>
<!--                            <div class="sidebar__item sidebar__item__color--option">
                                <h4>Colors</h4>
                                <div class="sidebar__item__color sidebar__item__color--white">
                                    <label for="white">
                                        White
                                        <input type="radio" id="white">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--gray">
                                    <label for="gray">
                                        Gray
                                        <input type="radio" id="gray">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--red">
                                    <label for="red">
                                        Red
                                        <input type="radio" id="red">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--black">
                                    <label for="black">
                                        Black
                                        <input type="radio" id="black">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--blue">
                                    <label for="blue">
                                        Blue
                                        <input type="radio" id="blue">
                                    </label>
                                </div>
                                <div class="sidebar__item__color sidebar__item__color--green">
                                    <label for="green">
                                        Green
                                        <input type="radio" id="green">
                                    </label>
                                </div>
                            </div>-->
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-7">
                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                        <span>Sort By</span>
                                        <form id="priceID" method="POST" action="ShoesControl">
                                            <select onChange="selectChange(this.value)">
                                                <option value="0">Price</option>
                                                <option value="400">High to Low</option>
                                                <option value="300">Low to High</option>
                                                <option value="200">Above RM 200</option>
                                                <option value="100">Below RM 200</option>
                                            </select> 
                                        </form>
                                    </div>
                                </div>
                                <div class="hero__search">
                                    <div class="hero__search__form">
                                        <form action="#">
                                            <input type="text" placeholder="What do yo u need?">
                                            <button type="submit" class="site-btn">SEARCH</button>
                                        </form>
                                    </div>
                                </div>                
                            </div>
                        </div>
                        <div class="row">  
    <%  
        
        ArrayList<Shoes> listRecord = shoes.listAllShoes();
        
        for(int i=0; i<listRecord.size(); i++)
        {
            
    %>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" >
                                        <img src="<%= listRecord.get(i).getImg()%>" alt="" style="height: 100%">
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h7><%= listRecord.get(i).getBrand()%></h7>
                                        <h7><%= listRecord.get(i).getSize()%></h7>
                                        <form action="ShoesControl" method="POST">
                                            <input type="hidden" id="prod_name" name="prod_name" value="<%= listRecord.get(i).getProdName()%>"/>
                                            <input type="hidden" id="color_id" name="color_id" value="<%= listRecord.get(i).getColorID()%>"/>
                                            <input type="submit" value="<%= listRecord.get(i).getProdName()%>" name="submit" />
                                        </form>
                                        <h5><%= listRecord.get(i).getPrice()%></h5>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </section>   
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
</html>
