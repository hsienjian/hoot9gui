<%-- 
    Document   : myOrder
    Created on : Mar 25, 2021, 6:06:05 PM
    Author     : Admin-jiahie
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="da.OrderDA"%>
<%@page import="domain.Order"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Hoot9e-myOrder</title>
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
            input,
            input::-webkit-input-placeholder {
                font-size: 15px;
            }
            .font-light-x1{
                color: #8a8a8a;
                font-size: 14px;
                font-weight: 500;
            } 
            .font-light{
                color: #606975;
                font-size: 16px;
                font-weight: 500;
            }
            @media screen and (max-width:768px) {
                .btn-center{
                    justify-content: center;
                }
                .setGap-no{
                    padding-top: 30px !important;
                    padding-bottom: 20px !important;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="components/clientHeader.jsp"%>
        <div class="container title-con font-style-dinot" style="margin-top: 120px;">
            <span class="h2">MY ORDER</span><br>
            <hr>
        </div>
        <div class="container p-2">
            <div class="row mb-3">
                <div class="col-md-8 col-sm-12 col-12">
                    <div class="row btn-center">
                        <div class="p-2">
                            <a href="OrderRecordControl?ordOpt=1" class="btn btn-dark">Recent</a>
                        </div>
                        <div class="p-2">
                            <a href="OrderRecordControl?ordOpt=2" class="btn btn-dark">Processing</a>
                        </div>
                        <div class="p-2">
                            <a href="OrderRecordControl?ordOpt=3" class="btn btn-dark">Delivery</a>
                        </div>
                        <div class="p-2">
                            <a href="OrderRecordControl?ordOpt=4" class="btn btn-dark">Completed</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-12">
                    <form action="OrderRecordControl" method="GET">
                        <div class="input-group p-2">
                            <input type="hidden" class="form-control" name="ordOpt" value="5">
                            <input type="text" class="form-control" placeholder="Search by Order ID" name="orderID">
                            <div class="input-group-btn">
                                <button class="btn btn-default border border-1" type="submit">
                                    <svg t="1616676596883" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7531" width="20" height="20">
                                    <path d="M416 192C537.6 192 640 294.4 640 416S537.6 640 416 640 192 537.6 192 416 294.4 192 416 192M416 128C256 128 128 256 128 416S256 704 416 704 704 576 704 416 576 128 416 128L416 128z" p-id="7532" fill="#2c2c2c"></path>
                                    <path d="M832 864c-6.4 0-19.2 0-25.6-6.4l-192-192c-12.8-12.8-12.8-32 0-44.8s32-12.8 44.8 0l192 192c12.8 12.8 12.8 32 0 44.8C851.2 864 838.4 864 832 864z" p-id="7533" fill="#2c2c2c"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            
            ArrayList<Order> orderList = (ArrayList<Order>) request.getAttribute("orderList");
            boolean isEmpty = Boolean.TRUE == request.getAttribute("checkIsEmpty");
            boolean isNotFound = Boolean.TRUE == request.getAttribute("checkNotFound");
            String title = (String) request.getAttribute("filterTitle");
        %>
        <!--Start Order Status-->
        <%if (!isEmpty) {%>
        <div class="container title-con">
            <span class="h4"><%=title%></span><br>
            <hr>
        </div>

        <div class="container mb-5">
            <%for (int i = 0; i < orderList.size(); i++) {%>
            <div class="container mb-4 shadow bg-white rounded">
                <div class="row">
                    <div class="col-md-2">
                        <p class="h5 text-center setGap-no" style="padding-top:80px;"><%=i + 1%></p>
                    </div>
                    <div class="col-md-3 bg-dark rounded">
                        <%if (orderList.get(i).getStatus().equals("Processing")) {%>
                        <div class="text-center p-3 pt-2 mt-4">
                            <svg t="1616738832490" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5332" data-spm-anchor-id="a313x.7781069.0.i1" width="80" height="80"><path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="#ffffff" p-id="5333" data-spm-anchor-id="a313x.7781069.0.i0" class=""></path><path d="M878.08 771.584c-5.12 0-9.216-1.536-12.8-5.12l-39.936-33.792c-4.608-3.584-7.168-9.216-7.168-15.36v-68.608c0-11.264 8.704-19.968 19.968-19.968s19.968 8.704 19.968 19.968v58.88l32.768 27.648c8.704 7.168 9.216 19.456 2.048 28.672-3.072 5.12-9.216 7.68-14.848 7.68z" fill="#f1f1f1" p-id="5334" data-spm-anchor-id="a313x.7781069.0.i2" class="selected"></path><path d="M848.896 872.448c-94.72 0-172.032-77.312-172.032-172.032s77.312-172.032 172.032-172.032 172.032 77.312 172.032 172.032-77.312 172.032-172.032 172.032z m0-290.816c-65.536 0-118.784 53.248-118.784 118.784S783.36 819.2 848.896 819.2s118.784-53.248 118.784-118.784-53.76-118.784-118.784-118.784z" fill="#f1f1f1" p-id="5335" data-spm-anchor-id="a313x.7781069.0.i3" class="selected"></path></svg>
                            <p class="text-white"><%=orderList.get(i).getStatus()%></p>
                        </div>
                        <%} else if (orderList.get(i).getStatus().equals("Delivery")) {%>
                        <div class="text-center p-3 pt-2 mt-4">
                            <svg t="1616740440359" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5971" data-spm-anchor-id="a313x.7781069.0.i18" width="80" height="80"><path d="M1005.056 676.352l-1.024-1.024c-1.024-1.024-1.536-2.048-2.56-2.56L855.04 541.184c-13.312-11.776-33.792-10.752-45.568 2.56-11.776 13.312-10.752 33.792 2.56 45.568l83.968 75.264h-246.272c-17.92 0-32.256 14.336-32.256 32.256s14.336 32.256 32.256 32.256h253.952l-80.896 77.312c-12.8 12.288-13.312 32.768-1.024 45.568 6.144 6.656 13.824 9.728 22.528 10.24 8.192 0 16.896-2.56 23.04-9.216l137.216-131.072c12.288-12.288 12.288-32.768 0.512-45.568z" fill="#f1f1f1" p-id="5972" data-spm-anchor-id="a313x.7781069.0.i16" class=""></path><path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="#ffffff" p-id="5973" data-spm-anchor-id="a313x.7781069.0.i15" class="selected"></path></svg>
                            <p class="text-white"><%=orderList.get(i).getStatus()%></p>
                        </div>
                        <%} else if (orderList.get(i).getStatus().equals("Completed")) {%>
                        <div class="text-center p-3 pt-2 mt-4">
                            <svg t="1616740793201" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7517" data-spm-anchor-id="a313x.7781069.0.i26" width="80" height="80"><path d="M972.288 305.152c0-0.512 0-1.536-0.512-2.048V302.08c-0.512-2.56-1.024-5.632-2.56-8.192 0-1.024-0.512-1.536-1.024-2.048-0.512-1.024-1.024-1.536-1.536-2.56-0.512-1.536-2.048-2.56-3.072-4.096l-3.072-3.072c-0.512-0.512-1.024-1.024-2.048-1.536-0.512-0.512-1.024-0.512-1.536-1.024l-0.512-0.512h-0.512s-0.512-0.512-1.024-0.512-1.024-0.512-1.536-1.024c-0.512-0.512-1.536-1.024-2.048-1.024l-220.672-92.16L527.36 98.816c-7.68-3.584-16.896-3.584-25.6-0.512L35.84 266.752h-1.024c-2.56 1.024-5.632 2.048-8.192 4.608l-1.024 1.024c-0.512 0.512-1.024 0.512-1.024 1.024-0.512 0.512-1.024 1.024-2.048 1.536l-0.512 0.512v1.024l-0.512 0.512c-0.512 0.512-0.512 1.024-1.024 1.024l-1.024 1.024c-1.536 1.536-2.048 3.072-2.56 4.608-0.512 0.512-0.512 1.536-1.024 2.048 0 0.512 0 0.512-0.512 1.024l-1.024 2.56c-0.512 1.024-1.024 2.56-1.024 4.096v1.024c0 1.024-0.512 2.048-0.512 3.072v363.52c0 13.312 7.168 25.088 18.944 30.72l433.152 220.672v1.024h2.048c0.512 0 0.512 0.512 1.024 0.512s1.024 0.512 1.024 0.512c0.512 0 0.512 0 1.024 0.512v0.512h0.512c0.512 0 1.024 0.512 2.048 0.512h0.512c0.512 0 1.024 0.512 2.048 0l0.512 0.512H481.28c1.024 0 3.072 0 4.608-0.512h0.512c1.024 0 1.536 0 2.048-0.512h1.024c1.024 0 2.048-0.512 2.56-1.024h1.024c0.512 0 1.024 0 1.536-0.512 1.024 0 1.536-0.512 2.048-1.024l156.672-70.144c8.192-3.584 14.848-10.752 18.432-19.456 3.072-8.704 3.072-17.92-1.024-26.624-8.192-17.408-28.672-25.088-45.568-17.408l-108.544 48.128v-302.08l387.072-166.4v113.664c0 18.944 15.36 34.816 34.816 34.816s34.816-15.36 34.816-34.816V305.152h-1.024z m-123.392 3.072L481.28 466.432 344.576 401.408l371.712-148.48 132.608 55.296z m-711.68-4.096L512 167.936l112.128 47.104-365.568 145.92-121.344-56.832z m308.736 221.696v299.52L81.92 640V354.304l364.032 171.52z" fill="#ffffff" p-id="7518" data-spm-anchor-id="a313x.7781069.0.i23" class=""></path><path d="M997.888 575.488c-15.36-12.8-37.376-11.264-50.688 3.584L798.72 752.64l-76.8-87.552c-6.144-7.168-15.36-11.264-24.576-12.288-9.728-0.512-18.944 2.56-26.112 9.216-14.336 13.312-15.872 35.84-3.072 50.688l104.448 119.296c6.144 7.68 16.384 12.288 27.136 12.288 11.264-0.512 20.48-5.12 26.624-12.8l175.616-204.8c12.288-15.872 10.752-37.888-4.096-51.2z" fill="#fafafa" p-id="7519" data-spm-anchor-id="a313x.7781069.0.i24" class="selected"></path></svg>
                            <p class="text-white"><%=orderList.get(i).getStatus()%></p>
                        </div>
                        <%}%>
                    </div>
                    <%
                        Date dtObj = orderList.get(i).getDate();  // Start date
                        String dt = dtObj.toString();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Calendar c = Calendar.getInstance();
                        c.setTime(sdf.parse(dt));
                        c.add(Calendar.DATE, 4);  // number of days to add
                        dt = sdf.format(c.getTime());  // dt is now the new date
                    %>
                    <div class="col-md-7">
                        <div class="row pt-2">
                            <div class="col-12">
                                <p class="h3">Order ID - <%=orderList.get(i).getOrderID()%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 pt-2">
                                <p class="font-light-x1">Order Date : <%=orderList.get(i).getDate()%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 pt-2">
                                <p class="font-light-x1">Delivery Date : <%=dt%></p>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-6 pt-2">
                                <p class="font-light">Total Price : RM <%=String.format("%.2f", orderList.get(i).getTtlPrice())%></p>
                            </div>
                            <div class="col-6 text-right">
                                <form method="GET" action="OrderRecordControl?">
                                    <input type="hidden" name="ordOpt" value="6">
                                    <input type="hidden" name="diliveryDate" value="<%=dt%>">
                                    <input type="hidden" name="ordID" value="<%=orderList.get(i).getOrderID()%>">
                                    <button type="submit" class="btn btn-dark">View Order</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <%}%>
        <!--End Order Status-->

        <!--Start Error message-->
        <%if (isEmpty) {%>

        <div class="container mb-5">
            <hr>
            <div class="row justify-content-center mt-5">
                <svg t="1616679981762" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3261" width="80" height="80">
                <path d="M807.424 389.12V208.896c0-55.296-50.176-80.384-75.264-80.384H296.448c-34.816 0-70.144 34.816-75.264 100.352v510.976c0 80.384 55.296 80.384 75.264 80.384h155.136c14.848 0 25.088 14.848 25.088 30.208s-10.24 30.208-25.088 30.208H291.84c-45.056 0-125.44-30.208-125.44-110.08V224.256c0-104.96 65.024-150.528 125.44-150.528h445.44c70.144 0 125.44 45.056 125.44 130.048V389.12c0 14.848-10.24 30.208-25.088 30.208-19.968-5.12-30.208-14.848-30.208-30.208z" fill="#cdcdcd" p-id="3262"></path>
                <path d="M341.504 228.864h350.72c14.848 0 25.088 10.24 25.088 25.088 0 14.848-10.24 25.088-25.088 25.088H341.504c-14.848 0-25.088-10.24-25.088-25.088 0.512-14.848 10.24-25.088 25.088-25.088zM341.504 379.392h350.72c14.848 0 25.088 10.24 25.088 25.088 0 14.848-10.24 25.088-25.088 25.088H341.504c-14.848 0-25.088-10.24-25.088-25.088 0.512-15.36 10.24-25.088 25.088-25.088zM341.504 529.408h150.528c14.848 0 25.088 10.24 25.088 25.088 0 14.848-10.24 25.088-25.088 25.088H341.504c-14.848 0-25.088-10.24-25.088-25.088 0.512-14.848 10.24-25.088 25.088-25.088z" fill="#cdcdcd" p-id="3263"></path><path d="M724.992 488.96l-170.496 207.872c-3.584 4.608-6.144 10.24-6.144 16.384l-0.512 93.696c0 16.384 15.36 29.184 31.232 25.6l91.648-18.944c6.144-1.024 11.264-4.608 14.848-9.216l170.496-207.872c9.216-11.264 7.68-27.648-3.584-36.864l-91.136-74.752c-10.752-8.704-27.136-7.168-36.352 4.096z m-70.656 274.432l-19.456 8.192c-18.944 7.68-38.912-8.192-35.84-28.16l3.072-22.016c0.512-4.608 2.56-9.216 5.632-12.8l118.784-144.896c9.216-11.264 25.6-12.8 36.864-3.584l16.896 13.824c11.264 9.216 12.8 25.6 3.584 36.864l-119.296 145.408c-3.072 2.56-6.144 5.12-10.24 7.168z" fill="#cdcdcd" p-id="3264"></path>
                </svg>
            </div>
            <div class="row justify-content-center pt-2">
                <P style="color:#cdcdcd;">You haven't placed any orders yet</P>
            </div>
        </div>
        <%} else if (isNotFound) {%>
        <div class="container mb-5">
            <div class="row justify-content-center mt-5">
                <svg t="1616744429471" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="14011" width="70" height="70"><path d="M960.253652 703.916984c8.637728 8.636704 8.637728 22.64065 0.001023 31.277354l-281.871739 281.871739c-8.636704 8.636704-22.64065 8.636704-31.278377-0.001023l0 0c-8.636704-8.635681-8.636704-22.64065 0-31.276331l281.871739-281.871739C937.614026 695.279257 951.616948 695.279257 960.253652 703.916984L960.253652 703.916984z" p-id="14012" fill="#cdcdcd"></path><path d="M960.254675 1017.065054c-8.636704 8.637728-22.64065 8.637728-31.277354 0.002047l-281.871739-281.871739c-8.636704-8.636704-8.636704-22.641673 0.001023-31.278377l0 0c8.635681-8.636704 22.64065-8.636704 31.276331 0l281.871739 281.871739C968.892403 994.425428 968.892403 1008.429373 960.254675 1017.065054L960.254675 1017.065054z" p-id="14013" fill="#cdcdcd"></path><path d="M732.397131 248.980631c0 12.216229-9.901511 22.11774-22.115694 22.11774l-398.626883 0c-12.215206 0-22.116717-9.902534-22.116717-22.11774l0 0c0-12.214183 9.902534-22.115694 22.116717-22.115694l398.626883 0C722.49562 226.863914 732.397131 236.766448 732.397131 248.980631L732.397131 248.980631z" p-id="14014" fill="#cdcdcd"></path><path d="M732.397131 492.752634c0 12.216229-9.901511 22.11774-22.115694 22.11774l-398.626883 0c-12.215206 0-22.116717-9.902534-22.116717-22.11774l0 0c0-12.214183 9.902534-22.115694 22.116717-22.115694l398.626883 0C722.49562 470.63694 732.397131 480.539474 732.397131 492.752634L732.397131 492.752634z" p-id="14015" fill="#cdcdcd"></path><path d="M522.024819 721.127971c0 12.216229-9.901511 22.11774-22.115694 22.11774l-188.254571 0c-12.215206 0-22.116717-9.902534-22.116717-22.11774l0 0c0-12.214183 9.902534-22.115694 22.116717-22.115694l188.254571 0C512.124332 699.012278 522.024819 708.914812 522.024819 721.127971L522.024819 721.127971z" p-id="14016" fill="#cdcdcd"></path><path d="M836.267826 0.455371l-648.536676 0c-71.938426 0-130.464377 58.525951-130.464377 130.464377l0 762.109338c0 71.938426 58.525951 130.464377 130.464377 130.464377l355.275539 0c0.473791 0.029676 0.949628 0.050142 1.430582 0.050142 12.446473 0 22.537296-10.090822 22.537296-22.537296 0-12.008498-9.392928-21.819958-21.230534-22.496363-0.00614-0.014326-0.01228-0.027629-0.017396-0.040932l-357.995487 0c-47.110971 0-85.438904-38.327934-85.438904-85.438904l0-762.109338c0-47.110971 38.327934-85.438904 85.438904-85.438904l648.536676 0c47.110971 0 85.438904 38.327934 85.438904 85.438904l0 467.611024c-0.029676 0.471744-0.049119 0.946558-0.049119 1.425466 0 12.446473 10.089799 22.537296 22.537296 22.537296 12.446473 0 22.537296-10.090822 22.537296-22.537296l0-469.036489C966.732204 58.982346 908.206252 0.455371 836.267826 0.455371z" p-id="14017" fill="#cdcdcd"></path></svg>
            </div>
            <div class="row justify-content-center pt-3">
                <p style="color:#cdcdcd;">This Order ID does not exist</p>
            </div>
        </div>
        <%}%>
        <!--End Error message-->


        <%@include  file="components/clientFooter.jsp"%>
    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
</html>
