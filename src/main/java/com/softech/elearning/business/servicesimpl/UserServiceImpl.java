package com.softech.elearning.business.servicesimpl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.UserService;
import com.softech.elearning.data.dao.UserDao;
import com.softech.elearning.data.domain.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public long count() {
		return userDao.count();
	}

	@Override
	public void delete(User entity) {
		userDao.delete(entity);
	}

	@Override
	public void delete(List<User> entities) {
		userDao.delete(entities);

	}

	@Override
	public void delete(String id) {
		userDao.delete(id);
	}

	@Override
	public void deleteAll() {
		userDao.deleteAll();
	}

	@Override
	public boolean exists(String id) {
		return userDao.exists(id);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return userDao.findAll(pageable).getContent();
	}

	@Override
	public List<User> findAll(Sort sort) {
		return userDao.findAll(sort);
	}

	@Override
	public User findOne(String id) {
		return userDao.findOne(id);
	}

	@Override
	public User save(User entity) {
		return userDao.save(entity);
	}

	@Override
	public User login(String userId, String password) {
		User user = userDao.findByUserIdAndPassword(userId, password);
		return user;
	}

	@Override
	public Page<User> findUserByUserIdOrFirstName(String keyword, int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		Page<User> listUser = userDao.findByUserIdLikeIgnoreCaseOrFirstNameLikeIgnoreCase("%" + keyword + "%",
				"%" + keyword + "%", pageable);
		
		return listUser;
	}

	@Override
	public List<User> findAllTeacher() {
		// TODO Auto-generated method stub
		return userDao.findByRole_NameLikeIgnoreCase("ROLE_TEACHER");
	}

}