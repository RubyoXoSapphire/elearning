package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.User;

public interface UserService {

	User login(String userId, String password);

	long count();

	void delete(User entity);

	void delete(List<User> entities);

	void delete(String id);

	void deleteAll();

	boolean exists(String id);

	List<User> findAll();

	List<User> findAll(int pageNumber, int pageSize, Sort sort);

	List<User> findAll(Sort sort);

	User findOne(String id);

	User save(User entity);

	Page<User> findUserByUserIdOrFirstName(String keyword, int pageNumber, int pageSize, Sort sort);
	
	List<User> findAllTeacher();
}