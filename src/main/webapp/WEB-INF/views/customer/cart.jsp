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
    
    
    <link rel='stylesheet' type='text/css' media='screen'
    href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css'>
    <jsp:include page="/WEB-INF/views/common/variables.jsp" ></jsp:include>
    
    <link rel='stylesheet' type='text/css' media='screen' href='${base}/icon/fontawesome-free-6.1.1-web/css/all.min.css'>
    <link href="${base}/css/home.css" rel="stylesheet" />
    <link href="${base}/js/home.js" rel="stylesheet" />
   
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp" ></jsp:include>
    
    <div class="title-cart">
        <div class="history-buy" id="history" onclick="hienHistory()">
            <h4 style="margin-left: 20px">Sản phẩm đã chọn mua</h4>
        </div>
    </div>
    <div class="list_product_inCart" >
          	<c:forEach items="${cart.cartItems}" var="a" varStatus="loop" >
          	<div style="display:flex;position: relative">
          			<img style="width:80px" src="${base }/upload/${a.avatar}">
                	<div class="product">
                        <div class="title-product">
                            <a href="#">${a.productName }</a>
                        </div>
                        <div id="price-product" class="price-product" style="display:flex">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="#">Giá tiền:
                           <fmt:formatNumber value="${a.priceUnit }" type="currency"  />   
                            </a>
                            <div class="totalproduct">Số lượng:
                        	<button type="submit" onclick="AddToCart('${base }', ${a.productId }, -1);Tru('${a.productId}')" value="-">-</button>
							<strong><input style="width: 40px" disabled="," type="number" id="${a.productId}" value="${a.quanlity }"></input></strong>
							<button type="submit"  onclick="AddToCart('${base }', ${a.productId }, 1);Cong('${a.productId}')" value="+">+</button>
                        	</div>
                        	<div class="tienHang" style="margin-left: 20px;margin-top: -5px">
                        	<input style="display: none;" class="thanhTien" type="number" value="${a.priceUnit * a.quanlity }">
                        Tiền hàng:
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${a.priceUnit * a.quanlity }" type="currency"  />  
                        </div>
                        </div>
                        
                    	</div>
                    	<div class="btn-delete" style="position: absolute;right: 40px">
                        <svg xmlns="http://www.w3.org/2000/svg" onclick="DeleteFromCart( ${a.productId })" width="16" height="16"
            fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
            <path
              d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
            <path fill-rule="evenodd"
              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
          </svg>
                        </div>
                   </div>    
                   
                </c:forEach>     
      
    <!-- form cho việc thanh toán -->
			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5  p-4 bg-white rounded shadow-sm form-infor-customer">
					<div class="col-lg-6">
						<!-- <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div> -->
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold ">Thông tin khách hàng</div>
						<div class="p-4">
							<input type="number" style="display: none" value="${userLogined.id}" name="customerId">
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Họ và tên khách hàng</label>
								<input type="text" class="form-control" id="customerFullName" onblur="kiemTraTrong()"   name="customerFullName" value="${userLogined.nameacc}" placeholder="Nhập tên của bạn">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerEmail">Số điện thoại</label>
								<input type="tel" class="form-control" id="customerPhone" onblur="kiemTraTrong()"   name="customerPhone" value="${userLogined.username }" placeholder="Nhập số điện thoại">
								<small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không để lộ thông tin cá nhân của bạn</small>
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerPhone">Email</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${userLogined.email}" placeholder="Nhập email">
							</div>
							<div class="form-group" style="margin-bottom: 5px;">
								<label for="customerAddress">Địa chỉ giao hàng</label>
								<input type="text" class="form-control" id="customerAddress" onblur="kiemTraTrong()"   name="customerAddress" value="${userLogined.shippingAddress }" placeholder="Nhập địa chỉ giao hàng">
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin thanh toán</div>
						<div class="p-4">
							<p class="font-italic mb-4">Bạn cần điền tên,số điện thoại,địa chỉ giao hàng để mua !</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng:
								 </strong> 
								<input type="text" style="outline:none;border:none;background-color: none;display: none;" name="tongTienHang" value=""   id="tongTienHangBiAn" >
								<input type="text" style="outline:none;border:none;background-color: none" disabled="disabled"  value=""   id="tongTienHang" >
								</li>
								
							</ul>
							<button type="submit" id="btn-buy" disabled="disabled" onmouseover="kiemTraTrong()"  class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</button>
						</div>
					</div>
				</div>

			</form>
    </div>
  	<jsp:include page="/WEB-INF/views/customer/layout/tool.jsp" ></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
    <script src="${base}/js/home.js" ></script>

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
    function DeleteFromCart( productId) {
    	// javascript object.  data la du lieu ma day len action cua controller
    	let data = {
    		productId: productId, // Id sản phẩm
    		
    	};

    	// $ === jQuery
    	// json == javascript object
    	jQuery.ajax({
    		url: '${base}' + "/ajax/deleteFromCart", //->action
    		type: "post",
    		contentType: "application/json",
    		data: JSON.stringify(data),

    		dataType: "json", // kieu du lieu tra ve tu controller la json
    		success: function(jsonResult) {
    			//alert(jsonResult.totalItems)
    			// tăng số lượng sản phẩm trong giỏ hàng trong icon			
    			$("#totalItemsInCart").html(jsonResult.totalItems);
					location.reload();
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
    	var tongTienHangBiAn = document.getElementById('tongTienHangBiAn');
    	tong = tong.toString()+" ";
    	tong=tong.replace("000 ",".000 ₫");
    	
    	tongTienHang.setAttribute('value',tong);
    	tongTienHangBiAn.setAttribute('value',tong);
    	kiemTraTrong();
	});	
    
    
    </script>
</body>
</html>