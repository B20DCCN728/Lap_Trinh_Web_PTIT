<%@page import="java.util.List"%>
<%@page import="model.admin.User"%>
<%@page import="model.admin.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/styles.css">
    <link rel="stylesheet" href="admin_styles/user_list.css">
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
        <h1 id="head">Danh sách khách hàng</h1>
        <form id="block-search" method="post">
            <input class="form-input" id="search-input" name="search-input" type="text" value="<%=(request.getAttribute("search-content") == null) ? "" : request.getAttribute("search-content")%>" placeholder="Nhập tên khách hàng cần tìm"/>
            <button class="form-button button-green" id="button-search" type="submit" formaction="user-list">Tìm kiếm</button>
        </form>
    </div>
                <div id="block-table" class="main-block">
                                                            
                    <div class="box">
                        <table id="" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
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
                                    <td class="center col1"><%=(i.getDob()==null) ? "-Trống-" : i.getDob()%></td>
                                    <td class="center col1"><%=i.getPhone()%></td>
                                    <td class="left col3"><%=i.getEmail()%></td>
                                    <td class="left col4"><%=(i.getAddress()==null) ? "-Trống-" : i.getAddress()%></td>
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