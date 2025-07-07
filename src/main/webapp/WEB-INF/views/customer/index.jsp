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
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
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
    <div class="popular-product bd-radius ">
            <div class="title-popular-product">
                <h3>Nhóm hàng thường mua</h3>
            </div>
            <div class="list-popular-product">
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
                <div class="product">
                    <div class="img-product">
                        <a href="#"><img src="../images/anhSanPhamThongDung/nuoc-mam-202205182059305066.png"></a>
                    </div>
                    <div class="name-product">
                        <h4><a>nước mắm</a></h4>
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
        <!-- start product -->
        <div class="products bd-radius" style="margin-top: 130px">
            <div class="type-products">
                <div class="title-products"><h3>Sản phẩm khuyến mãi</h3></div>
                <ul class="title-type-products">
                    <a href="#"><li class="khuyenMai">5448 khuyến mãi sốc</li></a>
                    <a href="#"><li>Thịt,cá,trứng</li></a>
                    <a href="#"><li>Rau,củ,quả</li></a>
                    <a href="#"><li>Bia,nước,giải khát</li></a>
                    <a href="#"><li>Sữa các loại</li></a>
                    <a href="#"><li>Bánh kẹo các loại</li></a>
                </ul>
                <div class="btn-change-type-products">
                    <div class="btn-change btn-change-left">
                        <i class="fa-solid fa-chevron-left"></i>
                    </div>
                    <div class="btn-change btn-change-right">
                        <i class="fa-solid fa-chevron-right"></i>
                    </div>
                </div>
            </div>
            <div class="list-products">
            	<div class="items">
                <c:forEach items="${saleProducts}" var="a" begin="0" end="3" >
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
            <div class="items">
                <c:forEach items="${saleProducts}" var="a" begin="4" end="7" >
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
            </div>
            <div class="view-more-products" id="thitCaTrung">
                <a href="#">Xem thêm 5440 sản phẩm
                <i class="fa-solid fa-sort-down"></i>
                </a>
            </div>
        </div>
        <!-- end products -->
<!-- --------------------------------------------------------------------------------------------------------------------------- -->
<!-- start product -->
<div class="products" id="normal-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Thịt,cá,trứng,hải sản</h3></div>
        <ul class="title-type-products">
            <a href="#"><li class="khuyenMai">84 thịt,cá,trứng</li></a>
            <a href="#"><li>Thịt heo các loại</li></a>
            <a href="#"><li>Thịt gà thịt vịt</li></a>
            <a href="#"><li>Thịt bò các loại </li></a>
            <a href="#"><li>Cá,hải sản</li></a>
            <a href="#"><li>Trứng gà,vịt,cút</li></a>
        </ul>

    </div>
    <div class="list-products">
        <!-- star item -->
        <div class="items">
            <c:forEach items="${ListType1}" var="a" begin="0" end="3" >
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
                         <!-- star item -->
        <div class="items">
            <c:forEach items="${ListType1}" var="a" begin="4" end="7" >
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
    </div>
    <div class="view-more-products" id="rauCuTraiCay">
        <a href="#">Xem thêm 76 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
    </div>
</div>
<!-- end products -->
<!-- ------------------------------------------------------------------------------------------------------------------------------ -->
         <!-- start product -->
<div class="products" id="normal-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Rau,củ,trái cây</h3></div>
        <ul class="title-type-products">
            <a href="#"><li class="khuyenMai">111 Rau,củ,trái cây</li></a>
            <a href="#"><li>Rau lá các loại</li></a>
            <a href="#"><li>Rau củ các loại</li></a>
            <a href="#"><li>Trái cây các loại </li></a>
 
        </ul>

    </div>
    <div class="list-products">
        <!-- star item -->
        <div class="items">
            <c:forEach items="${ListType2}" var="a" begin="0" end="3" >
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
                         <!-- star item -->
        <div class="items">
            <c:forEach items="${ListType2}" var="a" begin="4" end="7" >
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
    </div>
    <div class="view-more-products" id="biaNuocGiaiKhat">
        <a href="#">Xem thêm 104 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
    </div>
