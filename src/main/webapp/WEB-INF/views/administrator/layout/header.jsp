<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/variables.jsp" ></jsp:include>
<header class="p-3 text-bg-dark ">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="${base}/admin/homeAdmin" class="nav-link px-2 ml-3 text-secondary">Trang chủ</a></li>
                    <li><a href="${base}/admin/homeUser" class="nav-link px-2 ml-3 text-white">Tài khoản</a></li>
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