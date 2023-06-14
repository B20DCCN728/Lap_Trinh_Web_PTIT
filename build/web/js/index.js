//Created by Campus

const dropdownMenu = document.getElementsByClassName("category__menu-name");

for (var i = 0; i < dropdownMenu.length; i++) {
    (function(index) {
      dropdownMenu[index].addEventListener("click", function() {
        //Check 
        if(dropdownMenu[index].classList.contains("active")) {
            console.log("Have a toggle Active");
        } else {
            console.log("Not have toggle Active");
        }

        dropdownMenu[index].classList.toggle("active");
        //Check
        if(dropdownMenu[index].classList.contains("active")) {
            console.log("Have a toggle Active");
        } else {
            console.log("Not have toggle Active");
        }
        
        var dropdownContent = document.getElementsByClassName("category-list");
        if (dropdownContent[index].style.display == "block") {
            dropdownContent[index].style.display = "none";
        } else {
            dropdownContent[index].style.display = "block";
        }
      });
    })(i);
  }