package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.ClassUser;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

public interface ClassUserService {
	long count();

	void delete(ClassUser entity);

	void delete(List<ClassUser> entities);

	void delete(com.softech.elearning.data.domain.Class clazz, User user);

	void deleteAll();

	boolean exists(com.softech.elearning.data.domain.Class clazz, User user);

	List<ClassUser> findAll();

	List<ClassUser> findAll(int pageNumber, int pageSize, Sort sort);

	List<ClassUser> findAll(Sort sort);

	ClassUser findOne(com.softech.elearning.data.domain.Class clazz, User user);

	List<com.softech.elearning.data.domain.Class> findAllClassForStudent(User user, Semester semester);

	ClassUser save(ClassUser entity);

}