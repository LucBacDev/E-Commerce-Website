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
  <link rel='stylesheet' type='text/css' media='screen'
    href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css'>
    <link type="text/css" rel="stylesheet" href="${base }/css/simplePagination.css"/>
  <link rel='stylesheet' type='text/css' media='screen' href='${base}/css/main.css'>

</head>

<body>
  <!-- star header -->
 <header class="p-3 text-bg-dark ">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="${base}/admin/homeAdmin" class="nav-link px-2 ml-3 text-white">Trang chủ</a></li>
                    <li><a href="${base}/admin/homeUser" class="nav-link px-2 ml-3 text-secondary">Tài khoản</a></li>
                    <li><a href="${base}/admin/homeProduct" class="nav-link px-2 text-white">Sản Phẩm</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Giao hàng</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Phiếu mua hàng</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Nhân viên</a></li>
                </ul>
                <div class="text-end">
                    <a href="${base}/dangxuat" class="btn btn-primary">Đăng xuất</a>
                    <button type="button" class="btn btn-outline-light me-2">Đăng ký</button>
                </div>
            </div>
        </div>
    </header>
  
  <form class="form-inline" action="${base}/admin/homeUser" method="get" >
  <!-- tìm kiếm sản phẩm trên danh sách -->
						<div style="position:fixed;top:60px" class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input id="page" name="page" placeholder="Số trang" value="${searchData.page}"  class="form-control"> 
								
								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" value="${searchData.keyword}" name="keyword" class="form-control" placeholder="Tìm kiếm" style="margin-right: 5px;" value="${searchModel.keyword }">
								
								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="roleId" id="roleId" style="margin-right: 5px;">
									<option value="0">Tất cả</option>
									<c:forEach items="${roles}" var="role">
										<option id="roleID${role.id}" value="${role.id}">${role.name }</option>
									</c:forEach>
								</select>
								
								<button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-primary">Seach</button>
							</div>
							
						</div>
						</form>
  <table class="table table-khachHang" style="margin-top:130px">
    <thead>
      <tr>
        <th scope="col">Mã tài khoản</th>
        <th scope="col">Tên tài khoản</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">Email</th>
        <th scope="col">Địa chỉ giao hàng</th>
        <th scope="col"  >Quyền</th>
        

      </tr>
    </thead>
    <tbody>
    <c:forEach items="${users.data}" var="a" varStatus="loop">
      <tr>
        <td scope="row">${a.id} </td>
        <td>${a.nameacc}</td>
        <td>${a.username}</td>
        <td>${a.email}</td>
        <td>${a.shippingAddress }</td>
       
       <td>
         <div class="dropdown">
  			<a class="btn btn-success dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
     			<c:forEach items="${a.roles}" var="b">
        			${b.name }
       			 </c:forEach>
 		 </a>
  		<ul class="dropdown-menu">
  			<c:forEach items="${roles}" var="role">
   			 <li><a class="dropdown-item" href="${base }/admin/setNewRole/${a.id}/${role.id}">${role.name }</a></li>
   			 </c:forEach>
    		
  		</ul>
		</div>
        </td>
       
       
        
      </tr>
   
      </c:forEach>
    </tbody>
  </table>
  </form>
  <!-- end-table -->
  <!-- start-tools -->
  <div class="form_old_infor"  style="width: 600px;" id="form_old_infor">
    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Tên khách hàng" aria-label="Username"
        aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Số điện thoại" aria-label="NumberPhone"
        aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
      <label class="input-group-text" for="inputGroupSelect01">Giới tính:</label>
      <select class="form-select" id="inputGroupSelect01">
        <option selected>Nam</option>
        <option value="1">Nữ</option>
      </select>
    </div>
    <div class="input-group mb-3">
      <label class="input-group-text" for="inputGroupSelect01">Loại ưu đãi:</label>
      <select class="form-select" id="inputGroupSelect01">
        <option selected>Đồng</option>
        <option value="1">Bạc</option>
        <option value="2">Vàng</option>
        <option value="3">Kim Cương</option>
      </select>
    </div>

    <div class="input-group mb-3">
      <input type="text" class="form-control" placeholder="Mật khẩu" aria-label="password"
        aria-describedby="basic-addon1">
    </div>

    <button type="button" class="btn btn-success " onclick="An('form_old_infor')">Cập nhật</button>
  </div>
 
  
  
 
  	<div id="paging" style="width: 500px;margin-left: 40%;">
  	</div>
  
  <script type="text/javascript" src="${base }/js/jquery.min.js"></script>
<script type="text/javascript" src="${base }/js/jquery.simplePagination.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${base}/js/main.js">
  
  </script>
  
</body>