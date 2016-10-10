package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Semester;

public interface SemesterService {
	long count();

	void delete(Semester entity);

	void delete(List<Semester> entities);

	void delete(String id);

	void deleteAll();

	public Page<Semester> search(String keyword, int pageNumber, int pageSize);

	boolean exists(String id);

	List<Semester> findAll();

	Page<Semester> findAll(int pageNumber, int pageSize);

	List<Semester> findAll(Sort sort);

	Semester findOne(String id);

	Semester save(Semester entity);

	Semester findCurrentSemester();
}