package com.softech.elearning.business.servicesimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.QuestionService;
import com.softech.elearning.data.dao.ExamQuestionDao;
import com.softech.elearning.data.dao.QuestionDao;
import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.Question;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;

	@Autowired
	ExamQuestionDao examQuestionDao;

	@Override
	public long count() {
		return questionDao.count();
	}

	@Override
	public void delete(Question entity) {
		questionDao.delete(entity);
	}

	@Override
	public void delete(List<Question> entities) {
		questionDao.delete(entities);

	}

	@Override
	public void delete(Integer id) {
		questionDao.delete(id);
	}

	@Override
	public void deleteAll() {
		questionDao.deleteAll();
	}

	@Override
	public boolean exists(Integer id) {
		return questionDao.exists(id);
	}

	@Override
	public List<Question> findAll() {
		return questionDao.findAll();
	}

	@Override
	public Page<Question> findAll(int pageNumber, int pageSize, Sort sort) {
		Pageable pageable = new PageRequest(pageNumber, pageSize, sort);
		return questionDao.findAll(pageable);
	}

	@Override
	public List<Question> findAll(Sort sort) {
		return questionDao.findAll(sort);
	}

	@Override
	public Question findOne(Integer id) {
		return questionDao.findOne(id);
	}

	@Override
	public Question save(Question entity) {
		return questionDao.save(entity);
	}

	@Override
	public Page<Question> search(int pageNumber, int pageSize, String keyword) {
		PageRequest pageRequest = new PageRequest(pageNumber, pageSize, new Sort(Direction.DESC, "questionId"));
		return questionDao.findByContentLikeOrUser_FirstNameLikeAllIgnoreCase("%" + keyword + "%", "%" + keyword + "%",
				pageRequest);
	}

	@Override
	public List<Question> findQuestionByExam(Exam exam) {
		List<ExamQuestion> list = examQuestionDao.findByExam(exam);
		List<Question> questionList = new ArrayList<Question>();
		for (int i = 0; i < list.size(); i++) {
			ExamQuestion examQuestion = list.get(i);
			questionList.add(examQuestion.getQuestion());
		}
		return questionList;
	}
}