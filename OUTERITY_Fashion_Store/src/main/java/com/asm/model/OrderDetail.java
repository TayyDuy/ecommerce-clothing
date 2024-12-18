package com.asm.model;

import java.io.Serializable;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "chitiethoadon")
public class OrderDetail implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; // ID chi tiết hóa đơn, sẽ tự động tăng
	
    @Column(name = "size", nullable = false) 
    private String size; 

	@Column(name = "soluong", nullable = false)
	private Integer soluong; // Số lượng sản phẩm trong hóa đơn

	@Column(name = "gia", nullable = false)
	private Double gia; // Giá sản phẩm tại thời điểm hóa đơn

	@ManyToOne
	@JoinColumn(name = "idhoadon", nullable = false) // Không được để trống
	private Order order; // Hóa đơn mà chi tiết thuộc về

	@ManyToOne
	@JoinColumn(name = "idsanpham", nullable = false) // Không được để trống
	private Product product; // Sản phẩm trong chi tiết hóa đơn
}
