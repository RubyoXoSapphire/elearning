package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.AnswerSheetDetailService;
import com.softech.elearning.data.dao.AnswerSheetDetailDao;
import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.AnswerSheetDetail;
import com.softech.elearning.data.domain.Question;

@Service("answerSheetDetailService")
public class AnswerSheetDetailServiceImpl implements AnswerSheetDetailService {

	@Autowired
	AnswerSheetDetailDao answerSheetDetailDao;

	@Override
	public long count() {
		return answerSheetDetailDao.count();
	}

	@Override
	public void delete(AnswerSheetDetail entity) {
		answerSheetDetailDao.delete(entity);
	}

	@Override
	public void delete(List<AnswerSheetDetail> entities) {
		answerSheetDetailDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		answerSheetDetailDao.delete(id);
	}

	@Override
	public void deleteAll() {
		answerSheetDetailDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return answerSheetDetailDao.exists(id);
	}

	@Override
	public List<AnswerSheetDetail> findAll() {
		return answerSheetDetailDao.findAll();
	}

	@Override
	public List<AnswerSheetDetail> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return answerSheetDetailDao.findAll(pageable).getContent();
	}

	@Override
	public List<AnswerSheetDetail> findAll(Sort sort) {
		return answerSheetDetailDao.findAll(sort);
	}

	@Override
	public AnswerSheetDetail findOne(Integer id) {
		return answerSheetDetailDao.findOne(id);
	}

	@Override
	public AnswerSheetDetail save(AnswerSheetDetail entity) {
		return answerSheetDetailDao.save(entity);
	}

	public List<AnswerSheetDetail> findByQuestionAndAnswerSheet(Question question, AnswerSheet answerSheet) {
		return answerSheetDetailDao.findByQuestionAndAnswerSheet(question, answerSheet);
	}

	@Override
	public List<AnswerSheetDetail> findByAnswerSheet(AnswerSheet answerSheet) {
		return answerSheetDetailDao.findByAnswerSheet(answerSheet);
	}

	@Override
	public boolean checkIsSelected(Question question, Answer answer, AnswerSheet answerSheet) {
		if (answerSheetDetailDao.findByQuestionAndAnswerAndAnswerSheet(question, answer, answerSheet) == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public Integer countByAnswer(Answer answer) {
		return answerSheetDetailDao.countByAnswer(answer);
	}

	@Override
	public Integer countByQuestion(Question question) {
		return answerSheetDetailDao.countByQuestion(question);
	}
}