<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Hoot9e Shoes Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/homeDesign.css">
    <link rel="stylesheet" href="css/clientFooter.css">
    <link rel="stylesheet" href="css/clientHeader1.css">
    <link rel="stylesheet" href="css/clientSidebar1.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<jsp:include page="/components/clientHeader.jsp" />

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
<div id="shoesSec" class="container text-center" >
  <h3>VISION AND MISSION</h3>
  <p><em>We Hoot SHOES!</em></p>
  <p>We have created a shoes website. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  <br>
  <div class="row">
      
    <div class="col-sm-4">
      <!--<a href="#demo">-->
        <img src="images/DiorxJordan.jpg" class="person" alt="dior">
      <!--</a>-->
    </div>
      
    <div class="col-sm-4">
      <!--<a href="#demo2">-->
        <img src="images/converse.jpg" class="person" alt="converse">
      <!--</a>-->
    </div>
      
    <div class="col-sm-4">
      <!--<a href="#demo3">-->
        <img src="images/adidas.jpg" class="person" alt="adidas">
      <!--</a>-->
    </div>
 
  </div>
  <div class="row">

      <div class="col-sm-4">
      <!--<a href="#demo">-->
        <img src="images/birkenstock.jpg" class="person" alt="birkenstock">
      <!--</a>-->
      <p class="text-center"><strong>Sandals</strong></p><br>
    </div>
      
    <div class="col-sm-4">
      <!--<a href="#demo2">-->
        <img src="images/kalenji.jpg" class="person" alt="kalenji">
      <!--</a>-->
      <p class="text-center"><strong>Sport Shoes</strong></p><br>
    </div>
      
    <div class="col-sm-4">
      <!--<a href="#demo3">-->
        <img src="images/brownboot.jpg" class="person" alt="brownboot">
      <!--</a>-->
      <p class="text-center"><strong>Boots</strong></p><br>
    </div>
      
  </div>
  <button class="btn" data-toggle="modal" data-target="#myModal" style="margin-top: 15%;"><a href="ShoesControl?option=0">Click Here to Check Out More Shoes</a></button>  
</div>

<!-- Container (NEW Section) -->
<div id="tour" class="bg-1">
  <div class="container" >
    <h3 class="text-center">YOUR CHOICE</h3>

    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="images/styleup.jpg" width="400" height="300">
          <p><strong>Style Up</strong></p>
          <p>Keep it playful with trends that are built to elevate your look and extend your fashion repertoire</p>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="images/run.jpg" width="400" height="300">
          <p><strong>Let's Run</strong></p>
          <p>Our activewear catalogue is made for optimum performance to keep you at the top of your game.</p>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="images/staywarm.jpg" width="400" height="300">
          <p><strong>Boots up</strong></p>
          <p>Prepare to take a Hike! Winter Trip! Or any other season that we have prepared for you</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">Contact Us</h3>
  <div class="row" style="padding-top: 30px; margin-left: 30%">
      
    <div class="col-md-4">
      <p>For more information</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Malaysia, MY</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +60 0123456789</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: hoot9e@mail.com</p>
    </div>
    <div class="col-md-5">
        <p>SOCIAL MEDIA</p>
        <p>Instagram : hoot9e</p>
        <p>Facebook : hoot9e</p>
        <p>Twitter : hoot9e</p>
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
  </a><br>
  <p>Back to Top</p> 
</footer>
<%@include  file="components/clientFooter.jsp"%>
</body>

<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip(); 
  
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    if (this.hash !== "") {

      event.preventDefault();

      var hash = this.hash;

      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        window.location.hash = hash;
      });
    } 
  });
})
</script>
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
</html>
