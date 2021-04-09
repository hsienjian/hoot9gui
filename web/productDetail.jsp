<%@page import="domain.Shoes"%>
<%@page import="domain.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="da.ShoesDA"%>
<%@page import="da.ColorDA"%>
<% ArrayList<Color> colorChoice = (ArrayList<Color>) request.getAttribute("color");  %>
<% ArrayList<Shoes> shoesDetails = (ArrayList<Shoes>) request.getAttribute("shoes");%>
<% String message = (String) request.getAttribute("message");%>
<% boolean chkSuccessAdd = Boolean.TRUE == session.getAttribute("chkSuccessAdd");%>
<% boolean chkError = Boolean.TRUE == session.getAttribute("chkError");%>
<% Integer cusID = (Integer) session.getAttribute("cusID");%>
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

    <body class="load">
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
                                <% for (int i = 0; i < shoesDetails.size(); i++) {
                                        Shoes images = shoesDetails.get(i);
                                %> 
                                <img data-imgbigurl="<%= images.getImg()%>"
                                     src="<%= images.getImg()%>" alt="">
                                <% }%> 
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <div style="padding-bottom: 10px;">
                                <h3  style="margin-top: 30px"><%= shoesDetails.get(0).getProdName()%></h3>
                                <h3><%= shoesDetails.get(0).getBrand()%></h3>
                                <h5>RM<%= shoesDetails.get(0).getPrice()%></h5>
                            </div> 


                            <div class="product__details__quantity" style="margin-bottom: 10px">
                                <h4 style="margin-bottom: 10px">Shoe sizes & colors</h4>
                                <form action="" style="display: flex">
                                    <select id="available-size-color" name="available-size-color">                      
                                        <% for (int i = 0; i < shoesDetails.size(); i++) {
                                                Shoes sizes = shoesDetails.get(i);
                                                Color colors = colorChoice.get(i);
                                        %> 
                                        <option value='<%=sizes.getSize()%>|<%=colors.getColorName()%>'><%= sizes.getSize()%><%= colors.getColorName()%></option>                            
                                        <% }%>
                                    </select> &nbsp;&nbsp;&nbsp; 
                                </form>
                            </div>         
                            <li style="margin-bottom: 10px"><b>Shipping</b>&nbsp;&nbsp;&nbsp;<span>07 days shipping. &nbsp;&nbsp;&nbsp; <samp>Free pickup today</samp></span></li>
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input id="shoes-qty" name="shoes-qty" type="text" value="1">
                                </div>
                            </div>
                            <form id="addToCartForm" action="CartControl" method="POST">
                                <input id="shoesName" type="hidden" value="<%=shoesDetails.get(0).getProdName()%>" name="shoesName">
                                <input id="shoesSize" type="hidden" value="" name="shoesSize">
                                <input id="shoesQty" type="hidden" value="" name="shoesQty">                            
                                <input id="cartAction" type="hidden" value="addToCart" name="cartAction">                            
                                <input id="colorName" type="hidden" value="" name="colorName">  
                                <%if (cusID != null) {%>
                                <input type="button" onclick="submitFunction()" class="btn primary-btn" value="ADD TO CART">
                                <%} else {%>
                                <input type="button" class="btn primary-btn" value="ADD TO CART" disabled>
                                <%}%>
                                <a href="#" class="heart-icon primary-btn" style="background-color: red;"><span style="color: white" class="fa fa-heart-o"></span></a>
                            </form>
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

        <!--GetValue-->             
        <input type="hidden" value="<%=chkSuccessAdd%>" id="chkSuccess">
        <input type="hidden" value="<%=chkError%>" id="chkError">
        <%
            session.setAttribute("chkSuccessAdd", false);
            session.setAttribute("chkError", false);
        %>
        <!--Start Modal display Success add-->
        <div class="modal hide fade" id="myModal1">
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
                                <div class="col-6">
                                    <a href="CartControl?cartAction=displayCart" class="btn btn-primary btn-block" style="border-radius: 50px !important;">CheckOut</a>
                                </div>
                                <div class="col-6">
                                    <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" style="border-radius: 50px !important;">Continue Shopping</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal display Success add-->

        <!--Start Modal display Error-->
        <div class="modal hide fade" id="myModal2">
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
        <!--End Modal display Error-->

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
    <script src="js/price.js"></script>

    <script>
                                    $(window).on('load', function () {
                                        var success = document.getElementById("chkSuccess").value
                                        var error = document.getElementById("chkError").value
                                        if (success == "true") {
                                            $('#myModal1').modal('show');
                                        } else {
                                            $('#myModal1').modal('hide');

                                        }
                                        if (error == "true") {
                                            $('#myModal2').modal('show');
                                        } else {
                                            $('#myModal2').modal('hide');
                                        }
                                    });
                                    function submitFunction() {
                                        var size = document.getElementById("available-size-color");
                                        var sizeValue = size.options[size.selectedIndex].value;
                                        var sizeColorSplit = sizeValue.split("|");
                                        var qty = document.getElementById("shoes-qty").value;
                                        document.getElementById("shoesSize").value = sizeColorSplit[0];
                                        document.getElementById("colorName").value = sizeColorSplit[1];
                                        document.getElementById("shoesQty").value = qty;
                                        document.getElementById("addToCartForm").submit();
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

    </script>
</script>
</html>
