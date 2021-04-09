<%-- 
    Document   : shoppingCart
    Created on : Mar 21, 2021, 3:02:46 PM
    Author     : Admin-jiahie
--%>

<%@page import="domain.Color"%>
<%@page import="domain.Shoes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hoot9e-Checkout Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
        <style>
            @font-face {
                font-family: 'DINOT';
                src: url('font/DINOT-Medium.ttf'); 
            }
            body{
                background-color: #E3E4E4;
            }
            .font-style-dinot{
                font-family: "DINOT";
                font-stretch: condensed;
            }
            .title-con > hr{
                border-top: 1px solid #bdbdbd;
                margin-top: 45px;
            }
            .btn{
                border-radius: 0 !important;
                padding: 10px;
            }
            .vertical-scrollable { 
                width: 100%; 
                max-height: 400px; 
                overflow-y: scroll;  
            }
            .product-container{
                margin-left: 20px;
                padding:1px;
                padding-left:0px;
                margin-bottom: 15px;
                background-color: white;
            }
            .input-style{
                border-radius: 30px;
                width: 50%;
                padding-left: 20px;
                font-size: 14px;
            }
            .input-style2{
                border-radius: 30px;
                padding-left: 20px;
                font-size: 14px;
            }
            .font-light{
                color:#8a8a8a ;
            }
            .font-size-13{
                font-size: 13px;
            }
            .font-size-14{
                font-size: 14.5px;
            }
            .font-size-19{
                font-size: 17px;
            }
            .border-line-2{
                width: 100%;
                height: 1px;
                background:#cdcdcd;
            }
            /* Hide scrollbar for Chrome, Safari and Opera */
            .vertical-scrollable::-webkit-scrollbar {
                display: none;
            }

            /* Hide scrollbar for IE, Edge and Firefox */
            .vertical-scrollable {
                -ms-overflow-style: none;  /* IE and Edge */
                scrollbar-width: none;  /* Firefox */
            }
            @media screen and (max-width:768px) {
                .payment-column{
                    margin-top: 20px !important;
                }
                .product-img{
                    padding-top: 0 !important;
                    padding-bottom: 0 !important;
                }
                .button-gap{
                    margin-bottom:10px !important; 
                }
                .button-gap-left{
                    padding-left: 0 !important;
                }
                .font-size-19{
                    font-size: 19px;
                }
            }
        </style>
    </head>

    <body>
        <%@include file="components/clientHeader.jsp"%>
        <%
            ArrayList<Shoes> cartList = (ArrayList<Shoes>) session.getAttribute("cartProd");
            ArrayList<Color> prodColor = (ArrayList<Color>) session.getAttribute("prodColor");
            ArrayList<Double> prodSubTtl = (ArrayList<Double>) session.getAttribute("prodSubTtl");
            Double orderSubTtl = (Double) request.getAttribute("orderSubTtl");
            Double orderTtl = (Double) request.getAttribute("orderTtl");
            Double shippingFee = (Double) request.getAttribute("shippingFee");
            boolean isEmpty = Boolean.TRUE == request.getAttribute("checkEmpty");
            String message = (String) request.getAttribute("message");
            boolean chkSuccessAdd = Boolean.TRUE == session.getAttribute("chkSuccessAdd");
            boolean chkError = Boolean.TRUE == session.getAttribute("chkError");
            boolean chkRanOutStock = Boolean.TRUE == session.getAttribute("chkRanOutStock");
            ArrayList<Integer> ranOutStockIndex = (ArrayList<Integer>) session.getAttribute("ranOutStockIndex");
            if (ranOutStockIndex == null) {
                ranOutStockIndex = new ArrayList<Integer>();
            }
        %>
        <div class="container-fluid text-center title-con font-style-dinot" style="margin-top: 120px;">
            <span class="h2">CHECKOUT</span><br>
            <hr>
            <%if (!isEmpty) {%>
            <p class="h4 text-dark text-left">Product</p>
            <%}%>
        </div>

        <%if (isEmpty) {%>
        <!--Start Empty Cart-->
        <div class="container mt-5 mb-5 font-style-dinot">
            <p class="mb-3">Your cart is empty, please continue to shopping to add your cart.</p>
            <a href="ShoesControl?option=0" class="btn btn-dark btn-sm">Continue Shopping</a>
        </div>
        <!--End Empty Cart-->
        <%} else {%>
        <!--Start Cart Content-->
        <div class="container-fluid mb-4 font-style-dinot">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-sm-12 pl-0 pr-0 ">
                    <div class="container-fluid vertical-scrollable"> 
                        <div class="row">  
                            <div class="col-md-12"> 
                                <!--Start product List-->
                                <%for (int i = 0; i < cartList.size(); i++) {%>
                                <div class="row product-container ml-0 mr-0 pt-4 pb-0">
                                    <div class="col-md-4 col-sm-12">
                                        <img class="product-img img-thumbnail border-0" style="padding-top:90px;" src="images/<%=cartList.get(i).getImg()%>" alt="pic1">
                                    </div>
                                    <div class="col-md-8 col-sm-12 pr-4">
                                        <p class="h3 font-weight-bold"><%=cartList.get(i).getProdName()%></p>
                                        <p class="h4">RM&nbsp;<%=String.format("%.0f", cartList.get(i).getPrice())%></p>
                                        <div class="form-group ml-2 mb-2">
                                            <label class="h5" for="">Color :</label>
                                            <input type="text" class="input-style form-control form-control-sm" id="" name="color" value="<%=prodColor.get(i).getColorName()%>" disabled>
                                        </div>
                                        <div class="form-group ml-2 mb-2">
                                            <div class="form-row">
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="h5" for="">Size :</label>
                                                    <input type="text" class="form-control form-control-sm input-style2" id="size" name="size" value="<%=cartList.get(i).getSize()%>" disabled>
                                                </div>
                                                <div class="form-group col-md-6 col-sm-6">
                                                    <label class="h5" for="">Quantity :</label>
                                                    <input type="number" class="form-control form-control-sm input-style2" id="quantity<%=i%>" name="quantity<%=i%>" min="1" max="20" value="<%=cartList.get(i).getStock()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-row ml-2">
                                                <div class="form-group col-md-4 col-sm-4 col-4 mb-0">
                                                    <form action="CartControl" method="POST" id="updateForm<%=i%>">
                                                        <input type="hidden" value="updateCart" name="cartAction">
                                                        <input type="hidden" value="<%=i%>" name="indexProd">
                                                        <input type="hidden" value="" name="updateQty<%=i%>" id="updateQty<%=i%>">
                                                        <input type="hidden" value="<%=cartList.get(i).getProdID()%>" name="shoesID">
                                                        <button class="btn pt-0 pb-0 pl-0 pr-0" type="button" onclick="submitFunction(<%=i%>)">
                                                            <svg t="1616597917580" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1697" width="25" height="25">
                                                            <path d="M704.15 384a32 32 0 0 0 32 32H896a32 32 0 0 0 32-32V224a32 32 0 0 0-64 0v66.92C788.5 171.29 655 96 511.9 96c-229.37 0-416 186.62-416 416s186.63 416 416 416a415.67 415.67 0 0 0 413.32-368.4l0.47-4.22A32 32 0 0 0 897.4 520c-17.06-1.56-33.4 10.69-35.34 28.28l-0.44 4.13A351.68 351.68 0 0 1 511.9 864c-194.09 0-352-157.91-352-352s157.91-352 352-352c131.54 0 253.6 75.16 313.41 192h-89.16a32 32 0 0 0-32 32z" p-id="1698" fill="#8a8a8a"></path>
                                                            </svg>
                                                            <span class="font-light">Update</span>
                                                        </button>
                                                    </form >
                                                </div>
                                                <div class="form-group col-md-5 col-sm-4 col-4 mb-0">
                                                    <button class="btn pt-0 pb-0 pl-0 pr-0" type="button" data-toggle="modal" data-target="#myModal<%=i%>">
                                                        <svg t="1616598933519" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3871" width="28" height="28">
                                                        <path d="M779.3 228.2h-113v-35.4c0-34.9-28.4-63.3-63.3-63.3H425c-34.9 0-63.3 28.4-63.3 63.3v35.4h-113c-32.9 0-59.7 26.8-59.7 59.7v38.5c0 32.9 26.8 59.7 59.7 59.7h1.8v412.8c0 54.1 44 98.1 98.1 98.1h330.9c54.1 0 98.1-44 98.1-98.1V386.1h1.8c32.9 0 59.7-26.8 59.7-59.7v-38.5c-0.1-32.9-26.8-59.7-59.8-59.7z m-374.9-35.4c0-11.4 9.2-20.6 20.6-20.6h178c11.4 0 20.6 9.2 20.6 20.6v35.4H404.4v-35.4z m330.4 606c0 30.5-24.8 55.4-55.4 55.4H348.5c-30.5 0-55.4-24.8-55.4-55.4V386.1h441.7v412.7z m61.5-472.4c0 9.4-7.6 17-17 17H248.7c-9.4 0-17-7.6-17-17v-38.5c0-9.4 7.6-17 17-17h530.7c9.4 0 17 7.6 17 17v38.5z" p-id="3872" fill="#dc3545"></path><path d="M377.9 462.3h42.7v317.5h-42.7zM492.6 462.3h42.7v317.5h-42.7zM607.4 462.3h42.7v317.5h-42.7z" p-id="3873" fill="#dc3545"></path>
                                                        </svg>
                                                        <span class="text-danger">Remove</span>
                                                    </button>
                                                </div>
                                                <!--Start Modal-->
                                                <div id="myModal<%=i%>" class="modal">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Remove Comfirmation</h5>
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button> 
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Are you sure you want to remove this from your cart?</p>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form action="CartControl" method="POST">
                                                                    <input type="hidden" value="<%=cartList.get(i).getProdID()%>" name="shoesID">
                                                                    <input type="hidden" value="removeCart" name="cartAction">
                                                                    <input type="submit" class="btn btn-danger" value="Remove">
                                                                </form>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--End Modal-->
                                                <div class="form-group col-md-3 col-sm-4 col-12 mb-0 text-right">
                                                    <span class="font-light">Subtotal</span>
                                                    <p class="font-light">RM <%=String.format("%.0f", prodSubTtl.get(i))%></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <!--End product List-->
                            </div>  
                        </div>  
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-12 pl-3 payment-column">
                    <div class="container-fluid bg-white">
                        <div class="row p-2" style="background-color:#000000;">
                            <p class="h5 text-white pl-2 pt-1">Order Summary</p>
                        </div>
                        <div class="row pt-3 pb-2 font-size-14">
                            <div class="col-md-6 col-sm-6 col-6 font-light">Sub Total</div>
                            <div class="col-md-6 col-sm-6 col-6 text-right font-light"><span>RM <%=String.format("%.2f", orderSubTtl)%></span></div>
                        </div>
                        <div class="row pb-3 font-size-14">
                            <div class="col-md-6 col-sm-6 col-6 font-light">Shipping</div>
                            <div class="col-md-6 col-sm-6 col-6 text-right font-light"><span>RM <%=String.format("%.2f", shippingFee)%></span></div>
                        </div>
                        <div class="border-line-2"></div>
                        <div class="row pb-2 pt-2 font-size-19">
                            <div class="col-md-6 col-sm-6 col-6 ">Total</div>
                            <div class="col-md-6 col-sm-6 col-6 text-right"><span>RM <%=String.format("%.2f", orderTtl)%></span></div>
                        </div>
                        <div class="row pb-3 font-size-13">
                            <div class="col-md-12 col-sm-12 col-12 font-light"><span>*Estimate delivery time will be in 7 working days</span></div>
                        </div>
                        <div class="border-line-2"></div>
                        <div class="row pt-3 pb-3">
                            <div class="col-md-12 col-sm-12 col-12">
                                <form action="PaymentControl" method="POST">
                                    <input type="hidden" value="reviewOrder" name="paymentAction">
                                    <input type="hidden" value="<%=orderSubTtl%>" name="orderSubTtl">
                                    <input type="hidden" value="<%=shippingFee%>" name="shippingFee">
                                    <input type="hidden" value="<%=orderTtl%>" name="orderTtl">
                                    <button type="submit" class="btn text-white btn-block" style="border-radius: 50px !important;background-color:#000000;">
                                        Checkout
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <%}%>
        <!--GetValue-->             
        <input type="hidden" value="<%=chkSuccessAdd%>" id="chkSuccess">
        <input type="hidden" value="<%=chkError%>" id="chkError">
        <input type="hidden" value="<%=chkRanOutStock%>" id="chkRanOutStock">
        <%
            session.setAttribute("chkSuccessAdd", false);
            session.setAttribute("chkError", false);
            session.setAttribute("chkRanOutStock", false);
        %>
        <!--Start Modal display Success add-->
        <div class="modal hide fade" id="myModal-1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body pb-0">
                        <div class="container-fluid text-center">
                            <div class="row">
                                <div class="col-12">
                                    <svg t="1617291725035" class="icon" viewBox="0 0 1025 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1648" width="90" height="90"><path d="M511.9455 958.712809c-247.065724 0-448.054313-200.987589-448.054313-448.060313 0-247.065724 200.987589-448.054313 448.054313-448.054313 247.072724 0 448.060313 200.987589 448.060313 448.054313C960.005813 757.72422 759.017224 958.712809 511.9455 958.712809L511.9455 958.712809zM511.9455 126.893372c-211.60762 0-383.758124 172.150504-383.758124 383.758124 0 211.58062 172.150504 383.765124 383.758124 383.765124 211.58062 0 383.765124-172.184504 383.765124-383.765124C895.709624 299.043876 723.52512 126.893372 511.9455 126.893372L511.9455 126.893372zM511.9455 126.893372" p-id="1649" data-spm-anchor-id="a313x.7781069.0.i7" class="selected" fill="#a5dc86"></path><path d="M726.94813 391.825148c-12.545037-12.448036-32.837096-12.322036-45.249133 0.254001L448.388314 627.94784l-103.280303-106.122311c-12.350036-12.707037-32.612096-12.932038-45.249133-0.640002-12.678037 12.322036-12.965038 32.612096-0.640002 45.251133l126.032369 129.522379c0.064 0.093 0.190001 0.093 0.254001 0.190001 0.064 0.064 0.097 0.191001 0.161 0.254001 2.017006 1.988006 4.512013 3.204009 6.88102 4.547013 1.250004 0.674002 2.241007 1.793005 3.52001 2.305007 3.873011 1.601005 8.000023 2.398007 12.096035 2.398007 4.063012 0 8.131024-0.796002 11.969035-2.334007 1.250004-0.513002 2.208006-1.539005 3.39401-2.178006 2.398007-1.344004 4.898014-2.525007 6.94502-4.542013 0.063-0.064 0.098-0.196001 0.190001-0.259001 0.064-0.094 0.161-0.128 0.259001-0.191001l256.253751-259.041759C739.626167 424.499244 739.494166 404.242184 726.94813 391.825148L726.94813 391.825148zM726.94813 391.825148" p-id="1650" data-spm-anchor-id="a313x.7781069.0.i0" class="" fill="#a5dc86"></path></svg>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <h3>Success!!!</h3>
                                    <p><%=message%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer pt-0" style="border-top: 0px !important;">
                        <div class="container-fluid">
                            <div class="row text-center">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal" style="border-radius: 50px !important;">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal display Success add-->

        <!--Start Modal display Error-->
        <div class="modal hide fade" id="myModal-2">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body pb-0">
                        <div class="container-fluid text-center">
                            <div class="row">
                                <div class="col-12">
                                    <svg t="1617293083897" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2892" width="90" height="90"><path d="M512 1023.998046A511.999023 511.999023 0 0 1 312.610948 41.080156a511.999023 511.999023 0 0 1 398.778104 942.839689 508.993158 508.993158 0 0 1-199.389052 40.078201z m0-943.841643C273.534702 80.156403 80.15738 274.53568 80.15738 511.999023s193.377322 431.84262 431.84262 431.84262 431.84262-193.377322 431.84262-431.84262S749.463343 80.156403 512 80.156403z" fill="#dc3545" p-id="2893"></path><path d="M320.626588 743.450636a40.078201 40.078201 0 0 1-28.054741-68.132942l381.744869-381.744869a40.383798 40.383798 0 0 1 57.111437 57.111437L349.683284 731.427176a40.078201 40.078201 0 0 1-29.056696 12.02346z" fill="#dc3545" p-id="2894"></path><path d="M702.371457 743.450636a40.078201 40.078201 0 0 1-28.054741-12.02346L292.571847 349.682307a40.383798 40.383798 0 0 1 57.111437-57.111437l380.742914 382.746824a40.078201 40.078201 0 0 1-28.054741 68.132942z" fill="#dc3545" p-id="2895"></path></svg>                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <h3>Oops...</h3>
                                    <p><%=message%> </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer pt-0" style="border-top: 0px !important;">
                        <div class="container-fluid">
                            <div class="row text-center">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal" style="border-radius: 50px !important;">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal display Error-->
        <!--Start Modal display Error-->
        <div class="modal hide fade" id="myModal-3">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body pb-0">
                        <div class="container-fluid text-center">
                            <div class="row">
                                <div class="col-12">
                                    <svg t="1617293083897" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2892" width="90" height="90"><path d="M512 1023.998046A511.999023 511.999023 0 0 1 312.610948 41.080156a511.999023 511.999023 0 0 1 398.778104 942.839689 508.993158 508.993158 0 0 1-199.389052 40.078201z m0-943.841643C273.534702 80.156403 80.15738 274.53568 80.15738 511.999023s193.377322 431.84262 431.84262 431.84262 431.84262-193.377322 431.84262-431.84262S749.463343 80.156403 512 80.156403z" fill="#dc3545" p-id="2893"></path><path d="M320.626588 743.450636a40.078201 40.078201 0 0 1-28.054741-68.132942l381.744869-381.744869a40.383798 40.383798 0 0 1 57.111437 57.111437L349.683284 731.427176a40.078201 40.078201 0 0 1-29.056696 12.02346z" fill="#dc3545" p-id="2894"></path><path d="M702.371457 743.450636a40.078201 40.078201 0 0 1-28.054741-12.02346L292.571847 349.682307a40.383798 40.383798 0 0 1 57.111437-57.111437l380.742914 382.746824a40.078201 40.078201 0 0 1-28.054741 68.132942z" fill="#dc3545" p-id="2895"></path></svg>                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <h3>Oops...</h3>
                                    <p>Unable Checkout - Insufficient stock!!!</p>
                                    <p>Please remove from cart or try later!!!</p>
                                    <%for (int i = 0; i < ranOutStockIndex.size(); i++) {%>
                                    <p><%=i+1%>. <%=cartList.get(ranOutStockIndex.get(i)).getProdName()%> <%=cartList.get(ranOutStockIndex.get(i)).getSize()%> <%=prodColor.get(ranOutStockIndex.get(i)).getColorName()%></p>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer pt-0" style="border-top: 0px !important;">
                        <div class="container-fluid">
                            <div class="row text-center">
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal" style="border-radius: 50px !important;">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal display Error-->

        <%@include  file="components/clientFooter.jsp"%>

    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>
    <script>
                                                            function submitFunction(i) {
                                                                var qty = document.getElementById("quantity" + i).value;
                                                                document.getElementById("updateQty" + i).value = qty;
                                                                document.getElementById("updateForm" + i).submit();
                                                            }
                                                            $(document).ready(function () {
                                                                function alignModal() {
                                                                    var modalDialog = $(this).find(".modal-dialog");

                                                                    // Applying the top margin on modal to align it vertically center
                                                                    modalDialog.css("margin-top", Math.max(0, ($(window).height() - modalDialog.height()) / 2));
                                                                }
                                                                // Align modal when it is displayed
                                                                $(".modal").on("shown.bs.modal", alignModal);

                                                                // Align modal when user resize the window
                                                                $(window).on("resize", function () {
                                                                    $(".modal:visible").each(alignModal);
                                                                });
                                                            });
                                                            $(window).on('load', function () {
                                                                var success = document.getElementById("chkSuccess").value
                                                                var error = document.getElementById("chkError").value
                                                                var chkRanOutStock = document.getElementById("chkRanOutStock").value
                                                                if (success == "true") {
                                                                    $('#myModal-1').modal('show');
                                                                } else {
                                                                    $('#myModal-1').modal('hide');
                                                                }
                                                                if (error == "true") {
                                                                    $('#myModal-2').modal('show');
                                                                } else {
                                                                    $('#myModal-2').modal('hide');
                                                                }
                                                                if (chkRanOutStock == "true") {
                                                                    $('#myModal-3').modal('show');
                                                                } else {
                                                                    $('#myModal-3').modal('hide');
                                                                }
                                                            });
    </script>
</html>
