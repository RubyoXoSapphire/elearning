package com.softech.elearning.data.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

/**
 * The persistent class for the exam database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Exam.findAll", query = "SELECT e FROM Exam e")
public class Exam implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "exam_id")
	private int examId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createDate;

	@NotNull(message = "Enable is required")
	private byte enabled = 0;

	@Column(name = "mark_max")
	private double markMax = 0;

	@NotEmpty(message = "Exam name is required")
	@Size(min = 6, max = 50, message = "Exam name length must between 6 and 50")
	private String name;

	@Lob
	private String notes;

	@Column(name = "pass_mark")
	private double passMark = 0;

	@Column(name = "specific_exam")
	private String specificExam;

	/*@Temporal(TemporalType.TIMESTAMP)*/
	@Column(name = "test_datetime_begin")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date testDatetimeBegin;

	@Column(name = "test_minute")
	private int testMinute = 0;

	private String type;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date")
	private Date updateDate;

	// bi-directional many-to-one association to Answersheet
	@OneToMany(mappedBy = "exam", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<AnswerSheet> answerSheets;

	// bi-directional many-to-one association to Exam
	@ManyToOne
	@JoinColumn(name = "id_exam_source")
	private Exam exam;

	// bi-directional many-to-one association to Exam
	@OneToMany(mappedBy = "exam", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Exam> exams;

	// bi-directional many-to-one association to Subject
	@ManyToOne
	@JoinColumn(name = "subject_id")
	@NotNull(message = "This exam's object can not be null")
	private Subject subject;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "create_by")
	private User user;

	// bi-directional many-to-one association to ExamQuestion
	@OneToMany(mappedBy = "exam", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<ExamQuestion> examQuestions;

	public Exam() {
	}

	public int getExamId() {
		return this.examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public double getMarkMax() {
		return this.markMax;
	}

	public void setMarkMax(double markMax) {
		this.markMax = markMax;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotes() {
		return this.notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Date getTestDatetimeBegin() {
		return testDatetimeBegin;
	}

	public void setTestDatetimeBegin(Date testDatetimeBegin) {
		this.testDatetimeBegin = testDatetimeBegin;
	}

	public List<AnswerSheet> getAnswerSheets() {
		return answerSheets;
	}

	public void setAnswerSheets(List<AnswerSheet> answerSheets) {
		this.answerSheets = answerSheets;
	}

	public int getTestMinute() {
		return this.testMinute;
	}

	public void setTestMinute(int testMinute) {
		this.testMinute = testMinute;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public List<AnswerSheet> getAnswersSheets() {
		return this.answerSheets;
	}

	public void setAnswersheets(List<AnswerSheet> answerSheets) {
		this.answerSheets = answerSheets;
	}

	public AnswerSheet addAnswerSheet(AnswerSheet answerSheet) {
		getAnswersSheets().add(answerSheet);
		answerSheet.setExam(this);

		return answerSheet;
	}

	public AnswerSheet removeAnswerSheet(AnswerSheet answerSheet) {
		getAnswersSheets().remove(answerSheet);
		answerSheet.setExam(null);

		return answerSheet;
	}

	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public List<Exam> getExams() {
		return this.exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}

	public Exam addExam(Exam exam) {
		getExams().add(exam);
		exam.setExam(this);

		return exam;
	}

	public Exam removeExam(Exam exam) {
		getExams().remove(exam);
		exam.setExam(null);

		return exam;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ExamQuestion> getExamQuestions() {
		return this.examQuestions;
	}

	public void setExamQuestions(List<ExamQuestion> examQuestions) {
		this.examQuestions = examQuestions;
	}

	public ExamQuestion addExamQuestion(ExamQuestion examQuestion) {
		getExamQuestions().add(examQuestion);
		examQuestion.setExam(this);

		return examQuestion;
	}

	public ExamQuestion removeExamQuestion(ExamQuestion examQuestion) {
		getExamQuestions().remove(examQuestion);
		examQuestion.setExam(null);

		return examQuestion;
	}

	public double getPassMark() {
		return passMark;
	}

	public void setPassMark(double passMark) {
		this.passMark = passMark;
	}

	public String getSpecificExam() {
		return specificExam;
	}

	public void setSpecificExam(String specificExam) {
		this.specificExam = specificExam;
	}

}