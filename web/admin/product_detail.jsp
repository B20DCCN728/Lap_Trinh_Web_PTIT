<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/style4.css">
    <link rel="stylesheet" href="admin_styles/product_detail.css">
    <title>Phụ Kiện Công Nghệ</title>
</head>
<body>
<header id="header">
    <div id="logo-group">
        <span id="logo"><a href="/admin#/home"> <img src="" alt="RUNTIME"> </a></span>
        <span id="view-site"> <a href="/" target="_blank"><i class="fa fa-external-link"></i></a> </span>
    </div>
    <div class="pull-left">
        
        <div id="fullscreen" class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
        </div>
        
        <div id="hide-menu" class="btn-header pull-right no-margin">
            <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
        </div>

    </div>

    <div class="pull-right">

        <ul id="profile-img" class="header-dropdown-list hidden-xs padding-5">
            <li class="">
                <a href="#" target="_self" class="dropdown-toggle  no-margin avatar" data-toggle="dropdown">
                    <img src="/Areas/Admin/Images/avatars/user.png" alt="Phụ Kiện Công Nghệ" class="img-circle" />
                    <span>phukien</span>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="/admin#/userlogin/changepassword" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Đổi mật khẩu</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/admin#/userlogin" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> Tài khoản quản trị</a>
                    </li>
                    <li class="divider"></li>
                    
                    <li>
                        <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full Screen</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/admin/account/login" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout" data-logout-msg="Bạn có muốn đăng xuất khỏi hệ thống không?"><i class="fa fa-sign-out fa-lg"></i> <strong>Đăng xuất</strong></a>
                    </li>
                </ul>
            </li>
        </ul>

        <div id="logout" class="btn-header transparent pull-right hidden">
            <span> <a href="/admin/account/login" title="Sign Out" data-action="userLogout" data-logout-msg="Bạn có muốn đăng xuất khỏi hệ thống không?"><i class="fa fa-sign-out"></i></a> </span>
        </div>

    </div>

</header>
    
<aside id="left-panel">
    <nav>
        <ul>
            <li>
                <a id="tongquan" href="home" title="Tổng quan"><span class="menu-item-parent">Tổng quan</span></a>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Sản phẩm</span>
                <ul>
                    <li>
                        <a href="product-list">Tất cả sản phẩm</a>
                    </li>
                    <li>
                        <a href="/admin#/productgroup">Nhóm sản phẩm</a>
                    </li>
                    <li>
                        <a href="/admin#/product/inventory">Tồn kho</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Tin tức</span>
                <ul>
                    <li>
                        <a href="/admin#/news/create">Thêm mới tin tức</a>
                    </li>
                    <li>
                        <a href="/admin#/news">Danh sách tin tức</a>
                    </li>
                    <li>
                        <a href="/admin#/newsgroup">Nhóm tin tức</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Đơn hàng</span>
                <ul>
                    <li>
                        <a href="orderlist">Đơn hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/order/shipping">Vận chuyển</a>
                    </li>
                    <li>
                        <a href="/admin#/order/draft">Đơn hàng nháp</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Khách hàng</span>
                <ul>
                    <li>
                        <a href="user-list">Danh sách khách hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/contact">Liên hệ từ khách hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/newsletter">Danh sách Email đăng ký</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

</aside>
<div id="right-panel">
    <form method="post">
    <div id="top">
        <% Product product = (Product) request.getAttribute("Product"); %>
        <h1 id="head">Thông tin sản phẩm có ID #<%=10000+product.getId()%></h1>
        <input id="id" name="id" type="text" hidden="true" value="<%=product.getId()%>"/>
        <button class="form-button" id="button-save" type="submit" formaction="update-product-detail">Lưu</button>
    </div>
    <div id="content">
        <div id="product-form">
            <div class="form-item">
                <label class="form-label" for="name">Tên sản phẩm</label>
                <input class="form-input" id="name" name="name" type="text" value="<%=product.getName()%>" placeholder="Nhập tên sản phẩm"/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="image">Hình ảnh</label>
                <input class="form-input" id="image" name="image" type="text" value="<%=product.getImage()%>" placeholder="Nhập đường dẫn URL"/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="supplier">Nhà cung cấp</label>
                <input class="form-input" id="supplier" name="supplier" type="text" value="<%=product.getSupplier()%>" placeholder="Nhập tên nhà cung cấp"/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="price">Giá bán</label>
                <input class="form-input" id="price" name="price" type="text" value="<%=product.getPrice()%>" placeholder="Nhập giá bán"/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="quantity_sold">Đã bán</label>
                <input class="form-input" id="quantity_sold" name="quantity_sold" type="number" value="<%=product.getQuantity_sold()%>" readonly/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="quantity_remain">Còn lại</label>
                <input class="form-input" id="quantity_remain" name="quantity_remain" type="number" value="<%=product.getQuantity_remain()%>" placeholder="Nhập số lượng còn lại"/>
            </div>
            
            <div class="form-item2">
                <label class="form-label" for="des">Mô tả</label>
                <textarea class="form-textarea form-input" id="des" name="des" type="text" placeholder="Nhập mô tả"><%=product.getDes()%></textarea>
            </div>
        </div>
    </div>
    </form>
   
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>