-- Tạo cơ sở dữ liệu tên là 'test'
CREATE DATABASE Java5_ASM;

-- Chọn cơ sở dữ liệu 'test' để thực hiện các lệnh tiếp theo
USE Java5_ASM;

-- Tạo bảng [users]
CREATE TABLE [users] (
    [username] NVARCHAR(255) PRIMARY KEY, -- Tên đăng nhập người dùng, là khóa chính, không được để trống
    [hoten] NVARCHAR(255) NOT NULL, -- Họ tên người dùng, không được để trống
    [hinhanh] NVARCHAR(255) DEFAULT 'default.png', -- Đường dẫn tới hình ảnh đại diện, mặc định là 'default.png'
    [email] NVARCHAR(255) NOT NULL UNIQUE, -- Địa chỉ email, không được để trống và phải là duy nhất
    [sdt] NVARCHAR(15) NOT NULL, -- Số điện thoại, không được để trống
    [ngaysinh] DATE NULL, -- Ngày sinh, có thể để trống
    [gioitinh] BIT NULL, -- Giới tính, có thể để trống (0 = nam, 1 = nữ, 2 = khác)
    [diachi] NVARCHAR(500) NOT NULL, -- Địa chỉ, không được để trống
    [matkhau] NVARCHAR(255) NOT NULL, -- Mật khẩu, không được để trống
    [quyen] BIT NOT NULL DEFAULT 0, -- Quyền truy cập (0 = user, 1 = admin), mặc định là user
    [ngaydangky] DATETIME DEFAULT CURRENT_TIMESTAMP -- Ngày đăng ký, mặc định là thời gian hiện tại
);

-- Tạo bảng [loaisanpham] với id kiểu chuỗi
CREATE TABLE [loaisanpham] (
    [id] NVARCHAR(10) PRIMARY KEY, -- ID loại sản phẩm, là khóa chính, kiểu chuỗi
    [tenloai] NVARCHAR(255) NOT NULL -- Tên loại sản phẩm, không được để trống
);

-- Tạo bảng [sanpham] 
CREATE TABLE [sanpham] (
    [id] NVARCHAR(10) PRIMARY KEY, -- ID sản phẩm, là khóa chính, sử dụng định dạng chuỗi như 'SP001'
    [tensp] NVARCHAR(255) NOT NULL, -- Tên sản phẩm, không được để trống
    [anhsp] NVARCHAR(255) DEFAULT 'default.png', -- Đường dẫn tới hình ảnh sản phẩm, mặc định là 'default.png'
    [giasp] DECIMAL(10, 2) NOT NULL, -- Giá sản phẩm, không được để trống
    [phanloai] NVARCHAR(10) NOT NULL, -- ID loai san phẩm, không được để trống
    FOREIGN KEY ([phanloai]) REFERENCES [loaisanpham]([id]) -- Khóa ngoại tham chiếu đến bảng loại sản phẩm
);

-- Tạo bảng [khohang]
CREATE TABLE [khohang] (
    [id] NVARCHAR(10) PRIMARY KEY, -- ID kho, có thể sử dụng định dạng như 'KH001'
    [idsanpham] NVARCHAR(10) NOT NULL, -- ID sản phẩm
    [size] NVARCHAR(5) NOT NULL, -- Kích thước của sản phẩm
    [soluongton] INT NOT NULL DEFAULT 0, -- Số lượng sản phẩm tồn kho
    FOREIGN KEY ([idsanpham]) REFERENCES [sanpham]([id]) -- Khóa ngoại tham chiếu đến bảng sản phẩm
);

