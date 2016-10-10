package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ClassService;
import com.softech.elearning.data.dao.ClassDao;
import com.softech.elearning.data.domain.Class;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

@Service("classService")
public class ClassServiceImpl implements ClassService {

	@Autowired
	ClassDao classDao;

	@Override
	public long count() {
		return classDao.count();
	}

	@Override
	public void delete(Class entity) {
		classDao.delete(entity);
	}

	@Override
	public void delete(List<Class> entities) {
		classDao.delete(entities);

	}

	@Override
	public void delete(String id) {
		classDao.delete(id);
	}

	@Override
	public void deleteAll() {
		classDao.deleteAll();
	}

	@Override
	public boolean exists(String id) {
		return classDao.exists(id);
	}

	@Override
	public List<Class> findAll() {
		return classDao.findAll();
	}

	@Override
	public List<Class> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return classDao.findAll(pageable).getContent();
	}

	@Override
	public List<Class> findAll(Sort sort) {
		return classDao.findAll(sort);
	}

	@Override
	public Class findOne(String id) {
		return classDao.findOne(id);
	}

	@Override
	public Class save(Class entity) {
		return classDao.save(entity);
	}

	@Override
	public List<Class> findCurrentClassForTeacherInCurrentSemester(Semester semester, User user) {
		List<Class> classList = classDao.findBySemesterAndUser(semester, user);
		return classList;
	}
@Override
	public List<Class> findClassBySemester(Semester semester) {
		List<Class> classList = classDao.findBySemesterOrderBySubjectDesc(semester);
		return classList;
	}

	@Override
	public boolean checkClassOfUser(User user, com.softech.elearning.data.domain.Class clazz) {
		clazz = classDao.findByUserAndClassId(user, clazz.getClassId());
		if (clazz == null) {
			return false;
		} else {
			return true;
		}
	}	@Override
	public Page<Class> findByClassIdLikeIgnoreCase(String keyword,int pageNumber,int pageSize) {
		// TODO Auto-generated method stub
		PageRequest pageRequest=new PageRequest(pageNumber, pageSize, new Sort(Direction.DESC,"classId"));
		Page<Class> pageClass=classDao.findByClassIdLikeIgnoreCase("%"+keyword+"%", pageRequest);
		return pageClass;
	}}