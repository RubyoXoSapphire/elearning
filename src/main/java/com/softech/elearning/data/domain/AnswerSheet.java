package com.softech.elearning.data.domain;

import java.io.Serializable;
import javax.persistence.*;

import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the answersheet database table.
 * 
 */
@Component
@Entity
@NamedQuery(name = "Answersheet.findAll", query = "SELECT a FROM AnswerSheet a")
public class AnswerSheet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "answerSheet_id")
	private int answerSheetId;

	private byte enabled;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "test_time_begin")
	private Date testTimeBegin;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_time")
	private Date updateTime;


	// bi-directional many-to-one association to Exam
	@ManyToOne
	@JoinColumn(name = "exam_id")
	private Exam exam;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "total_mark")
	private double totalMark = 0;

	// bi-directional many-to-one association to Answersheetdetail
	@OneToMany(mappedBy = "answerSheet", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<AnswerSheetDetail> answerSheetDetails;

	public AnswerSheet() {
	}

	public int getAnswerSheetId() {
		return this.answerSheetId;
	}

	public double getTotalMark() {
		return totalMark;
	}

	public void setTotalMark(double totalMark) {
		this.totalMark = totalMark;
	}

	public void setAnswerSheetId(int answerSheetId) {
		this.answerSheetId = answerSheetId;
	}

	public byte getEnabled() {
		return this.enabled;
	}

	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}

	public Date getTestTimeBegin() {
		return this.testTimeBegin;
	}

	public void setTestTimeBegin(Date testTimeBegin) {
		this.testTimeBegin = testTimeBegin;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<AnswerSheetDetail> getAnswerSheetDetails() {
		return this.answerSheetDetails;
	}

	public void setAnswerSheetDetails(List<AnswerSheetDetail> answerSheetDetails) {
		this.answerSheetDetails = answerSheetDetails;
	}

	public AnswerSheetDetail addAnswerSheetDetail(AnswerSheetDetail answerSheetDetails) {
		getAnswerSheetDetails().add(answerSheetDetails);
		answerSheetDetails.setAnswerSheet(this);

		return answerSheetDetails;
	}

	public AnswerSheetDetail removeAnswersheetdetail(AnswerSheetDetail answerSheetDetails) {
		getAnswerSheetDetails().remove(answerSheetDetails);
		answerSheetDetails.setAnswerSheet(null);

		return answerSheetDetails;
	}


}