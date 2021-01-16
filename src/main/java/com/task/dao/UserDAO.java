package com.task.dao;

import org.springframework.data.repository.CrudRepository;

import com.task.model.User;

public interface UserDAO extends CrudRepository<User, Integer> {
	
}
