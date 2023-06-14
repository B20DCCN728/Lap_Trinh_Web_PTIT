//Created by Campus

var sidebarBtn = document.getElementsByClassName("client-info__explore-item");
var formGroup = document.getElementsByClassName("client-info__container-form");

var sidebarBtnLength = sidebarBtn.length;
var formGroupLength = formGroup.length;

for(var i = 0;i < sidebarBtnLength;i++) {
    (function(index) {
        sidebarBtn[index].addEventListener("click", function() {
            for(var j = 0;j < sidebarBtnLength;j++) {
                sidebarBtn[j].classList.remove("client-info__explore-item--active");
            }
            sidebarBtn[index].classList.add("client-info__explore-item--active");
            if(index == 0) {
                formGroup[0].style.display = "block";
                formGroup[1].style.display = "none";
            } else {
                formGroup[1].style.display = "block";
                formGroup[0].style.display = "none";
            }
        });
      })(i);
}

var orderBtn = document.getElementById("client-info__explore-component--order");
orderBtn.addEventListener("click", function() {
    window.location.href = "orders";
})