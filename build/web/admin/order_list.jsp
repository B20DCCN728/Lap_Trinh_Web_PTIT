<%@page import="java.util.List"%>
<%@page import="model.admin.Order"%>
<%@page import="model.admin.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/styles.css">
    <link rel="stylesheet" href="admin_styles/order_list.css">
    <title>Thế Giới Phụ Kiện</title>
</head>
<body>
<!--blur-->
<div id="overlay" class="overlay"></div>
<!--header-->
<%@include file="/admin/header.jsp"%>
<!--menu-->
<%@include file="/admin/menu.jsp"%>
<!--main-->
<div class="right-panel">
    <div id="top">
        <h1 id="head">Danh sách đơn hàng</h1>
        <form id="block-search" method="post">
            <input class="form-input" id="search-input" name="search-input" type="text" value="<%=(request.getAttribute("search-content") == null) ? "" : request.getAttribute("search-content")%>" placeholder="Nhập tên khách hàng cần tìm"/>
            <button class="form-button button-green" id="button-search" type="submit" formaction="order-list">Tìm kiếm</button>
        </form>
    </div>
                <div id="block-table" class="main-block">
                    
                    <div class="box">
                        <table id="" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col1">Mã đơn</th>
                                    <th class="table-header col2">Ngày đặt hàng</th>
                                    <th class="table-header col2">Khách hàng</th>
                                    <th class="table-header col2">Tổng tiền hàng</th>
                                    <th class="table-header col1">Khuyến mãi</th>
                                    <th class="table-header col1">Phí Ship</th>
                                    <th class="table-header col2">Thanh toán</th>
                                    <th class="table-header col2">Giao hàng</th>
                                    <th class="table-header col2">Trạng thái</th>
                                    <th class="table-header col2">Ghi Chú</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<Order> list_Order = (List<Order>)request.getAttribute("list_Order");
                            List<User> list_User = (List<User>)request.getAttribute("list_User");
                            String user_name = "";
                            for(Order i:list_Order){
                                int id = 1000000 + i.getId(); String page_name = "order-list";
                                for(User u : list_User){
                                    if(u.getId()==i.getUser_id()){
                                        user_name = u.getFullname();
                                        break;
                                    }
                                }
                                String color1 = "red", color2 = "red";
                                if(i.getDelivery().equals("Đã đóng gói")) color1 = "orange";
                                else if(i.getDelivery().equals("Đang giao hàng")) color1 = "#1ac7b6";
                                else if(i.getDelivery().equals("Đã giao hàng")) color1 = "green";
                                if(i.getPayment().equals("Đã thanh toán")) color2 = "green";
                        %>
                                <tr>
                                    <td class="center col1"><a href="order-detail?p=<%=page_name%>&id=<%=id%>">#<%=id%></a></td>
                                    <td class="center col2"><%=i.getCreate_date()%></td>
                                    <td class="left col2"><%=user_name%></td>
                                    <td class="center col2"><%=i.getCost()%></td>
                                    <td class="center col1"><%=i.getDiscount()%></td>
                                    <td class="center col1"><%=i.getFee()%></td>
                                    <td class="center col2"><%=i.getTotal()%></td>
                                    <td class="center col2"><div class="item-cell" style="border-radius: 6px; padding: 5px; font-weight: 600; opacity: 80%; background: <%=color1%>;"><%=i.getDelivery()%></div></td>
                                    <td class="center col2"><div class="item-cell" style="border-radius: 6px; padding: 5px; font-weight: 600; opacity: 80%; background: <%=color2%>;"><%=i.getPayment()%></div></td>
                                    <td class="left col4"><%=(i.getNote()==null) ? "--Trống--" : i.getNote()%></td>
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