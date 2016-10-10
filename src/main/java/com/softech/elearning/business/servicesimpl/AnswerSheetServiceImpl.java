package com.softech.elearning.business.servicesimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.AnswerSheetService;
import com.softech.elearning.data.dao.AnswerSheetDao;
import com.softech.elearning.data.dao.AnswerSheetDetailDao;
import com.softech.elearning.data.dao.ExamDao;
import com.softech.elearning.data.dao.ExamQuestionDao;
import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.Exam;

@Service("answerSheetService")
public class AnswerSheetServiceImpl implements AnswerSheetService {

	@Autowired
	AnswerSheetDao answerSheetDao;

	@Autowired
	ExamQuestionDao examQuestionDao;

	@Autowired
	AnswerSheetDetailDao answerSheetDetailDao;

	@Autowired
	ExamDao examDao;

	@Override
	public long count() {
		return answerSheetDao.count();
	}

	@Override
	public void delete(AnswerSheet entity) {
		answerSheetDao.delete(entity);
	}

	@Override
	public void delete(List<AnswerSheet> entities) {
		answerSheetDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		answerSheetDao.delete(id);
	}

	@Override
	public void deleteAll() {
		answerSheetDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return answerSheetDao.exists(id);
	}

	@Override
	public List<AnswerSheet> findAll() {
		return answerSheetDao.findAll();
	}

	@Override
	public List<AnswerSheet> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return answerSheetDao.findAll(pageable).getContent();
	}

	@Override
	public List<AnswerSheet> findAll(Sort sort) {
		return answerSheetDao.findAll(sort);
	}

	@Override
	public AnswerSheet findOne(Integer id) {
		return answerSheetDao.findOne(id);
	}

	@Override
	public AnswerSheet save(AnswerSheet entity) {
		return answerSheetDao.save(entity);
	}

	@Override
	public List<AnswerSheet> findByExam(Exam exam) {
		List<AnswerSheet> answerSheetList = answerSheetDao.findByExam(exam);
		return answerSheetList;
	}

	@Override
	public AnswerSheet findAnswerSheetByUserAndExam(String userId, int examId) {
		AnswerSheet answerSheet = answerSheetDao.findByUserAndExam(userId, examId);
		return answerSheet;
	}

	@Override
	public Integer countAnswerSheetByExamId(int examId) {
		int count = answerSheetDao.countByExamExamId(examId);
		return count;
	}

	@Override
	public List<Integer> countAnswerSheetWithFullAnswerAndNotFullAnswerByExamId(int examId) {
		List<Integer> listAnswerSheetId = answerSheetDao.findAllAnswerSheetIdByExamId(examId);
		int countQuestion = examQuestionDao.countByExamExamId(examId);

		int fullAnswer = 0;
		int notFullAnswer = 0;
		for (int i = 0; i < listAnswerSheetId.size(); i++) {
			int countAnswer = answerSheetDetailDao.countByAnswerSheetAnswerSheetId(listAnswerSheetId.get(i));
			if (countAnswer == countQuestion) {
				fullAnswer++;
			} else {
				notFullAnswer++;
			}
		}
		List<Integer> listResult = new ArrayList<Integer>();
		listResult.add(fullAnswer);
		listResult.add(notFullAnswer);

		return listResult;
	}

	@Override
	public List<Integer> countPassAndFailAnswerSheetByExam(Exam exam) {
		int countAnswerSheet = answerSheetDao.countByExamExamId(exam.getExamId());
		int passAnswerSheet = answerSheetDao.countPassAnswerSheetByExamId(exam.getExamId(), exam.getPassMark());
		int failAnswerSheet = countAnswerSheet - passAnswerSheet;

		List<Integer> listResult = new ArrayList<Integer>();
		listResult.add(passAnswerSheet);
		listResult.add(failAnswerSheet);
		return listResult;
	}

	@Override
	public Double countAverageMarkByExam(Exam exam) {
		int countAnswerSheet = answerSheetDao.countByExamExamId(exam.getExamId());
		double totalMark = answerSheetDao.countTotalMarkByExamId(exam.getExamId());
		double averageMark = totalMark / countAnswerSheet;
		return averageMark;
	}
}