<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/variables.jsp" ></jsp:include>
<!-- import JSTL -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header>
		<c:if test="${isLogined == false }">
        <div class="content content-header">
            <!-- start content header -->
            <a href="${base}/home" class="logo">
                <img src="../images/logo1.png">
            </a>
            <div class="select-area">
               <input type="text" placeholder="Giao tại">
                <i class="fa-solid fa-location-dot"></i>
            </div>
            <form class="input-search" action="${base}/searchbykeyword" method="get" >
                <input type="text" value="${dataSearch.keyword}" id="inputSearch" name="keyword" placeholder="Giao hàng nhanh,ít cũng giao">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <a href="${base}/dangnhap" class="donhang-ifor">
                <p>Đơn hàng của bạn</p>
            </a>
            <a href="${base}/cart/checkout" class="cart">
                <i class="fa-solid fa-cart-shopping"></i>
                <p>Giỏ hàng </p>
                <p style="position: absolute;" id="totalItemsInCart" value="0">
                ${totalItems}
                </p>
            </a>
        </div>
        </c:if>
        <c:if test="${isLogined == true }">
        <div class="content content-header">
            <!-- start content header -->
            <a href="${base}/home" class="logo">
                <img src="../images/logo1.png">
            </a>
            <div class="select-area">
               <input type="text" placeholder="Giao tại">
                <i class="fa-solid fa-location-dot"></i>
            </div>
            <form class="input-search" action="${base}/searchbykeyword" method="get" >
                <input type="text" value="${dataSearch.keyword}" id="inputSearch" name="keyword" placeholder="Giao hàng nhanh,ít cũng giao">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <a href="${base}/historybuy" class="donhang-ifor">
                <p>${userLogined.nameacc}</p>
            </a>
            <a href="${base}/cart/checkout" class="cart">
                <i class="fa-solid fa-cart-shopping"></i>
                <p>Giỏ hàng </p>
                <p style="position: absolute;" id="totalItemsInCart" value="0">
                ${totalItems}
                </p>
            </a>
        </div>
        </c:if>
    </header>