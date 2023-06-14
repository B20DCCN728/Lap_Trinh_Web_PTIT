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
    <link rel="stylesheet" href="admin_styles/product_detail.css">
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
                <label class="form-label" for="title">Tiêu đề</label>
                <input class="form-input" id="title" name="title" type="text" value="<%=product.getTitle()%>" placeholder="Nhập tiêu đề sản phẩm"/>
            </div>
            
            <div class="form-item2">
                <label class="form-label" for="category">Danh mục</label>
                <select class="form-input list-select" value="" name="category" id="category">
                    <option value="">--Hãy chọn danh mục--</option>
                <%
                    List<Category> list_Category = (List<Category>)request.getAttribute("list_Category");
                    for(int t=1; t<=5; t++){
                        int k = 0;
                        for(Category i:list_Category){
                            if(i.getParent()==t){
                                if(k==0) {
                                    k = 1;
                %>    
                                    <option class="parent" value="" disabled="true"><%=i.getParent_name()%></option>
                <%
                                }
                                if(i.getId()==product.getCategory_id()){
                %>
                                    <option class="" value="<%=i.getId()%>" selected="">---<%=i.getName()%></option>
                <%
                                }
                                else {
                %>
                                    <option class="" value="<%=i.getId()%>" >---<%=i.getName()%></option>
                <%
                                }
                            }
                        }
                    }
                %> 
                </select>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="image1">Hình ảnh 1</label>
                <input class="form-input" id="image1" name="image1" type="text" value="<%=product.getImage1()%>" placeholder="Nhập đường dẫn URL" required/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="image2">Hình ảnh 2</label>
                <input class="form-input" id="image2" name="image2" type="text" value="<%=product.getImage2()%>" placeholder="Nhập đường dẫn URL" required/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="price">Giá bán</label>
                <input class="form-input" id="price" name="price" type="text" value="<%=product.getPrice()%>" placeholder="Nhập giá bán" required/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="quantity_sold">Đã bán</label>
                <input class="form-input" id="quantity_sold" name="quantity_sold" type="number" value="<%=product.getQuantity_sold()%>" readonly/>
            </div>
            
            <div class="form-item">
                <label class="form-label" for="quantity_remain">Còn lại</label>
                <input class="form-input" id="quantity_remain" name="quantity_remain" type="number" value="<%=product.getQuantity_remain()%>" placeholder="Nhập số lượng còn lại" required/>
            </div>
            
            <div class="form-item3">
                <label class="form-label" for="des">Mô tả</label>
                <textarea class="form-textarea form-input" id="des" name="des" type="text" placeholder="Nhập mô tả" required><%=product.getDes()%></textarea>
            </div>
        </div>
    </div>
    </form>
   
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>