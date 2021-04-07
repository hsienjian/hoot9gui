<%-- 
    Document   : orderDetails
    Created on : Mar 26, 2021, 4:07:01 PM
    Author     : Admin-jiahie
--%>

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
            .steps .step {
                display: block;
                width: 100%;
                margin-bottom: 35px;
                text-align: center
            }

            .steps .step .step-icon-wrap {
                display: block;
                position: relative;
                width: 100%;
                height: 80px;
                text-align: center
            }

            .steps .step .step-icon-wrap::before,
            .steps .step .step-icon-wrap::after {
                display: block;
                position: absolute;
                top: 50%;
                width: 50%;
                height: 3px;
                margin-top: -1px;
                background-color: #e1e7ec;
                content: '';
                z-index: 1
            }

            .steps .step .step-icon-wrap::before {
                left: 0
            }

            .steps .step .step-icon-wrap::after {
                right: 0
            }

            .steps .step .step-icon {
                display: inline-block;
                position: relative;
                width: 80px;
                height: 80px;
                border: 1px solid #e1e7ec;
                border-radius: 50%;
                background-color: #f5f5f5;
                line-height: 72px;
                z-index: 5
            }

            .steps .step .step-title {
                margin-top: 16px;
                margin-bottom: 0;
                color: #606975;
                font-size: 14px;
                font-weight: 500;
            }

            .steps .step:first-child .step-icon-wrap::before {
                display: none;
            }

            .steps .step:last-child .step-icon-wrap::after {
                display: none;
            }

            .steps .step.completed .step-icon-wrap::before,
            .steps .step.completed .step-icon-wrap::after {
                background-color: #343a40;
            }

            .steps .step.completed .step-icon {
                border-color: #343a40;
                background-color: #343a40;
            }

            @media (max-width: 576px) {
                .flex-sm-nowrap .step .step-icon-wrap::before,
                .flex-sm-nowrap .step .step-icon-wrap::after {
                    display: none;
                }
            }

            @media (max-width: 768px) {
                .flex-md-nowrap .step .step-icon-wrap::before,
                .flex-md-nowrap .step .step-icon-wrap::after {
                    display: none;
                }
            }

            @media (max-width: 992px) {
                .flex-lg-nowrap .step .step-icon-wrap::before,
                .flex-lg-nowrap .step .step-icon-wrap::after {
                    display: none;
                }
                .product-img{
                    padding-top:20px;
                }

            }
            @media (max-width: 1200px) {
                .flex-xl-nowrap .step .step-icon-wrap::before,
                .flex-xl-nowrap .step .step-icon-wrap::after {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="components/clientHeader.jsp"%>
        <div class="container title-con font-style-dinot" style="margin-top: 120px;">
            <span class="h2">ORDER DETAILS</span><br>
            <hr>
        </div>
        <%
            Order orderDetails = (Order) request.getAttribute("orderDetails");
            ArrayList<OrderList> orderList = (ArrayList<OrderList>) request.getAttribute("orderList");
            ArrayList<Shoes> shoesList = (ArrayList<Shoes>) request.getAttribute("shoesList");
            ArrayList<Color> colorList = (ArrayList<Color>) request.getAttribute("colorList");
            
        %>
        <!--Start Order Status-->
        <div class="container mt-4">
            <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
                <div class="step ${orderDetails.getStatus()=="Processing" || orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "completed":""}">
                    <div class="step-icon-wrap">
                        <div class="step-icon">
                            <svg t="1616756958281" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="15252" width="45" height="45" data-spm-anchor-id="a313x.7781069.0.i49">
                            <path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="${orderDetails.getStatus()=="Processing" || orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="15253" data-spm-anchor-id="a313x.7781069.0.i46" class="selected"></path>
                            <path d="M878.08 771.584c-5.12 0-9.216-1.536-12.8-5.12l-39.936-33.792c-4.608-3.584-7.168-9.216-7.168-15.36v-68.608c0-11.264 8.704-19.968 19.968-19.968s19.968 8.704 19.968 19.968v58.88l32.768 27.648c8.704 7.168 9.216 19.456 2.048 28.672-3.072 5.12-9.216 7.68-14.848 7.68z" fill="${orderDetails.getStatus()=="Processing" || orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="15254" data-spm-anchor-id="a313x.7781069.0.i50" class="selected"></path><path d="M848.896 872.448c-94.72 0-172.032-77.312-172.032-172.032s77.312-172.032 172.032-172.032 172.032 77.312 172.032 172.032-77.312 172.032-172.032 172.032z m0-290.816c-65.536 0-118.784 53.248-118.784 118.784S783.36 819.2 848.896 819.2s118.784-53.248 118.784-118.784-53.76-118.784-118.784-118.784z" fill="${orderDetails.getStatus()=="Processing" || orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="15255" data-spm-anchor-id="a313x.7781069.0.i47" class="selected"></path>
                            </svg>
                        </div>
                    </div>
                    <h4 class="step-title">Processing</h4>
                </div>
                <div class="step ${orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "completed":""}">
                    <div class="step-icon-wrap">
                        <div class="step-icon">
                            <svg t="1616758516770" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="15945" width="45" height="45" data-spm-anchor-id="a313x.7781069.0.i54">
                            <path d="M1005.056 676.352l-1.024-1.024c-1.024-1.024-1.536-2.048-2.56-2.56L855.04 541.184c-13.312-11.776-33.792-10.752-45.568 2.56-11.776 13.312-10.752 33.792 2.56 45.568l83.968 75.264h-246.272c-17.92 0-32.256 14.336-32.256 32.256s14.336 32.256 32.256 32.256h253.952l-80.896 77.312c-12.8 12.288-13.312 32.768-1.024 45.568 6.144 6.656 13.824 9.728 22.528 10.24 8.192 0 16.896-2.56 23.04-9.216l137.216-131.072c12.288-12.288 12.288-32.768 0.512-45.568z" fill="${orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="15946"></path>
                            <path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="${orderDetails.getStatus()=="Delivery" || orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="15947"></path>
                            </svg>
                        </div>
                    </div>
                    <h4 class="step-title">Delivery</h4>
                </div>
                <div class="step ${orderDetails.getStatus()=="Completed" ? "completed":""}">
                    <div class="step-icon-wrap">
                        <div class="step-icon">
                            <svg t="1616758683096" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="17849" width="45" height="45">
                            <path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="${orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="17850"></path>
                            <path d="M997.888 575.488c-15.36-12.8-37.376-11.264-50.688 3.584L798.72 752.64l-76.8-87.552c-6.144-7.168-15.36-11.264-24.576-12.288-9.728-0.512-18.944 2.56-26.112 9.216-14.336 13.312-15.872 35.84-3.072 50.688l104.448 119.296c6.144 7.68 16.384 12.288 27.136 12.288 11.264-0.512 20.48-5.12 26.624-12.8l175.616-204.8c12.288-15.872 10.752-37.888-4.096-51.2z" fill="${orderDetails.getStatus()=="Completed" ? "#ffffff":"#343a40"}" p-id="17851"></path>
                            </svg>
                        </div>
                    </div>
                    <h4 class="step-title">Completed</h4>
                </div>
            </div>
        </div>
        <!--End Order Status-->

        <!--Start Row2 Delivery details & Order ID-->
        <div class="container title-con1 font-style-dinot mt-4" >
            <div class="row">
                <div class="col-12 col-md-6 col-sm-12">
                    <span class="h4">DELIVERY DETAILS</span><br>
                    <hr>
                    <div class="row">
                        <div class="col-6 ">
                            <p class="font-light">Name</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light text-right">${cusDetails.getFirstName()} ${cusDetails.getLastName()}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Contact Number</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light text-right">${cusDetails.getPhoneNo()}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Address</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light text-right">${cusDetails.getAddress()}</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-sm-12">
                    <span class="h4">ORDER ID - ${orderDetails.getOrderID()}</span><br>
                    <hr>
                    <div class="row">
                        <div class="col-6 ">
                            <p class="font-light">Order Date</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light text-right">${orderDetails.getDate()}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p class="font-light">Ship Date</p>
                        </div>
                        <div class="col-6">
                            <p class="font-light text-right">${deliveryDate}</p>
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
                    <%for (int i = 0; i < orderList.size() ; i++) {%>
                    <div class="container shadow bg-white p-3">
                        <div class="row">
                            <div class="col-md-2">
                                <p class="font-light font-weight-bold text-center" style="padding-top:50px;"><%=i + 1%></p>
                            </div>
                            <div class="col-md-3 product-img">
                                <img class="img-thumbnail border-0"  src="<%=shoesList.get(i).getImg()%>" alt="pic1">
                            </div>
                            <div class="col-md-7 mt-3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="h4"><%=shoesList.get(i).getProdName()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light-x2 mb-2">Color: <%=colorList.get(i).getColorName()%></p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light-x2 mb-2">Size: <%=shoesList.get(i).getSize()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light mb-2">RM <%=String.format("%.2f",shoesList.get(i).getPrice())%></p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-6">
                                        <p class="font-light mb-2">QTY: <%=orderList.get(i).getQty()%></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p class="font-light mb-0 text-right pr-4" style="font-size:18px !important;">Subtotal: RM <%=String.format("%.2f",orderList.get(i).getSubTtlPrice())%></p>
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
                        <%
                            double subtotal=0.0;
                            for(int i = 0; i < orderList.size() ; i++){
                                subtotal += orderList.get(i).getSubTtlPrice();
                            }
                        %>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">Subtotal</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">RM<%=String.format("%.2f",subtotal)%></p>
                            </div>
                        </div>
                        <div class="row pt-2 pb-2">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">Shipping</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light-x1 mb-0 text-right pr-4" style="font-size:20px !important;">RM0.00</p>
                            </div>
                        </div>
                        <hr>
                        <div class="row pt-1 pb-1">
                            <div class="col-md-7 col-sm-7 col-7">
                                <p class="font-light mb-0 text-right pr-4" style="font-size:20px !important;">Total</p>
                            </div>
                            <div class="col-md-5 col-sm-5 col-5">
                                <p class="font-light mb-0 text-right pr-4" style="font-size:20px !important;">RM<%=String.format("%.2f", orderDetails.getTtlPrice())%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End Total-->
            </div>
        </div>
        <!--End Order Product-->    

        <div class="container mb-5">
            <a href="OrderRecordControl?ordOpt=1" class="btn btn-dark">Back To Previous Page</a>
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
