<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
    <sf:form modelAttribute="data_user" action="${base}/addnewuser" method="post">
       <div class="square-resgister" >
            <h3>Vui lòng hoàn tất thông tin sau đây để đăng ký</h3>
           <!--   <div class="form-radio form-in-resgister" >
                <label class="label-normal">Chọn danh xưng:</label>
                <label class="label-diff top" for="type1">Anh</label>
                <input type="radio" id="type1" name="gender">
                <label class="label-diff bot" for="type2">Chị</label>
                <input type="radio" id="type2" name="gender">
                
            </div> -->
            <div class="form-in-resgister">
                <label  class="label-normal">Tên tài khoản:</label>
                <sf:input path="nameacc"  class="input-normal" id="input-name" onkeyup="hamKiemTraTen()"  type="text" ></sf:input>
                <span id="error2">Tên không hợp lệ</span>
            </div>
            <div class="form-in-resgister">
                <label class="label-normal">Số điện thoại:</label>
                <sf:input path="userName" name="username" class="input-normal" id="input-name" onkeyup="hamKiemTra()"  type="text" ></sf:input>
               
            </div>
            <div class="form-in-resgister">
                <label class="label-normal">Mật khẩu :</label>
                <sf:input path="password" name="password" id="password-input" class="input-normal" type="password" ></sf:input>
                <i style="position: relative;top: 20px;
    			right: -110px;" id="eye-show1" class="fa-solid fa-eye" onclick="An('eye-show1');Hien('eye-hidden1');xemMatKhau('password-input')"></i>
                <i style="position: relative;top: 20px;
    			right: -110px;display:none" id="eye-hidden1" onclick="An('eye-hidden1');Hien('eye-show1');anMatKhau('password-input')"  class="fa-solid fa-eye-slash"></i>
            </div>
             <div class="form-in-resgister">
                <label class="label-normal">Nhập lại khẩu:</label>
                <input id="retype-password" class="input-normal" type="password" onkeyup="soSanhNhapLai()" >
                <i style="position: relative;top: 20px;
    			right: -110px;" id="eye-show2" class="fa-solid fa-eye" onclick="An('eye-show2');Hien('eye-hidden2');xemMatKhau('retype-password')"></i>
                <i style="position: relative;top: 20px;
    			right: -110px;display:none" id="eye-hidden2" onclick="An('eye-hidden2');Hien('eye-show2');anMatKhau('retype-password')"  class="fa-solid fa-eye-slash"></i>
            </div>
            <p style="display: none;" id="p_error">Mật khẩu nhập lại không khớp !</p>
            <button type="submit" style="margin-top: 200px" class="btn-register" id="btn-hoantat">
                <p>hoàn tất</p>
            </button>
       </div>
       </sf:form>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/tool.jsp" ></jsp:include>   
 	<script type="text/javascript">
 	
 	</script>
    <script src="${base}/js/home.js" ></script>
</body>
</html>