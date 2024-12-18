package com.asm.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "khohang")
public class Warehouse implements Serializable {
    
    @Id
    @Column(name = "id", length = 10)
    private String id; // ID kho, sử dụng định dạng chuỗi như 'KH001'

    @ManyToOne
    @JoinColumn(name = "idsanpham", nullable = false) // Khóa ngoại tham chiếu đến bảng sản phẩm
    private Product product; // Sản phẩm

    @Column(name = "size", nullable = false) // Kích thước của sản phẩm
    private String size; 

    @Column(name = "soluongton", nullable = false) // Số lượng sản phẩm tồn kho
    private Integer soluongton = 0; // Mặc định là 0 nếu không có giá trị
}
