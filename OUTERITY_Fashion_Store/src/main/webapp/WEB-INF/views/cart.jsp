<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CART</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	font-family: monospace;
	background-color: #f8f9fa;
}

.cart {
	margin-top: 50px;
}

.product-info {
	display: flex;
	/* Hiển thị ngang */
	align-items: center;
	/* Căn giữa theo chiều dọc */
	margin-bottom: 15px;
	background-color: #ffffff;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.img-thumbnail {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.separator {
	border-top: 1px solid #e0e0e0;
	margin: 15px 0;
}

/* In đậm các nội dung quan trọng */
.important {
	font-weight: bold;
}

/* Flexbox cho thông tin sản phẩm */
.product-details {
	display: flex;
	flex-direction: column;
	/* Vẫn giữ thông tin sản phẩm theo chiều dọc */
	margin-left: 15px;
	/* Khoảng cách giữa hình ảnh và thông tin sản phẩm */
	flex: 1;
	/* Để thông tin sản phẩm chiếm không gian còn lại */
}

.input-group {
	margin-top: 10px;
	/* Khoảng cách giữa size và input group */
}

.price, .total-price {
	margin: 5px 0;
}

.summary-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.summary-total {
	font-weight: bold;
	font-size: 1.2em;
}

.nav-link {
	border: 0;
	transition: border-bottom 0.3s ease;
}

.nav-link:hover {
	border-bottom: 2px solid black;
}

p {
	padding: 0;
	margin: 0;
}
</style>
</head>

