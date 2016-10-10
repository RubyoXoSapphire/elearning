package com.softech.elearning.business.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.User;

public interface ExamService {
	long count();

	void delete(Exam entity);

	void delete(List<Exam> entities);

	void delete(Integer id);

	void deleteAll();

	boolean exists(Integer id);

	List<Exam> findAll();

	List<Exam> findAll(int pageNumber, int pageSize, Sort sort);

	List<Exam> findAll(Sort sort);

	Exam findOne(Integer id);

	Exam save(Exam entity);

	List<Exam> findByUser(User user);

	public int findTotalMarkByExam(Exam exam);

	public List<Double> getTotalMarkByExam(Exam exam);

	public Exam getExamSelectedForSubject(String subjectId);

	public List<Exam> findExamByUserId(String userId);

	public List<Exam> findQuizByUserId(String userId);

	public Integer countQuizByUserId(String userId);

	public Integer countExamByUserId(String userId);

	public List<Exam> findAllQuiz();
}