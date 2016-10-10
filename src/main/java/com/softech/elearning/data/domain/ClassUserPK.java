package com.softech.elearning.data.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.stereotype.Component;

/**
 * The primary key class for the exam_question database table.
 * 
 */
@Component
@Embeddable
public class ClassUserPK implements Serializable {
	// default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name = "class_id", insertable = false, updatable = false)
	private String classId;

	@Column(name = "user_id", insertable = false, updatable = false)
	private String userId;

	public ClassUserPK() {
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}