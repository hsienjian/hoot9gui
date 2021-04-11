<%-- 
    Document   : test
    Created on : Mar 14, 2021, 2:52:16 PM
    Author     : Admin-jiahie
--%>

<%@page import="domain.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOOT9e</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
    </head>

    <body>
        <%
            Order orderObj = (Order) session.getAttribute("order");
        %>
        <div class="container-fluid" style="margin-top: 130px;margin-bottom: 100px;">
            <div class="container text-center bg-light p-5"> 
                <svg t="1617941931281" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1062" width="120" height="120"><path d="M711.5 533.5h47.4v47.4h-47.4zM244.1 782.5l-56-41.9-29.4 39.2 96.2 72 108.5-152.3-39.9-28.4z" p-id="1063" fill="#515151"></path><path d="M957.2 801.5V253.6H893L872 74.8 225 250.5v313.9C133.9 578.9 64 658 64 753.1v2.4c0 105.4 85.7 191.1 191.1 191.1h2.4c65.9 0 124.1-33.5 158.5-84.4h541.2v-34.9h3l-3-25.8zM830 137l13.7 116.6H400.3L830 137zM257.5 897.6h-2.4c-78.4 0-142.1-63.8-142.1-142.1v-2.4c0-78.4 63.8-142.1 142.1-142.1h2.4c78.4 0 142.1 63.8 142.1 142.1v2.4c0 78.3-63.7 142.1-142.1 142.1z m650.7-269.4H657.8v-142h250.4v142z m0-191H608.8v240h299.4v136.1H439.7c5.8-18.2 8.9-37.6 8.9-57.8v-2.4c0-99.8-76.9-182-174.6-190.4V302.6h634.2v134.6z" p-id="1064" fill="#515151"></path></svg>
                <h3 class="mt-3 mb-3">Payment Success!!</h3>
                <h3 class="mt-3 mb-3">Your Order ID - <%=orderObj.getOrderID()%> </h3>           
                <h3 class="mt-3 mb-3">Total Price - <%=orderObj.getTtlPrice()%> </h3>         
                <div class="row">
                    <div class="col-6 text-right">
                        <a href="home.jsp" class="btn btn-dark">Back to HomePage</a>
                    </div>
                    <div class="col-6 text-left">
                        <a href="OrderRecordControl?ordOpt=1" class="btn btn-primary">View My Order</a>  
                    </div>
                </div>
            </div>
        </div>
        <%
            session.removeAttribute("order");
        %>
    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
</html>
