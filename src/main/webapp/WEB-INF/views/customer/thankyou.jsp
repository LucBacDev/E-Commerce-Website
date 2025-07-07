<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<link rel='stylesheet' type='text/css' media='screen'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css'>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<link rel='stylesheet' type='text/css' media='screen'
	href='${base}/icon/fontawesome-free-6.1.1-web/css/all.min.css'>
<link href="${base}/css/home.css" rel="stylesheet" />
<link href="${base}/js/home.js" rel="stylesheet" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<div style="margin-top: 80px;margin-left: 250px;background-color: white;width: 980px;height: 150px">
	<h1 style="text-align: center;line-height: 150px"><i>Cảm ơn bạn đã mua hàng !</i></h1>
	</div>
	
	<div class="footer">
        <div class="content-top-footer">
            <div class="title-ship">
                <i class="fa-solid fa-clock"></i>
                <p>Đặt online <span>giao tận nhà ĐÚNG GIỜ</span><br>(nếu trễ tặng PMH 50.000₫)</p>
            </div>
            <div class="title-traHang">
                <a href="#">
                <i class="fa-solid fa-dolly"></i>
                <p>Đổi, trả sản phẩm <span>trong 7 ngày</span></p>
                </a>
            </div>
        </div>
        <div class="content-mid-footer">
            <div class="left-content">
                <div class="title-left-content">
                    <i class="fa-solid fa-phone"></i>
                    <h3 style="font-size: 20px">Tổng đài:  1900.1908-028.3622.9900 (7:00 - 21:30)</h3>
                </div>
                <div class="functions">
                    <ul>
                        <a href="#"><li>Chính sách giao hàng</li></a>
                        <a href="#"><li>Liên hệ</li></a>
                        <a href="#"><li>Quy chế hoạt động</li></a>
                        <a href="#"><li>Hỏi đáp</li></a>
                    </ul>
                    <ul>
                        <a href="#"><li>Chính sách khách hàng</li></a>
                        <a href="#"><li>Hóa đơn điện tử</li></a>
                        <a href="#"><li>Giới thiệu công ty</li></a>
                        <a href="#"><li>Tuyển dụng </li></a>
                    </ul>
                    <ul>
                        <a href="#"><li>Chính sách đổi trả</li></a>
                        <a href="#"><li>Hướng dẫn mua hàng</li></a>
                        <a href="#"><li>Cần thuê mặt bằng</li></a>
                        <a href="#"><li>Tích điểm Quà tặng VIP</li></a>
                    </ul>
                </div>
                <div class="link-recruit">
                    <a href="#">11.407  công việc đang chờ bạn</a>
                </div>
            </div>
            <div class="right-content">
                <div class="text-relative-works text1">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <a href="#">Đăng ký chào hàng vào Bách Hóa Xanh</a>
                </div>
                <div class="text-relative-works text2">
                    <i class="fa-solid fa-store"></i>
                    <a href="#">Hệ thống <span>1.770</span> cửa hàng Bách Hóa Xanh</a>
                </div>
                <div class="img-footer"> 
                    <img src="../images/img-footer.png" style="width: 390px;">
                </div>
                <div class="link-contact">
                    <a href="${base}/contactus">Liên hệ với chúng tôi</a>
                </div>
            </div>
        </div>
    </div>
    <div class="text-location">
        <p>© 2018. Công Ty Cổ Phần Thương Mại Bách Hoá Xanh. GPDKKD: 0310471746 do sở KH & ĐT TP.HCM cấp ngày 23/11/2010. Giấy phép thiết lập mạng xã hội trên mạng (Số 20/GP-BTTTT) do Bộ Thông Tin Và Truyền Thông cấp ngày 11/01/2021. Trụ sở chính: 128 Trần Quang Khải, P.Tân Định, Quận.1, TP.HCM. Địa chỉ liên hệ: Toà nhà MWG, Lô T2-1.2, Đường D1, Khu Công Nghệ Cao, P. Tân Phú, TP.Thủ Đức, TP.HCM. Email:lienhe@bachhoaxanh.com SĐT: 028.38125960 Chịu trách nhiệm nội dung: Trần Nhật Linh. </p>
    </div>

	<jsp:include page="/WEB-INF/views/customer/layout/tool.jsp"></jsp:include>
	
	<script src="${base}/js/home.js"></script>

	<script type="text/javascript">
    function AddToCart(baseUrl, productId, quanlity) {
    	// javascript object.  data la du lieu ma day len action cua controller
    	let data = {
    		productId: productId, // Id sản phẩm
    		quanlity: quanlity, // Số lượng cho vào giỏ hàng
    	};

    	// $ === jQuery
    	// json == javascript object
    	jQuery.ajax({
    		url: baseUrl + "/ajax/addToCart", //->action
    		type: "post",
    		contentType: "application/json",
    		data: JSON.stringify(data),

    		dataType: "json", // kieu du lieu tra ve tu controller la json
    		success: function(jsonResult) {
    			//alert(jsonResult.totalItems)
    			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
    			$("#totalItemsInCart").html(jsonResult.totalItems);
					
    			//$([document.documentElement, document.body]).animate({
    				//scrollTop: $("#totalItems").offset().top
    			//}, 2000);
    		},
    		error: function(jqXhr, textStatus, errorMessage) {
    			
    		}
    	});
    }
        function Cong(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	a=parseInt(a);
    	product.setAttribute("value",a+1);
    	location.reload();
	}
    function Tru(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	product.setAttribute("value",a-1);
    	location.reload();
	}
    
    function kiemTraTrong(){
    	var btn = document.getElementById('btn-buy');
    	var fullName = document.getElementById('customerFullName').value;
    	var phone = document.getElementById('customerPhone').value;
    	var address = document.getElementById('customerAddress').value;
    	if(fullName.length>0&&phone.length==10&&address.length>0){
    		btn.removeAttribute('disabled');
    	}
    	else{
    		btn.setAttribute('disabled','disabled');
    	}
    	
    	
   	}
    $(document).ready(function () {
    	var thanhTien = document.getElementsByClassName('thanhTien');
    	var tong =0;
    	for(var i=0;i<thanhTien.length;i++){
    		var tam=thanhTien[i].getAttribute('value').replace(".000 ₫","000");
    		tong = tong + parseInt(tam);
    	}
    	var tongTienHang = document.getElementById('tongTienHang');
    	
    	tong = tong.toString()+" ";
    	tong=tong.replace("000 ",".000 ₫");
    	
    	tongTienHang.setAttribute('value',tong);
    	kiemTraTrong();
	});	
    
    
    </script>
</body>
</html>