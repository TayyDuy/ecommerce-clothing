<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
                border-top-left-radius: 30%;
                border-bottom-left-radius: 50%;
                border-top-right-radius: 50%;
                border-bottom-right-radius: 30%;
            }
            100% {
                border-top-left-radius: 50%;
                border-bottom-left-radius: 30%;
                border-top-right-radius: 30%;
                border-bottom-right-radius: 50%;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid m-0 p-0 d-flex" style="background-color: rgb(255, 255, 255); height: 100vh;">
        <!-- DIV 2 -->
        <div class="div2 d-flex justify-content-center align-items-center">
            <form action="/register" method="post" enctype="multipart/form-data" class="form-container w-60 p-4 bg-light rounded shadow">
                <div class="mb-4">
                    <h2 class="text-center text-uppercase">Đăng Ký</h2>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input class="form-control" type="text" name="username" value="${uRegister.username}" placeholder="Tên đăng nhập" required>
                    </div>
                    <span style="color: red;"><b><i>${message}</i></b></span>
                </div>
                <div class="mb-3 d-flex justify-content-between">
                    <div>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                            <input class="form-control" type="date" name="birthdate" required>
                        </div>
                    </div>
                    <div>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
                            <select class="form-select" name="gender" required>
                                <option value="" disabled selected>Giới Tính</option>
                                <option value="male">Nam</option>
                                <option value="female">Nữ</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input class="form-control" type="email" value="${uRegister.email}" name="email" placeholder="Địa chỉ email" required>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input class="form-control" type="tel" name="phone" value="${uRegister.sdt}" placeholder="Số điện thoại" required>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                        <input class="form-control" type="text" name="address" value="${uRegister.diachi}"  placeholder="Địa chỉ" required>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input class="form-control" type="password" name="password" value="${uRegister.matkhau}" placeholder="Mật khẩu" required>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-danger btn-lg" type="submit">ĐĂNG KÝ</button>
                    <button class="btn btn-secondary btn-lg" type="reset">HỦY</button>
                </div>
                <div class="mt-3 text-center">
                    <a href="<%= request.getContextPath() %>/login" class="text-decoration-none">Quay lại đăng nhập</a>
                </div>
            </form>
        </div>
        <!-- DIV 1 -->
        <div class="d-flex justify-content-center align-items-center" style="height: 100vh; width: 50vw; background-color: rgb(255, 255, 255);">
            <img src="https://file.hstatic.net/200000312481/file/newlogoort_5ffe29c58c414ccebc2120bed119c8c0.png" alt="">
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>