-- Tạo bảng [hoadon]
CREATE TABLE [hoadon] (
    [id] INT PRIMARY KEY IDENTITY(1,1), -- ID hóa đơn, là khóa chính, sử dụng định dạng chuỗi như 'HD001'
    [username] NVARCHAR(255) NOT NULL, -- Tên đăng nhập của khách hàng, không được để trống
    [tonggiatri] DECIMAL(10, 2) NOT NULL, -- Tổng giá trị hóa đơn, không được để trống
    [ngaytao] DATETIME2 DEFAULT CURRENT_TIMESTAMP, -- Ngày tạo hóa đơn, mặc định là thời gian hiện tại
    [trangthai] BIT NOT NULL DEFAULT 0, -- Trạng thái hóa đơn (0 = đang xử lý, 1 = đã thanh toán, 2 = đã hủy), mặc định là 0
    FOREIGN KEY ([username]) REFERENCES [users]([username]) ON DELETE CASCADE -- Khóa ngoại tham chiếu đến bảng người dùng, xóa hóa đơn nếu người dùng bị xóa
);

-- Tạo bảng [chitiethoadon]
CREATE TABLE [chitiethoadon] (
    [id] INT PRIMARY KEY IDENTITY(1,1), -- ID chi tiết hóa đơn, là khóa chính, sử dụng IDENTITY để tự động tăng
    [idhoadon] INT NOT NULL, -- ID hóa đơn, không được để trống
    [idsanpham] NVARCHAR(10) NOT NULL, -- ID sản phẩm, không được để trống
	[size] NVARCHAR(5) NOT NULL, -- Kích thước của sản phẩm
    [soluong] INT NOT NULL, -- Số lượng sản phẩm trong hóa đơn, không được để trống
    [gia] DECIMAL(10, 2) NOT NULL, -- Giá sản phẩm tại thời điểm hóa đơn, không được để trống
    FOREIGN KEY ([idhoadon]) REFERENCES [hoadon]([id]) ON DELETE CASCADE, -- Khóa ngoại tham chiếu đến bảng hóa đơn, xóa chi tiết hóa đơn nếu hóa đơn bị xóa
    FOREIGN KEY ([idsanpham]) REFERENCES [sanpham]([id]) -- Khóa ngoại tham chiếu đến bảng sản phẩm
);

-- Tạo bảng [giohang]
CREATE TABLE [giohang] (
    [id] INT PRIMARY KEY IDENTITY(1,1), -- ID giỏ hàng, là khóa chính, sử dụng IDENTITY để tự động tăng
    [username] NVARCHAR(255) NOT NULL, -- Tên đăng nhập người dùng, không được để trống
    [idsanpham] NVARCHAR(10) NOT NULL, -- ID sản phẩm, không được để trống
	[size] NVARCHAR(5) NOT NULL, -- Kích thước của sản phẩm 
    [soluong] INT NOT NULL, -- Số lượng sản phẩm trong giỏ hàng, không được để trống
    [ngaythem] DATETIME DEFAULT CURRENT_TIMESTAMP, -- Ngày thêm sản phẩm vào giỏ hàng, mặc định là thời gian hiện tại
    FOREIGN KEY ([username]) REFERENCES [users]([username]) ON DELETE CASCADE, -- Khóa ngoại tham chiếu đến bảng người dùng, xóa giỏ hàng nếu người dùng bị xóa
    FOREIGN KEY ([idsanpham]) REFERENCES [sanpham]([id]) -- Khóa ngoại tham chiếu đến bảng sản phẩm
);

INSERT INTO [users] ([username], [hoten], [hinhanh], [email], [sdt], [ngaysinh], [gioitinh], [diachi], [matkhau], [quyen])
VALUES 
(N'user1', N'Nguyễn Văn A', N'avatar.jpg', N'vana@gmail.com', N'0123456789', '1990-01-01', NULL, N'123 Đường ABC', N'matkhau1', 0),
(N'user2', N'Trần Thị B', N'avatar.jpg', N'thiB@gmail.com', N'0987654321', NULL, 1, N'456 Đường DEF', N'matkhau2', 0),
(N'user3', N'Lê Văn C', N'avatar.jpg', N'vanC@gmail.com', N'0912345678', '1992-05-05', 0, N'789 Đường GHI', N'matkhau3', 1),
(N'user4', N'Nguyễn Thị D', N'avatar.jpg', N'thiD@gmail.com', N'0123456789', NULL, NULL, N'321 Đường JKL', N'matkhau4', 0);

