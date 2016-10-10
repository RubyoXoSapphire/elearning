package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.SemesterService;
import com.softech.elearning.data.dao.SemesterDao;
import com.softech.elearning.data.domain.Semester;

@Service("semesterService")
public class SemesterServiceImpl implements SemesterService {

	@Autowired
	SemesterDao semesterDao;

	@Override
	public long count() {
		return semesterDao.count();
	}

	@Override
	public void delete(Semester entity) {
		semesterDao.delete(entity);
	}

	@Override
	public void delete(List<Semester> entities) {
		semesterDao.delete(entities);

	}

	@Override
	public void delete(String id) {
		semesterDao.delete(id);
	}

	@Override
	public void deleteAll() {
		semesterDao.deleteAll();
	}

	@Override
	public boolean exists(String id) {
		return semesterDao.exists(id);
	}

	@Override
	public List<Semester> findAll() {
		return semesterDao.findAll();
	}

	@Override
	public Page<Semester> findAll(int pageNumber, int pageSize) {
		Pageable pageable = new PageRequest(pageNumber, pageSize);
		return semesterDao.findAll(pageable);
	}

	@Override
	public List<Semester> findAll(Sort sort) {
		return semesterDao.findAll(sort);
	}

	@Override
	public Semester findOne(String id) {
		return semesterDao.findOne(id);
	}

	@Override
	public Semester save(Semester entity) {
		return semesterDao.save(entity);
	}

	@Override
	public Page<Semester> search(String keyword, int pageNumber, int pageSize) {
		PageRequest pageRequest = new PageRequest(pageNumber, pageSize, new Sort(Direction.DESC, "semesterId"));
		return semesterDao.findBySemesterIdLikeIgnoreCaseOrNameLikeIgnoreCase("%" + keyword + "%", "%" + keyword + "%",
				pageRequest);
	}

	@Override
	public Semester findCurrentSemester() {
		return semesterDao.findTop1ByOrderBySemesterIdDesc();
	}


}