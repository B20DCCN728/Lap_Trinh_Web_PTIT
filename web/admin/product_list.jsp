<%@page import="java.util.List"%>
<%@page import="model.admin.Product"%>
<%@page import="model.admin.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/styles.css">
    <link rel="stylesheet" href="admin_styles/product_list.css">
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
        <h1 id="head">Danh sách sản phẩm</h1>
        <form id="block-search" method="post">
            <input class="form-input" id="search-input" name="search-input" type="text" value="<%=(request.getAttribute("search-content") == null) ? "" : request.getAttribute("search-content")%>" placeholder="Nhập tên sản phẩm cần tìm"/>
            <button class="form-button button-green" id="button-search" type="submit" formaction="product-list">Tìm kiếm</button>
        </form>
        <a class="form-button" id="button-create" href="create-product-view">Thêm sản phẩm</a>
    </div>
                    
                <div id="block-table" class="main-block">
                    
                    <div class="box">
                        <table id="" class="sort-table border-table" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th id="idleft" class="table-header col1" >Mã SP</th>
                                    <th class="table-header col4">Tên SP</th>
                                    <th class="table-header col1">Hình ảnh</th>
                                    <th class="table-header col3">Danh mục</th>
                                    <th class="table-header col1">Giá bán</th>
                                    <th class="table-header col1">Đã bán</th>
                                    <th class="table-header col1">Còn lại</th>
                                    <th class="table-header col1">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                        <%
                            List<Product> list_Product = (List<Product>)request.getAttribute("list_Product");
                            List<Category> list_Category = (List<Category>)request.getAttribute("list_Category");
                            int t = 0, k = 0, j;
                            for(Product i:list_Product){
                                int id = 10000 + i.getId();
                                String category = "";
                                for(Category c:list_Category){
                                    if(c.getId()==i.getCategory_id()){
                                        category = c.getName();
                                        break;
                                    }
                                }
                        %>
                                <tr>
                                    <td class="center col1"><a href="product-detail?id=<%=id%>">#<%=id%></a></td>
                                    <td class="left col4 product-name"><%=i.getName()%></td>
                                    <td class="center col1"><img src="<%=i.getImage1()%>" style="height: 30px; width: auto;"/></td>
                                    <td class="left col3"><%=category%></td>
                                    <td class="center col1"><%=i.getPrice()%></td>
                                    <td class="center col1"><%=i.getQuantity_sold()%></td>
                                    <td class="center col1"><%=i.getQuantity_remain()%></td>
                                    <td class="center col6">
                                        <div id="action_col">
                                            <a class="form-button button-red" id="button-delete" href="#" data-product-id="<%=id%>" data-product-name="<%=i.getName()%>" onclick="showPopupDelete(this)">Xoá</a>
                                            <a class="form-button button-green" id="button-update" href="product-detail?id=<%=id%>">Sửa</a>
                                        </div>
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                </div>
</div>
<div id="popup-delete" class="popup">
        <p id="question"></p>
        <button onclick="closePopupDelete()">Huỷ</button>
        <button onclick="delete_product()">OK</button>
</div>
</body>
<script>
    function showPopupDelete(button) {
        var productName = button.getAttribute("data-product-name");
        var productId = button.getAttribute("data-product-id");
        var popup = document.getElementById("popup-delete");
        var question = document.getElementById("question");
        var overlay = document.getElementById('overlay');
        question.innerHTML = "Bạn chắc chắn muốn xoá sản phẩm " + productName + " ?";
        var okButton = popup.getElementsByTagName("button")[1];
        okButton.onclick = function() {
            delete_product(productId);
            closePopupDelete();
        };
        overlay.style.display = 'block';
        popup.style.display = "block";
        return false;
    }

    function closePopupDelete() {
        var overlay = document.getElementById('overlay');
        var popup = document.getElementById("popup-delete");
        overlay.style.display = 'none';
        popup.style.display = "none";
    }

    function delete_product(productId) {
        window.location.href = 'delete-product?id=' + productId;
    }
</script>
<script src="admin_scripts/admin.js"></script>
</html>