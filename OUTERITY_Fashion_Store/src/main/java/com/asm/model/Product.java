package com.asm.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "sanpham")
public class Product implements Serializable {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "tensp", nullable = false)
    private String tensp;

    @Column(name = "anhsp")
    private String anhsp = "default.png";

    @Column(name = "giasp", nullable = false)
    private Double giasp;

    @ManyToOne
    @JoinColumn(name = "phanloai", nullable = false)
    private Category category;  

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderDetails;  
}

