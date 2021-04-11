<%-- 
    Document   : orderDetails
    Created on : Mar 26, 2021, 4:07:01 PM
    Author     : Admin-jiahie
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="domain.Color"%>
<%@page import="domain.Shoes"%>
<%@page import="domain.Customer"%>
<%@page import="domain.OrderList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Order"%>
<%@page import="domain.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hoot9e-OrderDetails</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
        <style>
            @font-face {
                font-family: 'DINOT';
                src: url('font/DINOT-Medium.ttf'); 
            }
            .title-con > hr{
                border-top: 1px solid #e6e6e6;
                margin-top: 15px;
            }
            .title-con1 > hr{
                border-top: 1px solid #e6e6e6;
                margin-top: 10px;
            }
            .font-light{
                color: #606975;
                font-size: 16px;
                font-weight: 500;
            }
            .font-light-x0{
                color: #9c9c9c;
                font-size: 16px;
                font-weight: 500;
            }
            .font-light-x1{
                color: #8a8a8a;
                font-size: 14px;
                font-weight: 500;
            } 
            .font-light-x2{
                color: #bfbfbf;
                font-size: 14px;
                font-weight: 500;
            } 

        </style>
    </head>
    <body>
        <%@include file="components/clientHeader.jsp"%>
        <div class="container title-con font-style-dinot" style="margin-top: 120px;">
            <span class="h2">ORDER CONFIRMATION</span><br>
            <hr>
        </div>
        <%
            Order order = (Order) session.getAttribute("order");
            Customer cusInfo = (Customer) request.getAttribute("cusInfo");
            ArrayList<Color> prodColor = (ArrayList<Color>) session.getAttribute("prodColor");
            ArrayList<Shoes> cartList = (ArrayList<Shoes>) session.getAttribute("cartProd");
            Double orderSubTtl = (Double) request.getAttribute("orderSubTtl");
            Double shippingFee = (Double) request.getAttribute("shippingFee");
            ArrayList<Double> prodSubTtl = (ArrayList<Double>) session.getAttribute("prodSubTtl");
        %>
        <div class="container title-con1 font-style-dinot mt-4">
            <div class="row">
                <div class="col-12 col-md-6 col-sm-12">
                    <span class="h4">DELIVERY DETAILS</span><br>
                    <hr>
                    <div class="row">
                        <div class="col-6 ">
                            <p class="font-light">Name</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light-x0 text-right"><%=cusInfo.getFirstName()%> <%=cusInfo.getLastName()%></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Contact Number</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light-x0 text-right"><%=cusInfo.getPhoneNo()%></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Address</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light-x0 text-right"><%=cusInfo.getAddress()%></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-sm-12">
                    <span class="h4">ORDER DETAILS</span><br>
                    <hr>
                    <div class="row">
                        <div class="col-6 ">
                            <p class="font-light">Order Date</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light-x0 text-right"><%=order.getDate()%></p>
                        </div>
                    </div>
                    <%
                        Date dtObj = order.getDate();  // Start date
                        String dt = dtObj.toString();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Calendar c = Calendar.getInstance();
                        c.setTime(sdf.parse(dt));
                        c.add(Calendar.DATE, 4);  // number of days to add
                        dt = sdf.format(c.getTime());  // dt is now the new date
                    %>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Estimate Ship Date</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light-x0 text-right"><%=dt%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Row2 Delivery details & Order ID-->

        <!--Start Order Product-->
        <div class="container title-con1 font-style-dinotmt-4 mt-4 mb-4" >
            <div class="row">
                <div class="col-12 col-md-12 col-sm-12">
                    <span class="h4">ORDER PRODUCTS</span><br>
                    <hr>
                    <!--Start Product List-->
                    <%for (int i = 0; i < cartList.size(); i++) {%>
                    <div class="container shadow bg-white p-3">
                        <div class="row">
                            <div class="col-md-2">
                                <p class="font-light font-weight-bold text-center" style="padding-top:50px;"><%=i + 1%></p>
                            </div>
                            <div class="col-md-3 product-img">
                                <img class="img-thumbnail border-0"  src="images/<%=cartList.get(i).getImg()%>" alt="pic1">
                            </div>
                            <div class="col-md-7 mt-3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="h4"><%=cartList.get(i).getProdName()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light-x2 mb-2">Color: <%=prodColor.get(i).getColorName()%></p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light-x2 mb-2">Size: <%=cartList.get(i).getSize()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light mb-2">RM <%=String.format("%.2f", cartList.get(i).getPrice())%></p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light mb-2">QTY: <%=cartList.get(i).getStock()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="font-light mb-0 text-right pr-4" style="font-size:18px !important;">Subtotal: RM <%=String.format("%.2f", prodSubTtl.get(i))%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <!--Start Product List-->
                </div>
                <!--Start Total-->
                <div class="col-12 col-md-12 col-sm-12 mt-2">
                    <div class="container shadow bg-white p-3">

                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">Subtotal</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">RM <%=String.format("%.2f", orderSubTtl)%></p>
                            </div>
                        </div>
                        <div class="row pt-2 pb-2">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">Shipping</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">RM <%=String.format("%.2f", shippingFee)%></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row pt-1 pb-1">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light mb-0 text-right pr-4" style="font-size:20px !important;">Total</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light mb-0 text-right pr-4" style="font-size:20px !important;">RM <%=String.format("%.2f", order.getTtlPrice())%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Total-->
            </div>
        </div>
        <!--End Order Product-->    

        <div class="container mb-5 ">
            <div class="row">
                <div class="col-12">
                    <a href="CartControl?cartAction=displayCart" class="btn btn-dark">Back To Previous Page</a>
                    <a href="clientPaymentForm.jsp" class="btn btn-dark">Confirm & Pay</a>
                </div>
            </div>

        </div>

        <%@include  file="components/clientFooter.jsp"%>
    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
</html>
