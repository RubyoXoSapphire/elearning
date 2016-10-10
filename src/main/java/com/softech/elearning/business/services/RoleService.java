package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Role;

public interface RoleService{
	long count();

	void delete(Role entity);

	void delete(List<Role> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Role> findAll();

	List<Role> findAll(int pageNumber, int pageSize, Sort sort);

	List<Role> findAll(Sort sort);

	Role findOne(Integer id);

	Role save(Role entity);
}