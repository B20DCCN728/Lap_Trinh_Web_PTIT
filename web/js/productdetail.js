//Created by Campus
const quantityInput = document.getElementById("product-detail__quantity--value");
// const tang = document.getElementsByClassName("btn-minus")[0];
// const giam = document.getElementsByClassName("btn-plus")[0];

const increaseButton = quantityInput.nextElementSibling;
const decreaseButton = increaseButton.nextElementSibling;
const minimum = parseInt(quantityInput.getAttribute("data-minimum")) || 1;


decreaseButton.addEventListener("click", () => {
    let quantity = parseInt(quantityInput.value);
    quantity = isNaN(quantity) ? minimum : quantity;
    quantityInput.value = ++quantity;
});

increaseButton.addEventListener("click", () => {
    let quantity = parseInt(quantityInput.value);
    quantity = isNaN(quantity) ? minimum : quantity;
    quantityInput.value = quantity > minimum ? --quantity : minimum;
});


//When the user click the button Signup
//function callSendComment() {
//    var btn = document.getElementById("btnSubmitComment").value;
//    var cmt = document.getElementById("product-comment__value").value;
//    var productID = window.location.href.split("?");
//
//    var xhttp = new XMLHttpRequest();
//    xhttp.onreadystatechange = function() {
//      if (this.readyState == 4 && this.status == 200) {
//          if(this.responseText == "success") {
//              location.reload(true);
//          }
//          else {
//              alert("Vui lòng đăng nhập");
//              document.getElementById("product-comment__value").value = "";
//          }
//      }
//    };
//    
//    xhttp.open("POST", "sendCmt", true);
//    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//    xhttp.send(productID[1] + "&cmt=" + cmt);
//}

function callAddToCart() {
    var inputQuantity = document.getElementById("product-detail__quantity--value").value;
    var productID = window.location.href.split("?");
    var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          if(this.responseText == "success") {
              alert("Đã thêm vào giỏ hàng");
          }
          else if(this.responseText == "notLogin") {
              alert("Vui lòng đăng nhập");
          }
          else {
              alert("Kho không đủ hàng");
          }
      }
    };
    
    xhttp.open("POST", "productdetail", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send(productID[1] + "&quantity=" + inputQuantity);
    
}

