<%-- 
    Document   : orderdetail
    Created on : Jun 11, 2023, 1:03:48 AM
    Author     : PC
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- link set standard page-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
      <!-- font download -->
      <link rel="stylesheet" href="./fontawesome-free-6.4.0-web/css/all.min.css"> 
      <!-- font -->
      <link rel="preconnect" href="https://fonts.googleapis.com"> 
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
      <!-- link css styles -->
      <link rel="stylesheet" href="styles/base.css">
      <link rel="stylesheet" href="styles/header.css">
      <link rel="stylesheet" href="styles/orderdetail.css">
      <link rel="stylesheet" href="styles/footer.css">
      <!-- icon -->
      <link rel="icon" href="./imgs/logo.png">
      <!-- title -->
      <title>Chi tiết đơn hàng ${order.id}</title>
</head>
<body>
    <div class="app">
        <!-- header -->
      <%@include file="/header.jsp"%>
        <!-- container -->
        <div class="app__container">
            <div class="grid">

                <div class="grid__row home-details">  

                    <div class="grid__column-12">
                        <h1 class="details__heading">
                            ĐƠN HÀNG MÃ: ${order.id}
                        </h3>
                    </div>

                    <div class="grid__column-8">
                        <div class="order-method">
                            <!-- Shipping method -->
                            <div class="order-method__component">
                                <h3 class="order-method__component-heading">PHƯƠNG THỨC GIAO HÀNG</h3>
                                <span class="order-method__component-type">
                                    <i class="fa-solid fa-truck order-method__component-icon"></i>
                                    <span class="order-method__component-content">Vận chuyển hỏa tốc - 30.000₫</span>
                                </span>
                            </div>
                            <!-- Payment method -->
                            <div class="order-method__component">
                                <h3 class="order-method__component-heading">PHƯƠNG THỨC THANH TOÁN</h3>
                                <span class="order-method__component-type">    
                                    <i class="fa-solid fa-house order-method__component-icon"></i>
                                    <span class="order-method__component-content">Thanh toán khi nhận hàng</span>
                                </span>
                            </div>
                        </div>
                        <!-- Order items -->
                        <div class="order-details">
                            <div class="order-items">
                                <h3 class="order-items__heading">CÁC SẢN PHẨM ĐÃ MUA</h3>
                            </div>
                            <table class="carts-table">   
                                <tr class="carts-item__list-heading">
                                    <th class="carts-item__title">Hình ảnh</th>
                                    <th class="carts-item__title">Tên sản phẩm</th>
                                    <th class="carts-item__title">Số lượng</th>
                                    <th class="carts-item__title">Đơn giá</th>
                                    <th class="carts-item__title">Tổng cộng</th>
                                    <!-- <th class="carts-item__title">Xóa sản phẩm</th> -->
                                </tr>

                                <c:forEach items="${order.listOrderItems}" var="o">
                                    <tr class="carts-item__list">
                                        <td class="carts-item">
                                            <img src="${o.product.image1}"  alt="Hàng Xịn" class="carts-item__img">
                                        </td>
                                        <td class="carts-item">${o.product.name}</td>
                                        <td class="carts-item"><span class="carts-item__quantity">${o.quantity}</span></td>
                                        <td class="carts-item">${o.price}₫</td>
                                        <td class="carts-item">${o.total}₫</td>
                                        <!-- <td class="carts-item carts-item__delete">
                                            <a href="" class="carts-item__delete-active">
                                            <i class="carts-item__delete-icon fa-solid fa-trash"></i>
                                            </a>
                                        </td> -->
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                    <div class="grid__column-4">
                        <div class="carts-payment">
                          <h3 class="carts-payment__heading">THÔNG TIN GIAO HÀNG</h3>
                          <div class="carts-payment__detail">
                            <span class="carts-payment__detail-total">Họ và tên:	${order.client.fullName}</span>
                            <span class="carts-payment__detail-total">Điện thoại:	${order.client.phone}</span>
                            <span class="carts-payment__detail-total">Địa chỉ:	${order.client.address}</span>
                            <span class="carts-payment__detail-total">Trạng thái giao hàng:	${order.delivery}</span>
                            <span class="carts-payment__detail-totalcost">Trạng thái thanh toán: ${order.payment}</span>
                          </div>
                        </div>
                        <div class="carts-payment">
                            <h3 class="carts-payment__heading">CHI TIẾT THANH TOÁN</h3>
                            <div class="carts-payment__detail">
                              <span class="carts-payment__detail-total">Thành tiền:	${order.cost}₫</span>
                              <span class="carts-payment__detail-total">Phí giao hàng:	${order.fee}₫</span>
                              <span class="carts-payment__detail-totalcost">Tổng:	${order.total}₫</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer -->
        <%@include file="/footer.jsp"%>  
        
      <script src="/Web Pages/js/productdetail.js"></script>
    </div>

    </div>
</body>
</html>