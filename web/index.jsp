<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles/login.css">
    <link rel="stylesheet" href="styles/style2.css">
    <title>Phụ Kiện Công Nghệ</title>
</head>
    <body>
        <form method="post" action="login" class="form">
            
            <h1 id="heading">Đăng nhập</h1>

            <div class="form-group">
                <label class="form-label" for="email">Email</label>
                <input class="form-control" id="email" name="email" type="text" placeholder="Nhập địa chỉ email" required />
                <span class="form-message" id="email_error">${email_error}</span>
            </div>
            <div class="form-group">
                <label class="form-label" for="password">Mật khẩu</label>
                <input class="form-control" id="password" name="password" type="password" placeholder="Nhập mật khẩu" required/>
                <span class="form-message" id="password_error">${password_error}</span>
            </div>

            <button class="form-button" id="button" type="submit" onclick="validate_Login()">Đăng nhập</button>
        
            <div class="form-link">
                <label class="form-label" >Bạn chưa có tài khoản?</label>
                <a href="signup.jsp">Đăng ký ngay</a>
            </div>
        </form>
    </body>
<!--    <script src="js/validate.js"></script>-->
</html>