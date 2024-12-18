<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>
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

/* Phần menu */
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

.containerp {
	width: 100vw; /* Chiều rộng cố định */
	height: 100vh; /* Chiều cao cố định */
	overflow: hidden; /* Ẩn phần vượt ra ngoài */
	position: relative;
	/* Đặt vị trí tương đối để có thể sử dụng absolute cho img */
}

.picturehover {
	max-width: 100%; /* Chiều rộng tối đa */
	transition: transform 0.3s ease; /* Thêm hiệu ứng chuyển tiếp */
	position: absolute; /* Đặt vị trí tuyệt đối */
	top: 50%; /* Đưa hình ảnh vào giữa */
	left: 50%; /* Đưa hình ảnh vào giữa */
	transform: translate(-50%, -50%); /* Giúp hình ảnh căn giữa */
}

.picturehover:hover {
	transform: translate(-50%, -50%) scale(1.05);
	/* Phóng to 5% khi hover */
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
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img style="height: 85vh;"
					src="https://file.hstatic.net/200000312481/file/z4463558183726_a498b6c80488a460beb80665e52bc04b_965c8e758cf84fa3b58088295a7fb274.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img style="height: 85vh;"
					src="https://file.hstatic.net/200000312481/file/2mat_3469760b49bb4176864116189169f7b1.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img style="height: 85vh;"
					src="https://file.hstatic.net/200000312481/file/aokhoac_784f570b69dc4b61abf729543c4e58a8.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div>
		<marquee behavior="scroll" direction="left" scrollamount="20"
			class="text-danger fw-bold fs-4 m-0 p-0 mt-3"
			style="background-color: rgb(255, 255, 255);">SALE sốc giảm
			tất cả các sản phẩm 20%</marquee>
	</div>
	<!-- Danh sách sản phẩm -->
	<div class="d-flex flex-wrap">
		<div class="col-3"
			style="flex: 0 0 25%; max-width: 25%; padding: 10px;">
			<div class="card mb-4">
				<div class="product-image">
					<img
						src="https://product.hstatic.net/200000312481/product/ato1057a_7465cd87c25144abb27ca526f86dd17e_master.jpg"
						class="card-img-top" alt="Product Image">
				</div>
				<div class="card-body">
					<h5 class="card-title text-center">Áo thun Oversize</h5>
				</div>
			</div>
		</div>
		<div class="col-3"
			style="flex: 0 0 25%; max-width: 25%; padding: 10px;">
			<div class="card mb-4">
				<div class="product-image">
					<img
						src="https://product.hstatic.net/200000312481/product/z5334858872903_94c7f9f445f2b5fe7ad45e2e2f0d0255_3f45e7f2db034750ab6a22b5d2028e70_master.jpg"
						class="card-img-top" alt="Product Image">
				</div>
				<div class="card-body">
					<h5 class="card-title text-center">Áo thun Oversize</h5>
				</div>
			</div>
		</div>
		<div class="col-3"
			style="flex: 0 0 25%; max-width: 25%; padding: 10px;">
			<div class="card mb-4">
				<div class="product-image">
					<img
						src="https://product.hstatic.net/200000312481/product/otpl-1011_6ee65ae67a634b37aa203973df993c77_master.jpg"
						class="card-img-top" alt="Product Image">
				</div>
				<div class="card-body">
					<h5 class="card-title text-center">Áo thun Oversize</h5>
				</div>
			</div>
		</div>
		<div class="col-3"
			style="flex: 0 0 25%; max-width: 25%; padding: 10px;">
			<div class="card mb-4">
				<div class="product-image">
					<img
						src="https://product.hstatic.net/200000312481/product/otpl-1013_5dad891c4a974b409bf881c8e0c17ab4_master.jpg"
						class="card-img-top" alt="Product Image">
				</div>
				<div class="card-body">
					<h5 class="card-title text-center">Áo thun Oversize</h5>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center mb-3 mt-0">
		<a href="<%=request.getContextPath()%>/products"
			class="btn btn-danger">XEM THÊM</a>
	</div>
	<div class="containerp">
		<img class="picturehover"
			src="https://file.hstatic.net/200000312481/file/z4463558122016_bfef450d91a5399ebc2fade884caab82_97d2f0e768cb4543a22b4593107e3d3c.jpg"
			alt="">
	</div>
	<hr style="padding: 0; margin: 0;">
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