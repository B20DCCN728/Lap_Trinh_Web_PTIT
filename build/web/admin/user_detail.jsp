<%@page import="java.util.List"%>
<%@page import="model.admin.Order"%>
<%@page import="model.admin.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/styles.css">
    <link rel="stylesheet" href="admin_styles/user_detail.css">
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
                        <table id="table-order" class="sort-table" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col1">Mã đơn</th>
                                    <th class="table-header col2">Ngày đặt hàng</th>
                                    <th class="table-header col2">Tổng tiền hàng</th>
                                    <th class="table-header col1">Khuyến mãi</th>
                                    <th class="table-header col1">Phí Ship</th>
                                    <th class="table-header col2">Tổng thanh toán</th>
                                    <th class="table-header col2">Giao hàng</th>
                                    <th class="table-header col2">Thanh toán</th>
                                    <th class="table-header col1">Ghi Chú</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<Order> list_Order = (List<Order>)request.getAttribute("list_Order");
                            int tt_Total = 0, j;
                            for(Order i:list_Order){
                                int id = 1000000 + i.getId();
                                tt_Total+= i.getTotal();
                                String color1 = "red", color2 = "red";
                                if(i.getDelivery().equals("Đã đóng gói")) color1 = "orange";
                                else if(i.getDelivery().equals("Đang giao hàng")) color1 = "#1ac7b6";
                                else if(i.getDelivery().equals("Đã giao hàng")) color1 = "green";
                                if(i.getPayment().equals("Đã thanh toán")) color2 = "green";
                        %>
                                <tr onclick="insert(<%=i.getId()%>)">
                                    <td class="center col1"><a href="order-detail?p=user-detail&id=<%=id%>">#<%=id%></a></td>
                                    <td class="center col2"><%=i.getCreate_date()%></td>
                                    <td class="center col2"><%=i.getCost()%></td>
                                    <td class="center col1"><%=i.getDiscount()%></td>
                                    <td class="center col1"><%=i.getFee()%></td>
                                    <td class="right col2"><%=i.getTotal()%></td>
                                    <td class="center col2"><div class="item-cell" style="width: 90%; border-radius: 6px; padding: 3px; font-weight: 600; opacity: 80%; background: <%=color1%>;"><%=i.getDelivery()%></div></td>
                                    <td class="center col2"><div class="item-cell" style="width: 90%; border-radius: 6px; padding: 3px; font-weight: 600; opacity: 80%; background: <%=color2%>;"><%=i.getPayment()%></div></td>
                                    <td class="left col1"><%=(i.getNote()==null) ? "--Trống--" : i.getNote()%></td>
                                </tr>
                         <%
                            }
                        %>
                                
                            </tbody>
                            <tfoot>
                                <tr class="total-row order-row">
                                    <td class="center col1"></td>
                                    <td class="center col2">Tổng giá trị</td>
                                    <td class="center col2"></td>
                                    <td class="center col1"></td>
                                    <td class="center col1"></td>
                                    <td class="right col2"><%=tt_Total%></td>
                                    <td class="center col2"></td>
                                    <td class="center col2"></td>
                                    <td class="center col1"></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
        </div>
    </div>
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>