<%-- 
    Document   : clientHeader.jsp
    Created on : Mar 17, 2021, 11:34:49 AM
    Author     : Admin-jiahie
--%>

<div id="myNav" class="overlay">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="sidebar-nav container-fluid">
        <a href="home.jsp">Home</a>
        <a href="ShoesControl?option=0">Shoes</a>
    </div>
</div>
<nav class="navbar navbar-expand fixed-top navbar-dark bg-white">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <li class="nav-item active">
                <a class="side-bar nav-link pointer" onclick="openNav()">
                    <svg t="1615555886450" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="22275" width="30" height="30"><path d="M232.369231 282.813046h559.261538a31.507692 31.507692 0 0 0 0-63.015384h-559.261538a31.507692 31.507692 0 0 0 0 63.015384zM791.630769 480.492308h-559.261538a31.507692 31.507692 0 0 0 0 63.015384h559.261538a31.507692 31.507692 0 0 0 0-63.015384zM791.630769 741.186954h-559.261538a31.507692 31.507692 0 0 0 0 63.015384h559.261538a31.507692 31.507692 0 0 0 0-63.015384z" p-id="22276" fill="#bfbfbf"></path></svg>
                </a>
            </li>
        </ul>
        <ul class="nav navbar-nav mx-auto">
            <li class="nav-item"><a class="" href="mainpage.php"><img src="images/hoot9elogo-01.png" alt="logo" width="90%"></img></a></li>
        </ul>
        <ul class="navbar-nav" style="display: none;">
            <li class="nav-item pr-1">
                <a class="user-icon nav-link pointer" style="margin-right:20px;" id="user-dropdown" onmouseover="hoverStartDropdown(this)" onmouseout="hoverEndDropdown2(this)">
                    <svg t="1615659930705" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1527" width="30" height="30"><path d="M509.3 511.3c-117.1 0-212.4-95.3-212.4-212.4S392.2 86.5 509.3 86.5c117.1 0 212.4 95.3 212.4 212.4s-95.3 212.4-212.4 212.4z m0-374.8c-89.5 0-162.4 72.9-162.4 162.4s72.9 162.4 162.4 162.4 162.4-72.9 162.4-162.4-72.9-162.4-162.4-162.4z" p-id="1528" id="user-first" fill="#bfbfbf"></path><path d="M812.5 903.5H219.1c-29.3 0-56.7-13.1-75.1-35.9-18.4-22.8-25.4-52.4-19.1-81.1 19.6-90.5 68.9-172.6 138.7-231.4 34.9-29.4 74-52.3 116.1-68.1 43.6-16.4 89.4-24.6 136.2-24.6s92.6 8.3 136.2 24.6c42.1 15.8 81.1 38.7 116 68.1 69.8 58.7 119 140.9 138.7 231.4 6.2 28.7-0.7 58.3-19.1 81.1-18.5 22.8-45.9 35.9-75.2 35.9zM515.8 512.4c-40.8 0-80.7 7.2-118.6 21.5-36.8 13.8-70.9 33.8-101.4 59.5-61.4 51.7-104.7 124-122 203.7-3 13.9 0.3 28.1 9.2 39.1 8.9 11 22 17.3 36.2 17.3h593.4c14.1 0 27.3-6.3 36.2-17.3 8.9-11 12.2-25.3 9.2-39.1-17.3-79.7-60.7-152.1-122-203.7-30.5-25.7-64.7-45.7-101.4-59.5-38.1-14.3-78.1-21.5-118.8-21.5z" p-id="1529" id="user-second" fill="#bfbfbf"></path></svg>
                </a>
                <div class="dropdown-content" id="user-dropdown-content" onmouseover="hoverStartDropdown2(this)" onmouseout="hoverEndDropdown2(this)">
                    <a href="#">Login</a>
                    <a href="#">Register</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav" style="">
            <li class="nav-item pr-1">
                <a class="user-icon1 nav-link pointer" id="user-dropdown-1" onmouseover="hoverStartDropdown1(this)" onmouseout="hoverEndDropdown3(this)">
                    <svg t="1615659930705" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1527" width="30" height="30"><path d="M509.3 511.3c-117.1 0-212.4-95.3-212.4-212.4S392.2 86.5 509.3 86.5c117.1 0 212.4 95.3 212.4 212.4s-95.3 212.4-212.4 212.4z m0-374.8c-89.5 0-162.4 72.9-162.4 162.4s72.9 162.4 162.4 162.4 162.4-72.9 162.4-162.4-72.9-162.4-162.4-162.4z" p-id="1528" id="user-first-1" fill="#bfbfbf"></path><path d="M812.5 903.5H219.1c-29.3 0-56.7-13.1-75.1-35.9-18.4-22.8-25.4-52.4-19.1-81.1 19.6-90.5 68.9-172.6 138.7-231.4 34.9-29.4 74-52.3 116.1-68.1 43.6-16.4 89.4-24.6 136.2-24.6s92.6 8.3 136.2 24.6c42.1 15.8 81.1 38.7 116 68.1 69.8 58.7 119 140.9 138.7 231.4 6.2 28.7-0.7 58.3-19.1 81.1-18.5 22.8-45.9 35.9-75.2 35.9zM515.8 512.4c-40.8 0-80.7 7.2-118.6 21.5-36.8 13.8-70.9 33.8-101.4 59.5-61.4 51.7-104.7 124-122 203.7-3 13.9 0.3 28.1 9.2 39.1 8.9 11 22 17.3 36.2 17.3h593.4c14.1 0 27.3-6.3 36.2-17.3 8.9-11 12.2-25.3 9.2-39.1-17.3-79.7-60.7-152.1-122-203.7-30.5-25.7-64.7-45.7-101.4-59.5-38.1-14.3-78.1-21.5-118.8-21.5z" p-id="1529" id="user-second-1" fill="#bfbfbf"></path></svg>
                </a>
                <div class="dropdown-content maxwidth-120" id="user-dropdown-content-1" onmouseover="hoverStartDropdown3(this)" onmouseout="hoverEndDropdown3(this)">
                    <a href="#">Edit Profile</a>
                    <a href="OrderRecordControl?ordOpt=1">My Order</a>
                    <a href="#">Logout</a>
                </div>
            </li>
        </ul>

        <ul class="cart-all navbar-nav" style="margin-right:20px;" onmouseover="cartStartHover(this)" onmouseout="cartEndHover(this)">
            <li class="nav-item">
                <a class="cart-icon nav-link pr-0"  href="clientShoppingCart.jsp">
                    <svg t="1615659996837" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1733" width="30" height="30"><path d="M825.1 727.6H338.6c-28 0-55-9.9-76.1-28-21.8-18.6-34.8-43.7-36.7-70.6v-0.1l-26.1-405.1-49.3-24.1c-12.4-6.1-17.6-21-11.5-33.4 6.1-12.4 21-17.6 33.4-11.5l52.7 25.7c14.7 7.1 24 21.1 24.4 36.9l26.3 408.2c2 28.7 30.3 52 63 52h486.5c13.8 0 25 11.2 25 25s-11.3 25-25.1 25z m-621.8-502z" p-id="1734" id="cart-first" fill="#bfbfbf"></path><path d="M385.4 614.7h-1.1c-13.8 0-25-11.2-25-25s11.2-25 25-25h0.4l345.9-25.3c18.9-1.6 33.8-14.4 35.3-30.4 0.1-0.9 0.2-1.9 0.4-2.8l31.4-166.4c0.1-1.6 0.3-3.2 0.7-4.7 1.8-7.9-1-16.9-7.2-23.6-7.4-7.9-18.2-12.4-29.5-12.4H356.5c-13.8 0-25-11.2-25-25s11.2-25 25-25h405.2c25 0 49.1 10.3 65.9 28.1 17.3 18.4 24.7 43.4 19.9 67.2-0.1 1.1-0.2 2.2-0.4 3.3l-31.5 166.8c-4.3 39.7-38.2 71-81 74.6h-0.3l-346.7 25.3c-0.7 0.3-1.5 0.3-2.2 0.3z m430.3-100.9z m31.5-167.6z m-49.6-4.1z m-469.3 472c0.7 0 1.3 0.6 1.3 1.3 0 0.7-0.6 1.3-1.3 1.3-0.7 0-1.3-0.6-1.3-1.3 0-0.8 0.6-1.3 1.3-1.3m0-50c-28.3 0-51.3 23-51.3 51.3 0 28.3 23 51.3 51.3 51.3s51.3-23 51.3-51.3c0-28.4-23-51.3-51.3-51.3z m410.3 50c0.7 0 1.3 0.6 1.3 1.3 0 0.7-0.6 1.3-1.3 1.3-0.7 0-1.3-0.6-1.3-1.3 0-0.8 0.6-1.3 1.3-1.3m0-50c-28.3 0-51.3 23-51.3 51.3 0 28.3 23 51.3 51.3 51.3 28.3 0 51.3-23 51.3-51.3 0-28.4-22.9-51.3-51.3-51.3z" p-id="1735" id="cart-second" fill="#bfbfbf"></path></svg>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link pl-0 pr-0"  href="#"><span id="cart-num" style="color:#bfbfbf;">(0)</span></a>
            </li>
        </ul>
    </div> 
</nav>







