<%-- 
    Document   : clientinfo
    Created on : Jun 14, 2023, 8:04:54 AM
    Author     : PC
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- link -->
      <!-- link set standard page-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
      <!-- link css styles -->
        <link rel="stylesheet" href="styles/base.css">
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/footer.css">    
        <link rel="stylesheet" href="styles/clientinfo.css">   
      <!-- icon -->
      <link rel="icon" href="./imgs/iconlogo.png">
      <!-- font download -->
      <link rel="stylesheet" href="./fontawesome-free-6.4.0-web/css/all.min.css"> 
      <!-- font -->
      <link rel="preconnect" href="https://fonts.googleapis.com"> 
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- title -->

    <!-- JavaScript -->
    <title>Hồ sơ</title>
</head>
<body>
    <!-- Block Element Modifier -->
    <div class="app">
      <%@include file="/header.jsp"%>


      <!-- container -->
      <div class="container">
        <div class="grid">
            <div class="grid__row client-info">
                <!-- info sidebar -->
                <div class="grid__column-3">
                    <div class="client-info__sidebar">
                        <div class="client-info__cart">
                            <img src="imgs/avatar.png" alt="avatar" class="client-info__cart-img">
                            <span class="client-info__cart-name">${myAccount.fullName}</span>
                        </div>
                        <div class="client-info__explore">
                            <div class="client-info__explore-component">
                                <div>
                                    <i class="fa-sharp fa-solid fa-user-large client-info__explore-icon"></i>
                                    <span class="client-info__explore-header">Tài khoản của tôi</span>
                                </div>
                                <ul class="client-info__explore-list">
                                    <li class="client-info__explore-item">Hồ sơ</li>
                                    <li class="client-info__explore-item">Đổi mật khẩu</li>
                                </ul>
                            </div>
                            <div class="client-info__explore-component" id="client-info__explore-component--order">
                                <div>
                                    <i class="fa-sharp fa-solid fa-cart-shopping client-info__explore-icon"></i>
                                    <span class="client-info__explore-header">Đơn mua</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- detail info -->
                <div class="grid__column-9 client-info__container-form">
                    <div class="client-info__container">
                        <div class="client-info__title">
                            <h3 class="client-info__heading">Hồ sơ của tôi</h3>
                            <span class="client-info__remind">Quản lý thông tin hồ sơ để bảo mật tài khoản</span>
                        </div>
                        <div class="client-info__form">
                          <form action="profile" method="post">
                            <input type="hidden" name="action" value="update">
                            <label for="fullname" class="client-info__label">Họ và tên:</label>
                            <input type="text" name="fullname" class="client-info__input" placeholder="Nhập họ và tên" value="${myAccount.fullName}"><br>
                            <label for="dateofbirth" class="client-info__label">Ngày sinh: </label>
                            <input type="date" name="dateofbirth" class="client-info__input" value="${myAccount.dob}"><br>
                            <label for="phone" class="client-info__label">Số điện thoại:</label>
                            <input type="text" name="phone" class="client-info__input" placeholder="Nhập số điện thoại" value="${myAccount.phone}"><br>
                            <label for="email" class="client-info__label">Email:</label>
                            <input type="email" name="email" class="client-info__input" placeholder="Nhập email" value="${myAccount.email}"><br>
                            <label for="address" class="client-info__label">Địa chỉ:</label>
                            <input type="text" name="address" class="client-info__input" placeholder="Nhập địa chỉ" value="${myAccount.address}"><br>
                            <label for="note" class="client-info__label">Ghi chú:</label>
                            <input type="text" name="note" class="client-info__input" placeholder="Ghi chú của bạn ở đây" value="${myAccount.node}"><br>

                            <button type="submit" class="btn client-info__btn">Cập nhật</button>
                          </form>
                        </div>
                    </div>
                </div>
                <!-- change password -->
                <div class="grid__column-9 client-info__container-form">
                  <div class="client-info__container">
                      <div class="client-info__title">
                          <h3 class="client-info__heading">Đổi mật khẩu</h3>
                          <span class="client-info__remind">Thay đổi mật khẩu để tài khoản của bạn bảo mật hơn</span>
                      </div>
                      <div class="client-info__form">
                        <form action="profile" method="post">
                          <input type="hidden" name="action" value="change">
                          <label for="oldpassword" class="client-info__label">Mật khẩu cũ:</label>
                          <input type="password" name="oldpassword" class="client-info__input" placeholder="Nhập mật khẩu cũ"><br>
                          <label for="newpassword" class="client-info__label">Mật khẩu mới: </label>
                          <input type="password" name="newpassword" class="client-info__input" placeholder="Nhập mật khẩu mới"><br>
                          <label for="repassword" class="client-info__label">Nhập lại mật khẩu mới:</label>
                          <input type="password" name="repassword" class="client-info__input" placeholder="Nhập lại mật khẩu mới"><br>

                          <button type="submit" class="btn client-info__btn">Cập nhật</button>
                        </form>
                      </div>
                  </div>
              </div>
            </div>
        </div>
      </div>

      <!-- footer -->
      <%@include file="/footer.jsp"%>  
    </div>

    <!-- Modal layout -->


    </script>
    <script src="js/clientinfo.js"></script>
</body>
</html>