<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quên Mật Khẩu</title>
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

.form-container {
	transition: transform 0.3s ease;
}

.form-container:hover {
	transform: scale(1.05);
}

.form-control {
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-control:focus {
	border-color: #dc3545;
	box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
}

.btn {
	transition: transform 0.3s ease;
}

.btn:hover {
	transform: scale(1.05);
	font-weight: bold;
}

.div2 {
	animation: changeBorderRadius 5s infinite alternate;
	height: 100vh;
	width: 50vw;
	background-color: rgb(103, 156, 167);
}

@
keyframes changeBorderRadius { 0% {
	border-top-left-radius: 30%;
	border-bottom-left-radius: 60%;
	border-top-right-radius: 60%;
	border-bottom-right-radius: 30%;
}
</style>
</head>
<body>
	<div class="container-fluid m-0 p-0 d-flex"
		style="background-color: rgb(255, 255, 255); height: 100vh;">
		<!-- DIV 2 -->
		<div class="div2 d-flex justify-content-center align-items-center">
			<form action="/forgetpassword" method="post"
				class="form-container w-75 bg-light p-4 rounded shadow">
				<div class="mb-4">
					<h2 class="text-center text-uppercase">Quên Mật Khẩu</h2>
				</div>
				<div class="mb-3 input-group">
					<span class="input-group-text"><i class="bi bi-envelope"></i></span>
					<input class="form-control form-control-lg" type="text"
						name="username" placeholder="Nhập username của bạn" required>
				</div>
				<span class="ms-5 mt-1" style="color: red;"><b><i>${message}</i></b></span>
				<div class="d-grid gap-2 mt-2">
					<button class="btn btn-danger btn-lg fw" type="submit">GỬI
						MẬT KHẨU</button>
					<button class="btn btn-secondary btn-lg" type="reset">HỦY</button>
				</div>
				<div class="mt-3 text-center">
					<a href="<%=request.getContextPath()%>/login"
						class="text-decoration-none">Quay lại Đăng Nhập</a>
				</div>
			</form>
		</div>
		<!-- DIV 1 -->
		<div class="d-flex justify-content-center align-items-center"
			style="height: 100vh; width: 50vw; background-color: rgb(255, 255, 255);">
			<img
				src="https://file.hstatic.net/200000312481/file/newlogoort_5ffe29c58c414ccebc2120bed119c8c0.png"
				alt="">
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>