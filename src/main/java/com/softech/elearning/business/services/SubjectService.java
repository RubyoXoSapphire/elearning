package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Subject;

public interface SubjectService{
	long count();

	void delete(Subject entity);

	void delete(List<Subject> entities);

	void delete(String id);

	void deleteAll();

	boolean exists(String id);

	List<Subject> findAll();

	Page<Subject> findAll(int pageNumber, int pageSize, Sort sort);

	List<Subject> findAll(Sort sort);

	Subject findOne(String id);

	Subject save(Subject entity);
	
	Page<Subject> search(int pageNumber,int pageSize,String keyword);
}