</div>
<!-- end products -->
<!-- ------------------------------------------------------------------ -->
<!-- star part-products -->
<div class="products" id="half-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Bia,nước giải khát</h3></div>
        <ul class="title-type-products">
        </ul>

    </div>
    <div class="list-products">
        <!-- star item -->
        <div class="items">
        	<c:forEach items="${ListType3}" var="a"  end="0" >
                	<div class="product" id="special-product">
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
                            <a href="#">
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
        
            <c:forEach items="${ListType3}" var="a" begin="1" end="3" >
                	<div class="product" >
                       	<div class="img-product">
                            <a href="${base }/chitietsanpham/${a.id}"><img src="${base }/upload/${a.anh_san_pham}"></a>
                        </div>
                        <div class="title-product">
                            <a href="${base }/chitietsanpham/${a.id}">${a.ten_san_pham }</a>
                        </div>
                       <div id="price-product" class="price-product">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber>${a.gia_ban }</fmt:formatNumber>đ
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
                         
    </div>
    <div class="view-more-products" id="suaCacLoai">
        <a href="#">Xem thêm 104 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
        <div class="type-half-products">
            <ul>
                <li><a href="#">Bia, nước có cồn</a></li>
                <li><a href="#">Nước trà các loại</a></li>
            </ul>
            <ul>
                <li><a href="#">Rượu các loại</a></li>
                <li><a href="#">Nước ép trái cây</a></li>
            </ul>
            <ul>
                <li><a href="#">Nước ngọt</a></li>
                <li><a href="#">Sữa trái cây, trà sữa</a></li>
            </ul>
            <ul>
                <li><a href="#">Nước tăng lực, bù khoáng</a></li>
                <li><a href="#">Trái cây hộp, si rô</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end part-products -->
<!-- ------------------------------------------------------------------ -->
<!-- star part-products -->
<div class="products" id="half-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Sữa các loại</h3></div>
        <ul class="title-type-products">
        </ul>

    </div>
    <div class="list-products">
         <!-- star item -->
        <div class="items">
        	<c:forEach items="${ListType4}" var="a"  end="0" >
                	<div class="product" id="special-product">
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
        
            <c:forEach items="${ListType4}" var="a" begin="1" end="3" >
                	<div class="product" >
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
    </div>
    <div class="view-more-products" id="banhKeoCacLoai">
        <a href="#">Xem thêm 516 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
        <div class="type-half-products">
            <ul>
                <li><a href="#">Sữa tươi</a></li>
                <li><a href="#">Sữa đặc</a></li>
            </ul>
            <ul>
                <li><a href="#">Sữa chua uống liền</a></li>
                <li><a href="#">Ngũ cốc các loại</a></li>
            </ul>
            <ul>
                <li><a href="#">Sữa hạt, sữa đậu</a></li>
                <li><a href="#">Sữa bột các loại</a></li>
            </ul>
            <ul>
                <li><a href="#">Sữa ca cao, lúa mạch</a></li>
                <li><a href="#"></a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end part-products -->
<!-- ---------------------------------------------------------------- -->
<!-- ------------------------------------------------------------------ -->
<!-- star part-products -->
<div class="products" id="half-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Bánh kẹo các loại</h3></div>
        <ul class="title-type-products">
        </ul>

    </div>
    <div class="list-products">
         <!-- star item -->
        <div class="items">
        	<c:forEach items="${ListType5}" var="a"  end="0" >
                	<div class="product" id="special-product">
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
        
            <c:forEach items="${ListType5}" var="a" begin="1" end="3" >
                	<div class="product" >
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
                            <a href="#">
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
                         
    </div>
    <div class="view-more-products" id="miMienChaoPho">
        <a href="#">Xem thêm 1.054 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
        <div class="type-half-products">
            <ul>
                <li><a href="#">Kẹo cứng</a></li>
                <li><a href="#">Bánh gạo</a></li>
            </ul>
            <ul>
                <li><a href="#">Kẹo dẻo, kẹo marshmallow</a></li>
                <li><a href="#">Bánh quế</a></li>
            </ul>
            <ul>
                <li><a href="#">Kẹo singum</a></li>
                <li><a href="#">Bánh xốp</a></li>
            </ul>
            <ul>
                <li><a href="#">Bánh quy</a></li>
                <li><a href="#">Bánh que</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end part-products -->
