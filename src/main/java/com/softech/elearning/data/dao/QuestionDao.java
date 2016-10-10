package com.softech.elearning.data.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Question;

@Repository
public interface QuestionDao extends JpaRepository<Question, Integer> {
	public Page<Question> findByContentLikeOrUser_FirstNameLikeAllIgnoreCase(String content, String firstName,
			Pageable pageable);
}