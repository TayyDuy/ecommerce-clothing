package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.model.User;

public interface UserDAO extends JpaRepository<User, String>{

}
