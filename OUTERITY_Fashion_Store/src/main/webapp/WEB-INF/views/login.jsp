<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LOGIN</title>
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

        @keyframes changeBorderRadius {
            0% {
                border-top-left-radius: 50%;
                border-bottom-left-radius: 50%;
            }
            50% {
                border-top-left-radius: 30%;
                border-bottom-left-radius: 70%;
            }
            100% {
                border-top-left-radius: 70%;
                border-bottom-left-radius: 30%;
            }
        }
    </style>
</head>
<body>
	<div class="container-fluid m-0 p-0 d-flex"
		style="background-color: rgb(255, 255, 255); height: 100vh;">
		<!-- DIV 1 -->
		<div class="d-flex justify-content-center align-items-center"
			style="height: 100vh; width: 50vw; background-color: rgb(255, 255, 255);">
			<img
				src="https://file.hstatic.net/200000312481/file/newlogoort_5ffe29c58c414ccebc2120bed119c8c0.png"
				alt="Logo">
		</div>
		<!-- DIV 2 -->
		<div class="div2 d-flex justify-content-center align-items-center">
			<form action="/login" method="post"
				class="form-container w-50 bg-light p-4 rounded shadow">
				<div class="mb-4">
					<h2 class="text-center text-uppercase">Đăng Nhập</h2>
				</div>
				<div class="mb-3 input-group">
					<span class="input-group-text"><i class="bi bi-person"></i></span>
					<input class="form-control form-control-lg" type="text"
						name="username" placeholder="Username" value="${unCK}" required>
				</div>
				<div class="mb-3 input-group">
					<span class="input-group-text"><i class="bi bi-lock"></i></span> <input
						class="form-control form-control-lg" type="password"
						name="password" placeholder="Mật khẩu" value="${passCK}" required>
				</div>
					<span style="color: red;"><b><i>${message}</i></b></span>
				<div class="d-flex justify-content-between align-items-center mb-3">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="rememberMe"
							name="rememberMe"> 
						<label class="form-check-label" for="rememberMe">Nhớ mật khẩu</label>
					</div>
					<input type="hidden" name="rememberMe" value="false"> <!-- Input ẩn cho giá trị false -->
					<a href="<%=request.getContextPath()%>/forgetpassword"
						class="text-decoration-none">Quên mật khẩu?</a>
				</div>
				<div class="d-grid gap-2">
					<button class="btn btn-danger btn-lg fw" type="submit">ĐĂNG
						NHẬP</button>
					<button class="btn btn-secondary btn-lg" type="reset">HỦY</button>
				</div>
				<div class="mt-3 text-center">
					<a href="<%=request.getContextPath()%>/register"
						class="text-decoration-none">Đăng ký</a>
				</div>
			</form>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
