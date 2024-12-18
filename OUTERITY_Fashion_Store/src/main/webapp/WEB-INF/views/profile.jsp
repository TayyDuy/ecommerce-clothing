<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>USER</title>
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

/*  */
/* Bố cục nội dung */
.container {
	display: flex;
	margin-top: 20px;
}

.sidebar {
	width: 20%;
	padding: 15px;
	background-color: #f8f9fa;
}

.content {
	width: 70%;
	padding: 15px;
}

.section {
	display: block;
}

.section:target {
	display: block;
}

.section:target ~.section {
	display: none;
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
	<!-- Thanh menu dưới -->
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
							href="<%=request.getContextPath()%>/home">Trang Chủ</a></li>
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
	<hr>
	<!-- Nội dung -->
	<div class="container">
		<div class="sidebar">
			<!-- Removed sidebar buttons -->
		</div>
		<!-- Thông tin -->
		<div class="content">
			<div id="content-area">
				<!-- Thay Đổi Thông Tin Tài Khoản -->
				<div id="info" class="section">
					<form action="/profile" method="post" enctype="multipart/form-data">
						<div class="mb-3 text-center">
							<img src="/img/${user.hinhanh}" alt="Ảnh đại diện"
								class="img-fluid rounded-circle"
								style="width: 150px; height: 150px;">
							<div class="mt-3">
								<input type="file" id="fileInput" class="d-none"
									accept="image/*" onchange="previewImage(event)" name="img">
								<label for="fileInput" class="btn btn-primary">Chọn ảnh</label>
							</div>
						</div>
						<!-- Thông báo thành công -->
						<c:if test="${not empty messagePF}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								${messagePF}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>
						<div class="mb-3">
							<div class="input-group">
								<input class="form-control" type="text" name="fullname"
									placeholder="Họ và Tên" required value="${user.hoten}">
								<!-- Điền tên người dùng -->
							</div>
						</div>
						<div class="mb-3 d-flex justify-content-start">
							<div class="me-2">
								<div class="input-group">
									<!-- Ngày sinh -->
									<input class="form-control" type="date" name="birthdate"
										value="${user.ngaysinh}">
								</div>
							</div>
							<div>
								<div>
									<select class="form-select" name="gender" required>
										<option value="" disabled selected>Giới Tính</option>
										<option value="male"
											<c:if test="${user.gioitinh == false}">selected</c:if>>Nam</option>
										<option value="female"
											<c:if test="${user.gioitinh == true}">selected</c:if>>Nữ</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="input-group">
								<input class="form-control" type="email" name="email"
									placeholder="Địa chỉ email" disabled value="${user.email}">
								<!-- Email -->
							</div>
						</div>
						<div class="mb-3">
							<div class="input-group">
								<input class="form-control" type="tel" name="phone"
									placeholder="Số điện thoại" required value="${user.sdt}">
								<!-- Số điện thoại -->
							</div>
						</div>
						<div class="mb-3">
							<div class="input-group">
								<input class="form-control" type="text" name="address"
									placeholder="Địa chỉ" required value="${user.diachi}">
								<!-- Địa chỉ -->
							</div>
						</div>
						<div class="d-flex justify-content-center">
							<button style="width: 100px;" formaction="/profile/update"
								class="btn btn-primary me-2">Cập nhật</button>
							<a style="width: 100px;" href="/profile"
								class="btn btn-secondary">Hủy</a>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function previewImage(event) {
			const img = document.querySelector('img[alt="Ảnh đại diện"]');
			img.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>
</body>
</html>