package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.User;

@Repository
public interface ExamDao extends JpaRepository<Exam, Integer> {
	public List<Exam> findByUser(User user);

	@Query("select e from Exam e where e.user.userId = :userId and e.specificExam = 'Exam'")
	public List<Exam> findExamByUser(@Param("userId") String userId);

	@Query("select e from Exam e where e.user.userId = :userId and e.specificExam = 'Quiz'")
	public List<Exam> findQuizByUser(@Param("userId") String userId);

	@Query("select count(e) from Exam e where e.user.userId = :userId and e.specificExam = 'Quiz'")
	public int countQuizByUser(@Param("userId") String userId);

	@Query("select count(e) from Exam e where e.user.userId = :userId and e.specificExam = 'Exam'")
	public int countExamByUser(@Param("userId") String userId);

	public Exam findBySubjectSubjectIdAndEnabled(String subjectId, byte enabled);

	@Query("select e from Exam e where e.specificExam = 'Quiz'")
	public List<Exam> findAllQuiz();
}