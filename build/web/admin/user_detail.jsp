<%@page import="java.util.List"%>
<%@page import="model.Order"%>
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
    <link rel="stylesheet" href="admin_styles/user_detail.css">
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
    <h1 id="head">Thông tin khách hàng có ID #<%=request.getAttribute("id")%></h1>
    <div id="content">
        <div id="client-info" class="main-block">
            <h2 class="block-heading">Thông tin cá nhân</h2>
            <div id="block-parent">
                <div id="block-left" class="block-info">
                    <div class="info-item">
                        <label class="item-label" for="email">Email:</label>
                        <div class="item-content" id="email" name="email"><%=request.getAttribute("email")%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="fullname">Họ và tên:</label>
                        <div class="item-content" id="fullname" name="fullname"><%=request.getAttribute("fullname")%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="dob">Ngày sinh:</label>
                        <div class="item-content" id="dob" name="dob"><%=request.getAttribute("dob")%></div>
                    </div>
                </div>
                <div id="block-right" class="block-info">
                    <div class="info-item">
                        <label class="item-label" for="phone">SÐT:</label>
                        <div class="item-content" id="phone" name="phone"><%=request.getAttribute("phone")%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="address">Địa chỉ:</label>
                        <div class="item-content" id="address" name="address"><%=request.getAttribute("address")%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="note">Chú thích:</label>
                        <div class="item-content" id="note" name="note"><%=(request.getAttribute("note") == null) ? "--Trống--" : request.getAttribute("note")%></div>
                    </div>
                </div>
            </div>
            
        </div>
                
        <div id="order-info" class="main-block">
            <h2 class="block-heading">Thông tin mua hàng</h2>
                <div id="block-table" class="main-block">
                    
                    <div id="box-order">
                        <table id="table-order" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col1">Mã đơn</th>
                                    <th class="table-header col2">Ngày đặt hàng</th>
                                    <th class="table-header col2">Tổng tiền hàng</th>
                                    <th class="table-header col1">Khuyến mãi</th>
                                    <th class="table-header col2">Phí vận chuyển</th>
                                    <th class="table-header col3">Tổng Thanh Toán</th>
                                    <th class="table-header col3">Giao hàng</th>
                                    <th class="table-header col3">Thanh toán</th>
                                    <th class="table-header col2">Ghi Chú</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<Order> list_Order = (List<Order>)request.getAttribute("list_Order");
                            int tt_Total = 0, j;
                            for(Order i:list_Order){
                                int id = 1000000 + i.getId();
                                tt_Total+= i.getTotal();
                        %>
                                <tr onclick="insert(<%=i.getId()%>)">
                                    <td class="center col1"><a href="orderdetail?id=<%=id%>">#<%=id%></a></td>
                                    <td class="center col2"><%=i.getCreate_date()%></td>
                                    <td class="center col2"><%=i.getCost()%></td>
                                    <td class="center col1"><%=i.getDiscount()%></td>
                                    <td class="center col2"><%=i.getFee()%></td>
                                    <td class="right col3"><%=i.getTotal()%></td>
                                    <td class="center col3"><%=i.getDelivery()%></td>
                                    <td class="center col3"><%=i.getPayment()%></td>
                                    <td class="left col4"><%=(i.getNote()==null) ? "--Trống--" : i.getNote()%></td>
                                </tr>
                         <%
                            }
                        %>
                                <tr class="total-row order-row">
                                    <td class="center col1"></td>
                                    <td class="center col2">Tổng</td>
                                    <td class="center col2"></td>
                                    <td class="center col1"></td>
                                    <td class="center col2"></td>
                                    <td class="right col3"><%=tt_Total%></td>
                                    <td class="center col3"></td>
                                    <td class="center col3"></td>
                                    <td class="center col4"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
             
<!--        <div id="payment-info" class="main-block">
                <h2 id="payment_heading" class="block-heading">Thanh toán</h2>
                <div class="info-item3 info-item2">
                    <label class="item-label" for="hoten">Hình thức thanh toán:</label>
                    <div class="item-content2" id="hoten" name="hoten" >Thanh toán khi nhận hàng</div>
                </div>
                <div class="info-item3 info-item2">
                    <label class="item-label" for="hoten">Trạng thái thanh toán:</label>
                    <div class="item-content2" id="hoten" name="hoten" >Ðã thanh toán</div>
                </div>
                <div class="info-item4 info-item2 ">
                    <label class="item-label" for="hoten">Thanh toán COD:</label>
                    <div class="item-content" id="hoten" name="hoten" >0 ₫</div>
                </div>
        </div>-->
    </div>
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>