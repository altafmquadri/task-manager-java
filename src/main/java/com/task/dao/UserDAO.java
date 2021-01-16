package com.task.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.task.model.User;

public interface UserDAO extends CrudRepository<User, Integer> {
	
	public Optional<User> findOneByNameAndPassword(String name, String password);

	
}
