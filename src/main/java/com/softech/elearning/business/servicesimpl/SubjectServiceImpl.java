package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.SubjectService;
import com.softech.elearning.data.dao.SubjectDao;
import com.softech.elearning.data.domain.Subject;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	SubjectDao subjectDao;
	
	@Override
	public long count() {
		return subjectDao.count();
	}

	@Override
	public void delete(Subject entity) {
		subjectDao.delete(entity);
	}

	@Override
	public void delete(List<Subject> entities) {
		subjectDao.delete(entities);
		
	}

	@Override
	public void delete(String id) {
		subjectDao.delete(id);
	}
	
	@Override
	public void deleteAll() {
		subjectDao.deleteAll();
	}

	@Override
	public boolean exists(String id) {
		return subjectDao.exists(id);
	}

	@Override
	public List<Subject> findAll() {
		return subjectDao.findAll();
	}

	@Override
	public Page<Subject> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return subjectDao.findAll(pageable);
	}

	@Override
	public List<Subject> findAll(Sort sort) {
		return subjectDao.findAll(sort);
	}

	@Override
	public Subject findOne(String id) {
		return subjectDao.findOne(id);
	}

	@Override
	public Subject save(Subject entity) {
		return subjectDao.save(entity);
	}

	@Override
	public Page<Subject> search(int pageNumber, int pageSize, String keyword) {
		PageRequest pageRequest=new PageRequest(pageNumber, pageSize, new Sort(Direction.DESC, "subjectId"));
		return subjectDao.findBySubjectIdLikeIgnoreCaseOrNameLikeIgnoreCase("%"+keyword+"%", "%"+keyword+"%", pageRequest);
	}

	
	
	
}