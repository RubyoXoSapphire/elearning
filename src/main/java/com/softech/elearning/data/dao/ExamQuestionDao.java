package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.Question;

@Repository
public interface ExamQuestionDao extends JpaRepository<ExamQuestion, Integer> {
	List<ExamQuestion> findByExam(Exam exam);

	ExamQuestion findByExamAndQuestion(Exam exam, Question question);

	void deleteByExamAndQuestion(Exam exam, Question question);

	boolean countByExamAndQuestion(Exam exam, Question question);

	@Query("select e.mark from ExamQuestion e where e.exam.examId = :examId")
	List<Double> findMarkByExam(@Param("examId") int examId);

	Integer countByExamExamId(int examId);
}