package com.asm.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "hoadon")
public class Order implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; // ID chi tiết hóa đơn, sẽ tự động tăng

	@Column(name = "tonggiatri", nullable = false)
	private Double tonggiatri;

	@Column(name = "ngaytao", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date ngaytao = new Date();

	@Column(name = "trangthai", nullable = false)
	private Boolean trangthai = false;

	@ManyToOne
	@JoinColumn(name = "username", nullable = false)
	private User user;

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<OrderDetail> orderDetails; // Quan hệ với chi tiết hóa đơn
}
