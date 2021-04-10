<%--
    Document   : clientLogin
    Created on : Mar 31, 2021, 7:07:14 PM
    Author     : Ruey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Client Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

        </style>
        <%
            Object activeCustomer = session.getAttribute("activeCustomer");
            Object errorMsg = request.getAttribute("errorMsg");
            if (activeCustomer != null) {
                response.sendRedirect("home.jsp");
            }
        %>
    </head>

    <body class="my-login-page">
        <%@include  file="components/clientHeader.jsp"%>
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="container-fluid text-center title-con font-style-dinot" style="margin-top: 120px;">
                            <span class="h2">Member Login</span><br>
                            <hr>
                            <br>
                        </div>
                        <div class="card fat">
                            <div class="card-body">
                                <h1 class="card-title"> HOOT9e</h1>
                                <form method="POST" class="" id="loginForm" action="ClientLoginControl">
                                    <div class="form-group">
                                        <label for="email">E-Mail Address</label>
                                        <input id="customer_email" type="email" class="form-control" name="customer_email" value="" required autofocus>
                                    </div>
                                    <% session.removeAttribute("activeCustomer");
                                        if (activeCustomer == null) {%>
                                    <font style="position:absolute;font-weight:600" color="#B22222"><%= (errorMsg == null) ? "" : errorMsg%></font>
                                    <% } else {
                                            String site = "/hoot9e/home.jsp";
                                            response.setStatus(response.SC_MOVED_TEMPORARILY);
                                            response.setHeader("location", site);
                                        }%>
                                    <div class="form-group">
                                        <label for="password">Password
                                            <a href="" class="float-right">
                                                Forgot Password?
                                            </a>
                                        </label>
                                        <input id="customer_password" type="password" class="form-control" name="customer_password" required data-eye>
                                    </div>
                                    <br>${message}
                                    <br><br>

                                    <div class="form-group">
                                        <div class="custom-checkbox custom-control">
                                            <input type="checkbox" name="remember" id="remember" class="custom-control-input">
                                            <label for="remember" class="custom-control-label">Remember Me</label>
                                        </div>
                                    </div>

                                    <div class="form-group m-0">
                                        <button type="submit" class="btn btn-primary btn-block" value="LOGIN" id="login">
                                            Login
                                        </button>
                                    </div>
                                    <div class="mt-4 text-center">
                                        Don't have an account? <a href="clientRegister.jsp">Create One</a>
                                    </div>
                                </form>
                            </div>
                            <div class="footer">
                                abc123
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/my-login.js"></script>

        <%@include  file="components/clientFooter.jsp" %>
    </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="js/checkHover.js"></script>



    <script type="text/javascript">

        $(document).ready(function () {
            $("#loginForm").validate({
                rules: {
                    email: {
                        required: true,
                        email: true
                    },

                    password: "required";
                },

                messages: {
                    email: {
                        required: "Please enter email",
                        email: "Please enter a valid email address"
                    },

                    password: "Please enter password"
                }
            });

        });
    </script>
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
        });

    </script>
</html>

