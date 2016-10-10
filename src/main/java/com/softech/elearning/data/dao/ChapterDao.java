package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Chapter;
import com.softech.elearning.data.domain.Subject;

@Repository
public interface ChapterDao extends JpaRepository<Chapter, Integer> {
	List<Chapter> findBySubject(@Param("subject") Subject subject);
}