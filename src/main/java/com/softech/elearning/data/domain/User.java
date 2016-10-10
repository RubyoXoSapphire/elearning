package com.softech.elearning.data.domain;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the user database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "user_id")
	@NotEmpty
	private String userId;

	private String address;

	private String avatar;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name = "date_of_birth")
	@Past
	@NotNull
	private Date dateOfBirth;
	
	@Email
	@NotEmpty
	private String email;

	private byte enabled;

	@Column(name = "first_name")
	@NotEmpty
	private String firstName;

	@Column(name = "id_card")
	@NotEmpty
	@Length(max = 9)
	private String idCard;

	@Column(name = "last_name")
	@NotEmpty
	private String lastName;
	
	@NotEmpty
	@Size(min = 6, max = 20)
	private String password;

	private String phone;
	private String sex;

	// bi-directional many-to-one association to Answersheet
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<AnswerSheet> answerSheets;

	// bi-directional many-to-one association to Class
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Class> clazzs1;

	// bi-directional many-to-many association to Class
	@JsonIgnore
	@ManyToMany(mappedBy = "users", fetch = FetchType.LAZY)
	private List<Class> clazzs2;

	// bi-directional many-to-one association to Exam
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Exam> exams;

	// bi-directional many-to-one association to Question
	@JsonIgnore
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Question> questions;

	// bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name = "role_id")
	@NotNull
	private Role role;

	public User() {
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getDateOfBirth() {
		return this.dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public List<AnswerSheet> getAnswerSheets() {
		return this.answerSheets;
	}

	public void setAnswersheets(List<AnswerSheet> answerSheets) {
		this.answerSheets = answerSheets;
	}

	public AnswerSheet addAnswersheet(AnswerSheet answerSheet) {
		getAnswerSheets().add(answerSheet);
		answerSheet.setUser(this);

		return answerSheet;
	}

	public AnswerSheet removeAnswerSheet(AnswerSheet answerSheets) {
		getAnswerSheets().remove(answerSheets);
		answerSheets.setUser(null);

		return answerSheets;
	}

	public List<Class> getClazzs1() {
		return this.clazzs1;
	}

	public void setClazzs1(List<Class> clazzs1) {
		this.clazzs1 = clazzs1;
	}

	public Class addClazzs1(Class clazzs1) {
		getClazzs1().add(clazzs1);
		clazzs1.setUser(this);

		return clazzs1;
	}

	public Class removeClazzs1(Class clazzs1) {
		getClazzs1().remove(clazzs1);
		clazzs1.setUser(null);

		return clazzs1;
	}

	public List<Class> getClazzs2() {
		return this.clazzs2;
	}

	public void setClazzs2(List<Class> clazzs2) {
		this.clazzs2 = clazzs2;
	}

	public List<Exam> getExams() {
		return this.exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}

	public Exam addExam(Exam exam) {
		getExams().add(exam);
		exam.setUser(this);

		return exam;
	}

	public Exam removeExam(Exam exam) {
		getExams().remove(exam);
		exam.setUser(null);

		return exam;
	}

	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public Question addQuestion(Question question) {
		getQuestions().add(question);
		question.setUser(this);

		return question;
	}

	public Question removeQuestion(Question question) {
		getQuestions().remove(question);
		question.setUser(null);

		return question;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}