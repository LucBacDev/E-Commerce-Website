<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
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
    <div class="infor-products">
        <div class="linked-topIP">
            <p><a href="home.html">Trang chủ</a><i class="fa-solid fa-chevron-right"></i> <a href="#">${categorie.name}</a></p>
        </div>
        <div class="content-IP">
            <div class="content-leftIP">
                <div class="big-img-IP">
                    <img id="avatar" src="${base }/upload/${product2.anh_san_pham}">
                    
                </div>
                <div class="list-small-img-IP">
                    
                    <c:forEach items="${product2.danhSachAnh }" var="productImages">
					<div class="small-img">
					<img id="${productImages.id }" class="anhNho" onmouseover="hamThayDoiAnh('${productImages.id }')" alt="" style="" src="${base}/upload/${productImages.path}">
					 </div>
					</c:forEach>
                   
                </div>
            </div>
            <div class="content-rightIP product">
                <div class="title-product">
                    <a href="#">${product2.ten_san_pham}</a>
                </div>
                <div class="price-product">
                    <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber value="${product2.gia_ban }" type="currency"  />
                            </a>
                          </div>
                    <div class="old-price">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber value="${product2.gia_cu }" type="currency"  />
                            </a>
                    </div>
               <div class="totalproduct" style="margin-left:20px">Số lượng:
                        	<button type="submit" onclick="Tru('${product2.id}')" value="-">-</button>
							<strong><input style="width: 40px;" disabled="" name="a" type="number" id="${product2.id}" value="1" ></input></strong>
							<button type="submit"  onclick="Cong('${product2.id}')" value="+">+</button>
                </div>
               
                <div style="margin-left:20px" class="btn-buy-product" onclick="AddToCartInDetail('${base}', ${product2.id})">
                    chọn mua
                </div>
                <div class="cacCamKet" style="margin-top: 50px">
                    <div class="title-camKet">
                        <h3>bachhoaxanh.com cam kết!</h3>
                    </div>
                    <a href="#" class="camKet">
                        <img src="../images/icon/Untitled-1.png">
                        <p>HÀNG TƯƠI, CHẤT LƯỢNG</p>
                    </a>
                    <a href="#" class="camKet">
                        <img src="../images/icon/Untitled-2.png">
                        <p>GIAO ĐÚNG HẸN, ĐỦ HÀNG</p>
                    </a>
                    <a href="#" class="camKet">
                        <img src="../images/icon/Untitled-3.png">
                        <p>ĐỔI TRẢ, HOÀN TIỀN DỄ DÀNG</p>
                    </a>
                    <a href="#" class="camKet">
                        <img src="../images/icon/Untitled-4.png">
                        <p>THÂN THIỆN, VUI VẺ</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- end chi tiet san pham -->
    <!-- start hang lien quan -->
    <div class="products sanPhamLienQuan" id="half-products">
        <div class="type-products" id="normal-type-products">
            <div class="title-products"><h3>Sản phẩm liên quan</h3></div>
            <ul class="title-type-products">
            </ul>
    
        </div>
        <div class="list-products">
            <!-- star item -->
            <div class="items">
            <c:forEach items="${dslq}" var="a" begin="0" end="3">
                <div class="product" >
                    <div class="img-product">
                        <a href="${base }/chitietsanpham/${a.id}"><img src="${base}/upload/${a.anh_san_pham}"></a>
                    </div>
                    <div class="title-product">
                        <a href="${base }/chitietsanpham/${a.id}" >${a.ten_san_pham}</a>
                    </div>
                    <div class="price-product">
                        <a href="${base }/chitietsanpham/${a.id}">
                         <fmt:formatNumber value="${a.gia_ban }" type="currency"  />
                        </a>
                        <div class="old-price">
                             <a href="${base }/chitietsanpham/${a.id}">
                         <fmt:formatNumber value="${data.gia_cu }" type="currency"  />
                        </a>
                        </div>
                    </div>
                    <div class="sale-product">
                        
                    </div>
                    <div class="btn-buy-product">
                        chọn mua
                    </div>
                </div>
              </c:forEach>
               
                
            </div>
            <!-- end item -->                  
        </div>
        
    </div>
    <!-- end san pham lien quan -->
    <!-- start chi tiet san pham -->
    <div  class="chiTietSanPhamAndhangThuongMua">
        <div class="chiTietSanPham">
            <div class="title-chiTietSP">
                <div class="rectangle-decor">
    
                </div>
                <h3>Chi tiết sản phẩm</h3>
            </div>
            <div class="desc-chiTietSP">
                <p>
                    ${product2.thong_tin_them }
                     
                </p>
            </div>
            <div  class="table-chiTietSanPham">
            <ul>
                <li>Loại sản phẩm</li>
                <li>${categorie.name}</li>
            </ul>
            <ul>
                <li>Thương hiệu</li>
                <li>${product2.thuong_hieu}</li>
            </ul>
            <ul>
                <li>Hướng dẫn sử dụng</li>
                <li>${product2.huong_dan_su_dung }</li>
            </ul>
            <ul>
                <li>Bảo quản</li>
                <li>${product2.bao_quan }</li>
            </ul>
            </div>
          
           
        </div>
        <div class="popular-product">
            <div class="title-popular-product">
                <h3>Nhóm hàng thường mua</h3>
            </div>
            <div class="list-popular-product">
                <div class="item">
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/thit-heo-cac-loai-202206181001590412.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Thịt heo các loại</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/kem-cac-loai-202207181419160520.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Kem các loại</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/nuoc-giat-202206091338546631.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Nước giặt</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/mi-an-lien-202203091058152867.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Mì ăn liền</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/giay-ve-sinh-202205182007248109.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Giấy vệ sinh</a></h4>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/nuoc-mam-202205182059305066.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Nước mắm</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/rau-cu-trai-cay-202205261519146845.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Rau,củ,trái cây</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/sua-tuoi-202203091057291540.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Sữa tươi</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/nuoc-ngot-202203101706260419.png"></a>
                        </div>
                        <div class="name-product">
                            <h4><a>Nước ngọt</a></h4>
                        </div>
                    </div>
                    <div class="product">
                        <div class="img-product">
                            <a href="#"><img src="../images/anhSanPhamThongDung/cha-gio-cha-ram-202206061217236534.jpg"></a>
                        </div>
                        <div class="name-product" id="khuyenMaiHot">
                            <h4><a>Chả giò,chả ram</a></h4>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
    </div>
    
      
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
    function AddToCartInDetail(baseUrl, productId) {
    	// javascript object.  data la du lieu ma day len action cua controller
    	let data = {
    		productId: productId, // Id sản phẩm
    		quanlity: $("strong > input").val(), // Số lượng cho vào giỏ hàng
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
    function Cong(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	a=parseInt(a);
    	product.setAttribute("value",a+1);
	}
    function Tru(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	product.setAttribute("value",a-1);
	}
    function hamThayDoiAnh(id){
    	var anhNho=document.getElementById(id);
    	var avatar=document.getElementById("avatar");
    	avatar.setAttribute("src",anhNho.getAttribute("src"));
    	var listAnh=document.getElementsByClassName('anhNho');
    	for(var i=0;i<listAnh.length;i++){
    		if(listAnh[i].getAttribute("id")==id){
    			listAnh[i].style.border="2px solid green";
    			
    		}
    		else{
    			listAnh[i].style.border="none";
    		}
    		
    	}
    	
    	
    }
    
    </script>
</body>
</html>