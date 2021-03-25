<%-- 
    Document   : shoppingCart
    Created on : Mar 21, 2021, 3:02:46 PM
    Author     : Admin-jiahie
--%>

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
                font-size: 19px;
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
            }
        </style>
    </head>

    <body>
        <%@include file="components/clientHeader.jsp"%>

        <div class="container-fluid text-center title-con font-style-dinot" style="margin-top: 120px;">
            <span class="h2">CHECKOUT</span><br>
            <hr>
            <p class="h4 text-dark text-left">Product</p>
        </div>
        <!--Start Empty Cart-->
        <div class="container mt-5 mb-5 font-style-dinot" style="display:none;">
            <p class="mb-3">Your cart is empty, please continue to shopping to add your cart.</p>
            <a href="#" class="btn btn-dark btn-sm">Continue Shopping</a>
        </div>
        <!--End Empty Cart-->

        <!--Start Cart Content-->
        <div class="container-fluid mb-4 font-style-dinot">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-sm-12 pl-0 pr-0 ">
                    <div class="container-fluid vertical-scrollable"> 
                        <div class="row">  
                            <div class="col-md-12"> 
                                <!--Start product List-->
                                <%for (int i = 0; i < 5; i++) { %>
                                <div class="row product-container ml-0 mr-0 pt-4 pb-0">
                                    <div class="col-md-4 col-sm-12">
                                        <img class="product-img img-thumbnail border-0" style="padding-top:90px;" src="images/adidas.jpg" alt="pic1">
                                    </div>
                                    <div class="col-md-8 col-sm-12 pr-4">
                                        <p class="h3 font-weight-bold">Nike kid</p>
                                        <p class="h4">RM&nbsp;189</p>
                                        <form>
                                            <div class="form-group ml-2 mb-2">
                                                <label class="h5" for="">Color :</label>
                                                <input type="text" class="input-style form-control form-control-sm" id="" name="color" value="Black" disabled>
                                            </div>
                                            <div class="form-group ml-2 mb-2">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6 col-sm-6">
                                                        <label class="h5" for="">Size :</label>
                                                        <select id="" class="form-control form-control-sm input-style2">
                                                            <option selected>4.5 UK</option>
                                                            <option>5.0 UK</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6 col-sm-6">
                                                        <label class="h5" for="">Quantity :</label>
                                                        <input type="number" class="form-control form-control-sm input-style2" id="" name="quantity" min="1" max="30" value="1">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-row ml-2">
                                                    <div class="form-group col-md-4 col-sm-4 col-4 mb-0">
                                                        <button class="btn pt-0 pb-0 pl-0 pr-0" type="button">
                                                            <svg t="1616597917580" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1697" width="25" height="25">
                                                            <path d="M704.15 384a32 32 0 0 0 32 32H896a32 32 0 0 0 32-32V224a32 32 0 0 0-64 0v66.92C788.5 171.29 655 96 511.9 96c-229.37 0-416 186.62-416 416s186.63 416 416 416a415.67 415.67 0 0 0 413.32-368.4l0.47-4.22A32 32 0 0 0 897.4 520c-17.06-1.56-33.4 10.69-35.34 28.28l-0.44 4.13A351.68 351.68 0 0 1 511.9 864c-194.09 0-352-157.91-352-352s157.91-352 352-352c131.54 0 253.6 75.16 313.41 192h-89.16a32 32 0 0 0-32 32z" p-id="1698" fill="#8a8a8a"></path>
                                                            </svg>
                                                            <span class="font-light">Update</span>
                                                        </button>
                                                    </div>
                                                    <div class="form-group col-md-5 col-sm-4 col-4 mb-0">
                                                        <button class="btn pt-0 pb-0 pl-0 pr-0" type="button" data-toggle="modal" data-target="#myModal">
                                                            <svg t="1616598933519" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3871" width="28" height="28">
                                                            <path d="M779.3 228.2h-113v-35.4c0-34.9-28.4-63.3-63.3-63.3H425c-34.9 0-63.3 28.4-63.3 63.3v35.4h-113c-32.9 0-59.7 26.8-59.7 59.7v38.5c0 32.9 26.8 59.7 59.7 59.7h1.8v412.8c0 54.1 44 98.1 98.1 98.1h330.9c54.1 0 98.1-44 98.1-98.1V386.1h1.8c32.9 0 59.7-26.8 59.7-59.7v-38.5c-0.1-32.9-26.8-59.7-59.8-59.7z m-374.9-35.4c0-11.4 9.2-20.6 20.6-20.6h178c11.4 0 20.6 9.2 20.6 20.6v35.4H404.4v-35.4z m330.4 606c0 30.5-24.8 55.4-55.4 55.4H348.5c-30.5 0-55.4-24.8-55.4-55.4V386.1h441.7v412.7z m61.5-472.4c0 9.4-7.6 17-17 17H248.7c-9.4 0-17-7.6-17-17v-38.5c0-9.4 7.6-17 17-17h530.7c9.4 0 17 7.6 17 17v38.5z" p-id="3872" fill="#dc3545"></path><path d="M377.9 462.3h42.7v317.5h-42.7zM492.6 462.3h42.7v317.5h-42.7zM607.4 462.3h42.7v317.5h-42.7z" p-id="3873" fill="#dc3545"></path>
                                                            </svg>
                                                            <span class="text-danger">Remove</span>
                                                        </button>
                                                    </div>
                                                    <!--Start Modal-->
                                                    <div id="myModal" class="modal">
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
                                                                    <button type="button" class="btn btn-danger">Remove</button>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--End Modal-->
                                                    <div class="form-group col-md-3 col-sm-4 col-12 mb-0 text-right">
                                                        <span class="font-light">Subtotal</span>
                                                        <p class="font-light">RM 189</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
                            <div class="col-md-6 col-sm-6 col-6 text-right font-light"><span>RM 567.00</span></div>
                        </div>
                        <div class="row pb-3 font-size-14">
                            <div class="col-md-6 col-sm-6 col-6 font-light">Shipping</div>
                            <div class="col-md-6 col-sm-6 col-6 text-right font-light"><span>RM 5.00</span></div>
                        </div>
                        <div class="border-line-2"></div>
                        <div class="row pb-2 pt-2 font-size-19">
                            <div class="col-md-6 col-sm-6 col-6 ">Total</div>
                            <div class="col-md-6 col-sm-6 col-6 text-right"><span>RM 572.00</span></div>
                        </div>
                        <div class="row pb-3 font-size-13">
                            <div class="col-md-12 col-sm-12 col-12 font-light"><span>*Estimate delivery time will be in 7 working days</span></div>
                        </div>
                        <div class="border-line-2"></div>
                        <div class="row pt-3 pb-3">
                            <div class="col-md-12 col-sm-12 col-12">
                                <form>
                                    <button type="button" class="btn text-white btn-block" style="border-radius: 50px !important;background-color:#000000;">
                                        Checkout
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
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
    <script>
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
</html>
