<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PRODUCT</title>
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

/* Bộ lọc */
.filter {
	border: 1px solid #ccc;
	/* Thêm viền cho bộ lọc */
	border-radius: 5px;
	/* Bo góc */
}

.filter h4 {
	text-align: center;
	/* Căn giữa tiêu đề */
}

.mb-3 {
	margin-bottom: 1rem;
	/* Thêm khoảng cách giữa các mục bộ lọc */
}

/* Phần sản phẩm */
.product-image {
	position: relative;
}

.card-img-hover {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Đảm bảo ảnh vừa với khung */
	opacity: 0;
	/* Ảnh hover sẽ ẩn ban đầu */
	transition: opacity 1s ease-in-out;
	/* Hiệu ứng chuyển tiếp */
}

.product-image:hover .card-img-hover {
	opacity: 1;
	/* Hiện ảnh hover khi hover vào khung */
}

.product-image:hover .card-img-top {
	opacity: 0;
	/* Ẩn ảnh chính khi hover vào khung */
}

/* Phân trang */
.pagination {
	margin-top: 20px;
	/* Khoảng cách phía trên */
}

.page-item {
	margin: 0 5px;
	/* Khoảng cách giữa các nút */
}

.page-link {
	background-color: #007bff;
	/* Màu nền của nút */
	color: white;
	/* Màu chữ */
	border: none;
	/* Bỏ đường viền */
	border-radius: 5px;
	/* Bo góc */
	padding: 10px 15px;
	/* Padding cho nút */
	transition: background-color 0.3s, transform 0.2s;
	/* Hiệu ứng chuyển màu và phóng to */
}

.page-link:hover {
	background-color: #0056b3;
	/* Màu nền khi hover */
	text-decoration: none;
	/* Bỏ gạch chân */
	transform: scale(1.05);
	/* Phóng to nhẹ khi hover */
}

.page-link.active {
	background-color: #0056b3;
	/* Màu nền cho nút đang được chọn */
	color: white;
	/* Màu chữ cho nút đang được chọn */
	font-weight: bold;
	/* Chữ đậm */
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
	<div>
		<h2 class="text-center text-uppercase">Danh sách sản phẩm</h2>
	</div>
	<form action="/products/filter" method="get">
		<div class="d-flex justify-content-center" style="width: 100vw;">

			<!-- Bộ lọc -->
			<div class="filter"
				style="width: 20%; background-color: rgb(255, 255, 255); height: 500px; padding: 20px;">
				<h4 class="text-uppercase">Bộ lọc sản phẩm</h4>
					<div class="mb-3">
						<label for="categorySelect" class="form-label">Danh mục</label> <select
							id="categorySelect" class="form-select" name="category">
							<optiondisabled ${emptyparam.category ? 'selected' : ''}>Chọn
							danh mục
							</option>
							<c:forEach var="c" items="${categories}">
								<option value="${c.id}"
									${c.id == param.category ? 'selected' : ''}>${c.tenloai}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label for="priceRange" class="form-label">Khoảng giá</label> <input
							type="range" class="form-range" id="priceRange" min="0"
							max="1000" step="50"
							oninput="this.nextElementSibling.value = this.value" name="price"
							value="${param.price}">
						<output>${param.price != null ? param.price : 500}</output>
						.000 VNĐ
					</div>
					<button class="btn btn-secondary w-100 mb-3" id="applyFilters">Áp
						dụng bộ lọc</button>
					<!-- Nút hiển thị toàn bộ sản phẩm -->
					<a href="/products" class="btn btn-outline-secondary w-100">Hiển
						thị toàn bộ sản phẩm</a>
			</div>

			<!-- Sản phẩm -->
			<div class="products"
				style="width: 70%; background-color: rgb(255, 255, 255); height: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px;">
				<!-- Bộ lọc nhỏ -->
				<c:if test="${products.totalPages > 0}">
						<div class="mb-3 d-flex justify-content-end">
							<select id="filterSelect" class="form-select w-25" name="sort"
								onchange="this.form.submit()">
								<option value="" disabled selected>Bộ lọc</option>
								<option value="desc" ${param.sort == 'desc' ? 'selected' : ''}>Giá
									từ cao đến thấp</option>
								<option value="asc" ${param.sort == 'asc' ? 'selected' : ''}>Giá
									từ thấp đến cao</option>
							</select>
						</div>
				</c:if>

				<!-- Danh sách sản phẩm -->
				<div class="d-flex flex-wrap">
					<c:forEach var="p" items="${products.content}">
						<div class="col-3"
							style="flex: 0 0 25%; max-width: 25%; padding: 10px;">
							<div class="card mb-4">
								<div class="product-image">
									<img src="/img/${p.anhsp}" class="card-img-top"
										alt="Product Image"> <img src="/img/Aao3.jpg"
										class="card-img-hover" alt="Product Image Hover">
								</div>
								<div class="card-body">
									<h5 class="card-title text-center">${p.tensp}</h5>
									<p class="card-text text-center">Giá: ${p.giasp} VNĐ</p>
									<a href="/productdetail?id=${p.id}"
										class="btn btn-primary w-100">Thêm vào giỏ</a>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
				<!-- Thanh phân trang -->
				<nav aria-label="Page navigation" class="mt-4">
					<ul class="pagination justify-content-center">
						<li class="d-flex justify-content-center my-3">
							<!-- Hiển thị các số trang --> <c:if
								test="${products.totalPages > 0}">
								<a href="/products?p=${products.number-1}"
									class="btn btn-dark mx-1 ${products.number == 0 ? 'disabled' : ''}">Prev</a>
								<c:forEach var="page" begin="0" end="${products.totalPages - 1}">
									<a href="/products?p=${page}"
										class="btn btn-outline-secondary mx-1 ${products.number == page ? 'active' : ''}">${page + 1}</a>
								</c:forEach>
								<a href="/products?p=${products.number + 1}"
									class="btn btn-dark mx-1 ${products.number == products.totalPages - 1 ? 'disabled' : ''}">Next</a>
							</c:if> <!-- Nếu không có sản phẩm --> <c:if
								test="${products.totalPages == 0}">
								<div class="d-flex justify-content-center align-items-center"
									style="height: 50vh;">
									<div class="alert alert-warning text-center">Không có sản
										phẩm nào phù hợp.</div>
								</div>
							</c:if>
						</li>
					</ul>
				</nav>

			</div>
		</div>
	</form>
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