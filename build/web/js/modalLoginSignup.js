//Created by Campus

//Get the Modal
var modal = document.getElementsByClassName("modal")[0];
//Get the Modal overlay
var modal_overlay = document.getElementsByClassName("modal_overlay")[0];
//Get the button that open the modal -> login
var labelSignup = document.getElementById("signup");
//Get the button open the modal -> signup
var labelLogin = document.getElementById("login");
//Get the Signup Form 
let loginForm = document.getElementsByClassName("auth-form")[0];
//Get the Login Form 
let signupForm = document.getElementsByClassName("auth-form register")[0];

//Switch Login button
var switchLoginBtn = document.getElementById("switchLoginBtn");
//Switch Register button
var switchSignupBtn = document.getElementById("switchSignupBtn");

//Control back modal button
var controlBackModal = document.getElementsByClassName("auth-form__control-back");

//When the user clicks the button, open the Signup modal
labelSignup.onclick = function() {
    modal.style.display = "flex";
    signupForm.style.display = "block";
    loginForm.style.display = "none";
    
}

//When the user clicks the button, open the Login modal
labelLogin.onclick = function() {
    modal.style.display = "flex";
    loginForm.style.display = "block";
    signupForm.style.display = "none";
}

//When the user clicks the button, switch the Signup Form 
switchSignupBtn.onclick = function() {
    loginForm.style.display = "none";
    signupForm.style.display = "block";
} 

//When the user clicks the button, switch the Login Form
switchLoginBtn.onclick = function() {
    signupForm.style.display = "none";
    loginForm.style.display = "block";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if(event.target == modal_overlay) {
        modal.style.display = "none";    
    }
}

// When the user clicks the button, close the modal -> Back the index.html
for(var i = 0;i < controlBackModal.length;i++) {
    controlBackModal[i].addEventListener("click", function() {
        modal.style.display = "none";    
    });
}
    
//When the user click the button Login
function callLoginServlet() {
    var username = document.getElementById("auth-form__login-username").value;
    var password = document.getElementById("auth-form__login-password").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          if(this.responseText == "client_success") {
              window.location.href = "./home";
          } 
          else if(this.responseText == "admin_success") {
              window.location.href = "./admin/home";
          }
          else {
              document.getElementById("auth-form__login-announcement").innerHTML = "Sai tài khoản hoặc mật khẩu!!!";
          }
      }
    };
    xhttp.open("POST", "LoginControl", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("username=" + username + "&password=" + password);
}


//Check function
function isCheck(fullname, phonenumber, email, password, repassword) {
    const reGex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    var check = true;

    if(fullname.length < 5) {
        console.log("Name is too short!!");
        document.getElementById("auth-form__signup-fullname--announc").innerHTML = "Tên quá ngắn!!!";
        check = false;
    } else {
        console.log("Name is valid!");
        document.getElementById("auth-form__signup-fullname--announc").innerHTML = "";
    }

    if(phonenumber.length != 10) {
        console.log("Phone number is not enought 10 numbers!!");
        document.getElementById("auth-form__signup-phonenumber--announc").innerHTML = "Tên phải đủ 10 số!!!";
        check = false;
    } else {
        console.log("Phone Number is valid!");
        document.getElementById("auth-form__signup-phonenumber--announc").innerHTML = "";
    }

    if(!reGex.test(password)) {
        console.log("Password invalid!!");
        document.getElementById("auth-form__signup-password--announc").innerHTML = "Mật khẩu từ 8 kí tự trở lên chứa số và chữ!!!";
        document.getElementById("auth-form__signup-repassword--announc").innerHTML = "";
        check = false;
    } else {
        if(password != repassword) {
            console.log("Password incorrect!!");
            document.getElementById("auth-form__signup-repassword--announc").innerHTML = "Mật khẩu không khớp!!!";
            document.getElementById("auth-form__signup-password--announc").innerHTML = "";
            check = false;
        } else {
            console.log("Password is valid");
            document.getElementById("auth-form__signup-repassword--announc").innerHTML = "";
            document.getElementById("auth-form__signup-password--announc").innerHTML = "";
        }
    }

    return check;
}

//When the user click the button Signup
function callSignupServlet() {
    var fullname = document.getElementById("auth-form__signup-fullname").value;
    var phonenumber = document.getElementById("auth-form__signup-phonenumber").value;
    var email = document.getElementById("auth-form__signup-email").value;
    var password = document.getElementById("auth-form__signup-password").value;
    var repassword = document.getElementById("auth-form__signup-repassword").value;
    
    if(isCheck(fullname, phonenumber, email, password, repassword)) {    
        var xhttp = new XMLHttpRequest();   
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
              if(this.responseText == "success") {
                  document.getElementById("auth-form__signup-announcement").innerHTML = "Tạo tài khoản thành công vui lòng đăng nhập";
              }
              else if(this.responseText == "exist") {
                  document.getElementById("auth-form__signup-announcement").innerHTML = "Email đã tồn tại vui lòng chọn email khác!!!";
              } 
              else {
                  document.getElementById("auth-form__signup-announcement").innerHTML = "Đã có lỗi xảy ra trong quá trình đăng kí vui lòng thử lại sau ít phút!!!";
              }
          }
        };

        xhttp.open("POST", "SignupControl", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("fullname=" + fullname + "&phonenumber=" + phonenumber + "&email=" + email + "&password=" + password);
    } else {
        document.getElementById("auth-form__signup-announcement").innerHTML = "Kiểm tra lại thông tin đăng nhập!!!";
    }
}

//When the user clicks the search icon
function callSearchServlet() {
    var searchContent = document.getElementById("searchContent").value;
    var content = "./SearchProductControl?searchContent=" + searchContent;
    window.location.href = content;
}

//When the user clicks the search add to cart
function callViewCarts() {
    window.location.href = "./carts";
}

