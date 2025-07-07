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
                    <li><a href="${base}/admin/homeUser" class="nav-link px-2 ml-3 text-white">Tài khoản</a></li>
                    <li><a href="${base}/admin/homeProduct" class="nav-link px-2 text-secondary">Sản Phẩm</a></li>
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
  
  <form class="form-inline" action="${base}/admin/homeProduct" method="get" >
  <!-- tìm kiếm sản phẩm trên danh sách -->
						<div style="position:fixed;top:60px" class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input id="page" name="page" placeholder="Số trang" value="${searchData.page}"  class="form-control"> 
								
								<!-- tìm kiếm theo tên sản phẩm -->
								<input type="text" id="keyword" value="${searchData.keyword}" name="keyword" class="form-control" placeholder="Tìm kiếm" style="margin-right: 5px;" value="${searchModel.keyword }">
								
								<!-- tìm kiếm theo danh mục sản phẩm -->
								<select class="form-control" name="categoryId" id="categoryId" style="margin-right: 5px;">
									<option value="0">Tất cả</option>
									<c:forEach items="${categories}" var="category">
										<option id="categoryID${category.id}" value="${category.id}">${category.name }</option>
									</c:forEach>
								</select>
								
								<button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-primary">Seach</button>
							</div>
							<div>
								<a href="${base}/admin/addNewProduct" class="btn btn-primary">Thêm sản phẩm mới</a>
							</div>
						</div>
						</form>
  <table class="table table-khachHang" style="margin-top:130px">
    <thead>
      <tr>
        <th scope="col">Mã sản phẩm </th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Giá bán</th>
        <th scope="col">Giá cũ</th>
        <th scope="col">Số lượng còn</th>
        <th scope="col">Loại sản phẩm</th>
        <th scope="col">Thương hiệu</th>
        <th scope="col" colspan="2">Thao tác</th>

      </tr>
    </thead>
    <tbody>
    <c:forEach items="${products.data}" var="a" varStatus="loop">
      <tr>
        <td scope="row">${a.id} </td>
        <td>${a.ten_san_pham}</td>
        <td>${a.gia_ban}</td>
        <td>${a.gia_cu}</td>
        <td>${a.so_luong}</td>
        <td>${a.categories.name}</td>
        <td>${a.thuong_hieu}</td>
        <td>
        <a href="${base}/admin/addNewProduct/${a.id}">
          <svg xmlns="http://www.w3.org/2000/svg"  width="16" height="16" id="editbutton"
            fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
            <path
              d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
            <path fill-rule="evenodd"
              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
          </svg>
          </a>
        </td>
        <td>
          <svg xmlns="http://www.w3.org/2000/svg" onclick="Hien('alert-delete')" width="16" height="16"
            fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
            <path
              d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
            <path fill-rule="evenodd"
              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
          </svg>
        </td>
      </tr>
   <div class="alert-delete" id="alert-delete">
    <p>Bạn muốn xóa sản phẩm khách hàng này?</p>
    <button type="button" onclick="An('alert-delete')" class="btn btn-success "><a style="text-decoration: none;color:white" href="${base}/admin/deleteProduct/${a.id}">Xóa</a></button>
    <button type="button" onclick="An('alert-delete')" class="btn btn-danger">Hủy</button>
  </div>
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
  <script type="text/javascript">
  $( document ).ready(function() {// run khi load xong trang
		$('#categoryId').val(${searchData.categoryId});// set gia tri moi
		$("#paging").pagination({
			currentPage: ${products.currentPage}, //trang hiện tại
	        items: ${products.totalItems},	//tổng số sản phẩm
	        itemsOnPage: ${products.sizeOfPage}, //số sản phẩm trên 1 trang
	        cssStyle: 'light-theme',
	        onPageClick: function(pageNumber, event) {
	        	$('#page').val(pageNumber);
	        	$('#btnSearch').trigger('click');
			},
	    });
		<!--$("editbutton").click(function(){
			  $("form_old_infor").attr("display","block");
			});-->
		
	});
  </script>
</body>