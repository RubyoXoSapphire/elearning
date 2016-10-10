package com.softech.elearning.data.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Check;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * The persistent class for the semester database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Semester.findAll", query = "SELECT s FROM Semester s")
@Check(constraints="end_date > begin_date")
public class Semester implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "semester_id")
	@NotNull
	@NotEmpty
	private String semesterId;

	private byte enabled;
	
	@NotEmpty(message="Semester name is required")
	@Size(min=6,max=10,message="Semester name length must between 6 and 10")
	private String name;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="begin_date")
	@NotNull
	private Date beginDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name="end_date")
	@NotNull
	@Future
	private Date endDate;

	// bi-directional many-to-one association to Class
	// từ chối map quan hệ này Vì thằng json nó map lun mấy cái quan hệ của domain lun cho nên k dùng cái này bị lỗi lazy liền
	@JsonIgnore
	@OneToMany(mappedBy = "semester", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Class> clazzs;

	public Semester() {
	}

	public String getSemesterId() {
		return this.semesterId;
	}

	public void setSemesterId(String semesterId) {
		this.semesterId = semesterId;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Class> getClazzs() {
		return this.clazzs;
	}

	public void setClazzs(List<Class> clazzs) {
		this.clazzs = clazzs;
	}

	public Class addClazz(Class clazz) {
		getClazzs().add(clazz);
		clazz.setSemester(this);

		return clazz;
	}

	public Class removeClazz(Class clazz) {
		getClazzs().remove(clazz);
		clazz.setSemester(null);

		return clazz;
	}

	public Date getEndDate() {
		return this.endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getBeginDate() {
		return this.beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

}