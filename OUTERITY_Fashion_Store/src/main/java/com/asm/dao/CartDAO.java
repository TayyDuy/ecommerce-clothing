package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.model.Cart;
import com.asm.model.Product;
import com.asm.model.User;


public interface CartDAO extends JpaRepository<Cart, Integer>{
	@Query("SELECT o FROM Cart o WHERE o.user.username = ?1")
	List<Cart> getAllByUser(String username);
	
	@Query("SELECT o FROM Cart o WHERE o.product.id = ?1")
	List<Cart> getAllByProduct(String id);
	
	@Query("SELECT o FROM Cart o WHERE o.user.username = ?1 and o.product.id = ?2")
	Cart getByProAndUser(String username, String id);
	
	@Query("SELECT SUM(c.soluong) FROM Cart c WHERE c.user.username = ?1")
    Integer getTotalQuantityByUser(String username);
    
    @Query("SELECT SUM(c.soluong * p.giasp) FROM Cart c JOIN c.product p WHERE c.user.username = ?1")
    Double getTotalPriceByUser(String username);
}
