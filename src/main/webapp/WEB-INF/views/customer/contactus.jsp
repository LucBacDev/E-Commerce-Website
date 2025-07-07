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
    <link href="${base}/js/home.js" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp" ></jsp:include>
  
   <%-- Cach 1 use method post in 1 form
     <form action="${base}/contactus" method="post" class="contact_div">
        <h3 class="title_contact">Liên hệ với chúng tôi</h3>
        <div class="infor-input">
            <label>Tên của bạn:</label>
        <input type="text" name="fullName" placeholder="Mời bạn nhập tên">
        </div>
        <div class="infor-input">
            <label>Email của bạn:</label>
            <input type="email" name="email" placeholder="Mời bạn nhập email">
        </div>
        <div class="infor-input">
            <label>Ý kiến đóng góp của bạn:</label>
            <textarea rows="10" cols="40" name="ideal"></textarea>
        </div>
        <button class="btn-send">
            Gửi 
        </button>
    </form> --%>
    <%-- cach 2 use spring form
    b1: import thu vien spring form
    b2: tao data mapping,trong truong hop nay la contact
    b3: su dung cac the spring form de tao form --%>
     <sf:form modelAttribute="contact" action="${base}/contactus" method="post" class="contact_div">
        <h3 class="title_contact">Liên hệ với chúng tôi</h3>
        <div class="infor-input">
            <label>Tên của bạn:</label>
        <sf:input path="fullName"  type="text" name="fullName" placeholder="Mời bạn nhập tên"></sf:input>
        </div>
        <div class="infor-input">
            <label>Email của bạn:</label>
            <sf:input path="email" type="email" name="email" placeholder="Mời bạn nhập email"></sf:input>
        </div>
        <div class="infor-input">
            <label>Ý kiến đóng góp của bạn:</label>
            <sf:textarea path="ideal" rows="10" cols="40" name="ideal"></sf:textarea>
        </div>
        <button class="btn-send">
            Gửi 
        </button>
    </sf:form>
    

   
    
    <script src="${base}/js/home.js" ></script>
</div>
</body>
</html>