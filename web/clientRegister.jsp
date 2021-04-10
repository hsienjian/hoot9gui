<%-- 
    Document   : test
    Created on : Mar 14, 2021, 2:52:16 PM
    Author     : Admin-jiahie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Client Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
        <style>
            body {
                height: 100%;

            }


            body.my-login-page {
                background-color: #f7f9fb;
                font-size: 15px;

            }

            .my-login-page .card-wrapper {
                width: 800px;
                margin-bottom: 8%;
            }

            .my-login-page .card {
                border-color: transparent;
                box-shadow: 0 4px 8px rgba(0,0,0,.05);
            }

            .my-login-page .card.fat {
                padding: 15%;
            }

            .my-login-page .card .card-title {
                margin-bottom: 50px;
            }

            .my-login-page .form-control {
                border-width: 2px;
            }

            .my-login-page .form-group label {
                width: 100%;
            }

            .my-login-page .btn.btn-block {
                padding: 12px 10px;
            }

            .errorMsg{
                width: 100%;
                margin: 0px auto;
                margin-top: 0px;
                color: #a94442;
                background: #f2dede;
                text-align: center;
            }
        </style>
    </head>

    <body class="my-login-page">
        <%@include  file="components/clientHeader.jsp"%>

        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="container-fluid text-center title-con font-style-dinot" style="margin-top: 120px;">
                            <span class="h2">Member Register</span><br>
                            <hr>
                            <br>
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <form method="GET" class="my-login-validation" action="ClientRegisterControl">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input id="firstName" type="text" class="form-control" name="firstName" required autofocus>
                                        <div class="invalid-feedback">
                                            What's your first name?
                                        </div>
                                        <div class="form-group">
                                            <div>
                                                <label for="lastName">Last Name</label>
                                                <input id="lastName" type="text" class="form-control" name="lastName" required >
                                                <div class="invalid-feedback">
                                                    What's your last name?
                                                </div>
                                            </div>
                                            <div>
                                                <label for="age">Age</label>
                                                <input id="age" type="text" class="form-control" name="age" required >
                                                <div class="invalid-feedback">
                                                    What's your age?
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="email">E-Mail Address</label>
                                                <input id="email" type="email" class="form-control" name="email" required>
                                                <div class="invalid-feedback">
                                                    Your email is invalid
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="gender">Gender</label>
                                                <select class="form-control" name="gender" id="gender" required>
                                                    <option disabled="disabled" selected="selected">--Choose option--</option>
                                                    <option>N/A</option>
                                                    <option>Male</option>
                                                    <option>Female</option>
                                                </select>
                                                <div class="invalid-feedback">
                                                    Enter the gender
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Address">Address</label>
                                                <textarea class="form-control" placeholder="Key in your address..." name="address" required></textarea>
                                                <div class="invalid-feedback">
                                                    Address is required
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="phoneNo">Phone Number</label>
                                                <input id="phoneNo" type="password" class="form-control" name="phoneNo" required>
                                                <div class="invalid-feedback">
                                                    Enter the phone number
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input id="password" type="password" class="form-control" name="password" required data-eye>
                                                <div class="invalid-feedback">
                                                    Password is required
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="confirmPassword">Confirm Password</label>
                                                <input id="confirmPassword" type="password" class="form-control" name="confirmPassword" required data-eye>
                                                <div class="invalid-feedback">
                                                    Confirm password is required
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="custom-checkbox custom-control">
                                                    <input type="checkbox" name="agree" id="agree" class="custom-control-input" required>
                                                    <label for="agree" class="custom-control-label">I agree to the <a href="#">Terms and Conditions</a></label>
                                                    <div class="invalid-feedback">
                                                        You must agree with our Terms and Conditions
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group m-0">
                                                <button type="submit" class="btn btn-primary btn-block" name="addCustomer" id="addCustomer">
                                                    Register
                                                </button>
                                            </div>
                                            <div class="mt-4 text-center">
                                                Already have an account? <a href="clientLogin.jsp">Login</a>
                                            </div>

                                        </div>

                                    </div>
                                </form>
                            </div>

                        </div>

                    </div>

                </div>


            </div>
        </section>
        <%@include  file="components/clientFooter.jsp" %>

    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>

    <!-- javascript for registeration form validation-->
    <script>

        $(function () {

            $("input[type='password'][data-eye]").each(function (i) {
                var $this = $(this),
                        id = 'eye-password-' + i,
                        el = $('#' + id);

                $this.wrap($("<div/>", {
                    style: 'position:relative',
                    id: id
                }));

                $this.css({
                    paddingRight: 60
                });
                $this.after($("<div/>", {
                    html: 'Show',
                    class: 'btn btn-primary btn-sm',
                    id: 'passeye-toggle-' + i,
                }).css({
                    position: 'absolute',
                    right: 10,
                    top: ($this.outerHeight() / 2) - 12,
                    padding: '2px 7px',
                    fontSize: 12,
                    cursor: 'pointer',
                }));

                $this.after($("<input/>", {
                    type: 'hidden',
                    id: 'passeye-' + i
                }));

                var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

                if (invalid_feedback.length) {
                    $this.after(invalid_feedback.clone());
                }

                $this.on("keyup paste", function () {
                    $("#passeye-" + i).val($(this).val());
                });
                $("#passeye-toggle-" + i).on("click", function () {
                    if ($this.hasClass("show")) {
                        $this.attr('type', 'password');
                        $this.removeClass("show");
                        $(this).removeClass("btn-outline-primary");
                    } else {
                        $this.attr('type', 'text');
                        $this.val($("#passeye-" + i).val());
                        $this.addClass("show");
                        $(this).addClass("btn-outline-primary");
                    }
                });
            });

            $(".my-login-validation").submit(function () {
                var form = $(this);
                if (form[0].checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.addClass('was-validated');
            });
        });

    </script>

</html>
