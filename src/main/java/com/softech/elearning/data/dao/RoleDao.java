package com.softech.elearning.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Role;

@Repository
public interface RoleDao extends JpaRepository<Role, Integer>{

}