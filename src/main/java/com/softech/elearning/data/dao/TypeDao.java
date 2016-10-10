package com.softech.elearning.data.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.softech.elearning.data.domain.Type;

@Repository
public interface TypeDao extends JpaRepository<Type, Integer>  {

}