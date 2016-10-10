package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.TypeService;
import com.softech.elearning.data.dao.TypeDao;
import com.softech.elearning.data.domain.Type;

@Service("typeService")
public class TypeServiceImpl implements TypeService{

	@Autowired
	TypeDao typeDao;
	
	@Override
	public long count() {
		return typeDao.count();
	}

	@Override
	public void delete(Type entity) {
		typeDao.delete(entity);
	}

	@Override
	public void delete(List<Type> entities) {
		typeDao.delete(entities);
		
	}

	@Override
	public void delete(Integer id) {
		typeDao.delete(id);
	}

	@Override
	public void deleteAll() {
		typeDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return typeDao.exists(id);
	}

	@Override
	public List<Type> findAll() {
		return typeDao.findAll();
	}

	@Override
	public List<Type> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return typeDao.findAll(pageable).getContent();
	}

	@Override
	public List<Type> findAll(Sort sort) {
		return typeDao.findAll(sort);
	}

	@Override
	public Type findOne(Integer id) {
		return typeDao.findOne(id);
	}

	@Override
	public Type save(Type entity) {
		return typeDao.save(entity);
	}
}