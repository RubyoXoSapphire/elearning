package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ClassUserService;
import com.softech.elearning.data.dao.ClassUserDao;
import com.softech.elearning.data.domain.ClassUser;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

@Service("classUserService")
public class ClassUserServiceImpl implements ClassUserService {

	@Autowired
	ClassUserDao classUserDao;

	@Override
	public long count() {
		return classUserDao.count();
	}

	@Override
	public void delete(ClassUser entity) {
		classUserDao.delete(entity);
	}

	@Override
	public void delete(List<ClassUser> entities) {
		classUserDao.delete(entities);

	}

	@Override
	public void delete(com.softech.elearning.data.domain.Class clazz, User user) {
		classUserDao.deleteByClazzAndUser(clazz, user);
	}

	@Override
	public void deleteAll() {
		classUserDao.deleteAll();
	}

	@Override
	public boolean exists(com.softech.elearning.data.domain.Class clazz, User user) {
		ClassUser classUser = classUserDao.findByClazzAndUser(clazz, user);
		return classUser != null ? true : false;
	}

	@Override
	public List<ClassUser> findAll() {
		return classUserDao.findAll();
	}

	@Override
	public List<ClassUser> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return classUserDao.findAll(pageable).getContent();
	}

	@Override
	public List<ClassUser> findAll(Sort sort) {
		return classUserDao.findAll(sort);
	}

	@Override
	public ClassUser findOne(com.softech.elearning.data.domain.Class clazz, User user) {
		return classUserDao.findByClazzAndUser(clazz, user);
	}

	@Override
	public ClassUser save(ClassUser entity) {
		return classUserDao.save(entity);
	}

	@Override
	public List<com.softech.elearning.data.domain.Class> findAllClassForStudent(User user, Semester semester) {
		return classUserDao.findByUserAtCurrentSemester(user, semester);
	}

}