<%-- 
    Document   : propose
    Created on : May 10, 2023, 12:57:01 AM
    Author     : PC
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!-- Propose -->
            <div class="grid__column-2">               
                <!-- Navbar item -->
                <nav class="category">
                  <!-- Heading navbar -->
                  <h3 class="category__heading">
                    <i class="fa-regular fa-down"></i>
                    <!-- <i class="category__heading-icon fa-solid fa-list"></i> -->
                    <i class="category__heading-icon fa-solid fa-arrow-down"></i>
                    Tương Tự
                  </h3>
                  <!-- Item -->
                  <div class="grid__row-propose">
                    <c:forEach items="${proposeList}" var="o">
                    <div class="grid__column-2-1">
                      <a class="home-product-item" href="productdetail?productID=${o.ID}">  
                        <!-- Product img -->
                        <div class="home-product-item__img" style="background-image: url(${o.image1})"></div>
                        <!-- Title -->
                        <h4 class="home-product-item__name">${o.name}</h4>
                        <div class="home-product-item__price">
                          <span class="home-product-item__price-old">1.200.000đ</span>                        
                          <span class="home-product-item__price-current">${o.price}đ</span>
                        </div>
                        <!-- Like and vote rating and sold -->
                        <div class="home-product-item__action">
                          <span class="home-product-item__like home-product-item__like--liked">
                            <i class="home-product-item__like-icon--empty fa-regular fa-heart"></i>
                            <i class="home-product-item__like-icon--fill fa-solid fa-heart"></i>
                          </span>
                          <div class="home-product-item__rating">
                            <i class="home-product-item_star--gold fa-solid fa-star"></i>
                            <i class="home-product-item_star--gold fa-solid fa-star"></i>
                            <i class="home-product-item_star--gold fa-solid fa-star"></i>
                            <i class="home-product-item_star--gold fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                          </div>
                          <span class="home-product-item__sold">Đã bán</span>
                        </div>
                        <!-- Branch and Product Source -->
                        <div class="home-product-item__origin">
                          <span class="home-product-item__branch">${o.category.name}</span>
                          <span class="home-product-item__source">${o.quantity_remain}</span>
                        </div>
                        <!-- Favourite -->
                        <div class="home-product-item__favourite">
                          <i class="fa-solid fa-check"></i>
                          <span>Chính hãng</span> 
                        </div>
                        <!-- Sell off -->
                        <div class="home-product-item__sell-off">
                          <span class="home-product-item__sell-off-percent">100%</span>
                          <span class="home-product-item__sell-off-label">Giảm</span> 
                        </div>
                      </a>    
                    </div>
                    </c:forEach>
                  </div>
                </nav>
            </div>