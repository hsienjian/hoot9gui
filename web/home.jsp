<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Theme Made By www.w3schools.com - No Copyright -->
        <title>Bootstrap Theme The Band</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/homeDesign.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/clientFooter.css">
        <link rel="stylesheet" href="css/clientHeader1.css">
        <link rel="stylesheet" href="css/clientSidebar1.css">
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
        <%@include  file="components/clientHeader.jsp"%>
        <div id="homeSlide" class="carousel slide" data-ride="carousel">

            <div id="slider">
                <figure>
                    <img src="images/shoe1.jpg" alt="shoeShow">
                    <img src="images/shoe2.jpg" alt="shoeShow">
                    <img src="images/shoe3.jpg" alt="shoeShow">
                </figure>
            </div>
            <h1 style="text-align: center; margin: 20px; margin-bottom: 0px">W E L C O M E</h1>
        </div>

        <!-- Container (The Info Section) -->
        <div id="band" class="container text-center" >
            <h3>VISION AND MISSION</h3>
            <p><em>We Hoot SHOES!</em></p>
            <p>We have created a shoes website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <br>
            <div class="row">

                <div class="col-sm-4">
                    <a href="#demo">
                        <img src="images/DiorxJordan.jpg" class="person" alt="dior">
                    </a>
                    <p class="text-center"><strong>Nike</strong></p><br>
                </div>

                <div class="col-sm-4">
                    <a href="#demo2">
                        <img src="images/converse.jpg" class="person" alt="converse">
                    </a>
                    <p class="text-center"><strong>Converse</strong></p><br>
                </div>

                <div class="col-sm-4">
                    <a href="#demo3">
                        <img src="images/adidas.jpg" class="person" alt="adidas">
                    </a>
                    <p class="text-center"><strong>Adidas</strong></p><br>
                </div>

            </div>
            <div class="row">

                <div class="col-sm-4">
                    <a href="#demo">
                        <img src="images/birkenstock.jpg" class="person" alt="birkenstock">
                    </a>
                    <p class="text-center"><strong>Sandals</strong></p><br>
                </div>

                <div class="col-sm-4">
                    <a href="#demo2">
                        <img src="images/kalenji.jpg" class="person" alt="kalenji">
                    </a>
                    <p class="text-center"><strong>Sport Shoes</strong></p><br>
                </div>

                <div class="col-sm-4">
                    <a href="#demo3">
                        <img src="images/brownboot.jpg" class="person" alt="brownboot">
                    </a>
                    <p class="text-center"><strong>Boots</strong></p><br>
                </div>

                <a class="btn" href="viewProduct.jsp" data-toggle="modal" data-target="#myModal" style="margin-top: 50px">More Shoes</a>  
            </div>
        </div>

        <!-- Container (NEW Section) -->
        <div id="tour" class="bg-1">
            <div class="container" >
                <h3 class="text-center">NEW THIS WEEK</h3>

                <div class="row text-center">
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="images/styleup.jpg" alt="Paris" width="400" height="300">
                            <p><strong>Style Up</strong></p>
                            <p>Dior x Converse</p>
                            <button class="btn" data-toggle="modal" data-target="#myModal">Buy Now</button>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="images/run.jpg" alt="New York" width="400" height="300">
                            <p><strong>Let's Run</strong></p>
                            <p>Nike Uni Sport Shoe</p>
                            <button class="btn" data-toggle="modal" data-target="#myModal">Buy Now</button>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="thumbnail">
                            <img src="images/staywarm.jpg" alt="San Francisco" width="400" height="300">
                            <p><strong>Stay Warm</strong></p>
                            <p>Pronounce Fall Blue Boot</p>
                            <button class="btn" data-toggle="modal" data-target="#myModal">Buy Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Container (Contact Section) -->
        <div id="contact" class="container">
            <h3 class="text-center">Contact Us</h3>

            <div class="row">
                <div class="col-md-4">
                    <p>For more information</p>
                    <p><span class="glyphicon glyphicon-map-marker"></span>Malaysia, MY</p>
                    <p><span class="glyphicon glyphicon-phone"></span>Phone: +60 0123456789</p>
                    <p><span class="glyphicon glyphicon-envelope"></span>Email: hoot9e@mail.com</p>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
                        </div>
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                        </div>
                    </div>
                    <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
                    <br>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <button class="btn pull-right" type="submit">Send</button>
                        </div>
                    </div>
                </div>
            </div>
            <br>
        </div>

        <!-- Image of shop -->
        <img src="images/shop.jpg" class="img-responsive" style="width:100%;">

        <!--Brand Name-->
        <div id="contact" class="container">
            <h3 class="text-center">FEATURED BRANDS</h3>
            <div class="row">
                <div class="col-sm-4">
                    <img src="images/nikelogo.png" class="brand" alt="logo">
                </div>
                <div class="col-sm-4">
                    <img src="images/adidaslogo.png" class="brand" alt="logo">
                </div>

                <div class="col-sm-4">
                    <img src="images/converselogo.png" class="brand" alt="logo">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <img src="images/pumalogo.png" class="brand" alt="logo">
                </div>
                <div class="col-sm-4">
                    <img src="images/birkenstock-logo.png" class="brand" alt="logo">
                </div>
                <div class="col-sm-4" style="margin-top: 8%">
                    <h2 style="font-size: 25px">AND MORE...</h2>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="text-center">
            <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a><br><br>
            <p>Back to Top</p> 
        </footer>
        <%@include  file="components/clientFooter.jsp" %>
        <script src="js/checkHover.js"></script>
        <script>
            $(document).ready(function () {
                // Initialize Tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {

                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {

                        // Prevent default anchor click behavior
                        event.preventDefault();

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {

                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });
            })
        </script>
    </body>

</html>
