package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.RoleService;
import com.softech.elearning.data.dao.RoleDao;
import com.softech.elearning.data.domain.Role;

@Service("roleService")
public class RoleServiceImpl implements RoleService{

	@Autowired
	RoleDao roleDao;
	
	@Override
	public long count() {
		return roleDao.count();
	}

	@Override
	public void delete(Role entity) {
		roleDao.delete(entity);
	}

	@Override
	public void delete(List<Role> entities) {
		roleDao.delete(entities);
		
	}

	@Override
	public void delete(Integer id) {
		roleDao.delete(id);
	}

	@Override
	public void deleteAll() {
		roleDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return roleDao.exists(id);
	}

	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}

	@Override
	public List<Role> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return roleDao.findAll(pageable).getContent();
	}

	@Override
	public List<Role> findAll(Sort sort) {
		return roleDao.findAll(sort);
	}

	@Override
	public Role findOne(Integer id) {
		return roleDao.findOne(id);
	}

	@Override
	public Role save(Role entity) {
		return roleDao.save(entity);
	}
}