<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div class="subscribe">
        <form action="" method="">
            <div class="subscribe-input-nm">
                <input type="text" id="name" name="name" placeholder="Tên của bạn">
            </div>
            <div class="subscribe-input-nm">
                <input type="email" id="email" name="Email" placeholder="Email của bạn">
            </div>
            <div class="subscribe-input">
                <input type="checkbox" name="" placeholder="">
                <label>Đồng ý với điều khoản của trang</label>
            </div>
            <button onclick="callAjax()" type="button" class="btn-follow">Theo dõi</button>
           
        </form>
    </div>
	<script type="text/javascript">
        function callAjax(){
        	// tạo javascript object để binding với data bên phía controller  
			var requestBody = {
				name: jQuery("#name").val(), // lay theo id
				//email: jQuery("#idEmail").val(), // lay theo id
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url: "${base}/ajax/subscribe", 	   //->request mapping định nghĩa bên controller
				type: "post",					   //-> method type của Request Mapping	
				contentType: "application/json",   //-> nội dung gửi lên dạng json <=> javascript object
				data: JSON.stringify(requestBody), //-> chuyển 1 javascript object thành string json

				dataType: "json", 				   // kiểu dữ liệu trả về từ Controller
				success: function(jsonResult) {    // gọi ajax thành công
					alert(jsonResult.statusCode + " - " + jsonResult.statusMessage);
				},
				error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
					alert("error");
				}
			});

        	
        }
        
        </script>
   <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
   <!-- Jquery -->
	
    <script src='${base}/js/home.js'></script>
 
</body>

</html>