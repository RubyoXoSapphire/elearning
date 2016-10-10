package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ExamService;
import com.softech.elearning.data.dao.ExamDao;
import com.softech.elearning.data.dao.ExamQuestionDao;
import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.User;

@Service("examService")
public class ExamServiceImpl implements ExamService {

	@Autowired
	ExamQuestionDao examQuestionDao;

	@Autowired
	ExamDao examDao;

	@Override
	public long count() {
		return examDao.count();
	}

	@Override
	public void delete(Exam entity) {
		examDao.delete(entity);
	}

	@Override
	public void delete(List<Exam> entities) {
		examDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		examDao.delete(id);
	}

	@Override
	public void deleteAll() {
		examDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return examDao.exists(id);
	}

	@Override
	public List<Exam> findAll() {
		return examDao.findAll();
	}

	@Override
	public List<Exam> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return examDao.findAll(pageable).getContent();
	}

	@Override
	public List<Exam> findAll(Sort sort) {
		return examDao.findAll(sort);
	}

	@Override
	public Exam findOne(Integer id) {
		return examDao.findOne(id);
	}

	@Override
	public Exam save(Exam entity) {
		return examDao.save(entity);
	}

	@Override
	public List<Exam> findByUser(User user) {
		return examDao.findByUser(user);
	}

	@Override
	public int findTotalMarkByExam(Exam exam) {
		List<ExamQuestion> list = examQuestionDao.findByExam(exam);
		int mark = 0;
		for (int i = 0; i < list.size(); i++) {
			ExamQuestion examQuestion = list.get(i);
			mark += examQuestion.getMark();
		}
		return mark;
	}

	@Override
	public List<Double> getTotalMarkByExam(Exam exam) {
		List<Double> list = examQuestionDao.findMarkByExam(exam.getExamId());
		return list;
	}

	@Override
	public Exam getExamSelectedForSubject(String subjectId) {
		Exam exam = examDao.findBySubjectSubjectIdAndEnabled(subjectId, new Byte("2"));
		return exam;
	}

	@Override
	public List<Exam> findExamByUserId(String userId) {
		List<Exam> list = examDao.findExamByUser(userId);
		return list;
	}

	@Override
	public List<Exam> findQuizByUserId(String userId) {
		List<Exam> list = examDao.findQuizByUser(userId);
		return list;
	}
	
	@Override
	public Integer countQuizByUserId(String userId) {
		int count = examDao.countQuizByUser(userId);
		return count;
	}
	
	@Override
	public Integer countExamByUserId(String userId) {
		int count = examDao.countExamByUser(userId);
		return count;
	}

	@Override
	public List<Exam> findAllQuiz() {
		return examDao.findAllQuiz();
	}
}