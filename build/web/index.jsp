<%-- 
    Document   : index
    Created on : Apr 26, 2023, 1:26:58 AM by Campus
    Author     : CAMPUS
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" href="styles/main.css">
        <link rel="stylesheet" href="styles/header.css">
        <link rel="stylesheet" href="styles/categorysidebar.css">
        <link rel="stylesheet" href="styles/footer.css">
        <link rel="stylesheet" href="styles/modalLoginSignup.css"/>
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
    <title>Thế giới phụ kiện - Home</title>
    
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
            
            <!-- Componenet -->
            <div class="grid__column-10">
              <!-- Home filter -->
              <div class="home-filter">

                <span class="home-filter__label">Sắp xếp theo</span>
<!--                <button class="home-filter__btn btn">Tồn kho</button>-->
                <button class="home-filter__btn btn btn--primary">Mới nhất</button>
<!--                <button class="home-filter__btn btn">Bán chạy</button>-->

                <div class="select-input">  
                  <span class="select-input__label">Price</span>
                  <i class="select-input__icon fa-sharp fa-solid fa-chevron-down"></i>
                  <!-- List option -->
                  <ul class="select-input__list">
                    <li class="select-input__item">
                        <!--choose sort type - ASC -->
                        <c:choose>
                            <c:when test="${sevlet.equals('SearchProductControl')}">
                                <a href="${sevlet}?searchContent=${searchContent}&sortBy=price&orderBy=ASC" class="select-input__link">Giá: Thấp đến cao</a>
                            </c:when>
                            
                            <c:when test="${sevlet.equals('CategoryControl')}">
                                <a href="${sevlet}?categoryID=${categoryID}&sortBy=price&orderBy=ASC" class="select-input__link">Giá: Thấp đến cao</a>
                            </c:when>
                                                               
                            <c:otherwise>
                                <a href="${sevlet}?sortBy=price&orderBy=ASC" class="select-input__link">Giá: Thấp đến cao</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="select-input__item">
                        <!--choose sort type - DESC -->
                        <c:choose>
                            <c:when test="${sevlet.equals('SearchProductControl')}">
                                <a href="${sevlet}?searchContent=${searchContent}&sortBy=price&orderBy=DESC" class="select-input__link">Giá: Cao xuống thấp</a>
                            </c:when>

                            <c:when test="${sevlet.equals('CategoryControl')}">
                                <a href="${sevlet}?categoryID=${categoryID}&sortBy=price&orderBy=DESC" class="select-input__link">Giá: Cao xuống thấp</a>
                            </c:when>  
                                
                            <c:otherwise>
                                <a href="${sevlet}?sortBy=price&orderBy=DESC" class="select-input__link">Giá: Cao xuống thấp</a>
                            </c:otherwise>
                        </c:choose>
                                
                        <!--<a href="${sevlet}?sortBy=price&orderBy=DESC" class="select-input__link">Giá: Cao đến thấp</a>-->
                      
                    </li>
                  </ul> 
                </div>

                <div class="home-filter__page">
                  <span class="home-filter__page-num">
                    <span class="home-filter__page-current">${index}</span>/${totalPage}
                  </span>

                  <div class="home-filter__page-control">
                    <!--<a href="${sevlet}?sortBy=${sortBy}&orderBy=${orderBy}&page=${index - 1}" class="home-filter__page-btn ${index == 1 ? "home-filter__page-btn--disable" : ""}">
                      <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                    </a>-->
<!--                    Left-->
                    <c:choose>
                        
                        <c:when test = "${index <= 1}">
                         <div class="home-filter__page-btn home-filter__page-btn--disable">
                           <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                         </div>
                        </c:when>
                        
                        <c:when test="${sevlet.equals('SearchProductControl')}">
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?searchContent=${searchContent}&page=${index - 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?searchContent=${searchContent}&sortBy=${sortBy}&orderBy=${orderBy}&page=${index - 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>    
                            </c:if>
                        </c:when>            

                        <c:when test="${sevlet.equals('CategoryControl')}">
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?categoryID=${categoryID}&page=${index - 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?categoryID=${categoryID}&sortBy=${sortBy}&orderBy=${orderBy}&page=${index - 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>    
                            </c:if>
                        </c:when>    
                        
                        <c:otherwise>
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?page=${index - 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?sortBy=${sortBy}&orderBy=${orderBy}&page=${index - 1}" class="home-filter__page-btn">
                                  <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-left"></i>
                                </a>
                            </c:if>
                        </c:otherwise>
                        
                    </c:choose>
                    
<!--                    Right-->
                    <c:choose>

                       <c:when test = "${index >= totalPage}">
                        <div class="home-filter__page-btn home-filter__page-btn--disable">
                          <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                        </div>
                       </c:when>
                        
                        <c:when test="${sevlet.equals('SearchProductControl')}">
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?searchContent=${searchContent}&page=${index + 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?searchContent=${searchContent}&sortBy=${sortBy}&orderBy=${orderBy}&page=${index + 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>    
                            </c:if>
                        </c:when>            

                        <c:when test="${sevlet.equals('CategoryControl')}">
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?categoryID=${categoryID}&page=${index + 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?categoryID=${categoryID}&sortBy=${sortBy}&orderBy=${orderBy}&page=${index + 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>    
                            </c:if>
                        </c:when>    
                        
                        <c:otherwise>
                            <c:if test="${sortBy == null}">
                                <a href="${sevlet}?page=${index + 1}" class="home-filter__page-btn">
                                    <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>    
                            </c:if>
                            
                            <c:if test="${sortBy != null}">
                                <a href="${sevlet}?sortBy=${sortBy}&orderBy=${orderBy}&page=${index + 1}" class="home-filter__page-btn">
                                  <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                                </a>
                            </c:if>
                        </c:otherwise>
                        
                    </c:choose>
                      
                    <!--<a href="${sevlet}?sortBy=${sortBy}&orderBy=${orderBy}&page=${index + 1}" class="home-filter__page-btn">
                      <i class="home-filter__page-icon fa-sharp fa-solid fa-chevron-right"></i>
                    </a>-->
                  </div>
                </div>
              </div>
              <!-- Product -->
              <div class="home-product">
                <!--Create 1 - Row  -->
                <div class="grid__row">
                 <c:forEach items="${listProduct}" var="o">
                  <div class="grid__column-2-4">
                    <a class="home-product-item" href="productdetail?productID=${o.ID}">  
                      <!-- Product img -->
                      <div class="home-product-item__img" style="background-image: url(${o.image1})"></div>
                      <!-- Title -->
                      <h4 class="home-product-item__name">${o.name}</h4>
                      <div class="home-product-item__price">
                        <span class="home-product-item__price-old">1.200.000đ</span>     
                        <c:set var="amount" value="${o.price}" />
                        <span class="home-product-item__price-current">
                            <c:set var="formattedAmount">
                               <fmt:formatNumber value="${amount}" pattern="###,###" type="currency" currencySymbol="₫" />
                            </c:set>
                            ${formattedAmount}₫
                        </span>
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
                        <span class="home-product-item__sold">Đánh giá</span>
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
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- footer --> 
      <%@include file="/footer.jsp"%>        
    </div>
    
      <!-- Modal layout -->
      <%@include file= "/modalLoginSignup.jsp"%>
      <script src="./js/index.js"></script>
      <script src="./js/modalLoginSignup.js"></script>
  </body>   

</html>