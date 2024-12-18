package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.model.Warehouse;

public interface WarehouseDAO extends JpaRepository<Warehouse, String>{
	@Query("SELECT w.size FROM Warehouse w WHERE w.product.id = ?1")
    List<String> findSizesByProductId(String idSanPham);
	
	@Query("SELECT w FROM Warehouse w WHERE w.product.id = ?1 And w.size = ?2")
    List<Warehouse> findByProductAndSize(String idSanPham, String size);
	
	@Query("SELECT w FROM Warehouse w WHERE w.product.id = ?1 And w.size = ?2")
    Warehouse findOneByProductAndSize(String idSanPham, String size);
}
