<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/styles.css">
    <link rel="stylesheet" href="admin_styles/home.css">
    <title>Thế Giới Phụ Kiện</title>
</head>
<body>
<!--header-->
<%@include file="/admin/header.jsp"%>
<!--menu-->
<%@include file="/admin/menu.jsp"%>
<!--main-->
<div id="home-right" class="right-panel">
    <div id="block-overview" class="home-main-block">
        <div id="overview-header"><h1>Chào mừng bạn đến với Thế Giới Phụ Kiện</h1></div>
        <div id="overview-content">
            <span id="overview-span" style="text-align: justify;">
                <strong>Thế Giới Phụ Kiện</strong> là trang bán hàng trực tuyến chuyên cung cấp tất cả các thiết bị, vật dụng, phụ kiện phục vụ tốt nhất cho mọi sản phẩm công nghệ mới nhất trên thị trường.<br><br>
                Trước sự bùng nổ của các sản phẩm công nghệ, nhu cầu trang bị các loại phụ kiện công nghệ ngày càng gia tăng. Nhận thấy nhu cầu đó, trang bán hàng trực tuyến <strong>thegioiphukien.com</strong> được thành lập vào tháng 2 năm 2023 với mục tiêu phục vụ tất cả các sản phẩm phụ kiện công nghệ cho người tiêu dùng.<br><br>
                Dòng sản phẩm với nhiều mẫu mã đa dạng, phong phú, từ phụ kiện điện thoại, phụ kiện máy tính, phụ kiện camera cho đến phụ kiện âm thanh, ánh sáng cùng với rất nhiều phụ kiện khác, người dùng hoàn toàn có thể dễ dàng tìm kiếm sản phẩm yêu thích cho bản thân mình.<br><br>
                Với mục tiêu cung cấp tất cả các loại phụ kiện cho mọi sản phẩm công nghệ đến với người tiêu dùng, <strong>Thế Giới Phụ Kiện</strong> sẽ ngày càng đầu tư, hoàn thiện hơn nữa để phục vụ tất cả mọi người.
            </span>
        </div>
    </div>
    <div id="block-info" class="home-main-block">
        <div id="block-image">
            <img id="page-logo" src="admin_images/logo2.png""/>
        </div>
        <div id="block-content">
            <div class="content-item">
                <label class="item-label" for="name">Tên miền: </label>
                <div class="item-text" id="name" name="name">thegioiphukien.com</div>
            </div>
            <div class="content-item">
                <label class="item-label" for="name">Thành lập: </label>
                <div class="item-text" id="name" name="name">Ngày 26-2-2023</div>
            </div>
            <div class="content-item">
                <label class="item-label" for="name">Email: </label>
                <div class="item-text" id="name" name="name">thegioiphukien@gmail.com</div>
            </div>
            <div class="content-item">
                <label class="item-label" for="name">SÐT: </label>
                <div class="item-text" id="name" name="name">0384 909 862</div>
            </div>
            <div class="content-item">
                <label class="item-label" for="name">Địa chỉ: </label>
                <div class="item-text" id="name" name="name">Mộ Lao, Hà Đông, Hà Nội</div>
            </div>
        </div>
    </div>
</div>
<div id="overlay" class="overlay"></div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>
