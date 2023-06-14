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
        <footer class="footer">
            <div class="grid">
            <div class="grid__row footer-top">
                <div class="footer-top__left">
                <h3 class="footer-top__left-heading footer__heading">ĐĂNG KÝ NHẬN THÔNG TIN</h3>
                <span class="footer-top__left-content">Đăng ký ngay để được cập nhật sớm nhất những thông tin hữu ích, ưu đãi từ Shoes Store!</span>
                </div>
                <div class="footer-header__right">
                <form action="" class="footer-header__right-form">
                    <input type="email" class="footer-header__right-email" placeholder="Nhập email của bạn">
                    <button type="submit" class="footer-header__right-submit btn">Đăng kí</button>
                </form>
                </div>
            </div>
            <div class="grid__row footer-container">
                <!-- <div class="grid__column-2-4"> -->
                <div>
                    <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                    <ul class="footer-list">
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Trung tâm trợ giúp</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Hướng dẫn mua hàng</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Trả hàng & hoàn tiền</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Chính sách bảo hành</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Chăm sóc khách hàng</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Chính sách khuyến mãi</a></li>
                    </ul>
                </div>
                
                <!-- <div class="grid__column-2-4"> -->
                <div>
                    <h3 class="footer__heading">Về Shoes Store</h3>
                    <ul class="footer-list">
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Giới thiệu về Shoes Store</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Điều khoản & dịch vụ</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Chính sách bảo mật</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Liên hệ với truyền thông</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Cơ hội việc làm</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Chương trình giới thiệu</a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2">Đăng kí bản quyền</a></li>
                    </ul>
                </div>
                <!-- <div class="grid__column-2-4"> -->
                <div>
                    <h3 class="footer__heading">Theo dõi</h3>
                    <ul class="footer-list">
                        <li class="footer-item">
                            <a class="footer-item__link" href="https://www.facebook.com/yjspyeu/">
                                <i class="fa-brands fa-facebook"></i>
                                Facebook
                            </a>
                        </li>
                        <li class="footer-item">
                            <a class="footer-item__link" href="https://github.com/Campus-is-me">
                                <i class="fa-brands fa-github"></i>
                                Github
                            </a>
                        </li>
                        <li class="footer-item">
                            <a class="footer-item__link" href="https://twitter.com/campus2k2">
                                <i class="fa-brands fa-twitter"></i>
                                Twitter
                            </a>
                        </li>
                    </ul>
                </div>
                
                <!-- <div class="grid__column-2-4"> -->
                <div>
                    <h3 class="footer__heading">Liên hệ</h3>
                    <ul class="footer-list">
                        <li class="footer-item"><span class="footer-item__info">Hotline: 0337176055</span></li>
                        <li class="footer-item"><span class="footer-item__info">Email: nvit80@gmail.com</span></li>
                        <li class="footer-item"><span class="footer-item__info">Địa chỉ Showroom 1: Tòa Capital Place, số 29 Liễu Giai, Ngọc Khánh, Ba Đình, Hà Nội</span></li>
                        <li class="footer-item"><span class="footer-item__info">Địa chỉ Showroom 2: 249 Xã Đàn, Đống Đa, Hà Nội</span></li>
                        <li class="footer-item"><span class="footer-item__info">Địa chỉ Showroom 3: Tòa BMM, KM2, Phúc La, Hà Đông, Hà Nội</span></li>
                    </ul>
                </div>

                <!-- <div class="grid__column-2-4"> -->
                <div>
                    <h3 class="footer__heading">Chứng nhận</h3>
                    <ul class="footer-list">
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2"><img src="https://images.dmca.com/Badges/DMCA_logo-grn-btn150w.png?ID=1ed4cd9e-5ee4-4b63-95dc-c70388edd3cb" alt="address" class="footer__certi-img"></a></li>
                        <li class="footer-item"><a class="footer-item__link" href="https://twitter.com/campus2k2"><img src="https://myshoes.vn/image/catalog/logo/logo-bct.png" alt="address" class="footer__certi-img"></a></li>
                    </ul>           
                </div>

            </div> 
            <div class="grid__row footer-bottom">
                <span class="footer-bottom__left">Copyright © 2023 by PMC WAGNER</span>
                <div class="footer-bottom__right">
                <i class="footer-bottom__icon fa-brands fa-cc-visa"></i>
                <i class="footer-bottom__icon fa-brands fa-cc-paypal"></i>
                <i class="footer-bottom__icon fa-brands fa-cc-mastercard"></i>
                <i class="footer-bottom__icon fa-brands fa-cc-discover"></i>
                </div>
            </div>
            </div>
        
        </footer>

      <script src="/Web Pages/js/productdetail.js"></script>
    </div>

    </div>
</body>
</html>