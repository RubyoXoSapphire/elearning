package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Type;

public interface TypeService {
	long count();

	void delete(Type entity);

	void delete(List<Type> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Type> findAll();

	List<Type> findAll(int pageNumber, int pageSize, Sort sort);

	List<Type> findAll(Sort sort);

	Type findOne(Integer id);

	Type save(Type entity);
}