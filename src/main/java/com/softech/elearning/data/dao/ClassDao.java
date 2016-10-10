package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.softech.elearning.data.domain.Class;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

@Repository
public interface ClassDao extends JpaRepository<com.softech.elearning.data.domain.Class, String> {
	Page<Class> findByClassIdLikeIgnoreCase(String classId,Pageable pageable);
	List<com.softech.elearning.data.domain.Class> findBySemesterAndUser(Semester semester, User user);

	com.softech.elearning.data.domain.Class findByUserAndClassId(User user, String classId);

	List<com.softech.elearning.data.domain.Class> findBySemesterOrderBySubjectDesc(Semester semester);

}