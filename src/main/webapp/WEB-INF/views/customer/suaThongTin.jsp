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
       <div class="square-resgister" id="sua_thong_tin_square" >
            <h3>Thông tin của tài khoản</h3>
           	<sf:input path="id" style="display:none;" ></sf:input>
            <div class="form-in-resgister" >
                <label  class="label-normal">Tên tài khoản:</label>
                <sf:input path="nameacc"  class="input-normal" id="input-name" value="" onkeyup="hamKiemTraTen()"  type="text" ></sf:input>
                <span id="error2">Tên không hợp lệ</span>
            </div>
            <div class="form-in-resgister">
                <label class="label-normal">Số điện thoại:</label>
                <sf:input path="userName" name="username" class="input-normal" id="input-name" onkeyup="hamKiemTra()"  type="text" ></sf:input>
               
            </div>
             <div class="form-in-resgister" id="sua_Email_User">
                <label class="label-normal">Email:</label>
                <sf:input path="email" name="" class="input-normal" id="input-name" onkeyup="hamKiemTra()"  type="text" ></sf:input>
               
            </div>
            <div class="form-in-resgister" id="sua_Shippingadress_User">
                <label class="label-normal">Địa chỉ giao hàng:</label>
                <sf:input path="shippingAddress" name="username" class="input-normal" id="input-name" onkeyup="hamKiemTra()"  type="text" ></sf:input>
               
            </div>
          
             
            
            <button type="submit" class="btn-register" id="btn-hoantat">
                <p>Cập nhật</p>
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