<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/style4.css">
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
                <div id="block-table" class="main-block">
                                        
<!--                    <h2 class="heading"> Bảng thông tin </h2>-->
                    
                    <div id="box">
                        <table id="tbl-content" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col0">ID</th>
                                    <th class="table-header col1">Họ</th>
                                    <th class="table-header col0">Tên</th>
                                    <th class="table-header col1">Ngày sinh</th>
                                    <th class="table-header col1">SÐT</th>
                                    <th class="table-header col3">Email</th>
                                    <th class="table-header col4">Địa chỉ</th>
                                    <th class="table-header col1">Số đơn hàng</th>
                                    <th class="table-header col1">Tổng giá trị</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<User> list_User = (List<User>)request.getAttribute("list_User");
                            List<Order> list_Order = (List<Order>)request.getAttribute("list_Order");
                            int j = 0;
                            for(User i:list_User){
                                int id = 1000000 + i.getId();
                                String[] w = i.getFullname().split("\\s+");
                                String fname = "";
                                for(j=0; j<w.length-1; j++){
                                    fname+= w[j] + " ";
                                }
                                fname.trim();
                                String lname = w[j];
                                int num_order=0, num_product=0, total_cost=0;
                                for(Order o : list_Order){
                                    if(o.getUser_id()==i.getId()){
                                        num_order++;
                                        total_cost+= o.getTotal();
                                    }
                                }
                        %>
                                <tr>
                                    <td class="center col0"><a href="user-detail?id=<%=id%>">#<%=id%></a></td>
                                    <td class="left col1"><%=fname%></td>
                                    <td class="center col0"><%=lname%></td>
                                    <td class="center col1"><%=i.getDob()%></td>
                                    <td class="center col1"><%=i.getPhone()%></td>
                                    <td class="left col3"><%=i.getEmail()%></td>
                                    <td class="left col4"><%=i.getAddress()%></td>
                                    <td class="center col1"><%=num_order%></td>
                                    <td class="right col1"><%=total_cost%></td>
                                </tr>
                        <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                </div>
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>