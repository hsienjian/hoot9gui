/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function hoverStartDropdown() {
    document.getElementById("user-dropdown-content").style.display = "block";
    document.getElementById("user-dropdown").style.borderBottom = "2px solid #2c2c2c";
}
function hoverStartDropdown2() {
    document.getElementById("user-dropdown-content").style.display = "block";
    document.getElementById("user-dropdown").style.borderBottom = "2px solid #2c2c2c";
    document.getElementById("user-first").setAttribute("fill", "#2c2c2c")
    document.getElementById("user-second").setAttribute("fill", "#2c2c2c")
}
function hoverEndDropdown2() {
    document.getElementById("user-dropdown-content").style.display = "none";
    document.getElementById("user-dropdown").style.borderBottom = "0px";
    document.getElementById("user-first").setAttribute("fill", "#bfbfbf")
    document.getElementById("user-second").setAttribute("fill", "#bfbfbf")
}
function openNav() {
    document.getElementById("myNav").style.width = "100%";
}

function closeNav() {
    document.getElementById("myNav").style.width = "0%";
}
function cartStartHover() {
    document.getElementById("cart-first").setAttribute("fill", "#2c2c2c")
    document.getElementById("cart-second").setAttribute("fill", "#2c2c2c")
    document.getElementById("cart-num").style.color = "#2c2c2c";
}

function cartEndHover() {
    document.getElementById("cart-first").setAttribute("fill", "#bfbfbf")
    document.getElementById("cart-second").setAttribute("fill", "#bfbfbf")
    document.getElementById("cart-num").style.color = "#bfbfbf";
}


