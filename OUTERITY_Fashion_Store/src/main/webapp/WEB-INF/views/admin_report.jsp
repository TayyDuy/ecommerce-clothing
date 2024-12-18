<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<!-- Xem Báo Cáo Doanh Thu -->
				<div id="sales-report" class="section">
					<h6 class="text-uppercase fw-bold">Xem Báo Cáo Doanh Thu</h6>
					<form action="/admin/report/search">
						<div class="mb-3">
							<input class="form-control" type="date" name="date" required>
						</div>
						<div class="d-flex justify-content-center">
							<button style="width: 100px;" type="submit"
								class="btn btn-primary me-2">Xem</button>
							<a style="width: 100px;" href="/admin/report"
								class="btn btn-secondary">Hủy</a>
						</div>
					</form>
					<div class="mt-4">

						<c:if test="${not empty param.date}">
							<div class="mb-4">
								<h6 class="font-weight-bold">Báo Cáo Doanh Thu: Tháng
									${month} - Năm ${year}</h6>
								<p>
									Tổng số hóa đơn: <strong>${countOrder}</strong>
								</p>
								<p>
									Tổng thu: <strong>${totalPrice}00 VNĐ</strong>
								</p>
							</div>
						</c:if>
						<hr>
						<h5>Danh Sách Hóa Đơn</h5>
						<table class="table">
							<thead>
								<tr>
									<th>ID Hóa Đơn</th>
									<th>Người mua</th>
									<th>Giá</th>
									<th>Ngày Mua</th>
									<th>Trạng thái</th>
								</tr>
							</thead>
							<tbody>
								<!-- Thêm dữ liệu vào đây -->
								<c:forEach var="r" items="${report}">
									<tr>
										<td>${r.id}</td>
										<td>${r.user.hoten}</td>
										<td>${r.tonggiatri}00đ</td>
										<td><fmt:formatDate value="${r.ngaytao}"
												pattern="dd-MM-yyyy" /></td>
										<td>${r.trangthai ? 'Đã nhận hàng' : 'Đang giao hàng'}</td>
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
			const img = document.querySelector('img[alt="Ảnh đại diện"]');
			img.src = URL.createObjectURL(event.target.files[0]);
		}
	</script>
</body>
</html>