<!-- ---------------------------------------------------------------- -->
<!-- ------------------------------------------------------------------ -->
<!-- star part-products -->
<div class="products" id="half-products">
    <div class="type-products" id="normal-type-products">
        <div class="title-products"><h3>Mì,Miến,Cháo,Phở</h3></div>
        <ul class="title-type-products">
        </ul>

    </div>
    <div class="list-products">
         <!-- star item -->
        <div class="items">
        	<c:forEach items="${ListType6}" var="a"  end="0" >
                	<div class="product" id="special-product">
                       	<div class="img-product">
                            <a href="${base }/chitietsanpham/${a.id}"><img src="${base }/upload/${a.anh_san_pham}"></a>
                        </div>
                        <div class="title-product">
                            <a href="${base }/chitietsanpham/${a.id}">${a.ten_san_pham }</a>
                        </div>
                        <div id="price-product" class="price-product">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber>${a.gia_ban }</fmt:formatNumber>đ
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
        
            <c:forEach items="${ListType6}" var="a" begin="1" end="3" >
                	<div class="product" >
                       	<div class="img-product">
                            <a href="${base }/chitietsanpham/${a.id}"><img src="${base }/upload/${a.anh_san_pham}"></a>
                        </div>
                        <div class="title-product">
                            <a href="${base }/chitietsanpham/${a.id}">${a.ten_san_pham }</a>
                        </div>
                        <div id="price-product" class="price-product">
                        <fmt:setLocale value="vi_VN"/>
                            <a href="${base }/chitietsanpham/${a.id}">
                           <fmt:formatNumber>${a.gia_ban }</fmt:formatNumber>đ
                            </a>
                        </div>
                        <div  id="old-price" class="old-price">
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
                         
    </div>
    <div class="view-more-products">
        <a href="#">Xem thêm 703 sản phẩm
        <i class="fa-solid fa-sort-down"></i>
        </a>
        <div class="type-half-products">
            <ul>
                <li><a href="#">Mì ăn liền</a></li>
                <li><a href="#">Bánh gạo Hàn Quốc</a></li>
            </ul>
            <ul>
                <li><a href="#">Hủ tiếu, miến, bánh canh</a></li>
                <li><a href="#">Bún các loại</a></li>
            </ul>
            <ul>
                <li><a href="#">Phở, bún ăn liền</a></li>
                <li><a href="#">Nui các loại</a></li>
            </ul>
            <ul>
                <li><a href="#">Cháo gói, cháo tươi</a></li>
                <li><a href="#">Miến, hủ tiếu, phở</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- end part-products -->
<!-- ---------------------------------------------------------------- -->
<div class="tips-for-family">
    <div class="content-left">
        <div class="title-left">
            <h3>Mẹo hay trong gia đình</h3>
            <div class="video-left">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/b2lmxb-ds9A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>
    </div>
    <div class="content-right">
        <ul class="ul-content-right">
            <li><a src="#"><img src="../images/meoChoGiaDinh/kham-pha-rung-dua-bay-mau-hoi-an-mot-mien-tay-thu-nho-giu-long-mien-trung-202207271811169589.jpg"></a></li>
            <li><a src="#">Khám phá rừng dừa Bảy Mẫu - Hội An, một miền Tây thu nhỏ giữ lòng miền Trung</a></li>
        </ul>
        <ul class="ul-content-right">
            <li><a src="#"><img src="../images/meoChoGiaDinh/day-la-nhung-tone-mau-quan-ao-chuan-he-ma-nang-nao-cung-nen-co-trong-tu-202207270949039932.jpg"></a></li>
            <li><a src="#">Đây là những tone màu quần áo 'chuẩn hè' mà nàng nào cũng nên có trong tủ</a></li>
        </ul>
        <ul class="ul-content-right">
            <li><a src="#"><img src="../images/meoChoGiaDinh/day-la-nhung-tone-mau-quan-ao-chuan-he-ma-nang-nao-cung-nen-co-trong-tu-202207270949039932.jpg"></a></li>
            <li><a src="#">Bộ Y Tế chỉ ra qua 8 loại thực phẩm gây dậy thì sớm ở trẻ</a></li>
        </ul>
        <ul class="ul-content-right">
            <li><a src="#"><img src="../images/meoChoGiaDinh/bo-tui-5-bi-kip-tang-tuoi-tho-may-say-quan-ao-hieu-qua-202207271745359180.jpg"></a></li>
            <li><a src="#">Bỏ túi 5 bí kíp tăng tuổi thọ máy sấy quần áo hiệu quả</a></li>
        </ul>
        <ul class="ul-content-right">
            <li><a src="#"><img src="../images/meoChoGiaDinh/cach-lam-ca-com-than-chien-me-xot-mam-tac-mem-ngot-thom-lung-gian-bep-202207271000019286.jpg"></a></li>
            <li><a src="#">Cách làm cá cơm than chiên mè sốt mắm tắc mềm ngọt, thơm lừng gian bếp</a></li>
        </ul>
        <div class="view-more-content-right">
            <a src="#">Xem thêm các tin khác</a>
        </div>
        
    </div>
    </div>


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
    $(document).ready(function () {
    	var listPercent = document.getElementsByClassName('percent');
    	for(var i=0;i<listPercent.length;i++){
    		listPercent[i].setAttribute('value',(listPercent[i].getAttribute('value') + "%"));
    	}
	});
    </script>
   
</body>
</html>