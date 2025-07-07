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
     <div class="linked-type-products">
        <ul>
            <li class="li-linked" ><a  href="${base}/dssanpham">Thịt các loại</a></li>
            <li><i class="fa-solid fa-chevron-right"></i></li>
            <li class="li-linked" ><a  href="${base}/dssanpham2">Thịt bò các loại</a></li>
            <li class="li-linked" ><a  href="${base}/dssanpham2">Thịt heo các loại</a></li>
            <li class="li-linked" ><a  href="${base}/dssanpham2">Thịt gà,thịt vịt</a></li>
        </ul>
    </div>
    <div class="small-bannner">
        <h3>Cam kết khi mua thịt tươi sống tại Bachhoaxanh</h3>
        <ul>
            <li><i class="fa-solid fa-circle-check"></i><p>Thịt tươi bao ăn </p></li>
            <li><i class="fa-solid fa-circle-check"></i><p>Nếu hư hỏng đền 50.000 đ </p></li>
            <li><i class="fa-solid fa-circle-check"></i><p>Giao 2h </p></li>
        </ul>
    </div>
    <div class="select-products">
        
       	<form class="form-inline" action="${base}/ketquatimkiemdssanpham2" method="get">
        <div class="select-type">
            <div class="select-div">
                <h3>Loại thịt: </h3>
                <select name="loai_san_pham" value="${searchData.loaiSanPham}">
                    <option value="bò">Tất cả</option>
                    <option value="Thăn bò">Thăn bò</option>
                    <option value="Bắp bò">Bắp bò</option>
                    <option value="Nạm bò">Nạm bò</option>
                    <option value="Đùi bò">Đùi bò</option>
                </select>
            </div>
            
            <div class="select-div">
                <h3>Mức giá: </h3>
                <select name="gia">
                	<option value="0">Mọi mức giá</option>
                    <option value="1">Dưới 100.000 đ</option>
                    <option value="2">Từ 100.000 đ - 200.000đ</option>
                    <option value="3">Trên 200.000đ</option>
                </select>
            </div>
        </div>
        <button id="btn-s-special" type="submit">Tìm kiếm</button>
        </form>
    </div>
    <div class="displayBrandSelected" id="displayBrandSelected">
        <ul>
            <li id="liBrandSelected" >Bách hóa xanh</li>
            <li><i class="fa-solid fa-circle-xmark" onclick="An('displayBrandSelected');AnBackGroundDecor()"></i></li>
        </ul>
    </div>
    <!-- star product -->
    <div class="products" id="normal-products">
        <div class="type-products" id="normal-type-products">
            <div class="title-products"><h3>Thịt bò các loại</h3></div>
            <ul class="title-type-products">
                
            </ul>
    
        </div>
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
                        <c:if test="${a.gia_cu != null }">
                        <div class="percent-sale" id="percent-sale">
                       
                        <input type="text" class="percent" value="${(((a.gia_ban-a.gia_cu)*100) div a.gia_cu) }"> 
                        
                        </div>
                        </c:if>
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
        <div class="view-more-products" id="rauCuTraiCay">
            <a href="#">Xem thêm 4 sản phẩm
            <i class="fa-solid fa-sort-down"></i>
            </a>
        </div>
    </div>
    <!-- end products -->

 <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp" ></jsp:include>
 <jsp:include page="/WEB-INF/views/customer/layout/mainNav.jsp" ></jsp:include>  
 <jsp:include page="/WEB-INF/views/customer/layout/tool.jsp" ></jsp:include>   
 
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

    			$([document.documentElement, document.body]).animate({
    				scrollTop: $("#totalItems").offset().top
    			}, 2000);
    		},
    		error: function(jqXhr, textStatus, errorMessage) {
    			
    		}
    	});
    }
    $(document).ready(function () {
    	var listPercent = document.getElementsByClassName('percent');
    	for(var i=0;i<listPercent.length;i++){
    		listPercent[i].setAttribute('value',(listPercent[i].getAttribute('value') + "%"));
    	}
	});
    </script>
</body>
</html>