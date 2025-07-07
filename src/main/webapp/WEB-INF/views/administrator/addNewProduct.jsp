<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<!-- include summernote css/js -->


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<link rel='stylesheet' type='text/css' media='screen'
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css'>
<link href="${base}/css/main.css" rel="stylesheet" />

</head>
<body style="background-color: #ccc">
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
                    <li><a href="${base}/admin/homeSaleOrder" class="nav-link px-2 text-white">Giao hàng</a></li>
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

	<sf:form modelAttribute="product" method="post"
		enctype="multipart/form-data" action="${base}/admin/homeProduct"
		style="" class="div-add-newproduct" id="div-add-newproduct">
		<h3 style="text-align: center;">Thông tin sản phẩm</h3>
		<div class="input-group mb-3">
			<sf:hidden path="id" class="form-control" placeholder="Mã sản phẩm"></sf:hidden>
		</div>
		<div class="input-group mb-3">
			<label>Tên sản phẩm:</label>
			<sf:input path="ten_san_pham" type="text" class=""
				placeholder="Tên sản phẩm"></sf:input>
		</div>

		<div class="input-group mb-3">
			<sf:input path="gia_ban" type="number" class="" placeholder="Giá bán"></sf:input>
		</div>

		<div class="input-group mb-3">
			<sf:input path="gia_cu" type="number" class="" placeholder="Giá cũ"></sf:input>
		</div>

		<div class="input-group mb-3">
			<sf:input path="so_luong" type="number" class=""
				placeholder="Số lượng còn"></sf:input>
		</div>
		<div class="input-group">
			<span class="input-group-text">Thông tin thêm</span>
			<sf:textarea path="thong_tin_them" class=""
				aria-label="With textarea"></sf:textarea>
		</div>
		<div class="input-group mb-3">
			<sf:input path="huong_dan_su_dung" type="text" class=""
				placeholder="Hướng dẫn sử dụng"></sf:input>
		</div>
		<div class="input-group mb-3">
			<sf:input path="thuong_hieu" type="text" class=""
				placeholder="Thương hiệu"></sf:input>
		</div>
		<div class="input-group mb-3">
			<sf:input path="bao_quan" type="text" class="" placeholder="Bảo quản"></sf:input>
		</div>
		<div class="input-group mb-3">
			<sf:checkbox path="isHot" class="form-check-input" id="productHot"></sf:checkbox>
			<label for="productHot">Đây có phải sản phẩm hot ?</label>
		</div>

		<div class="input-group mb-3">
			<label>Loại sản phẩm</label>
			<sf:select path="categories.id" class="input-group mb-3">
				<sf:options items="${categories}" itemValue="id" itemLabel="name"
					class="form-control"></sf:options>
			</sf:select>
		</div>


		<div class="input-group mb-3">
			<label for="avatar">Ảnh đại diện sản phẩm:</label> <input id="avatar"
				name="avatar" type="file" class="form-control">
		</div>
		<div class="form-group">
			<img alt="" style="width: 100px; height: 100px;"
				src="${base }/upload/${product.anh_san_pham}">
		</div>
		<div class="input-group mb-3">
			<label for="ProductImages">Các ảnh sản phẩm:</label> <input
				id="ProductImages" name="productImages" type="file"
				class="form-control" multiple="multiple">
		</div>
		<div class="form-group">
			<c:forEach items="${product.danhSachAnh }" var="productImages">
				<img alt="" style="width: 100px; height: 100px;"
					src="${base }/upload/${productImages.path}">
			</c:forEach>
		</div>
		<button style="" type="submit" class="btn btn-success ">Thêm</button>

	</sf:form>
	<div class="bd-example">
	<h3 style="text-align: center;">Thông tin sản phẩm</h3>
		<sf:form class="row g-3" modelAttribute="product" method="post" enctype="multipart/form-data" action="${base}/admin/addNewProduct">
			<div class="input-group mb-3">
			<sf:hidden path="id" class="form-control" placeholder="Mã sản phẩm"></sf:hidden>
		</div>
			<div class="col-12" style="">
				<label for="inputNameProduct" class="form-label">Tên sản phẩm:</label>
				<sf:input type="text" path="ten_san_pham" class="form-control" id="inputNameProduct"></sf:input>
			</div>
			<div class="col-md-2">
				<label for="inputGiaBan" class="form-label">Giá bán:</label> 
				<sf:input type="number" path="gia_ban" class="form-control" id="inputGiaBan"></sf:input>
			</div>
			
			<div class="col-md-2">
				<label for="inputGiaCu" class="form-label">Giá cũ:</label> 
				<sf:input type="number" path="gia_cu" class="form-control" id="inputGiaCu"></sf:input>
			</div>
			<div class="col-md-2">
				<label for="inputSoLuong" class="form-label">Số lượng còn:</label> 
				<sf:input type="number" path="so_luong" class="form-control" id="inputSoLuong"></sf:input>
			</div>
			<div class="input-group col-12" style="width: 80%;
    	margin-left: 40px;" >
			<span class="input-group-text">Thông tin thêm</span>
			<sf:textarea path="thong_tin_them" class="form-control" aria-label="With textarea"></sf:textarea>
			</div>
			<div class="col-12" style="">
				<label for="inputThuongHieu" class="form-label">Thương hiệu:</label> 
				<sf:input type="text" path="thuong_hieu" class="form-control" id="inputThuongHieu"></sf:input>
			</div>
			<div class="col-12" style="">
				<label for="inputHuongDanSD" class="form-label">Hướng dẫn sử dụng:</label> 
				<sf:input type="text" path="huong_dan_su_dung" class="form-control" id="inputHuongDanSD"></sf:input>
			</div>
			<div class="col-12" style="">
				<label for="inputBaoQuan" class="form-label">Bảo quản:</label>
				 <sf:input type="text" path="bao_quan" class="form-control" id="inputBaoQuan"></sf:input>
			</div>
			
			<div class="col-md-4" style="margin-left: 40px">
				<label for="inputState" class="form-label">Loại sản phẩm:</label> 
				<sf:select path="categories.id" id="inputState" class="form-select">
				<sf:options items="${categories}" itemValue="id" itemLabel="name"
					class="form-control"></sf:options>
				</sf:select>
			</div>
			
			
			<div class="col-md-2">
				<div class="form-check" style="margin-left: 40px">
					<sf:checkbox path="isHot" class="form-check-input" id="productHot"></sf:checkbox>
					<label for="productHot">Đây có phải sản phẩm hot ?</label>
				</div>
			</div>
			<div class="col-12">
			<label for="inputState" class="form-label">Ảnh đại diện:</label> 
			 <input id="avatar" name="avatar" type="file" class="form-control">
		</div>
		<div class="col-12" style="margin-left: 40px">
			<img alt="" style="width: 100px; height: 100px;"
				src="${base }/upload/${product.anh_san_pham}">
		</div>
		<div class="col-12">
			<label for="inputState" class="form-label">Các ảnh sản phẩm:</label> 
			 <input
				id="ProductImages" name="productImages" type="file"
				class="form-control" multiple="multiple">
		</div>
		<div class="col-12">
			<c:forEach items="${product.danhSachAnh }" var="productImages">
				<img alt="" style="width: 100px; height: 100px;"
					src="${base }/upload/${productImages.path}">
			</c:forEach>
		</div>
			<div class="col-6 " style="margin-left: 40%">
				<button type="submit" class="btn btn-primary align-middle" style:"">Cập nhật</button>
				<a href="${base}/admin/homeProduct" class="btn btn-primary">Hủy</a>
			</div>
			
		</sf:form>
	</div>
</body>
</html>