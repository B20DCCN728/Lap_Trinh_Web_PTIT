<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="model.admin.Order"%>
<%@page import="model.admin.Product"%>
<%@page import="model.admin.Category"%>
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
    <link rel="stylesheet" href="admin_styles/statistic.css">
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
        <h1 id="head">Dashboard <%=request.getAttribute("time")%></h1>
    </div>
    <form method="post" id="block-daily" class="main-block">
        <div class="form-item">
            <label class="form-label" for="start-date">Từ ngày</label>
            <input class="form-input" type="date" name="start-date" id="start-date" value="" required>
        </div>
        <div class="form-item">
            <label class="form-label" for="finish-date">Đến ngày</label>
            <input class="form-input" type="date" name="finish-date" id="finish-date" value="" required>
        </div>
        <button class="form-button" id="button-search" type="submit" formaction="statistic">Lọc</button>

    </form>
    <div class="block-table main-block">
        <h2 class="block-heading">Danh sách đơn hàng</h1>
                    <div class="box">
                        <table id="" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col1">Mã đơn</th>
                                    <th class="table-header col2">Ngày đặt hàng</th>
                                    <th class="table-header col2">Khách hàng</th>
                                    <th class="table-header col2">Tổng tiền hàng</th>
                                    <th class="table-header col1">Khuyến mãi</th>
                                    <th class="table-header col2">Phí vận chuyển</th>
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
                            int tt_cost = 0, tt_discount = 0, tt_fee = 0, tt_total = 0;
                            for(Order i:list_Order){
                                int id = 1000000 + i.getId(); String page_name = "statistic";
                                for(User u : list_User){
                                    if(u.getId()==i.getUser_id()){
                                        user_name = u.getFullname();
                                        break;
                                    }
                                }
                                tt_cost+= i.getCost();
                                tt_discount+= i.getDiscount();
                                tt_fee+= i.getFee();
                                tt_total+= i.getTotal();
                                String color1 = "red", color2 = "red";
                                if(i.getDelivery().equals("Đã đóng gói")) color1 = "orange";
                                else if(i.getDelivery().equals("Đang giao hàng")) color1 = "#1ac7b6";
                                else if(i.getDelivery().equals("Đã giao hàng")) color1 = "green";
                                if(i.getPayment().equals("Đã thanh toán")) color2 = "green";
                        %>
                                <tr onclick="insert(<%=i.getId()%>)">
                                    <td class="center col1"><a href="order-detail?p=<%=page_name%>&id=<%=id%>">#<%=id%></a></td>
                                    <td class="center col2"><%=i.getCreate_date()%></td>
                                    <td class="left col2"><%=user_name%></td>
                                    <td class="right col2"><%=i.getCost()%></td>
                                    <td class="right col1"><%=i.getDiscount()%></td>
                                    <td class="right col2"><%=i.getFee()%></td>
                                    <td class="right col2"><%=i.getTotal()%></td>
                                    <td class="center col2"><div class="item-cell" style="border-radius: 6px; padding: 5px; font-weight: 600; opacity: 80%; background: <%=color1%>;"><%=i.getDelivery()%></div></td>
                                    <td class="center col2"><div class="item-cell" style="border-radius: 6px; padding: 5px; font-weight: 600; opacity: 80%; background: <%=color2%>;"><%=i.getPayment()%></div></td>
                                    <td class="left col4"><%=(i.getNote()==null) ? "--Trống--" : i.getNote()%></td>
                                </tr>

                         <%
                            }
                        %>
                            </tbody>
                            <tfoot>
                                <tr class="total-row">
                                    <td class="center col1">Tổng</td>
                                    <td class="center col2"></td>
                                    <td class="center col2"></td>
                                    <td class="right col2"><%=tt_cost%></td>
                                    <td class="right col1"><%=tt_discount%></td>
                                    <td class="right col2"><%=tt_fee%></td>
                                    <td class="right col2"><%=tt_total%></td>
                                    <td class="center col2"></td>
                                    <td class="center col2"></td>
                                    <td class="center col4"></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
    </div>
    <div class="block-table main-block">
        <h2 class="block-heading">Danh sách sản phẩm</h1>
                    <div class="box">
                        <table id="table-product" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th id="idleft" class="table-header col1" >Mã SP</th>
                                    <th class="table-header col4">Tên SP</th>
                                    <th class="table-header col2">Hình ảnh</th>
                                    <th class="table-header col2">Danh mục</th>
                                    <th class="table-header col2">Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<Product> list_Product = (List<Product>)request.getAttribute("list_Product");
                            List<Category> list_Category = (List<Category>)request.getAttribute("list_Category");
                            
                            HashMap<Integer, Integer> mapProduct = (HashMap<Integer, Integer>)request.getAttribute("mapProduct");
                            if(mapProduct.size()!=0){
                                for (Integer p : mapProduct.keySet()) {
                                    int count = mapProduct.get(p);
                                    for(Product i:list_Product){
                                        if(i.getId()==p){
                                            int id = 10000 + i.getId();
                                            String category = "";
                                            for(Category c:list_Category){
                                                if(c.getId()==i.getCategory_id()){
                                                    category = c.getName();
                                                    break;
                                                }
                                            }
                        %>
                                            <tr onclick="insert(<%=i.getId()%>)">
                                                <td class="center col1"><a href="product-detail?id=<%=id%>">#<%=id%></a></td>
                                                <td class="left col4"><%=i.getName()%></td>
                                                <td class="center col2"><img src="<%=i.getImage1()%>" style="height: 30px; width: auto;"/></td>
                                                <td class="left col2"><%=category%></td>
                                                <td class="center col2"><%=count%></td>
                                            </tr>
                        <%
                                            break;
                                        }
                                    }
                                }
                            }
                        %>
                            </tbody>
                        </table>
                        <script>
                            function makeSortable() {
                                const table = document.querySelector('#table-product');
                                const headers = table.querySelectorAll('.table-header');

                                headers.forEach((header, index) => {
                                    header.addEventListener('click', () => {
                                      // Xác định thứ tự sắp xếp và cột được chọn
                                        const isAscending = header.classList.contains('asc');
                                        const columnIndex = index;

                                        // Sắp xếp bảng
                                        sortTableByColumn(table, columnIndex, isAscending);

                                        // Đổi thứ tự sắp xếp và cập nhật lớp CSS trên tiêu đề cột
                                        headers.forEach((h) => {
                                            h.classList.remove('asc', 'desc');
                                        });
                                        header.classList.toggle(isAscending ? 'desc' : 'asc');
                                    });
                                });
                            }

                            function sortTableByColumn(table, column, asc = true) {
                                const dirModifier = asc ? 1 : -1;
                                const tBody = table.tBodies[0];
                                const rows = Array.from(tBody.querySelectorAll("tr"));

                                // Sắp xếp các hàng theo giá trị của cột được chỉ định
                                const sortedRows = rows.sort((a, b) => {
                                    const aVal = a.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
                                    const bVal = b.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
                                    return aVal.localeCompare(bVal, undefined, {numeric: true}) * dirModifier;
                                });

                                // Xóa các hàng hiện tại khỏi bảng
                                while (tBody.firstChild) {
                                    tBody.removeChild(tBody.firstChild);
                                }

                                // Thêm các hàng đã sắp xếp trở lại vào bảng
                                tBody.append(...sortedRows);
                            }
                            makeSortable();   
                        </script>
        </div>
    </div>
    <div class="block-table main-block">
        <h2 class="block-heading">Danh sách khách hàng</h1>                                   
                    <div class="box">
                        <table id="table-user" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
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
                            int j = 0;
                            HashMap<Integer, Integer> mapUser = (HashMap<Integer, Integer>)request.getAttribute("mapUser");
                            if(mapUser.size()!=0){
                                for (Integer u : mapUser.keySet()) {
                                    int count = mapUser.get(u);
                                    for(User i:list_User){
                                        if(i.getId()==u){
                                            int id = 1000000 + i.getId();
                                            String[] w = i.getFullname().split("\\s+");
                                            String fname = "";
                                            for(j=0; j<w.length-1; j++){
                                                fname+= w[j] + " ";
                                            }
                                            fname.trim();
                                            String lname = w[j];
                                            int total_cost=0;
                                            for(Order o : list_Order){
                                                if(o.getUser_id()==i.getId()){
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
                                                <td class="center col1"><%=count%></td>
                                                <td class="right col1"><%=total_cost%></td>
                                            </tr>
                        <%
                                            break;
                                        }
                                    }
                                }
                            }
                        %>
                            </tbody>
                        </table>
                        <script>
                            function makeSortable() {
                                const table = document.querySelector('#table-user');
                                const headers = table.querySelectorAll('.table-header');

                                headers.forEach((header, index) => {
                                    header.addEventListener('click', () => {
                                      // Xác định thứ tự sắp xếp và cột được chọn
                                        const isAscending = header.classList.contains('asc');
                                        const columnIndex = index;

                                        // Sắp xếp bảng
                                        sortTableByColumn(table, columnIndex, isAscending);

                                        // Đổi thứ tự sắp xếp và cập nhật lớp CSS trên tiêu đề cột
                                        headers.forEach((h) => {
                                            h.classList.remove('asc', 'desc');
                                        });
                                        header.classList.toggle(isAscending ? 'desc' : 'asc');
                                    });
                                });
                            }

                            function sortTableByColumn(table, column, asc = true) {
                                const dirModifier = asc ? 1 : -1;
                                const tBody = table.tBodies[0];
                                const rows = Array.from(tBody.querySelectorAll("tr"));

                                // Sắp xếp các hàng theo giá trị của cột được chỉ định
                                const sortedRows = rows.sort((a, b) => {
                                    const aVal = a.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
                                    const bVal = b.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
                                    return aVal.localeCompare(bVal, undefined, {numeric: true}) * dirModifier;
                                });

                                // Xóa các hàng hiện tại khỏi bảng
                                while (tBody.firstChild) {
                                    tBody.removeChild(tBody.firstChild);
                                }

                                // Thêm các hàng đã sắp xếp trở lại vào bảng
                                tBody.append(...sortedRows);
                            }
                            makeSortable();   
                        </script>
                    </div>
                </div>
    </div>
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>
