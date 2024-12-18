package com.asm.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "loaisanpham")
public class Category implements Serializable{
    @Id
    @Column(name = "id")
    private String id;

    @Column(name="tenloai")
    private String tenloai;
    
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Product> products;  // Quan hệ với sản phẩm
}
