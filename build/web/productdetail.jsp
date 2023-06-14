<%-- 
    Document   : productdetail
    Created on : May 10, 2023, 1:05:53 AM
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
    <link rel="stylesheet" href="styles/categorysidebar.css">
    <link rel="stylesheet" href="styles/productdetail.css">
    <link rel="stylesheet" href="styles/modalLoginSignup.css"/>
    <link rel="stylesheet" href="styles/propose.css">
    <link rel="stylesheet" href="styles/footer.css">
    <!-- icon -->
      <link rel="icon" href="./imgs/iconlogo.png">
    <!-- font download -->
    <link rel="stylesheet" href="./fontawesome-free-6.4.0-web/css/all.min.css"> 
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com"> 
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <!--Footer css-->
    <link rel="stylesheet" href="styles/footer.css"/>

  <!-- title -->
    <title>${product.name}</title>

  <!--Ajax-->
  <!--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
</head>

<body>
    <!-- Block Element Modifier -->
    <div class="app">
      <!-- header -->
        <%@include file="/header.jsp"%>
        
      <!-- container -->
      <div class="app__container">
        <div class="grid">
        <!-- Grid row -->
        <div class="grid__row app__content">
            <!-- Side bar -->
            <%@include file="/categorysidebar.jsp"%>
            
            <!-- Product detail -->
            <div class="grid__column-8">
                <div class="grid__row">
                    <!-- Home -->
                    <div class="grid__column-3-4">
                        <img src="${product.image1}" alt="product-img1" class="product-detail__img">
                    </div>   
                    <div class="grid__column-3-4">
                        <div class="product-detail">
                            <!-- Title -->
                            <h3 class="product-detail__title">
                                ${product.name}
                            </h3>
                            <!-- Price and quantity -->
                            <div class="product-detail__status">
                            <div class="product-detail__status-content">Giá: ${product.price}₫</div>
                            <div class="product-detail__status-content">Kho hàng: ${product.quantity_remain}</div>
                            </div>
                            <!-- Select Quantities -->
                            <div class="product-detail__quantity">
                                
                                <div class="product-detail__quantity-input">
                                    <div class="product-detail__quantity-select">Chọn số lượng:</div>   
                                    <input id="product-detail__quantity--value" type="text" name="quantity" value="1" data-minimum="1" class="product-detail__quantity--value">
                                    <button class="product-detail__quantity-btn btn__spinner-box btn-minus">-</button>
                                    <button class="product-detail__quantity-btn btn__spinner-box btn btn-plus">+</button>
                                </div>
                            </div>
                            <!-- Add to cart -->
                            <div class="product-detail__cart">
                                <button onclick="callAddToCart()"  class="product-detail__cart-btn btn product-detail__cart-add">
                                    <i class="product-detail__cart-icon fa-solid fa-cart-plus"></i>
                                    Thêm vào giỏ
                                </button>
                                <button class="product-detail__cart-btn btn product-detail__cart-order">
                                    <i class="product-detail__cart-icon fa-solid fa-money-check-dollar"></i>
                                    Mua hàng ngay
                                </button>
                            </div>
                        </div>
                    </div>  
                    <!-- Description -->
                    <div class="grid__column-3-8">
                        <div class="product-info">
                            <div><div class="product-info__option">Mô Tả Sản Phẩm</div></div>
                            <div class="product-info__body">
                                <h3 class="product-info__title">${product.title}</h3>
                                <p class="product-info__content">${product.des}</p>
                                <img src="${product.image2}" alt="product-img2" class="product-info__img">
                              </div>
                        </div>
                    </div>         
                    <!-- Comments -->
<!--                    <div class="grid__column-3-8">
                        <div class="product-comment">   
                            <div><div class="product-comment__option">Bình Luận Của Khách Hàng</div></div>
                            <div class="product-comment__client">
                                <c:forEach items="${listComment}" var="comment">
                                <div class="product-comment__client-each">
                                    <h3 class="product-comment__name">Khách hàng: ${comment.fullName}</h3>
                                    <p class="product-comment__content">Nội dung: ${comment.title}</p>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="product-comment__me">
                                <input id="product-comment__value" type="text" class="product-comment__value" placeholder="Hãy nhập bình luận của bạn">
                                <button id="btnSubmitComment" onclick="callSendComment()" class="product-comment__btn btn">Gửi bình luận</button>
                            </div>
                        </div>   
                    </div>     -->
                </div>
            </div>
            <%@include file="/propose.jsp"%>  
      </div>
        </div>
      </div>

      <!-- footer -->
      <%@include file="/footer.jsp"%>  
    </div>
    
    <script src="./js/productdetail.js"></script>
    <%@include file= "/modalLoginSignup.jsp"%>
    <script src="./js/modalLoginSignup.js"></script>
    <script src="./js/index.js"></script>
</body>
</html>