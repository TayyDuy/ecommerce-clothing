<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PRODUCT DETAIL</title>
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
}

.container-fluid {
	background-color: rgb(255, 255, 255);
	height: 85vh;
}

.left {
	height: 100%;
	width: 57vw;
}

.small-picture {
	height: 20%;
	width: 80%;
	margin-bottom: 5px;
	cursor: pointer;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.picture-main {
	height: 100%;
	width: 100%;
}

.right {
	height: 100%;
	width: 37vw;
	background-color: rgb(255, 255, 255);
	padding: 20px;
}

p {
	padding: 0;
	margin: 0;
}

.color-option {
	width: 30px;
	height: 30px;
	border: 1px solid #000;
	border-radius: 50%;
	cursor: pointer;
}

.size-option {
	width: 35px;
	height: 30px;
	border: 1px solid #000;
	cursor: pointer;
	text-align: center;
	background-color: rgb(255, 255, 255);
}

.size-option:hover {
	background-color: rgb(0, 0, 0);
	color: white;
}

.description {
	background-color: rgba(255, 255, 255, 0.1);
	border: 1px solid white;
	padding: 10px;
	border-radius: 5px;
	margin-top: 10px;
}

.btn-add {
	padding: 10px 20px;
	font-weight: bold;
	width: 100%;
	transition: transform 1s ease;
}

.btn-add:hover {
	transform: scale(1.05);
	background-color: rgb(194, 64, 64);
	border: 0;
}

.nav-link {
	border: 0;
	transition: border-bottom 0.3s ease;
}

.nav-link:hover {
	border-bottom: 2px solid black;
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
				<input type="text" class="form-control w-75" placeholder="Tìm kiếm">
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
	<div class="d-flex justify-content-center align-items-center">
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
	<div
		class="container-fluid p-0 m-0 d-flex justify-content-center align-items-start">
		<!-- Ảnh -->
		<div class="left d-flex">
			<!-- Hình nhỏ -->
			<div
				class="d-flex flex-column justify-content-between align-items-center h-100"
				style="width: 20vw;">
				<img class="small-picture"
					src="https://product.hstatic.net/200000312481/product/0af6a832564ef010a95f_74bfa26293244b05ae30402ef7add48d_master.jpg"
					alt="Hình sản phẩm 1" onclick="changeImage(this.src)"> <img
					class="small-picture"
					src="https://product.hstatic.net/200000312481/product/1_c64d7c75a37c49e08b735783b6faffb5_master.jpg"
					alt="Hình sản phẩm 2" onclick="changeImage(this.src)"> <img
					class="small-picture"
					src="https://product.hstatic.net/200000312481/product/ato1058a_3a5fcd9840434e3a94538928ace39db2_master.jpg"
					alt="Hình sản phẩm 3" onclick="changeImage(this.src)"> <img
					class="small-picture"
					src="https://product.hstatic.net/200000312481/product/ato1058a_3a5fcd9840434e3a94538928ace39db2_master.jpg"
					alt="Hình sản phẩm 3" onclick="changeImage(this.src)">
			</div>
			<div style="background-color: beige; height: 100%; width: 80vw;">
				<img class="picture-main" id="main-image"
					src="/img/${pDetail.anhsp}" alt="">
			</div>
		</div>
		<!-- Thông tin -->
		<form action="/cart/add" method="post">
			<div class="right">
				<div>
					<h3>${pDetail.tensp}</h3>
					<p>${pDetail.id}</p>
				</div>
				<hr>
				<div class="d-flex align-items-center mb-3">
					<p class="badge rounded-0 text-bg-danger me-3">-25%</p>
					<p class="me-3 fw-bold">${pDetail.giasp}00đ</p>
					<p style="text-decoration: line-through; color: gray;">${pDetail.giasp + 50}00
						đ</p>
				</div>
				<hr>
				<div>
					<p class="mb-1 fw-bold">Màu sắc</p>
					<div class="d-flex">
						<div class="color-option me-2" style="background-color: red;"
							title="Đỏ"></div>
						<div class="color-option me-2" style="background-color: green;"
							title="Xanh lá"></div>
						<div class="color-option me-2" style="background-color: blue;"
							title="Xanh dương"></div>
						<div class="color-option me-2" style="background-color: yellow;"
							title="Vàng"></div>
						<div class="color-option me-2" style="background-color: orange;"
							title="Cam"></div>
					</div>
				</div>
				<hr>
				<div>
					<p class="mb-1 fw-bold">Kích cỡ</p>
					<div class="d-flex">
						<c:forEach var="size" items="${listSize}">
							<div class="form-check me-2">
								<input class="form-check-input" type="radio" name="selectedSize"
									id="size_${size}" value="${size}"> <label
									class="form-check-label fw-bold" for="size_${size}">
									${size} </label>
							</div>
						</c:forEach>
					</div>
				</div>
				<hr>
				<div>
					<p class="mb-1 fw-bold">Số lượng</p>
					<div class="d-flex align-items-center col-2">
						<input type="number" class="form-control text-center fw-bold fs-4"
							value="1" min="1" name="quantity" id="quantity" required>
					</div>
				</div>
				<div class="mt-3 mb-3">
					<button class="btn btn-secondary btn-add">THÊM VÀO GIỎ
						HÀNG</button>
				</div>
				<hr>
				<div class="description">
					<p>Mô tả sản phẩm: Đây là sản phẩm mẫu để bạn có thể tham khảo.
						Nó có nhiều tính năng tuyệt vời.</p>
				</div>
			</div>
		</form>

	</div>
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
	<script>
		function changeImage(src) {
			document.getElementById('main-image').src = src; // Cập nhật hình lớn
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>