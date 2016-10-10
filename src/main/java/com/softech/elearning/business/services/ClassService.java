package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Class;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

public interface ClassService {
	long count();

	void delete(Class entity);

	void delete(List<Class> entities);

	void delete(String id);

	void deleteAll();

	boolean exists(String id);

	List<Class> findAll();

	List<Class> findAll(int pageNumber, int pageSize, Sort sort);

	List<Class> findAll(Sort sort);

	Class findOne(String id);

	Class save(Class entity);

	public Page<Class> findByClassIdLikeIgnoreCase(String keyword,int pageNumber,int pageSize);
	
	List<Class> findCurrentClassForTeacherInCurrentSemester(Semester semester, User user);

	List<Class> findClassBySemester(Semester semester);

	boolean checkClassOfUser(User user, com.softech.elearning.data.domain.Class clazz);
}