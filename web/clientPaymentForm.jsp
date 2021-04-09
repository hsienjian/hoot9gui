<%-- 
    Document   : test
    Created on : Mar 14, 2021, 2:52:16 PM
    Author     : Admin-jiahie
--%>

<%@page import="domain.Order"%>
<%@page import="domain.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOOT9e</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    

        <style>
            body {
                background: #f5f5f5
            }

            .rounded {
                border-radius: 1rem
            }

            .nav-pills .nav-link {
                color: #555
            }

            .nav-pills .nav-link.active {
                color: white
            }

            input[type="radio"] {
                margin-right: 5px
            }

            .bold {
                font-weight: bold
            }
        </style>
    </head>

    <body>
        <%
            boolean invalid = Boolean.TRUE == session.getAttribute("invalid");
            String errorName = (String) request.getAttribute("errorName");
            String errorCardNum = (String) request.getAttribute("errorCardNum");
            if (errorName == null || errorName.isEmpty() && errorCardNum == null || errorCardNum.isEmpty()) {
                errorName = "";
                errorCardNum = "";
            }
        %>
        <div class="container py-5">
            <!-- For demo purpose -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-6">Payment Step</h1>
                </div>
            </div> <!-- End -->
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card ">
                        <div class="card-header">
                            <div class="bg-secondary shadow-sm pt-4 pl-2 pr-2 pb-2">
                                <h1 class="text-center text-white">Credit Card</h1>
                            </div> <!-- End -->
                            <!-- Credit card form content -->
                            <div class="tab-content">
                                <!-- credit card info-->
                                <div id="credit-card" class="tab-pane fade show active pt-3">
                                    <form role="form" action="PaymentControl" method="POST">
                                        <div class="form-group"> <label for="username">
                                                <h6>Card Owner</h6>
                                            </label> 
                                            <input type="text" name="username" placeholder="Card Owner Name" required class="form-control"> </div>
                                            <%if (invalid) {%>
                                        <p class="text-danger"><%=errorName%></p>
                                        <%}%>
                                        <div class="form-group"> <label for="cardNumber">
                                                <h6>Card number</h6>
                                            </label>
                                            <div class="input-group">
                                                <input name="cardNum" type="number" placeholder="Card Number" maxlength="16" class="form-control" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
                                                <div class="input-group-append"> 
                                                    <span class="input-group-text text-muted"> 
                                                        <svg t="1617637543507" class="icon mr-2" viewBox="0 0 1152 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2149" width="20" height="20"><path d="M940.2 462.6s15.2 74.4 18.6 90H892c6.6-17.8 32-87 32-87-0.4 0.6 6.6-18.2 10.6-29.8l5.6 26.8zM1152 160v704c0 53-43 96-96 96H96c-53 0-96-43-96-96V160c0-53 43-96 96-96h960c53 0 96 43 96 96zM305 662.4L431.4 352h-85l-78.6 212-8.6-43-28-142.8c-4.6-19.8-18.8-25.4-36.4-26.2H65.4l-1.4 6.2c31.6 8 59.8 19.6 84.4 34.2l71.6 270h85z m188.8 0.4L544.2 352h-80.4l-50.2 310.8h80.2z m279.8-101.6c0.4-35.4-21.2-62.4-67.4-84.6-28.2-14.2-45.4-23.8-45.4-38.4 0.4-13.2 14.6-26.8 46.2-26.8 26.2-0.6 45.4 5.6 59.8 11.8l7.2 3.4 11-67.2c-15.8-6.2-41-13.2-72-13.2-79.4 0-135.2 42.4-135.6 102.8-0.6 44.6 40 69.4 70.4 84.4 31 15.2 41.6 25.2 41.6 38.6-0.4 20.8-25.2 30.4-48.2 30.4-32 0-49.2-5-75.4-16.6l-10.6-5-11.2 69.8c18.8 8.6 53.6 16.2 89.6 16.6 84.4 0.2 139.4-41.6 140-106zM1056 662.8L991.2 352h-62.2c-19.2 0-33.8 5.6-42 25.8l-119.4 285H852s13.8-38.4 16.8-46.6H972c2.4 11 9.6 46.6 9.6 46.6H1056z" p-id="2150" fill="#515151"></path></svg>
                                                        <svg t="1617637612045" class="icon" viewBox="0 0 1152 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3477" width="20" height="20"><path d="M965.8 820.6c0 13.6-9.2 23.4-22.4 23.4-13.6 0-22.4-10.4-22.4-23.4 0-13 8.8-23.4 22.4-23.4 13.2 0 22.4 10.4 22.4 23.4z m-621.6-23.4c-14.2 0-22.4 10.4-22.4 23.4 0 13 8.2 23.4 22.4 23.4 13 0 21.8-9.8 21.8-23.4-0.2-13-8.8-23.4-21.8-23.4z m235-0.6c-10.8 0-17.4 7-19 17.4h38.2c-1.8-11.4-8.8-17.4-19.2-17.4z m215.6 0.6c-13.6 0-21.8 10.4-21.8 23.4 0 13 8.2 23.4 21.8 23.4 13.6 0 22.4-9.8 22.4-23.4 0-13-8.8-23.4-22.4-23.4z m211.8 52.2c0 0.6 0.6 1 0.6 2.2 0 0.6-0.6 1-0.6 2.2-0.6 0.6-0.6 1-1 1.6-0.6 0.6-1 1-2.2 1-0.6 0.6-1 0.6-2.2 0.6-0.6 0-1 0-2.2-0.6-0.6 0-1-0.6-1.6-1-0.6-0.6-1-1-1-1.6-0.6-1-0.6-1.6-0.6-2.2 0-1 0-1.6 0.6-2.2 0-1 0.6-1.6 1-2.2 0.6-0.6 1-0.6 1.6-1 1-0.6 1.6-0.6 2.2-0.6 1 0 1.6 0 2.2 0.6 1 0.6 1.6 0.6 2.2 1s0.4 1.2 1 2.2z m-4.4 2.8c1 0 1-0.6 1.6-0.6 0.6-0.6 0.6-1 0.6-1.6 0-0.6 0-1-0.6-1.6-0.6 0-1-0.6-2.2-0.6h-3.2v7h1.6V852h0.6l2.2 2.8h1.6l-2.2-2.6zM1152 162v704c0 53-43 96-96 96H96c-53 0-96-43-96-96V162c0-53 43-96 96-96h960c53 0 96 43 96 96zM128 441.2c0 153 124.2 277 277 277 54.4 0 107.8-16.4 153-46.2-145.8-118.6-144.8-342.4 0-461-45.2-30-98.6-46.2-153-46.2-152.8-0.2-277 124-277 276.4z m448 217.6c141-110 140.4-324.4 0-435-140.4 110.6-141 325.2 0 435z m-284.6 152.6c0-17.4-11.4-28.8-29.4-29.4-9.2 0-19 2.8-25.6 13-4.8-8.2-13-13-24.4-13-7.6 0-15.2 2.8-21.2 10.8V784h-16.4v73.4h16.4c0-37.8-5-60.4 18-60.4 20.4 0 16.4 20.4 16.4 60.4h15.8c0-36.6-5-60.4 18-60.4 20.4 0 16.4 20 16.4 60.4h16.4v-46z m89.8-27.4h-15.8v8.8c-5.4-6.6-13-10.8-23.4-10.8-20.6 0-36.4 16.4-36.4 38.6 0 22.4 15.8 38.6 36.4 38.6 10.4 0 18-3.8 23.4-10.8v9.2h15.8V784z m81 51.2c0-30-45.8-16.4-45.8-30.4 0-11.4 23.8-9.6 37-2.2l6.6-13c-18.8-12.2-60.4-12-60.4 16.4 0 28.6 45.8 16.6 45.8 30 0 12.6-27 11.6-41.4 1.6l-7 12.6c22.4 15.2 65.2 12 65.2-15z m70.8 18.6l-4.4-13.6c-7.6 4.2-24.4 8.8-24.4-8.2v-33.2h26.2V784h-26.2v-22.4h-16.4V784h-15.2v14.6h15.2V832c0 35.2 34.6 28.8 45.2 21.8z m26.6-26.8h55c0-32.4-14.8-45.2-34.8-45.2-21.2 0-36.4 15.8-36.4 38.6 0 41 45.2 47.8 67.6 28.4l-7.6-12c-15.6 12.8-39.2 11.6-43.8-9.8z m118.2-43c-9.2-4-23.2-3.6-30.4 8.8V784h-16.4v73.4h16.4V816c0-23.2 19-20.2 25.6-16.8l4.8-15.2z m21.2 36.6c0-22.8 23.2-30.2 41.4-16.8l7.6-13c-23.2-18.2-65.4-8.2-65.4 30 0 39.6 44.8 47.6 65.4 30l-7.6-13c-18.4 13-41.4 5.2-41.4-17.2z m133.4-36.6H816v8.8c-16.6-22-59.8-9.6-59.8 27.8 0 38.4 44.8 49.4 59.8 27.8v9.2h16.4V784z m67.4 0c-4.8-2.4-22-5.8-30.4 8.8V784h-15.8v73.4h15.8V816c0-22 18-20.6 25.6-16.8l4.8-15.2z m80.6-29.8h-15.8v38.6c-16.4-21.8-59.8-10.2-59.8 27.8 0 38.8 45 49.2 59.8 27.8v9.2h15.8v-103.4z m15.2-150.2v9.2h1.6V604h3.8v-1.6h-9.2v1.6h3.8z m13.2 247.6c0-1 0-2.2-0.6-3.2-0.6-0.6-1-1.6-1.6-2.2-0.6-0.6-1.6-1-2.2-1.6-1 0-2.2-0.6-3.2-0.6-0.6 0-1.6 0.6-2.8 0.6-1 0.6-1.6 1-2.2 1.6-1 0.6-1.6 1.6-1.6 2.2-0.6 1-0.6 2.2-0.6 3.2 0 0.6 0 1.6 0.6 2.8 0 0.6 0.6 1.6 1.6 2.2 0.6 0.6 1 1 2.2 1.6 1 0.6 2.2 0.6 2.8 0.6 1 0 2.2 0 3.2-0.6 0.6-0.6 1.6-1 2.2-1.6 0.6-0.6 1-1.6 1.6-2.2 0.6-1.2 0.6-2.2 0.6-2.8z m6.4-249.4h-2.8l-3.2 7-3.2-7h-2.8v10.8h1.6v-8.2l3.2 7h2.2l2.8-7v8.2h2.2v-10.8z m8.8-161c0-152.4-124.2-276.6-277-276.6-54.4 0-107.8 16.4-153 46.2 144.2 118.6 146.4 343 0 461 45.2 30 99 46.2 153 46.2 152.8 0.2 277-123.8 277-276.8z" fill="#515151" p-id="3478"></path></svg>   
                                                    </span> 
                                                </div>
                                            </div>
                                            <%if (invalid) {%>
                                            <p class="text-danger"><%=errorCardNum%></p>
                                            <%}%>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="form-group"> <label><span class="hidden-xs">
                                                            <h6>Expiration Date</h6>
                                                        </span></label>
                                                    <div class="input-group"> 
                                                        <select class="form-control" name='expireMM' id='expireMM'>
                                                            <option value=''>Month</option>
                                                            <option value='01'>01</option>
                                                            <option value='02'>02</option>
                                                            <option value='03'>03</option>
                                                            <option value='04'>04</option>
                                                            <option value='05'>05</option>
                                                            <option value='06'>06</option>
                                                            <option value='07'>07</option>
                                                            <option value='08'>08</option>
                                                            <option value='09'>09</option>
                                                            <option value='10'>10</option>
                                                            <option value='11'>11</option>
                                                            <option value='12'>12</option>
                                                        </select>
                                                        <select class="form-control" name='expireYY' id='expireYY'>
                                                            <option value=''>Year</option>
                                                            <option value='21'>2021</option>
                                                            <option value='22'>2022</option>
                                                            <option value='23'>2023</option>
                                                            <option value='24'>2024</option>
                                                            <option value='25'>2025</option>
                                                            <option value='26'>2026</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group mb-4"> <label data-toggle="tooltip" title="Three digit CV code on the back of your card">
                                                        <h6>CVV <i class="fa fa-question-circle d-inline"></i></h6>
                                                    </label> <input type="number" maxlength="4" class="form-control"  oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"> </div>
                                            </div>
                                        </div>
                                        <input type="hidden" value="paymentConfirmation" name="paymentAction">
                                        <div class="card-footer"> <button type="submit" class="subscribe btn btn-primary btn-block shadow-sm"> Confirm Payment </button>
                                    </form>
                                    <a href="cancelPayment.jsp" class="subscribe btn btn-danger btn-block shadow-sm"> Cancel Payment</a>
                                </div>
                            </div> <!-- End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script>
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</html>
