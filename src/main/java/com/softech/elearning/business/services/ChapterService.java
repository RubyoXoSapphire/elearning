package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Chapter;
import com.softech.elearning.data.domain.Subject;

public interface ChapterService{
	long count();

	void delete(Chapter entity);

	void delete(List<Chapter> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Chapter> findAll();

	List<Chapter> findAll(int pageNumber, int pageSize, Sort sort);

	List<Chapter> findAll(Sort sort);

	Chapter findOne(Integer id);

	Chapter save(Chapter entity);
	
	List<Chapter> findChapterBySubject(Subject subject);
}