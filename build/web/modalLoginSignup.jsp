<%-- 
    Document   : register
    Created on : Apr 28, 2023, 2:17:48 PM
    Author     : CAMPUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!--Modal Layout-->
    <div class="modal">
      <!-- Lớp phủ -->
      <div class="modal_overlay"></div>
      <!-- Nội dung -->
      <div class="modal_body">
        <!-- Login Form -->
        <div class="auth-form">

          <!-- First  -->
          <div class="auth-form__container">

            <!-- Header -->
            <div class="auth_form__header">
              <h3 class="auth_form__heading">Đăng Nhập</h3>
              <span id="switchSignupBtn" class="auth-form__switch-btn">Đăng Kí</span>
            </div>

            <!-- form input -->
            <div class="auth-form__form">
              <div class="auth-form__group">
                  <p id="auth-form__login-announcement" class="auth-form__signup-announcement"></p>
              </div>
              <div class="auth-form__group">
                <input id="auth-form__login-username" type="text" class="auth-form__input" placeholder="Nhập email của bạn">
              </div>
              <div class="auth-form__group">
                <input id="auth-form__login-password" type="password" class="auth-form__input" placeholder="Nhập mật khẩu của bạn">                               
              </div>
            </div>

            <!-- bonus -->
            <div class="auth-form__aside">
              <div class="auth-form__help">
                <a href="" class="auth-form__help-link auth-form__help-forgot">Quên mật khẩu</a>
                <span class="auth-form__help-separate"></span>
                <a href="" class="auth-form__help-link">Cần trợ giúp</a>
              </div>

            </div>

            <!-- submit control -->
            <div class="auth-form__controls">
              <button class="btn btn--normal auth-form__control-back">Trở lại</button>
              <button onclick="callLoginServlet()" class="btn btn--primary">Đăng Nhập</button>
            </div>
          </div>

          <!-- Second -->
          <!-- Connect by social -->
          <div class="auth-form__socials">
            <a href="https://www.facebook.com/thiep.ha.161" class="auth-form__facebook-icon btn btn--size-s btn--with-icon">
              <i class="auth-form__socials-icon fab fa-facebook-square"></i>
              <span class="auth-form__socials-title">
                Kết nối với Facebook
              </span>
            </a>
            <a href="https://www.facebook.com/yjspyeu/" class="auth-form__google-icon btn btn--size-s btn--with-icon">
              <i class="auth-form__socials-icon fab fa-google"></i>
              <span class="auth-form__socials-title">
                Kết nối với Google
              </span>
            </a>
          </div>
        </div>
        
        
        <!-- Register Form -->
        <div class="auth-form register">

            <!-- First  -->
            <div class="auth-form__container">
              <!-- Header -->
              <div class="auth_form__header">
                <h3 class="auth_form__heading">Đăng kí</h3>
                <span id="switchLoginBtn" class="auth-form__switch-btn">Đăng nhập</span>
              </div>
              
              <!-- form input -->
              <div class="auth-form__form">
                <div class="auth-form__group">
                  <p id="auth-form__signup-announcement" class="auth-form__signup-announcement"></p>
                </div>
                  
                <div class="auth-form__group">
                  <input id="auth-form__signup-fullname" type="text" class="auth-form__input" placeholder="Nhập đầy đủ tên của bạn">
                  <p id="auth-form__signup-fullname--announc" class="auth-form__signup-announcement"></p>
                </div>
                  
                <div class="auth-form__group">
                  <input id="auth-form__signup-email" type="email" class="auth-form__input" placeholder="Nhập email của bạn">
                </div>
                  
                <div class="auth-form__group">
                  <input id="auth-form__signup-phonenumber" type="text" class="auth-form__input" placeholder="Nhập số điện thoại của bạn">
                  <p id="auth-form__signup-phonenumber--announc" class="auth-form__signup-announcement"></p>
                </div>
                  
                <div class="auth-form__group">
                  <input id="auth-form__signup-password" type="password" class="auth-form__input" placeholder="Nhập mật khẩu của bạn">   
                  <p id="auth-form__signup-password--announc" class="auth-form__signup-announcement"></p>
                </div>
                  
                <div class="auth-form__group">
                  <input id="auth-form__signup-repassword" type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu">      
                  <p id="auth-form__signup-repassword--announc" class="auth-form__signup-announcement"></p>
                </div> 
<!--                <div class="auth-form__group">
                  <input id="auth-form__signup-address" type="text" class="auth-form__input" placeholder="Nhập địa chỉ của bạn">
                </div>-->
<!--                <div class="auth-form__group">
                  <input id="auth-form__signup-phonenumber" type="text" class="auth-form__input" placeholder="Nhập số điện thoại của bạn">
                </div>-->
              </div>
  
              <!-- bonus -->
              <div class="auth-form__aside">
                <p class="auth-form__policy-text">
                  Bằng việc đăng kí, bạn đã đồng ý với chúng tôi về
                  <a href="" class="auth-form__text-link">Điều khoản dịch vụ</a> &
                  <a href="" class="auth-form__text-link">Chính sách bảo mật</a>
                </p>
              </div>
  
              <!-- submit control -->
              <div class="auth-form__controls">
                <button class="btn btn--normal auth-form__control-back">Trở lại</button>
                <button id="signup_btn" onclick="callSignupServlet()" class="btn btn--primary">Đăng kí</button>
              </div>
            </div>
  
            <!-- Second -->
            <!-- Connect by social -->
            <div class="auth-form__socials">
              <a href="https://www.facebook.com/thiep.ha.161" class="auth-form__facebook-icon btn btn--size-s btn--with-icon">
                <i class="auth-form__socials-icon fab fa-facebook-square"></i>
                <span class="auth-form__socials-title">
                  Kết nối với Thiệp
                </span>
              </a>
              <a href="https://www.facebook.com/yjspyeu/" class="auth-form__google-icon btn btn--size-s btn--with-icon">
                <i class="auth-form__socials-icon fab fa-google"></i>
                <span class="auth-form__socials-title">
                  Kết nối với Việt
                </span>
              </a>
            </div>
        </div> 
        
      </div>
    </div>