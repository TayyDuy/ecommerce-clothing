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
<title>Product Checkout</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
body {
	background-color: #f8f9fa;
	font-family: monospace;
}

.checkout {
	display: flex;
	flex-wrap: wrap; /* Cho phép cuộn khi không đủ chỗ */
	justify-content: space-between;
	margin-top: 50px;
}

.infor, .total {
	flex: 1;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 5px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px; /* Thêm khoảng cách giữa hai phần */
}

.total {
	margin-left: 20px;
}

.product-info {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.separator {
	border-top: 1px solid #e0e0e0;
	margin: 15px 0;
}

.summary-item {
	display: flex;
	justify-content: space-between;
}

.summary-total {
	font-weight: bold;
}

/* Đặt kích thước cố định cho hình ảnh */
.img-thumbnail {
	width: 100px; /* Đặt chiều rộng */
	height: 100px; /* Đặt chiều cao */
	object-fit: cover; /* Đảm bảo hình ảnh không bị biến dạng */
}
</style>
</head>

<body>
	<div class="container">
		<div class="checkout">
			<div class="infor">
				<h1 class="text-center">OUTERITY</h1>
				<h2 class="mb-4">Thông tin giao hàng</h2>
				<c:if test="${empty user}">
					<p>
						Bạn đã có tài khoản? <a href="<%=request.getContextPath()%>/login">Đăng
							nhập</a>
					</p>
				</c:if>
				<form action="/payment/order">
					<div class="mb-3">
						<label for="fullname" class="form-label">Họ và tên</label> <input
							type="text" class="form-control" id="fullname"
							placeholder="Nhập họ và tên" value="${user.hoten}" required>
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email"
							placeholder="Nhập email" value="${user.email}" required>
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">Số điện thoại</label> <input
							type="text" class="form-control" id="phone"
							placeholder="Nhập số điện thoại" value="${user.sdt}" required>
					</div>
					<div class="mb-3">
						<label for="address" class="form-label">Địa chỉ</label> <input
							type="text" class="form-control" id="address"
							placeholder="Nhập địa chỉ" value="${user.diachi}" required>
					</div>
					<div class="mb-4">
						<label for="payment-method" class="form-label">Phương thức
							thanh toán</label>
						<div>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="payment-method" id="cod" value="cod" required> <label
									class="form-check-label" for="cod">Thanh toán khi nhận
									hàng</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="payment-method" id="bank-transfer" value="bank-transfer"
									required> <label class="form-check-label"
									for="bank-transfer">Chuyển khoản</label>
							</div>
						</div>
					</div>
					<!-- Thông báo lỗi -->
					<c:if test="${not empty error_pay}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							${error_pay}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:if>
					<button type="submit" class="btn btn-primary w-100">Hoàn
						tất đơn hàng</button>
					<a href="<%=request.getContextPath()%>/cart"
						class="text-decoration-none d-block text-center mt-3">Giỏ hàng</a>
				</form>
			</div>
			<div class="total">
				<h4 class="mb-4">Đơn hàng của bạn</h4>
				<c:forEach var="c" items="${carts}">
					<div class="product-info">
						<img src="/img/${c.product.anhsp}" class="img-thumbnail">
						<div class="ms-3">
							<p class="mb-1">${c.product.tensp}</p>
							<p class="mb-1">Size: ${c.size}</p>
							<p class="mb-1">Số lượng: ${c.soluong}</p>
							<p class="mb-1 price">Giá: ${c.product.giasp}00 VND</p>
						</div>
					</div>
				</c:forEach>

				<div class="separator"></div>
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="Mã giảm giá">
					<button class="btn btn-outline-secondary w-100 mt-2">Sử
						dụng</button>
				</div>
				<div class="separator"></div>
				<div class="summary-item">
					<p>Tạm tính</p>
					<p>${cartG}00VND</p>
				</div>
				<div class="summary-item">
					<p>Phí vận chuyển</p>
					<p>30,000 VND</p>
				</div>
				<div class="separator"></div>
				<div class="summary-item summary-total">
					<p>Tổng cộng</p>
					<p>${cartG + 30}00VND</p>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>