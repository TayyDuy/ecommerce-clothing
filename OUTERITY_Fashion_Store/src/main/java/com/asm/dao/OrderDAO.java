package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.asm.model.Order;
import com.asm.model.User;


public interface OrderDAO extends JpaRepository<Order, Integer>{
	@Query("Select o From Order o Where o.user.username = ?1 Order By o.ngaytao desc")
	List<Order> findAllByUser(String user);
	
	@Query("SELECT o FROM Order o WHERE MONTH(o.ngaytao) = ?1 AND YEAR(o.ngaytao) = ?2")
	List<Order> findAllByMonthAndYear(int month, int year);
	
	@Query("SELECT COUNT(o) FROM Order o WHERE MONTH(o.ngaytao) = ?1 AND YEAR(o.ngaytao) = ?2")
	Long countTotalOrdersByMonthAndYear(int month, int year);

	@Query("SELECT SUM(o.tonggiatri) FROM Order o WHERE MONTH(o.ngaytao) = ?1 AND YEAR(o.ngaytao) = ?2")
	Double sumTotalAmountByMonthAndYear(int month, int year);

}
