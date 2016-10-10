package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.Exam;

@Repository
public interface AnswerSheetDao extends JpaRepository<AnswerSheet, Integer> {
	List<AnswerSheet> findByExam(Exam exam);

	@Query("select a from AnswerSheet a where a.user.userId = :userId and a.exam.examId = :examId")
	AnswerSheet findByUserAndExam(@Param("userId") String userId, @Param("examId") int examId);

	int countByExamExamId(int examId);

	@Query("select a.answerSheetId from AnswerSheet a where a.exam.examId = :examId")
	List<Integer> findAllAnswerSheetIdByExamId(@Param("examId") int examId);

	@Query("select count(a.answerSheetId) from AnswerSheet a where a.totalMark >= :passMark and a.exam.examId = :examId")
	Integer countPassAnswerSheetByExamId(@Param("examId") int examId, @Param("passMark") double passMark);
	
	@Query("select sum(a.totalMark) from AnswerSheet a where a.exam.examId = :examId")
	Double countTotalMarkByExamId(@Param("examId") int examId);
}