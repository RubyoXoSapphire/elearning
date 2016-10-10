package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ExamQuestionService;
import com.softech.elearning.data.dao.ExamQuestionDao;
import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.Question;

@Service("examQuestionService")
public class ExamQuestionServiceImpl implements ExamQuestionService {

	@Autowired
	ExamQuestionDao examQuestionDao;

	@Override
	public long count() {
		return examQuestionDao.count();
	}

	@Override
	public void delete(ExamQuestion entity) {
		examQuestionDao.delete(entity);
	}

	@Override
	public void delete(List<ExamQuestion> entities) {
		examQuestionDao.delete(entities);

	}

	@Override
	public void delete(Exam exam, Question question) {
		examQuestionDao.deleteByExamAndQuestion(exam, question);
	}

	@Override
	public void deleteAll() {
		examQuestionDao.deleteAll();
	}

	@Override
	public boolean exists(Exam exam, Question question) {
		ExamQuestion examQuestion = examQuestionDao.findByExamAndQuestion(exam, question);
		return examQuestion != null ? true : false;
	}

	@Override
	public List<ExamQuestion> findAll() {
		return examQuestionDao.findAll();
	}

	@Override
	public List<ExamQuestion> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return examQuestionDao.findAll(pageable).getContent();
	}

	@Override
	public List<ExamQuestion> findAll(Sort sort) {
		return examQuestionDao.findAll(sort);
	}

	@Override
	public ExamQuestion findOne(Exam exam, Question question) {
		return examQuestionDao.findByExamAndQuestion(exam, question);
	}

	@Override
	public ExamQuestion save(ExamQuestion entity) {
		return examQuestionDao.save(entity);
	}

	@Override
	public List<ExamQuestion> findByExam(Exam exam) {
		return examQuestionDao.findByExam(exam);
	}

}