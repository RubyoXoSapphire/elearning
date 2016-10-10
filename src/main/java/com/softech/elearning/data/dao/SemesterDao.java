package com.softech.elearning.data.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Semester;

@Repository
public interface SemesterDao extends JpaRepository<Semester, String> {
	public Page<Semester> findBySemesterIdLikeIgnoreCaseOrNameLikeIgnoreCase(String semesterId, String name,
			Pageable pageable);

	public Semester findTop1ByOrderBySemesterIdDesc();
	
}