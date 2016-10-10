package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ChapterService;
import com.softech.elearning.data.dao.ChapterDao;
import com.softech.elearning.data.domain.Chapter;
import com.softech.elearning.data.domain.Subject;

@Service("chapterService")
public class ChapterServiceImpl implements ChapterService {

	@Autowired
	ChapterDao chapterDao;

	@Override
	public long count() {
		return chapterDao.count();
	}

	@Override
	public void delete(Chapter entity) {
		chapterDao.delete(entity);
	}

	@Override
	public void delete(List<Chapter> entities) {
		chapterDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		chapterDao.delete(id);
	}

	@Override
	public void deleteAll() {
		chapterDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return chapterDao.exists(id);
	}

	@Override
	public List<Chapter> findAll() {
		return chapterDao.findAll();
	}

	@Override
	public List<Chapter> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return chapterDao.findAll(pageable).getContent();
	}

	@Override
	public List<Chapter> findAll(Sort sort) {
		return chapterDao.findAll(sort);
	}

	@Override
	public Chapter findOne(Integer id) {
		return chapterDao.findOne(id);
	}

	@Override
	public Chapter save(Chapter entity) {
		return chapterDao.save(entity);
	}

	@Override
	public List<Chapter> findChapterBySubject(Subject subject) {
		return chapterDao.findBySubject(subject);
	}
}