INSERT INTO [loaisanpham] ([id], [tenloai])
VALUES 
(N'LS001', N'Áo'),
(N'LS002', N'Quần'),
(N'LS003', N'Áo khoác'),
(N'LS004', N'Phụ kiện');

INSERT INTO [sanpham] ([id], [tensp], [anhsp], [giasp], [phanloai])
VALUES 
(N'SP0001', N'Áo thun trắng', N'aothun_trang.png', 200.00, N'LS001'),
(N'SP0002', N'Áo thun đen', N'aothun_den.png', 200.00, N'LS001'),
(N'SP0003', N'Quần jean xanh', N'jean_xanh.png', 300.00, N'LS002'),
(N'SP0004', N'Quần jean đen', N'jean_den.png', 300.00, N'LS002'),
(N'SP0005', N'Áo khoác xám', N'aokhoac_xam.png', 500.00, N'LS001'),
(N'SP0006', N'Áo khoác xanh', N'aokhoac_xanh.png', 500.00, N'LS001'),
(N'SP0007', N'Giày thể thao', N'giay_the_thao.png', 800.00, N'LS003'),
(N'SP0008', N'Ba lô thời trang', N'ba_lo.png', 600.00, N'LS003'),
(N'SP0009', N'Khăn quàng cổ', N'khan_quang_co.png', 150.00, N'LS003'),
(N'SP0010', N'Mũ lưỡi trai', N'mu_luoi_trai.png', 100.00, N'LS003');

INSERT INTO [khohang] ([id], [idsanpham], [size], [soluongton])
VALUES 
(N'KH001', N'SP0001', N'S', 20),
(N'KH002', N'SP0001', N'M', 15),
(N'KH003', N'SP0002', N'S', 25),
(N'KH004', N'SP0003', N'M', 30),
(N'KH005', N'SP0004', N'L', 10),
(N'KH006', N'SP0005', N'S', 18),
(N'KH007', N'SP0006', N'M', 12),
(N'KH008', N'SP0007', N'S', 50),
(N'KH009', N'SP0008', N'M', 40),
(N'KH010', N'SP0009', N'S', 60);

INSERT INTO [hoadon] ([username], [tonggiatri], [ngaytao], [trangthai])
VALUES 
(N'user1', 400.00, DEFAULT, 0),
(N'user1', 1500.00, DEFAULT, 1),
(N'user1', 300.00, DEFAULT, 0);

INSERT INTO [chitiethoadon] ([idhoadon], [idsanpham],[size] , [soluong], [gia])
VALUES 
(N'1', N'SP0001',N'M', 2, 200.00),
(N'1', N'SP0002',N'S', 1, 200.00),
(N'2', N'SP0005',N'S', 1, 500.00),
(N'2', N'SP0007',N'S', 2, 800.00),
(N'3', N'SP0003',N'M', 1, 300.00);

SELECT * FROM [users];
SELECT * FROM [loaisanpham];
SELECT * FROM [sanpham];
SELECT * FROM [hoadon];
SELECT * FROM [chitiethoadon];
SELECT * FROM [giohang];



-- Xóa dữ liệu từ bảng chitiethoadon
DELETE FROM [chitiethoadon];

-- Xóa dữ liệu từ bảng hoadon
DELETE FROM [hoadon];

-- Xóa dữ liệu từ bảng giohang
DELETE FROM [giohang];

-- Xóa dữ liệu từ bảng sanpham
DELETE FROM [sanpham];

-- Xóa dữ liệu từ bảng danhmuc
DELETE FROM [loaisanpham];

-- Xóa dữ liệu từ bảng users
DELETE FROM [users];
