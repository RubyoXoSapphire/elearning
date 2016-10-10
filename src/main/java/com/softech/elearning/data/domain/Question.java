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

import org.springframework.stereotype.Component;

/**
 * The persistent class for the question database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q")
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "question_id")
	private int questionId;

	@Lob
	private String answer;

	@Lob
	private String content;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	private byte enabled;
	
	@Lob
	@Column(name="media_url")
	private String mediaUrl;

	@Column(name = "question_level")
	private String questionLevel;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date")
	private Date updateDate;

	// bi-directional many-to-one association to Answer
	@OneToMany(mappedBy = "question", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Answer> answers;

	// bi-directional many-to-one association to Answersheetdetail
	@OneToMany(mappedBy = "question", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<AnswerSheetDetail> answerSheetDetails;

	// bi-directional many-to-one association to ExamQuestion
	@OneToMany(mappedBy = "question", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<ExamQuestion> examQuestions;

	// bi-directional many-to-one association to Chapter
	@ManyToOne
	@JoinColumn(name = "chapter_id")
	private Chapter chapter;

	// bi-directional many-to-one association to Type
	@ManyToOne
	@JoinColumn(name = "type_id")
	private Type type;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "create_by")
	private User user;

	public Question() {
	}

	public int getQuestionId() {
		return this.questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getQuestionLevel() {
		return this.questionLevel;
	}

	public void setQuestionLevel(String questionLevel) {
		this.questionLevel = questionLevel;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getMediaUrl() {
		return mediaUrl;
	}

	public void setMediaUrl(String mediaUrl) {
		this.mediaUrl = mediaUrl;
	}

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Answer addAnswer(Answer answer) {
		getAnswers().add(answer);
		answer.setQuestion(this);

		return answer;
	}

	public Answer removeAnswer(Answer answer) {
		getAnswers().remove(answer);
		answer.setQuestion(null);

		return answer;
	}

	public List<AnswerSheetDetail> getAnswerSheetDetails() {
		return this.answerSheetDetails;
	}

	public void setAnswersheetdetails(List<AnswerSheetDetail> answerSheetDetails) {
		this.answerSheetDetails = answerSheetDetails;
	}

	public AnswerSheetDetail addAnswerSheetDetail(AnswerSheetDetail answerSheetDetail) {
		getAnswerSheetDetails().add(answerSheetDetail);
		answerSheetDetail.setQuestion(this);

		return answerSheetDetail;
	}

	public AnswerSheetDetail removeAnswersheetdetail(AnswerSheetDetail answerSheetDetail) {
		getAnswerSheetDetails().remove(answerSheetDetail);
		answerSheetDetail.setQuestion(null);

		return answerSheetDetail;
	}

	public List<ExamQuestion> getExamQuestions() {
		return this.examQuestions;
	}

	public void setExamQuestions(List<ExamQuestion> examQuestions) {
		this.examQuestions = examQuestions;
	}

	public ExamQuestion addExamQuestion(ExamQuestion examQuestion) {
		getExamQuestions().add(examQuestion);
		examQuestion.setQuestion(this);

		return examQuestion;
	}

	public ExamQuestion removeExamQuestion(ExamQuestion examQuestion) {
		getExamQuestions().remove(examQuestion);
		examQuestion.setQuestion(null);

		return examQuestion;
	}

	public Chapter getChapter() {
		return this.chapter;
	}

	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public Type getType() {
		return this.type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}