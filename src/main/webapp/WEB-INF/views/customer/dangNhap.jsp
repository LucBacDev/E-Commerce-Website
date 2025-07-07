<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    
     <jsp:include page="/WEB-INF/views/common/variables.jsp" ></jsp:include>
    <link href="${base}/css/home.css" rel="stylesheet" />
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/icon/fontawesome-free-6.1.1-web/css/all.min.css'>
    
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp" ></jsp:include>
  	<form method="POST" action="${base }/dangnhap_processing_url" >
      <div class="square-logIn" id="square-logIn">
            <p class="title-logIn">Để xem "Đơn hàng của bạn" vui lòng
                <br>đăng nhập
            </p>
            <div class="form_input">
                <p class="title-numberP">Số điện thoại: </p>
                <input type="text" name="username" onkeyup="hamKiemTra()" id="inputNumberPhone">
                <span id="error">Số điện thoại không hợp lệ</span>
                <p id="textInForm">Bạn chưa có tài khoản ? <a href="${base }/dangky">Đăng ký ngay</a></p>
            </div>
            <div id="pass" class="form_input">
                <p class="title-numberP">Mật khẩu: </p>
                <input type="password" name="password" onkeyup="" id="inputPassword">
                <i style="position: relative;top: 20px;
    			right: -185px;" id="eye-show1" class="fa-solid fa-eye" onclick="An('eye-show1');Hien('eye-hidden1');xemMatKhau('inputPassword')"></i>
                <i style="position: relative;top: 20px;
    			right: -185px;display:none" id="eye-hidden1" onclick="An('eye-hidden1');Hien('eye-show1');anMatKhau('inputPassword')"  class="fa-solid fa-eye-slash"></i>
                <p class="text-infor">Bạn quên mật khẩu <a href="#">lấy ở đây</a></p>
            </div>
            <div type="button" id="btn-continue" class="btn-register" onclick="hamHienLogIn();An('textInForm');An('btn-continue');Hien('btn-login')">
                <p>tiếp tục</p>
            </div>
            <button type="submit" style="display: none;" id="btn-login" class="btn-register" >
                <p>Đăng nhập</p>
            </button>
            <div class="hr-decor"> 
                <hr>
                <p>Hoặc sử dụng tài khoản</p>
                <hr>
            </div>
            <div class="signInAnother">
                <div class="accFB">
                    <i class="fa-brands fa-facebook"></i>
                    <p>Facebook</p>
                </div>
                <div class="accGG">
                    <i class="fa-brands fa-google"></i>
                    <p>Google</p>
                </div>
            </div>
       </div>
      </form>
     <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
     <jsp:include page="/WEB-INF/views/customer/layout/tool.jsp" ></jsp:include>   
 
    <script src="${base}/js/home.js" ></script>
</body>
</html>