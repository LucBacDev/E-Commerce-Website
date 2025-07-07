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
    <link href="${base}/js/home.js" rel="stylesheet" />
   
</head>
<body>
   <jsp:include page="/WEB-INF/views/customer/layout/header.jsp" ></jsp:include>
    <div class="slider">
        <div class="content" >
            <div class="content-slider" id="top">
                <div class="slider img-slider" id="slider1">
                <img src="../images/bhx-mung-sinh-nhat-18-mwg-14072022224814.jpg">
                </div>
                <div class="slider img-slider" id="slider2">
                    <img src="../images/goi-xa-nhuom-30-2207202221452.jpg">
                </div>
                <div class="slider img-slider" id="slider3">
                    <img src="../images/sua-gia-si-1507202214239.jpg">
                </div>
                <div class="slider img-slider" id="slider4">
                    <img src="../images/thuc-pham-dong-lanh-13072022165918.png">
                </div>
                <div class="button-change-slider">
                    <div class="btn-change btn-change-left">
                        <i class="fa-solid fa-chevron-left"></i>
                    </div>
                    <div class="btn-change btn-change-right">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                    <div class="btn-circle" id="circle1"></div>
                    <div class="btn-circle" id="circle2"></div>
                    <div class="btn-circle" id="circle3"></div>
                    <div class="btn-circle" id="circle4"></div>
                </div>
            </div>
        </div>
    </div>
<!-- start product -->
<div class="products" id="normal-products" style="margin-top: 10px;margin-bottom: 350px;height: unset;">
    
    <div class="list-products" style="height: unset;" >
        <!-- star item -->
         <c:set var="b" scope = "session" value="${0}" />
        <c:forEach  begin="0" end="${soPhanTu}" >
       
        <div class="items">
            <c:forEach items="${data}" var="a" begin="${b}" end="${b+3}" >
                	<div class="product">
                       	<div class="img-product">
                            <a href="${base }/chitietsanpham/${a.id}"><img src="${base }/upload/${a.anh_san_pham}"></a>
                        </div>
                        <div class="title-product">
                            <a href="${base }/chitietsanpham/${a.id}">${a.ten_san_pham }</a>
                        </div>
                        <div id="price-product" class="price-product">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber value="${a.gia_ban }" type="currency"  />
                            </a>
                        </div>
                        <div  id="old-price" class="old-price">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber value="${a.gia_cu }" type="currency"  />
                            </a>
                        <div class="percent-sale" id="percent-sale"></div>
                    	</div>
                       <button type="submit" class="btn-buy-product" onclick="AddToCart('${base}', ${a.id }, 1)">
                            chọn mua									
                        </button>
                    </div>
                </c:forEach>   
        </div>
        <!-- end item -->
         <c:set var="b" scope = "session" value="${b+4}" />
       	</c:forEach>
    </div>
    
</div>
<!-- end products -->



 <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
 <jsp:include page="/WEB-INF/views/customer/layout/mainNav.jsp" ></jsp:include>  
 <jsp:include page="/WEB-INF/views/customer/layout/tool.jsp" ></jsp:include>   
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

    			$([document.documentElement, document.body]).animate({
    				scrollTop: $("#totalItems").offset().top
    			}, 2000);
    		},
    		error: function(jqXhr, textStatus, errorMessage) {
    			
    		}
    	});
    }
    </script>
   
</body>
</html>