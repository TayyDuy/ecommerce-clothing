package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.model.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{

}
