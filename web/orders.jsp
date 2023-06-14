<%-- 
    Document   : orders
    Created on : May 15, 2023, 1:05:33 AM
    Author     : PC
--%>

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
    <link rel="stylesheet" href="styles/orders.css">
    <link rel="stylesheet" href="styles/footer.css">
    <!-- icon -->
        <link rel="icon" href="./imgs/iconlogo.png">
    <!-- font download -->
    <link rel="stylesheet" href="./fontawesome-free-6.4.0-web/css/all.min.css"> 
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com"> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <!-- title -->
    <title>Đơn hàng đã mua</title>

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
          <div class="grid__row home-order">
            <div class="orders">
              <h3 class="orders__heading">CÁC ĐƠN HÀNG ĐÃ MUA</h3>
              <table class="orders-table">
                  <tr class="orders-item__list-heading">
                      <th class="orders-item__title">Mã đơn hàng</th>
                      <th class="orders-item__title">Số lượng</th>
                      <th class="orders-item__title">Tổng cộng</th>
                      <th class="orders-item__title">Thanh toán</th>
                      <th class="orders-item__title">Tình trạng</th>
                      <th class="orders-item__title">Ngày mua</th>
                      <th class="orders-item__title">Xem chi tiết</th>
                  </tr>
                  <c:forEach items="${listOrder}" var="order">
                    <tr class="orders-item__list">
                        <td class="orders-item">
                            ${order.id}
                            <!-- <img src="/Web Pages/imgs/mrstev3.jpg"  alt="Hàng Xịn" class="orders-item__img"> -->
                        </td>
                        <td class="orders-item">${order.fee}</td>
                        <td class="orders-item"><span class="orders-item__quantity">${order.total}₫</span></td>
                        <td class="orders-item">${order.payment}</td>
                        <td class="orders-item">${order.delivery}</td>
                        <td class="orders-item">${order.createdDate}</td>
                        <td class="orders-item orders-item__delete">
                          <a href="orderdetails?orderID=${order.id}" class="orders-item__delete-active">
                            <i class="orders-item__delete-icon fa-solid fa-circle-info"></i>
                          </a>
                        </td> 
                    </tr>
                  </c:forEach>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- footer -->
      <%@include file="/footer.jsp"%> 
    </div>
    <%@include file= "/modalLoginSignup.jsp"%>
    <script src="./js/modalLoginSignup.js"></script>
</body>
</html>