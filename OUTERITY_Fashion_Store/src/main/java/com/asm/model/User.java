package com.asm.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User implements Serializable {

    @Id
    @Column(name = "username")
    private String username; // Tên đăng nhập người dùng, là khóa chính

    @Column(name = "hoten", nullable = false) // Không được để trống
    private String hoten; // Họ tên người dùng

    @Column(name = "hinhanh")
    private String hinhanh = "default.png"; // Đường dẫn tới hình ảnh đại diện, mặc định là 'default.png'

    @Column(name = "email", nullable = false, unique = true) // Không được để trống và phải là duy nhất
    private String email; // Địa chỉ email

    @Column(name = "sdt", nullable = false) // Không được để trống
    private String sdt; // Số điện thoại

    @Column(name = "ngaysinh")
    @Temporal(TemporalType.DATE)
    private Date ngaysinh; // Ngày sinh, có thể để trống

    @Column(name = "gioitinh") // Giới tính có thể để trống (0 = nam, 1 = nữ, 2 = khác)
    private Boolean gioitinh; 

    @Column(name = "diachi", nullable = false) // Không được để trống
    private String diachi; // Địa chỉ

    @Column(name = "matkhau", nullable = false) // Không được để trống
    private String matkhau; // Mật khẩu

    @Column(name = "quyen", nullable = false) // Quyền truy cập (0 = user, 1 = admin), mặc định là user
    private Boolean quyen = false; 

    @Column(name = "ngaydangky", nullable = false) // Không được để trống
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngaydangky = new Date(); // Ngày đăng ký

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Order> orders; // Quan hệ với hóa đơn

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Cart> carts; // Quan hệ với giỏ hàng
}
