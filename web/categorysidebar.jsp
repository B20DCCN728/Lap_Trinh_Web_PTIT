<%-- 
    Document   : categorysidebar
    Created on : Apr 27, 2023, 9:42:03 AM
    Author     : PC
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <!-- Side bar -->
            <div class="grid__column-2">
              <!-- Navbar item -->
              <nav class="category">
                <!-- Heading navbar -->
                <h3 class="category__heading">
                  <i class="category__heading-icon fa-solid fa-list"></i>
                  Danh Mục
                </h3>
                <!-- List item -->
                <!--Phụ kiện điện thoại-->
                <div class="category__menu">
                  <div class="category__menu-name">Phụ kiện điện thoại</div>
                  <ul class="category-list"> 
                      <c:forEach items="${listCategory}" var="o">
                          <c:if test="${o.parent == 1}">
                            <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                              <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                            </li>           
                          </c:if>
                      </c:forEach>
<!--                      <li class="category-item">
                        <a href="#" class="category-link">Nike</a>
                      </li>
                      <li class="category-item">
                        <a href="#" class="category-link">Converse</a>
                      </li>
                      <li class="category-item">
                        <a href="#" class="category-link">Vans</a>
                      </li>-->
                  </ul>
                </div>
                <!--Phụ kiện máy tính-->
                <div class="category__menu">
                  <div class="category__menu-name">Phụ kiện máy tính</div>
                  <ul class="category-list"> 
                      <c:forEach items="${listCategory}" var="o">
                          <c:if test="${o.parent == 2}">
                            <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                              <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                            </li>           
                          </c:if>
                      </c:forEach>
                  </ul>
                </div>
                <!--Phụ kiện camera-->
                <div class="category__menu">
                  <div class="category__menu-name">Phụ kiện camera</div>
                  <ul class="category-list"> 
                      <c:forEach items="${listCategory}" var="o">
                          <c:if test="${o.parent == 3}">
                            <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                              <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                            </li>           
                          </c:if>
                      </c:forEach>
                  </ul>
                </div>
                <!--Phụ kiện âm thanh, ánh sáng-->
                <div class="category__menu">
                  <div class="category__menu-name">Phụ kiện âm thanh, ánh sáng</div>
                  <ul class="category-list"> 
                      <c:forEach items="${listCategory}" var="o">
                          <c:if test="${o.parent == 4}">
                            <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                              <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                            </li>           
                          </c:if>
                      </c:forEach>
                  </ul>
                </div>
                <!--Phụ kiện khác-->
                <div class="category__menu">
                  <div class="category__menu-name">Phụ kiện khác</div>
                  <ul class="category-list"> 
                      <c:forEach items="${listCategory}" var="o">
                          <c:if test="${o.parent == 5}">
                            <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                              <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                            </li>           
                          </c:if>
                      </c:forEach>
                  </ul>
                </div>
                <!--<ul class="category-list">
                  <li class="category-item category-link--active">
                    <a href="#" class="category-link">Adidas</a>
                  </li>
                  
                  <c:forEach items="${listCategory}" var="o">
                    <li class="category-item ${categoryID == o.id ? "category-link--active" : ""}">
                      <a href="CategoryControl?categoryID=${o.id}" class="category-link">${o.name}</a>
                    </li>
                  </c:forEach>
                </ul>-->
                
      
              </nav>
            </div>