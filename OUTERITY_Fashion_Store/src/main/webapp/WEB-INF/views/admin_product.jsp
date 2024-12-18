<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADMIN</title>
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
			<div class="col-3 d-flex justify-content-center align-items-center">
				<div class="dropdown">
					<button class="btn btn-link text-dark" type="button"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="bi bi-person fs-2 mx-2"></i>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
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
							href="/admin/profile">Thay Đổi Thông Tin</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="/admin/khohang">Kho Hàng</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="/admin/product">Sản Phẩm</a></li>
						<li class="nav-item mx-3"><a class="nav-link text-uppercase"
							href="/admin/report">Báo Cáo Doanh Thu</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	</div>
	<hr>
	<!-- Nội dung -->
	<div class="container">
		<div class="sidebar">
			<!-- Removed sidebar buttons -->
		</div>

		<div class="content">
			<div id="content-area">

				<!-- Quản lý sản phẩm -->
				<div id="add-product" class="section">
					<h6 class="text-uppercase fw-bold">Quản lý sản phẩm</h6>
					<form action="/admin/product" method="post"
						enctype="multipart/form-data">
						<div class="mb-3">
							<input class="form-control" type="text" value="${product.id}"
								name="product-id" placeholder="ID Sản Phẩm" required>
						</div>
						<div class="mb-3">
							<input class="form-control" type="text" value="${product.tensp}"
								name="product-name" placeholder="Tên Sản Phẩm" required>
						</div>
						<div class="mb-3 input-group">
							<input class="form-control" type="text" value="${product.giasp}"
								name="product-price" placeholder="Giá" required> <label
								class="input-group-text">.000 VND</label>
						</div>
						<div class="mb-3">
							<select class="form-select" name="product-category" required>
								<option value="" disabled selected>Phân loại sản phẩm</option>
								<c:forEach var="c" items="${categories}">
									<option value="${c.id}"
										<c:if test="${product.category.tenloai == c.tenloai}">selected</c:if>>${c.tenloai}</option>
								</c:forEach>
							</select>
						</div>
						<div class="mb-3">
							<label>Ảnh hiện tại:</label> <br> <img
								src="/img/${product.anhsp}" alt="Ảnh sản phẩm" width="150px"
								height="150px"> <br> <input class="form-control"
								type="file" name="product-image" onchange="previewImage(event)">
						</div>
						<!-- Thông báo thành công -->
						<c:if test="${not empty messageP}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								${messageP}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>
						<div class="d-flex justify-content-center">
							<button style="width: 100px;" type="submit"
								formaction="/admin/product/update" class="btn btn-primary me-2">Lưu</button>
							<a style="width: 100px;" class="btn btn-secondary"
								href="/admin/product">Hủy</a>
						</div>
					</form>

					<!-- Bảng danh sách sản phẩm -->
					<div class="mt-4">
						<h6 class="text-uppercase fw-bold">Danh Sách Sản Phẩm</h6>
						<table class="table">
							<thead>
								<tr>
									<th>ID Sản Phẩm</th>
									<th>Tên Sản Phẩm</th>
									<th>Giá</th>
									<th>Phân Loại</th>
									<th>Hình Ảnh</th>
									<th>Thao Tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${products}">
									<tr>
										<td>${p.id}</td>
										<td>${p.tensp}</td>
										<td>${p.giasp}</td>
										<td>${p.category.tenloai}</td>
										<td><img src="/img/${p.anhsp}" style="width: 50px;"></td>
										<td><a class="btn btn-warning btn-sm"
											href="/admin/product/edit?id=${p.id}">Edit</a> <a
											class="btn btn-danger btn-sm"
											href="/admin/product/remove?id=${p.id}">Remove</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script>
		function previewImage(event) {
			const img = document.querySelector('img[alt="Ảnh sản phẩm"]');
			img.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>
</body>
</html>
