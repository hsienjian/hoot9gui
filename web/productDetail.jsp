<%@page import="domain.Shoes"%>
<%@page import="domain.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="da.ShoesDA"%>
<%@page import="da.ColorDA"%>
<% ArrayList <Color> colorChoice = (ArrayList<Color>) request.getAttribute("color");  %>
<% ArrayList <Shoes> shoesDetails = (ArrayList<Shoes>) request.getAttribute("shoes");  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoe Details</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/styleProduct.css" type="text/css">
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
    </head>
    
    <body>
        <jsp:include page="/components/clientHeader.jsp" />
        <section class="product-details spad">
            <div class="container">
                <div class="row"  >
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large" src="<%= shoesDetails.get(0).getImg()%>" alt="">
                            </div>
                            <div class="product__details__pic__slider owl-carousel">
                                <% for(int i=0; i < shoesDetails.size(); i++){
                                        Shoes images = shoesDetails.get(i); 
                                    %> 
                                <img data-imgbigurl="<%= images.getImg()%>"
                                    src="<%= images.getImg()%>" alt="">
                                <% } %> 
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <div style="padding-bottom: 10px;">
                                <h3  style="margin-top: 30px"><%= shoesDetails.get(0).getProdName()%></h3>
                                <h3><%= shoesDetails.get(0).getBrand()%></h3>
                                <h5>RM <%= shoesDetails.get(0).getPrice()%></h5>
                            </div> 
                            
                           
                            <div class="product__details__quantity" style="margin-bottom: 10px">
                                <h4 style="margin-bottom: 10px">Shoe sizes & colors</h4>
                                <form action="" style="display: flex">
                                    <select id="available" name="orderStatus">                      
                                    <% for(int i=0; i < shoesDetails.size(); i++){
                                        Shoes sizes = shoesDetails.get(i); 
                                    %> 
                                            <option value='<%= sizes.getSize() %>'><%= sizes.getSize() %></option>
                                         &nbsp;                             
                                     <% } %>
                                    </select> &nbsp;&nbsp;&nbsp; 
                                    <select id="available" name="orderColor">                      
                                    <% for(int i=0; i < colorChoice.size(); i++){
                                        Color colors = colorChoice.get(i); 
                                    %> 
                                            <option value='<%= colors.getColorName() %>'><%= colors.getColorName() %></option>
                                         &nbsp;                             
                                     <% } %>
                                    </select>
                                </form>
                            </div>         
                            <li style="margin-bottom: 10px"><b>Shipping</b>&nbsp;&nbsp;&nbsp;<span>07 days shipping. &nbsp;&nbsp;&nbsp; <samp>Free pickup today</samp></span></li>
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                            <a href="#" class="primary-btn">ADD TO CARD</a>
                            <a href="#" class="heart-icon primary-btn" style="background-color: red;"><span style="color: white" class="fa fa-heart-o"></span></a>
                        </div> 
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                        aria-selected="true">Read Me</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                        aria-selected="false">Size Guide</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                        aria-selected="false">Track Order</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Additional Infomation</h6>
                                        <p>Returns are accepted if returned within 30 days of receipt except for Yeezy or launch products. 
                                           Only items that are unworn, unaltered, unwashed, and in sellable condition can be returned. 
                                           For Yeezy products, Customer will need to refer to Product Terms and Conditions.
                                           To be eligible for a return, your item must be in the same condition that you received it. 
                                           Any accompanying tags must be intact and in original packaging.
                                           Please be informed that in-store purchases are not eligible for returns online.</p>   
                                        <p>If an item arrives damaged or faulty, or isn’t what you ordered, please contact our Customer 
                                            Care team and let the advisor know the details of your parcel.Our Customer Care team would 
                                            also require you to provide image or video evidence of the item to expedite returns process.</p>   
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>UniSize Guide</h6>
                                        <img src="images/footsize.png" alt=""/>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Your Order</h6>
                                        <p>If your order has not arrived by the estimated delivery date we’re here to help.
                                           Before contacting us it’s worth checking few things first. 
                                           Check the tracking link we sent in your despatch email to view up to date tracking information.
                                           Sign into your account to check we have the correct delivery information for your order and that 
                                           all of your contact details are up to date. If you still can’t find your parcel contact our 
                                           Customer Care team quoting your order number.</p>
                                        <p>On occasions we are unable to send all of the items you have ordered. We will send you an email if 
                                            you are to expect any missing items from your order so please check your mailbox. Some details may 
                                            also be printed on your despatch note. We will refund any payment taken for items not sent.
                                            If you have not received an email from us or if there is no information on your despatch note, please 
                                            contact our Customer Care team in Email and we will resolve the issue for you as quickly as we can.</p>
                                    </div>
                                </div>
                            </div>
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
