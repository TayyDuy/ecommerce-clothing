package com.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.model.OrderDetail;
import com.asm.model.Order;


public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer>{
	List<OrderDetail> findAllByOrder(Order order);
}
