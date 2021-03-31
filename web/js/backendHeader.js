/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showMenu() {
    document.getElementById("menuNav").style.transform = "translateX(0px)";
    document.getElementById("menuBtn").style.opacity = "0";
}
function hideMenu() {
    document.getElementById("menuNav").style.transform = "translateX(-270px)";
    document.getElementById("menuBtn").style.opacity = "1";
}
function handleCollapse(element, icon) {
//    console.log(event.target.getAttribute('id'));
    if (event.target.getAttribute('name') === element || event.target.getAttribute('id') === icon){
        if ($("#" + element).css("maxHeight") === "0px") {
            var height = document.getElementById(element).scrollHeight;
            document.getElementById(element).style.maxHeight = height + "px";
            document.getElementById(element).style.overflow = "auto";
            document.getElementById(icon).style.transform = "rotate(180deg)";
        }else {
            document.getElementById(element).style.maxHeight = "0px";
            document.getElementById(icon).style.transform = "rotate(0deg)";
        }
    }
}