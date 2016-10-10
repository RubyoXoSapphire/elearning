package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.ClassUser;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.User;

@Repository
public interface ClassUserDao extends JpaRepository<ClassUser, Integer> {
	
	@Query("select c.clazz from ClassUser c where c.user = :user and c.clazz.semester = :semester")
	List<com.softech.elearning.data.domain.Class> findByUserAtCurrentSemester(@Param("user")User user,@Param("semester") Semester semester);
	
	List<ClassUser> findByClazz(com.softech.elearning.data.domain.Class clazz);
	
	ClassUser findByClazzAndUser(com.softech.elearning.data.domain.Class clazz, User user);

	void deleteByClazzAndUser(com.softech.elearning.data.domain.Class clazz, User user);
}