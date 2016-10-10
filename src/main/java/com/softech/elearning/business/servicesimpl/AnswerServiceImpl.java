package com.softech.elearning.business.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.AnswerService;
import com.softech.elearning.data.dao.AnswerDao;
import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.Question;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	AnswerDao answerDao;

	@Override
	public long count() {
		return answerDao.count();
	}

	@Override
	public void delete(Answer entity) {
		answerDao.delete(entity);
	}

	@Override
	public void delete(List<Answer> entities) {
		answerDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		answerDao.delete(id);
	}

	@Override
	public void deleteAll() {
		answerDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return answerDao.exists(id);
	}

	@Override
	public List<Answer> findAll() {
		return answerDao.findAll();
	}

	@Override
	public List<Answer> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return answerDao.findAll(pageable).getContent();
	}

	@Override
	public List<Answer> findAll(Sort sort) {
		return answerDao.findAll(sort);
	}

	@Override
	public Answer findOne(Integer id) {
		return answerDao.findOne(id);
	}

	@Override
	public Answer save(Answer entity) {
		return answerDao.save(entity);
	}

	@Override
	public List<Answer> findByQuestion(Question question) {
		return answerDao.findByQuestion(question);
	}

	@Override
	public boolean checkAnswerIsRight(Question question, Answer answer) {
		Answer answerTemp = answerDao.findByQuestionAndAnswerIdAndRight(question, answer.getAnswerId(), true);
		if (answerTemp != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkRightListAnswer(Question question, List<Answer> answerList) {
		List<Answer> list = answerDao.findByQuestionAndRight(question, true);
		int count = 0;
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < answerList.size(); j++) {
				if (list.get(i).getAnswerId() == answerList.get(j).getAnswerId()) {
					count++;
				}
			}
		}
		if (count == list.size()) {
			return true;
		}
		return false;
	}

	@Override
	public List<Answer> findRightAnswerListByQuestion(Question question) {
		List<Answer> list = answerDao.findByQuestionAndRight(question, true);
		return list;
	}
}