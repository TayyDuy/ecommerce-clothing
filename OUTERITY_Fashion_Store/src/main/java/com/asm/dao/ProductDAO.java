package com.asm.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.model.Product;

public interface ProductDAO extends JpaRepository<Product, String>{
	@Query("SELECT o FROM Product o WHERE o.category.id LIKE ?1 and o.giasp between ?2 and ?3")
	Page<Product> findByCate(String cate,Integer min, Integer max, PageRequest page);
	
	@Query("SELECT p FROM Product p WHERE p.tensp LIKE ?1")
    Page<Product> searchByName(String name, PageRequest page);
	
	@Query("SELECT p FROM Product p WHERE p.category.id LIKE ?1 AND p.giasp BETWEEN ?2 AND ?3 ORDER BY p.giasp ASC")
	Page<Product> findByCateOrderByPriceAsc(String category, int minPrice, int maxPrice, PageRequest pageable);

	@Query("SELECT p FROM Product p WHERE p.category.id LIKE ?1 AND p.giasp BETWEEN ?2 AND ?3 ORDER BY p.giasp DESC")
	Page<Product> findByCateOrderByPriceDesc(String category, int minPrice, int maxPrice, PageRequest pageable);

}
