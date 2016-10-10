package com.softech.elearning.data.domain;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


/**
 * The persistent class for the exam_question database table.
 * 
 */
@Component
@Entity
@Table(name="class_user")
@NamedQuery(name="ClassUser.findAll", query="SELECT e FROM ClassUser e")
public class ClassUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ClassUserPK id;

	//bi-directional many-to-one association to Exam
	@ManyToOne
	@JoinColumn(name="class_id", insertable=false, updatable=false)
	private Class clazz;

	//bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name="user_id", insertable=false, updatable=false)
	private User user;

	public ClassUser() {
	}

	public ClassUserPK getId() {
		return this.id;
	}

	public void setId(ClassUserPK id) {
		this.id = id;
	}

	public Class getClazz() {
		return clazz;
	}

	public void setClazz(Class clazz) {
		this.clazz = clazz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}