<%-- 
    Document   : carts
    Created on : May 10, 2023, 9:26:23 AM
    Author     : PC
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- meta configuration -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- link -->
        <!-- link set standard page-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <!-- link css styles -->
        <link rel="stylesheet" href="styles/base.css">
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/carts.css"/>
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/footer.css">
        <!-- icon -->
        <link rel="icon" href="./imgs/iconlogo.png">
        <!-- font download -->
        <link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css"> 
        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com"> 
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <!-- title -->
    <title>Giỏ hàng của bạn</title>
    <!--Ajax-->
    <!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
</head>
<body>
    <div class="app">
      <!-- header -->
        <%@include file="/header.jsp"%>
      <!-- container -->
      <div class="app__container">
        <div class="grid">
            <div class="grid__row home-carts">
                <div class="grid__column-8">
                  <div class="carts">
                    <h3 class="carts__heading">GIỎ HÀNG CỦA BẠN</h3>
                    <table class="carts-table">
                        <tr class="carts-item__list-heading">
                            <th class="carts-item__title">Hình ảnh</th>
                            <th class="carts-item__title">Tên sản phẩm</th>
                            <th class="carts-item__title">Số lượng</th>
                            <th class="carts-item__title">Đơn giá</th>
                            <th class="carts-item__title">Tổng cộng</th>
                            <th class="carts-item__title">Xóa sản phẩm</th>
                        </tr>
                        <c:if test="${listCart != null}">
                            <c:forEach items="${listCart}" var="c" varStatus="status">
                            <tr class="carts-item__list">
                                <td class="carts-item">
                                    <img src="${c.product.image1}"  alt="Hàng Xịn" class="carts-item__img">
                                </td>
                                <td class="carts-item">${c.product.name}</td>
                                <td class="carts-item"><span class="carts-item__quantity">${c.quantity}</span></td>
                                <td class="carts-item">${c.product.price}₫</td>
                                <td class="carts-item">${c.total}₫</td>
                                <td class="carts-item carts-item__delete">
                                    <a href="remove?index=${status.index}" class="carts-item__delete-active">
                                      <i class="carts-item__delete-icon fa-solid fa-trash"></i>
                                  </a>
                                </td>
                            </tr>
                            </c:forEach>   
                        </c:if>
                    </table>
                  </div>
                </div>
                <div class="grid__column-4">
                  <div class="carts-payment">
                    <h3 class="carts-payment__heading">TỔNG CHI PHÍ CỦA BẠN</h3>
                    <div class="carts-payment__detail">
                      <span class="carts-payment__detail-total">Thành tiền:	${totalCost}₫</span>
                      <span class="carts-payment__detail-totalcost">Tổng:	${totalCost}₫</span>
                    </div>
                    <a href="checkout" class="carts-payment__detail-submit btn">Checkout</a>
                  </div>
                </div>
            </div>
        </div>
      </div>

      <!-- footer -->
      <%@include file="/footer.jsp"%> 
    </div>
    <%@include file= "/modalLoginSignup.jsp"%>
    <script src="js/modalLoginSignup.js"></script>
    <script src="js/carts.js"></script>
</body>
</html>
