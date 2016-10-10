package com.softech.elearning.data.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.User;

@Repository

public interface UserDao extends JpaRepository<User, String> {

	public User findByUserIdAndPassword(@Param("userId") String userId, @Param("password") String password);

	public User findByUserId(@Param("userId") String userId);

	public Page<User> findByUserIdLikeIgnoreCaseOrFirstNameLikeIgnoreCase(@Param("UserId") String userId,
			@Param("FirstName") String firstName, Pageable pageable);

	public List<User> findByUserIdLikeIgnoreCaseOrFirstNameLikeIgnoreCase(@Param("UserId") String userId,
			@Param("FirstName") String firstName);
	public List<User> findByRole_NameLikeIgnoreCase(String roleName);
}