<body>
	<!-- Menu -->
	<div class="container-fluid d-flex flex-column"
		style="height: 15vh; background-color: rgb(255, 255, 255);">
		<!-- DIV trên -->
		<div class="d-flex justify-content-between align-items-center"
			style="height: 50%;">
			<div class="col-3 d-flex justify-content-center align-items-center">
				<img
					src="https://file.hstatic.net/200000312481/file/newlogoort_5ffe29c58c414ccebc2120bed119c8c0.png"
					alt="" class="img-fluid w-50">
			</div>
			<div class="col-6 d-flex justify-content-center align-items-center">
				<form action="/products/search"
					class="form col-12 d-flex justify-content-center align-items-center"
					method="post">
					<input type="text" class="form-control w-75"
						value="${param.keyword}" name="keyword"
						onchange="this.form.submit()" placeholder="Tìm kiếm">
				</form>
			</div>
			<div class="col-3 d-flex justify-content-center align-items-center">
				<a href="<%=request.getContextPath()%>/cart"
					class="text-decoration-none text-dark"> <i
					class="bi bi-cart fs-3 mx-2"></i>
				</a>
				<div class="dropdown">
					<button class="btn btn-link text-dark" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="bi bi-person fs-2 mx-2"></i>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<li><a class="dropdown-item" href="/profile">Thông tin
								tài khoản</a></li>
						<li><a class="dropdown-item" href="/orderHistory">Lịch sử
								đơn hàng</a></li>
						<hr>
						<li><a class="dropdown-item"
							href="<%=request.getContextPath()%>/change-password">Đổi mật
								khẩu</a></li>
						<li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
					</ul>
				</div>
				<p class="mb-0 ms-2">${user.hoten}</p>
			</div>
		</div>
	</div>
	<!-- DIV dưới -->
	<div style="height: 50%;"
		class="d-flex justify-content-center align-items-center">
		<nav class="navbar navbar-expand-lg navbar-light"
			style="background-color: #ffffff; height: 100%; width: 100%;">
			<div class="container-fluid h-100">
				<div
					class="collapse navbar-collapse h-100 d-flex justify-content-center align-items-center"
					id="navbarMenu">
					<ul
						class="navbar-nav mb-2 mb-lg-0 d-flex justify-content-center align-items-center">
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							aria-current="page" href="<%=request.getContextPath()%>/home">Trang
								Chủ</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="<%=request.getContextPath()%>/products">Sản phẩm</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="<%=request.getContextPath()%>/contact">Liên hệ</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="<%=request.getContextPath()%>/introduce">Giới thiệu</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	</div>
	<hr>
	<!-- Nội dung -->
	<div class="container cart">
		<h1 class="text-center text-uppercase">Giỏ Hàng Của Bạn</h1>
		<c:if test="${empty carts}">
			<p class="text-center"
				style="padding-top: 180px; padding-bottom: 180px;">Giỏ hàng của
				bạn hiện đang rỗng.</p>
		</c:if>
		<c:if test="${not empty carts}">
			<!-- Tổng số sản phẩm -->
			<div class="text-center mb-4">
				<h4 id="totalProducts">
					Tổng số sản phẩm: <span id="productCount">${cartSL}</span>
				</h4>
			</div>
			<div class="row">
				<div class="col-md-8">
					<h2 class="mb-4 text-uppercase">Sản phẩm trong giỏ hàng</h2>
					<!-- Product -->
					<c:forEach var="c" items="${carts}">
						<form action="/cart/update/${c.id}" method="post">
							<div class="product-info">
								<img src="/img/${c.product.anhsp}" alt="Sản phẩm"
									class="img-thumbnail">
								<div class="product-details">
									<p class="important mb-1">${c.product.tensp}</p>
									<p class="mb-1">Size: ${c.size}</p>
									<div class="input-group w-25">
										<input type="number" value="${c.soluong}" min="1" name="qty"
											oninput="this.form.submit()" class="form-control text-center">
									</div>
									<p class="price important">
										Giá: <span id="price1">${c.product.giasp}</span> VND
									</p>
									<p class="total-price important" id="total1">Tổng:
										${c.soluong * c.product.giasp} VND</p>
									<button formaction="/cart/remove/${c.id}"
										class="btn btn-danger btn-sm">Xóa</button>
								</div>
							</div>
						</form>
					</c:forEach>


					<div class="separator"></div>
				</div>
				<div class="col-md-4">
					<h2 class="mb-4 text-uppercase">Tổng quan đơn hàng</h2>
					<div class="separator"></div>
					<div class="summary-item">
						<p>Tạm tính</p>
						<p id="subtotal">${cartG}00VND</p>
					</div>
					<div class="summary-item">
						<p>Phí vận chuyển</p>
						<p>30,000 VND</p>
					</div>
					<div class="separator"></div>
					<div class="summary-item summary-total">
						<p>Tổng cộng</p>
						<p id="total">${cartG + 30}00VND</p>
					</div>
					<div class="text-center mt-4">
						<a href="<%=request.getContextPath()%>/payment"
							class="btn btn-primary w-100">Tiến hành thanh toán</a>
					</div>
				</div>
			</div>
		</c:if>
		<hr>
		<!-- Footer -->
		<footer class="bg-light text-dark text-center py-4">
			<div class="container">
				<div class="row text-start">
					<div class="col-md-4 mb-3">
						<h5 class="text-uppercase fw-bold">Hộ Kinh Doanh Bao GT</h5>
						<p>MST: 8752797026-001 do UBND Q. Tân Bình cấp ngày 14/11/2022</p>
					</div>
					<div class="col-md-4 mb-3">
						<h6 class="text-uppercase fw-bold">Liên kết</h6>
						<ul class="list-unstyled">
							<li><a href="#" class="text-dark text-decoration-none">Giới
									thiệu</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách thanh toán</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách khiếu nại</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách vận chuyển</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách đổi trả</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách bảo hành</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách kiểm hàng</a></li>
							<li><a href="#" class="text-dark text-decoration-none">Chính
									sách bảo mật</a></li>
						</ul>
					</div>
					<div class="col-md-4 mb-3">
						<h6 class="text-uppercase fw-bold">Thông tin liên hệ</h6>
						<p>22 Nguyễn Thái Học - Phường Tân Thành - Quận Tân Phú - TP.
							Hồ Chí Minh</p>
						<p>
							Điện thoại: <strong>‭086 2642568‬</strong>
						</p>
						<p>
							Email: <strong>outerity.local@gmail.com</strong>
						</p>
						<p>
							<a href="#" class="text-dark">Fanpage</a>
						</p>
					</div>
				</div>
			</div>
		</footer>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>