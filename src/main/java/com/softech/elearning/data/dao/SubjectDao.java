package com.softech.elearning.data.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Subject;

@Repository
public interface SubjectDao extends JpaRepository<Subject, String> {
	public Page<Subject> findBySubjectIdLikeIgnoreCaseOrNameLikeIgnoreCase(String subjectId,String name,Pageable pageable);
}