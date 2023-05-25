// Lấy tất cả các menu cha
var dropdowns = document.getElementsByClassName("sub-menu");
		
// Lặp qua các menu cha và thêm sự kiện click
for (var i = 0; i < dropdowns.length; i++) {
    dropdowns[i].addEventListener("click", function() {
        // Lấy tất cả các menu cha khác và ẩn các menu con của chúng
        var otherDropdowns = document.getElementsByClassName("sub-menu");
        for (var j = 0; j < otherDropdowns.length; j++) {
            if (otherDropdowns[j] != this) {
                otherDropdowns[j].classList.remove("active");
                otherDropdowns[j].querySelector("ul").style.display = "none";
            }
        }
        // Toggle lớp CSS "active" để hiển thị hoặc ẩn các menu con của menu cha đang được nhấp vào
        this.classList.toggle("active");
        var dropdownContent = this.querySelector("ul");
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}