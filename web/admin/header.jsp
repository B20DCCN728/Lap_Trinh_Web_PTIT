<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="admin_styles/header.css">
<script>
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
    
    const logoutLink = document.getElementById('logout-link');

    function openPopup() {
        const overlay = document.getElementById('overlay');
        const popup = document.getElementById('popup');

        overlay.style.display = 'block';
        popup.style.display = 'block';
    }

    function closePopup() {
        const overlay = document.getElementById('overlay');
        const popup = document.getElementById('popup');

        overlay.style.display = 'none';
        popup.style.display = 'none';
    }

    function logout() {
        window.location.href = '/thegioiphukien.com/admin/logout';
    }

    logoutLink.onclick = function() {
      openPopup();
      return false; // ngăn chặn trình duyệt chuyển hướng đến link "Đăng xuất"
    };
</script>
<header id="header">
    <div class="block-logo block-header">
        <span><a href="home"><img id="logo" src="admin_images/logo2.png" alt="PKCN"></a></span>
        <h4><a id="domain" href="home">thegioiphukien</a></h4>
    </div>
    <div class="block-account block-header">
        <nav>
            <li id="account" class="sub-menu"><span class="menu-item-parent">Tài khoản</span>
                <ul id="logout">
                    <li>
                        <a id="logout-link" onclick="openPopup()" href="#">Đăng xuất</a>
                    </li>
                </ul>
            </li>
        </nav>
    </div>

</header>
<!--popup-->
<%@include file="/admin/popup.jsp"%>