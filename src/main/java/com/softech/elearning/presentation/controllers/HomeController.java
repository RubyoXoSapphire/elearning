package com.softech.elearning.presentation.controllers;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.LineSeparator;
import com.softech.elearning.business.services.AnswerService;
import com.softech.elearning.business.services.AnswerSheetDetailService;
import com.softech.elearning.business.services.AnswerSheetService;
import com.softech.elearning.business.services.ChapterService;
import com.softech.elearning.business.services.ClassService;
import com.softech.elearning.business.services.ClassUserService;
import com.softech.elearning.business.services.ExamQuestionService;
import com.softech.elearning.business.services.ExamService;
import com.softech.elearning.business.services.QuestionService;
import com.softech.elearning.business.services.SemesterService;
import com.softech.elearning.business.services.SubjectService;
import com.softech.elearning.business.services.TypeService;
import com.softech.elearning.business.services.UserService;
import com.softech.elearning.business.servicesimpl.DateFormatValidate;
import com.softech.elearning.business.validate.ExamValidator;
import com.softech.elearning.data.domain.Answer;
import com.softech.elearning.data.domain.AnswerSheet;
import com.softech.elearning.data.domain.AnswerSheetDetail;
import com.softech.elearning.data.domain.Chapter;
import com.softech.elearning.data.domain.Exam;
import com.softech.elearning.data.domain.ExamQuestion;
import com.softech.elearning.data.domain.ExamQuestionPK;
import com.softech.elearning.data.domain.Question;
import com.softech.elearning.data.domain.Semester;
import com.softech.elearning.data.domain.Subject;
import com.softech.elearning.data.domain.Type;
import com.softech.elearning.data.domain.User;
import com.softech.elearning.presentation.dto.AnswerContentAndCountAnswered;
import com.softech.elearning.presentation.dto.AnswerModel;
import com.softech.elearning.presentation.dto.ClassListModel;
import com.softech.elearning.presentation.dto.ClassModel;
import com.softech.elearning.presentation.dto.ExamAndQuestionCountModel;
import com.softech.elearning.presentation.dto.MyUploadForm;
import com.softech.elearning.presentation.dto.QuestionAndFourAnswerModel;
import com.softech.elearning.presentation.dto.QuestionAndListAnswerModel;
import com.softech.elearning.presentation.dto.QuestionAndListAnswerModel2;
import com.softech.elearning.presentation.dto.QuestionContentAndAnswerContentModel;
import com.softech.elearning.presentation.dto.RegisterClassFormModel;
import com.softech.elearning.presentation.dto.Temp;
import com.softech.elearning.presentation.dto.TempListAnswerModel;
import com.softech.elearning.presentation.dto.UserAnswer;

@Controller
public class HomeController {

	DateFormatValidate dateFormat;

	@Autowired
	ExamValidator examValidator;

	@Autowired
	UserService userService;

	@Autowired
	ExamService examService;

	@Autowired
	QuestionService questionService;

	@Autowired
	ExamQuestionService examQuestionService;

	@Autowired
	AnswerSheetService answerSheetService;

	@Autowired
	AnswerSheetDetailService answerSheetDetailService;

	@Autowired
	ChapterService chapterService;

	@Autowired
	TypeService typeService;

	@Autowired
	SubjectService subjectService;

	@Autowired
	ClassService classService;

	@Autowired
	SemesterService semesterService;

	@Autowired
	AnswerService answerService;

	@Autowired
	ClassUserService classUserService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String redirectToHome(Locale locale, Model model) {
		return "homePage";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String redirectToHomePage(Locale locale, Model model) {
		return "homePage";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String redirectToDashboard(Model model) {

		return "dashboardPage";
	}

	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String redirectToAccount(Model model, Principal principal,
			@RequestParam(value = "message", required = false) String message) {
		String userId = principal.getName();
		User user = userService.findOne(userId);
		model.addAttribute("user", user);
		model.addAttribute("message", message);
		return "accountPage";
	}

	@RequestMapping(value = "/edit-account", method = RequestMethod.GET)
	public String redirectToEditAccount(Model model, Principal principal,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		String userId = principal.getName();
		User user = userService.findOne(userId);

		message = (String) model.asMap().get("message");

		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);
		model.addAttribute("user", user);
		return "editAccountPage";
	}

	@RequestMapping(value = "/edit-account", method = RequestMethod.POST)
	public String editAccount(Model model, @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
		User userTemp = userService.findOne(user.getUserId());
		user.setRole(userTemp.getRole());
		user.setEnabled(userTemp.getEnabled());
		user.setSex(userTemp.getSex());
		user.setPassword(userTemp.getPassword());

		user = userService.save(user);
		redirectAttributes.addAttribute("user", user);
		redirectAttributes.addAttribute("message", "Account saved");

		return "redirect:/edit-account";
	}

	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public String redirectToChangePassword(Model model, HttpSession session, Principal principal,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		model.addAttribute("hasError", hasError);
		model.addAttribute("message", message);
		return "changePasswordPage";
	}

	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public String changePassword(Model model, @RequestParam("password") String password,
			@RequestParam("newPassword") String newPassword,
			@RequestParam("repeatNewPassword") String repeatNewPassword, Principal principal, HttpSession session) {

		User user = userService.findOne(principal.getName());
		if (user.getPassword().equals(password)) {
			if (repeatNewPassword.equals(newPassword)) {
				user.setPassword(newPassword);
				userService.save(user);
				model.addAttribute("message", "Password changed.");
			} else {
				model.addAttribute("message", "New password and repeat password does not match. Please input again!");
				model.addAttribute("hasError", "true");
			}
		} else {
			model.addAttribute("message", "Wrong password.");
			model.addAttribute("hasError", "true");
		}

		return "changePasswordPage";
	}

	@RequestMapping(value = "/register-class", method = RequestMethod.GET)
	public String redirectToRegisterClass(Model model, Principal principal,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {

		String userId = principal.getName();
		User user = userService.findOne(userId);
		Semester currentSemester = semesterService.findCurrentSemester();

		if (currentSemester.getBeginDate().before(new Date())) {
			model.addAttribute("isValid", "false");
		} else {
			ClassModel classModel = null;
			List<com.softech.elearning.data.domain.Class> classList = classService.findClassBySemester(currentSemester);
			List<ClassModel> classModelList = new ArrayList<ClassModel>();
			RegisterClassFormModel registerFormModel = new RegisterClassFormModel();
			ClassListModel classListModel = new ClassListModel();
			for (int i = 0; i < classList.size(); i++) {
				classModel = new ClassModel();
				com.softech.elearning.data.domain.Class clazz = classList.get(i);
				classModel.setClazz(clazz);
				boolean selected = false;
				for (int j = 0; j < clazz.getUsers().size(); j++) {
					User userTemp = clazz.getUsers().get(j);
					if (userTemp.getUserId().equals(user.getUserId())) {
						selected = true;
					}
				}
				classModel.setFuck(selected);
				classModelList.add(classModel);
			}
			classListModel.setClazzList(classModelList);
			registerFormModel.setClassListModel(classListModel);

			model.addAttribute("registerFormModel", registerFormModel);
			model.addAttribute("classCount", classList.size());
		}
		model.addAttribute("currentSemester", currentSemester);
		model.addAttribute("message", message);

		return "registerClassPage";
	}

	@RequestMapping(value = "/register-class", method = RequestMethod.POST)
	public String redirectToRegisterClass(Model model, Principal principal,
			@ModelAttribute("registerFormModel") RegisterClassFormModel registerClassFormModel) {

		String userId = principal.getName();
		User user = userService.findOne(userId);

		ClassModel classModel = null;
		List<ClassModel> classModelList = registerClassFormModel.getClassListModel().getClazzList();

		String message = null;
		com.softech.elearning.data.domain.Class clazz = null;
		for (int i = 0; i < classModelList.size(); i++) {
			classModel = classModelList.get(i);
			boolean selected = classModel.getFuck();
			String classId = classModel.getClazz().getClassId();
			clazz = classService.findOne(classId);
			if (selected == true) {
				selected = false;
				for (int j = 0; j < clazz.getUsers().size(); j++) {
					User userTemp = clazz.getUsers().get(j);
					if (userTemp.getUserId().equals(user.getUserId())) {
						selected = true;
					}
				}
				if (selected == false && clazz.getUsers().size() < clazz.getNumberMax()) {
					clazz.getUsers().add(user);
				}
			} else {
				selected = classService.checkClassOfUser(user, clazz);
				if (selected == true) {
					for (int j = 0; j < clazz.getUsers().size(); j++) {
						if (user.getUserId().equals(clazz.getUsers().get(j).getUserId())) {
							clazz.getUsers().remove(j);
						}
					}
				}
			}
			classService.save(clazz);
		}

		message = "Register completed!";
		model.addAttribute("message", message);
		return "redirect:/register-class";
	}

	@RequestMapping(value = "/exam-warning", method = RequestMethod.GET)
	public String redirectToExamWarning(Model model,
			@RequestParam(value = "message", required = false) String message) {
		model.addAttribute("message", message);

		return "examWarningPage";
	}

	@RequestMapping(value = "/exams", method = RequestMethod.GET)
	public String redirectToExam(Model model, Principal principal,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		String userId = principal.getName();
		List<Exam> examList = examService.findExamByUserId(userId);
		List<ExamAndQuestionCountModel> list = new ArrayList<ExamAndQuestionCountModel>();

		for (int i = 0; i < examList.size(); i++) {
			Exam exam = examList.get(i);
			List<Question> questionList = questionService.findQuestionByExam(exam);
			ExamAndQuestionCountModel examAndQuestionCountModel = new ExamAndQuestionCountModel();
			examAndQuestionCountModel.setExam(exam);
			examAndQuestionCountModel.setCountQuestion(questionList.size() == 0 ? 0 : questionList.size());
			list.add(examAndQuestionCountModel);
		}
		model.addAttribute("list", list);
		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);
		return "examPage";
	}

	@RequestMapping(value = "/quizzes", method = RequestMethod.GET)
	public String redirectToQuiz(Model model, Principal principal,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		String userId = principal.getName();
		User user = userService.findOne(userId);

		List<Exam> examList = null;
		if (user.getRole().getName().equals("Role_Student")) {
			examList = examService.findAllQuiz();
		} else {
			examList = examService.findQuizByUserId(userId);
		}

		List<ExamAndQuestionCountModel> list = new ArrayList<ExamAndQuestionCountModel>();

		for (int i = 0; i < examList.size(); i++) {
			Exam exam = examList.get(i);
			List<Question> questionList = questionService.findQuestionByExam(exam);
			ExamAndQuestionCountModel examAndQuestionCountModel = new ExamAndQuestionCountModel();
			examAndQuestionCountModel.setExam(exam);
			examAndQuestionCountModel.setCountQuestion(questionList.size() == 0 ? 0 : questionList.size());
			list.add(examAndQuestionCountModel);
		}
		model.addAttribute("list", list);
		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "quizPage";
	}

	@RequestMapping(value = "/exam-detail/{examId}", method = RequestMethod.GET)
	public String redirectToExamDetail(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);
		int playersCount = answerSheetService.findByExam(exam).size();
		model.addAttribute("playersCount", playersCount);

		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "examDetailPage";
	}

	@RequestMapping(value = "/print-exam/{examId}", method = RequestMethod.GET)
	@ResponseBody
	public void redirectToExamPrint(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError, HttpServletRequest request)
			throws DocumentException, IOException {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		model.addAttribute("message", message);

		Document document = new Document();

		@SuppressWarnings("unused")
		PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(exam.getName() + ".pdf"));
		document.open();

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfWriter.getInstance(document, baos);

		document.open();
		Paragraph paragraph = new Paragraph();
		paragraph.add("Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam");
		paragraph.setIndentationLeft(80);
		paragraph.setIndentationRight(80);
		paragraph.setAlignment(Element.ALIGN_CENTER);

		Paragraph paragraph1 = new Paragraph();
		paragraph1.add("Độc Lập - Tự Do - Hạnh Phúc");
		paragraph1.setIndentationLeft(80);
		paragraph1.setIndentationRight(80);
		paragraph1.setAlignment(Element.ALIGN_CENTER);
		paragraph1.setSpacingAfter(30);

		Paragraph paragraph2 = new Paragraph();

		Font underlineFont = new Font(Font.TIMES_ROMAN, 20, Font.UNDERLINE);
		Chunk underlineChunk = new Chunk(exam.getName(), underlineFont);

		paragraph2.add(underlineChunk);
		paragraph2.setAlignment(Element.ALIGN_CENTER);

		Paragraph paragraph3 = new Paragraph();
		paragraph3.add("Name :................................................");
		paragraph3.setSpacingBefore(15);

		Paragraph paragraph4 = new Paragraph();
		String decription = exam.getNotes();
		if (decription.contains("<p>")) {
			decription = decription.substring(3, decription.length());
		}
		if (decription.contains("</p>")) {
			decription = decription.substring(0, decription.length() - 4);
		}
		paragraph4.add("Decription : " + decription);
		paragraph4.setAlignment(Element.ALIGN_LEFT);

		Paragraph paragraph5 = new Paragraph();
		paragraph5.add("Questions : " + questionList.size());
		paragraph5.setAlignment(Element.ALIGN_LEFT);

		Paragraph paragraph6 = new Paragraph();
		paragraph6.add("Test minute : " + exam.getTestMinute());
		paragraph6.setAlignment(Element.ALIGN_LEFT);
		paragraph6.setSpacingBefore(15);

		document.add(paragraph);
		document.add(paragraph1);
		document.add(paragraph2);
		document.add(paragraph3);
		document.add(paragraph4);
		document.add(paragraph5);
		document.add(paragraph6);
		document.add(new Chunk(new LineSeparator()));

		for (int i = 0; i < questionList.size(); i++) {
			Question question = questionList.get(i);
			Paragraph paragraphQuestion = new Paragraph();
			Font font = new Font(Font.TIMES_ROMAN, 15);

			String questionContent = question.getContent();
			if (questionContent.contains("<p>")) {
				questionContent = questionContent.substring(3, questionContent.length());
			}
			if (questionContent.contains("</p>")) {
				questionContent = questionContent.substring(0, questionContent.length() - 4);
			}
			Chunk chunk = new Chunk((i + 1) + ". " + questionContent, font);

			paragraphQuestion.add(chunk);
			document.add(paragraphQuestion);

			List<Answer> answerList = answerService.findByQuestion(question);

			Paragraph paragraphAnswer1 = new Paragraph();
			Font font2 = new Font(Font.TIMES_ROMAN, 15);
			Chunk chunk2 = new Chunk("A. " + answerList.get(0).getContent(), font2);
			paragraphAnswer1.add(chunk2);
			document.add(paragraphAnswer1);

			Paragraph paragraphAnswer2 = new Paragraph();
			Chunk chunk3 = new Chunk("B. " + answerList.get(1).getContent(), font2);
			paragraphAnswer2.add(chunk3);
			document.add(paragraphAnswer2);

			Paragraph paragraphAnswer3 = new Paragraph();
			Chunk chunk4 = new Chunk("C. " + answerList.get(2).getContent(), font2);
			paragraphAnswer3.add(chunk4);
			document.add(paragraphAnswer3);

			Paragraph paragraphAnswer4 = new Paragraph();
			Chunk chunk5 = new Chunk("D. " + answerList.get(3).getContent(), font2);
			paragraphAnswer4.add(chunk5);
			paragraphAnswer4.setSpacingAfter(15);
			document.add(paragraphAnswer4);

		}
		document.add(new Chunk(new LineSeparator()));
		Paragraph paragraphEnd = new Paragraph();
		paragraphEnd.add("End");
		paragraphEnd.setAlignment(Element.ALIGN_RIGHT);
		document.add(paragraphEnd);

		document.close();
	}

	@RequestMapping(value = "/results-stats/{examId}", method = RequestMethod.GET)
	public String redirectToExamStats(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		int allCountAnswerSheet = answerSheetService.countAnswerSheetByExamId(examId);
		model.addAttribute("allCountAnswerSheet", allCountAnswerSheet);

		List<Integer> listResult = answerSheetService.countAnswerSheetWithFullAnswerAndNotFullAnswerByExamId(examId);
		int countAnswerSheetWithFullAnswer = listResult.get(0);
		int countAnswerSheetWithNotFullAnswer = listResult.get(1);

		model.addAttribute("countAnswerSheetWithFullAnswer", countAnswerSheetWithFullAnswer);
		model.addAttribute("countAnswerSheetWithNotFullAnswer", countAnswerSheetWithNotFullAnswer);

		List<Integer> listResult2 = answerSheetService.countPassAndFailAnswerSheetByExam(exam);

		int countPassAnswerSheet = listResult2.get(0);
		int countFailAnswerSheet = listResult2.get(1);

		model.addAttribute("countPassAnswerSheet", countPassAnswerSheet);
		model.addAttribute("countFailAnswerSheet", countFailAnswerSheet);

		double averageMark = answerSheetService.countAverageMarkByExam(exam);
		model.addAttribute("averageMark", averageMark);

		List<Question> questionList = questionService.findQuestionByExam(exam);

		List<QuestionContentAndAnswerContentModel> listQuestionContentAndAnswerContent = new ArrayList<QuestionContentAndAnswerContentModel>();
		QuestionContentAndAnswerContentModel questionContentAndAnswerContentModel = null;
		for (int i = 0; i < questionList.size(); i++) {
			questionContentAndAnswerContentModel = new QuestionContentAndAnswerContentModel();

			Question question = questionList.get(i);
			questionContentAndAnswerContentModel.setQuestionContent(question.getContent());

			List<Answer> answerList = answerService.findByQuestion(question);

			List<AnswerContentAndCountAnswered> listAnswerContentAndCountAnswered = new ArrayList<AnswerContentAndCountAnswered>();
			AnswerContentAndCountAnswered answerContentAndCountAnswered = null;

			for (Answer answer : answerList) {
				answerContentAndCountAnswered = new AnswerContentAndCountAnswered();
				answerContentAndCountAnswered.setContent(answer.getContent());
				answerContentAndCountAnswered.setCount(answerSheetDetailService.countByAnswer(answer));

				listAnswerContentAndCountAnswered.add(answerContentAndCountAnswered);
			}
			questionContentAndAnswerContentModel
					.setAnswerContentAndCountAnsweredList(listAnswerContentAndCountAnswered);
			questionContentAndAnswerContentModel.setCountAnswered(answerSheetDetailService.countByQuestion(question));
			listQuestionContentAndAnswerContent.add(questionContentAndAnswerContentModel);
		}
		model.addAttribute("listQuestionContentAndAnswerContent", listQuestionContentAndAnswerContent);

		return "resultsStatsPage";
	}

	@RequestMapping(value = "/exam-fail-pass/{examId}", method = RequestMethod.GET)
	public String redirectToExamFailPass(Model model, @PathVariable("examId") int examId) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("examId", examId);
		model.addAttribute("passMark", exam.getPassMark());
		return "examFailPassPage";
	}

	@RequestMapping(value = "/exam-fail-pass/{examId}", method = RequestMethod.POST)
	public String setExamFailPass(Model model, @PathVariable("examId") int examId,
			@RequestParam("passMark") double passMark) {
		model.addAttribute("examId", examId);
		Exam exam = examService.findOne(examId);
		exam.setPassMark(passMark);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = formatter.format(new Date());
		try {
			exam.setUpdateDate(formatter.parse(today));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		examService.save(exam);

		return "redirect:/exam-detail/" + examId;
	}

	@RequestMapping(value = "/exam-layout-setting", method = RequestMethod.GET)
	public String redirectToExamLayoutSetting(Model model) {

		return "examLayoutSettingPage";
	}

	@RequestMapping(value = "/add-question/{examId}", method = RequestMethod.GET)
	public String redirectToAddQuestion(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		List<Chapter> chapterList = chapterService.findChapterBySubject(exam.getSubject());
		model.addAttribute("chapterList", chapterList);

		QuestionAndFourAnswerModel questionAndFourAnswerModel = new QuestionAndFourAnswerModel();
		questionAndFourAnswerModel.setQuestion(new Question());
		questionAndFourAnswerModel.setAnswer1(new Answer());
		questionAndFourAnswerModel.setAnswer2(new Answer());
		questionAndFourAnswerModel.setAnswer3(new Answer());
		questionAndFourAnswerModel.setAnswer4(new Answer());

		model.addAttribute("questionAndFourAnswerModel", questionAndFourAnswerModel);

		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "addQuestionPage";
	}

	@RequestMapping(value = "/add-question/{examId}", method = RequestMethod.POST)
	public String addQuestion(Model model, @PathVariable("examId") int examId,
			@ModelAttribute("questionAndFourAnswerModel") QuestionAndFourAnswerModel questionAndFourAnswerModel,
			ExamQuestion examQuestion, ExamQuestionPK examQuestionPK, @RequestParam("chapterId") int chapterId,
			@RequestParam("typeId") int typeId, @RequestParam("mark") double mark, Principal principal,
			RedirectAttributes redirectAttributes) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		Question question = questionAndFourAnswerModel.getQuestion();
		Chapter chapter = chapterService.findOne(chapterId);
		question.setChapter(chapter);

		String username = principal.getName();
		User user = userService.findOne(username);
		question.setUser(user);

		Type type = typeService.findOne(typeId);
		question.setType(type);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(createDate);

		question.setAnswers(new ArrayList<Answer>());

		question.getAnswers().add(questionAndFourAnswerModel.getAnswer1());
		questionAndFourAnswerModel.getAnswer1().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer2());
		questionAndFourAnswerModel.getAnswer2().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer3());
		questionAndFourAnswerModel.getAnswer3().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer4());
		questionAndFourAnswerModel.getAnswer4().setQuestion(question);

		question.setEnabled(Byte.parseByte("1"));

		questionService.save(question);

		examQuestionPK.setExamId(exam.getExamId());
		examQuestionPK.setQuestionId(question.getQuestionId());

		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(mark);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");

		return "redirect:/add-question/" + exam.getExamId();
	}

	@RequestMapping(value = "/edit-question/{examId}&{questionId}", method = RequestMethod.GET)
	public String redirectToEditQuestion(Model model, @PathVariable("questionId") int questionId,
			@PathVariable("examId") int examId, @RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		Question question = questionService.findOne(questionId);
		if (question.getType().getTypeId() == 2) {
			return "redirect:/edit-multichoice-question/{examId}&{questionId}";
		} else {
			List<Answer> answerList = answerService.findByQuestion(question);
			if (answerList.size() > 0) {
				question.setAnswers(answerList);
			} else {
				question.setAnswers(new ArrayList<Answer>());
			}
			Exam exam = examService.findOne(examId);

			List<Chapter> chapterList = chapterService.findChapterBySubject(question.getChapter().getSubject());
			model.addAttribute("chapterList", chapterList);

			ExamQuestion examQuestion = examQuestionService.findOne(exam, question);

			QuestionAndFourAnswerModel questionAndFourAnswerModel = new QuestionAndFourAnswerModel();
			questionAndFourAnswerModel.setQuestion(question);

			questionAndFourAnswerModel.setAnswer1(question.getAnswers().get(0));
			questionAndFourAnswerModel.setAnswer2(question.getAnswers().get(1));
			questionAndFourAnswerModel.setAnswer3(question.getAnswers().get(2));
			questionAndFourAnswerModel.setAnswer4(question.getAnswers().get(3));

			model.addAttribute("questionAndFourAnswerModel", questionAndFourAnswerModel);

			model.addAttribute("mark", examQuestion.getMark());

			model.addAttribute("message", message);
			model.addAttribute("hasError", hasError);

			model.addAttribute("exam", exam);

			model.addAttribute("question", question);

			return "editQuestionPage";
		}
	}

	@RequestMapping(value = "/edit-question/{examId}&{questionId}", method = RequestMethod.POST)
	public String editQuestion(Model model,
			@ModelAttribute("questionAndFourAnswerModel") QuestionAndFourAnswerModel questionAndFourAnswerModel,
			@PathVariable("questionId") int questionId, @PathVariable("examId") int examId,
			@RequestParam(value = "chapterId") String chapterId, @RequestParam(value = "mark") String mark,
			Principal principal, ExamQuestionPK examQuestionPK, ExamQuestion examQuestion,
			RedirectAttributes redirectAttributes) {

		int chapterIdTemp = Integer.parseInt(chapterId);
		double markTemp = Double.parseDouble(mark);

		Question question = questionAndFourAnswerModel.getQuestion();

		Question questionTemp = questionService.findOne(questionId);

		question.setQuestionId(questionId);
		Chapter chapter = chapterService.findOne(chapterIdTemp);
		question.setChapter(chapter);

		Type type = typeService.findOne(1);
		question.setType(type);

		String userId = principal.getName();
		User user = userService.findOne(userId);
		question.setUser(user);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date updateDate = null;
		try {
			String myUpdateDate = formatter.format(new Date());
			updateDate = formatter.parse(myUpdateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(questionTemp.getCreateDate());
		question.setUpdateDate(updateDate);

		List<Answer> answerList = new ArrayList<Answer>();
		question.setAnswers(answerList);

		question.getAnswers().add(questionAndFourAnswerModel.getAnswer1());
		questionAndFourAnswerModel.getAnswer1().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer2());
		questionAndFourAnswerModel.getAnswer2().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer3());
		questionAndFourAnswerModel.getAnswer3().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer4());
		questionAndFourAnswerModel.getAnswer4().setQuestion(question);

		question.setEnabled(Byte.parseByte("1"));

		questionService.save(question);

		examQuestionPK.setExamId(examId);
		examQuestionPK.setQuestionId(questionId);

		Exam exam = examService.findOne(examId);

		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(markTemp);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");

		return "redirect:/edit-question/" + examId + "&" + questionId;
	}

	@RequestMapping(value = "/delete-question", method = RequestMethod.POST)
	public String deleteQuestion(Model model, @RequestParam(value = "examIdAndQuestionId") String examIdAndQuestionId,
			Principal principal, ExamQuestionPK examQuestionPK, ExamQuestion examQuestion) {
		int examId = Integer.parseInt(examIdAndQuestionId.substring(0, examIdAndQuestionId.indexOf("&")));
		int questionId = Integer.parseInt(
				examIdAndQuestionId.substring(examIdAndQuestionId.indexOf("&") + 1, examIdAndQuestionId.length()));

		Exam exam = examService.findOne(examId);
		Question question = questionService.findOne(questionId);
		List<Question> questionList = questionService.findQuestionByExam(exam);

		boolean result = false;
		for (int i = 0; i < questionList.size(); i++) {
			Question questionTemp = questionList.get(i);
			if (questionTemp.getQuestionId() == question.getQuestionId()) {
				questionList.remove(questionTemp);
				examQuestion = examQuestionService.findOne(exam, question);
				examQuestionService.delete(examQuestion);

				result = true;
			}
		}
		String message = "";
		String hasError = "";
		if (result == true) {
			message = "Delete complete!";
		} else {
			message = "Delete fail!";
			hasError = "true";
		}

		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "redirect:/question-list/" + examId;
	}

	@RequestMapping(value = "/import-questions/{examId}", method = RequestMethod.GET)
	public String redirectToImportQuestion(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		model.addAttribute("message", message);
		model.addAttribute("myUploadForm", new MyUploadForm());
		return "importQuestionsPage";
	}

	@RequestMapping(value = "/import-questions/{examId}", method = RequestMethod.POST)
	public String importQuestion(Model model, @ModelAttribute("myUploadForm") MyUploadForm myUploadForm,
			@PathVariable("examId") int examId, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		Question question = null;
		Answer answer = null;
		ExamQuestion examQuestion = null;
		ExamQuestionPK examQuestionPK = null;
		Double mark = 0d;

		List<Question> questionList = new ArrayList<Question>();

		// Root Directory.
		String uploadRootPath = request.getServletContext().getRealPath("/resources/upload");
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);
		//
		// Create directory if it not exists.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		CommonsMultipartFile[] fileDatas = myUploadForm.getFileDatas();
		//
		List<File> uploadedFiles = new ArrayList<File>();
		for (CommonsMultipartFile fileData : fileDatas) {

			// Tên file gốc tại Client.
			String name = fileData.getOriginalFilename();
			System.out.println("Client File Name = " + name);

			if (name != null && name.length() > 0) {
				try {
					// Tạo file tại Server.
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

					// Luồng ghi dữ liệu vào file trên Server.
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					//
					uploadedFiles.add(serverFile);
					System.out.println("Write file: " + serverFile);

					POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(serverFile));
					HSSFWorkbook wb = new HSSFWorkbook(fs);
					HSSFSheet sheet = wb.getSheetAt(0);
					HSSFRow row;
					HSSFCell cell;

					int rows; // No of rows
					rows = sheet.getPhysicalNumberOfRows();

					int cols = 0; // No of columns
					int tmp = 0;

					// This trick ensures that we get the data properly even if
					// it doesn't start from first few rows
					for (int i = 0; i < 10 || i < rows; i++) {
						row = sheet.getRow(i);
						if (row != null) {
							tmp = sheet.getRow(i).getPhysicalNumberOfCells();
							if (tmp > cols)
								cols = tmp;
						}
					}

					for (int r = 1; r <= rows; r++) {
						row = sheet.getRow(r);
						if (row != null) {
							question = new Question();

							cell = row.getCell(0);
							if (cell != null) {
								String content = cell.getStringCellValue();
								question.setContent(content);
							}

							cell = row.getCell(1);
							if (cell != null) {
								Double chapterId = cell.getNumericCellValue();
								int test = chapterId.intValue();
								question.setChapter(chapterService.findOne(test));
							}

							cell = row.getCell(2);
							if (cell != null) {
								String level = cell.getStringCellValue();
								question.setQuestionLevel(level);
							}

							cell = row.getCell(3);
							if (cell != null) {
								mark = cell.getNumericCellValue();
								System.out.println(mark);
							}

							cell = row.getCell(4);
							if (cell != null) {
								String mediaUrl = cell.getStringCellValue();
								question.setMediaUrl(mediaUrl);
							}

							cell = row.getCell(5);
							if (cell != null) {
								Double typeId = cell.getNumericCellValue();
								int test = typeId.intValue();
								question.setType(typeService.findOne(test));
							}

							cell = row.getCell(6);
							if (cell != null) {
								String userId = cell.getStringCellValue();
								question.setUser(userService.findOne(userId));
							}

							cell = row.getCell(7);
							if (cell != null) {
								String answerTemp = cell.getStringCellValue();
								question.setAnswer(answerTemp);
							}

							question.setAnswers(new ArrayList<Answer>());

							for (int h = 8; h < 15; h++) {
								cell = row.getCell(h);
								if (cell != null) {
									answer = new Answer();
									answer.setQuestion(question);
									String answerContent = cell.getStringCellValue();
									answer.setContent(answerContent);
								}

								cell = row.getCell(++h);
								if (cell != null) {
									boolean right = cell.getBooleanCellValue();
									answer.setRight(right);
								}
								question.getAnswers().add(answer);
							}

							DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							Date createDate = null;
							try {
								String myCreateDate = formatter.format(new Date());
								createDate = formatter.parse(myCreateDate);
							} catch (ParseException e) {
								e.printStackTrace();
							}
							question.setCreateDate(createDate);

							question.setEnabled(Byte.parseByte("1"));

							questionService.save(question);

							examQuestionPK = new ExamQuestionPK();
							examQuestionPK.setExamId(exam.getExamId());
							examQuestionPK.setQuestionId(question.getQuestionId());

							examQuestion = new ExamQuestion();
							examQuestion.setExam(exam);
							examQuestion.setQuestion(question);
							examQuestion.setMark(mark);
							examQuestion.setId(examQuestionPK);

							examQuestionService.save(examQuestion);

							questionList.add(question);

						}
					}
					redirectAttributes.addFlashAttribute("message",
							"(" + questionList.size() + ") questions has been saved!");
					return "redirect:/question-list/" + exam.getExamId();
				} catch (Exception e) {
					System.out.println("Error Write file: " + name);
				}
			}
		}

		return "importQuestionsPage";
	}

	@RequestMapping(value = "/export-questions/{examId}", method = RequestMethod.GET)
	@ResponseBody
	public void redirectToExportQuestion(Model model, @PathVariable("examId") int examId, HttpServletResponse response)
			throws IOException {
		Exam exam = examService.findOne(examId);
		List<Question> questionList = questionService.findQuestionByExam(exam);
		ExamQuestion examQuestion = null;

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=" + exam.getName() + "_questions.xls");

		Workbook wb = new HSSFWorkbook();
		Sheet questionSheet = wb.createSheet("QuestionList");

		int row = 1;
		for (int i = 0; i < questionList.size(); i++) {
			Question question = questionList.get(i);
			examQuestion = examQuestionService.findOne(exam, question);
			List<Answer> answerList = answerService.findByQuestion(question);
			int collumn = 0;

			Row dataRow = questionSheet.createRow(row);

			Cell dataContentCell = dataRow.createCell(0);
			dataContentCell.setCellValue(question.getContent());

			Cell dataChapterIdCell = dataRow.createCell(1);
			dataChapterIdCell.setCellValue(question.getChapter().getChapterId());

			Cell dataLevelCell = dataRow.createCell(2);
			dataLevelCell.setCellValue(question.getQuestionLevel());

			Cell dataMarkCell = dataRow.createCell(3);
			dataMarkCell.setCellValue(examQuestion.getMark());

			Cell dataMediaUrlCell = dataRow.createCell(4);
			dataMediaUrlCell.setCellValue(question.getMediaUrl());

			Cell dataTypeCell = dataRow.createCell(5);
			dataTypeCell.setCellValue(question.getType().getTypeId());

			Cell dataUserIdCell = dataRow.createCell(6);
			dataUserIdCell.setCellValue(question.getUser().getUserId());

			Cell dataAnswerCell = dataRow.createCell(7);
			dataAnswerCell.setCellValue(question.getAnswer());

			collumn = 7;

			for (int j = 0; j < answerList.size(); j++) {
				collumn++;
				Cell dataAnswer1Cell = dataRow.createCell(collumn);
				dataAnswer1Cell.setCellValue(answerList.get(j).getContent());

				collumn++;
				Cell dataRightCell = dataRow.createCell(collumn);
				dataRightCell.setCellValue(answerList.get(j).getRight());
			}

			collumn++;

			Cell dataExplanationCell = dataRow.createCell(collumn);
			dataExplanationCell.setCellValue(question.getAnswer());

			row++;
		}

		// write it as an excel attachment
		ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
		wb.write(outByteStream);
		byte[] outArray = outByteStream.toByteArray();
		OutputStream outStream = response.getOutputStream();
		outStream.write(outArray);
		outStream.flush();
	}

	@RequestMapping(value = "/add-multichoice-question/{examId}", method = RequestMethod.GET)
	public String redirectToAddMultichoiceQuestion(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {

		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		List<Chapter> chapterList = chapterService.findChapterBySubject(exam.getSubject());
		model.addAttribute("chapterList", chapterList);

		QuestionAndFourAnswerModel questionAndFourAnswerModel = new QuestionAndFourAnswerModel();
		questionAndFourAnswerModel.setQuestion(new Question());
		questionAndFourAnswerModel.setAnswer1(new Answer());
		questionAndFourAnswerModel.setAnswer2(new Answer());
		questionAndFourAnswerModel.setAnswer3(new Answer());
		questionAndFourAnswerModel.setAnswer4(new Answer());

		model.addAttribute("questionAndFourAnswerModel", questionAndFourAnswerModel);

		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "addMultichoiceQuestionPage";
	}

	@RequestMapping(value = "/add-multichoice-question/{examId}", method = RequestMethod.POST)
	public String addMultichoiceQuestion(Model model, @PathVariable("examId") int examId,
			@ModelAttribute("questionAndFourAnswerModel") QuestionAndFourAnswerModel questionAndFourAnswerModel,
			ExamQuestion examQuestion, ExamQuestionPK examQuestionPK, @RequestParam("chapterId") int chapterId,
			@RequestParam("typeId") int typeId, @RequestParam("mark") double mark, Principal principal,
			RedirectAttributes redirectAttributes) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		Question question = questionAndFourAnswerModel.getQuestion();
		Chapter chapter = chapterService.findOne(chapterId);
		question.setChapter(chapter);

		if (question.getMediaUrl().contains("watch?v=") == true) {
			String mediaUrl = question.getMediaUrl().substring(32, question.getMediaUrl().length());
			mediaUrl = " https://www.youtube.com/embed/" + mediaUrl;
			question.setMediaUrl(mediaUrl);
		}

		String username = principal.getName();
		User user = userService.findOne(username);
		question.setUser(user);

		Type type = typeService.findOne(typeId);
		question.setType(type);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(createDate);

		question.setAnswers(new ArrayList<Answer>());

		question.getAnswers().add(questionAndFourAnswerModel.getAnswer1());
		questionAndFourAnswerModel.getAnswer1().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer2());
		questionAndFourAnswerModel.getAnswer2().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer3());
		questionAndFourAnswerModel.getAnswer3().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer4());
		questionAndFourAnswerModel.getAnswer4().setQuestion(question);

		question.setEnabled(Byte.parseByte("1"));

		questionService.save(question);

		examQuestionPK.setExamId(exam.getExamId());
		examQuestionPK.setQuestionId(question.getQuestionId());

		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(mark);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");

		return "redirect:/add-multichoice-question/" + exam.getExamId();
	}

	@RequestMapping(value = "/edit-multichoice-question/{examId}&{questionId}", method = RequestMethod.GET)
	public String redirectToEditMultichoiceQuestion(Model model,
			@RequestParam(value = "message", required = false) String message,
			@PathVariable("questionId") int questionId, @PathVariable("examId") int examId) {

		Question question = questionService.findOne(questionId);
		Exam exam = examService.findOne(examId);
		ExamQuestion examQuestion = examQuestionService.findOne(exam, question);

		List<Chapter> chapterList = chapterService.findChapterBySubject(question.getChapter().getSubject());
		model.addAttribute("chapterList", chapterList);

		QuestionAndFourAnswerModel questionAndFourAnswerModel = new QuestionAndFourAnswerModel();
		questionAndFourAnswerModel.setQuestion(question);

		List<Answer> answerList = answerService.findByQuestion(question);

		questionAndFourAnswerModel.setAnswer1(answerList.get(0));
		questionAndFourAnswerModel.setAnswer2(answerList.get(1));
		questionAndFourAnswerModel.setAnswer3(answerList.get(2));
		questionAndFourAnswerModel.setAnswer4(answerList.get(3));

		model.addAttribute("questionAndFourAnswerModel", questionAndFourAnswerModel);

		model.addAttribute("message", message);
		model.addAttribute("mark", examQuestion.getMark());
		model.addAttribute("exam", exam);
		return "editMultichoiceQuestionPage";
	}

	@RequestMapping(value = "/edit-multichoice-question/{examId}", method = RequestMethod.POST)
	public String addMultichoiceQuestion(Model model,
			@ModelAttribute("questionAndFourAnswerModel") QuestionAndFourAnswerModel questionAndFourAnswerModel,
			@RequestParam("chapterId") int chapterId, @RequestParam("typeId") int typeId,
			@PathVariable("examId") int examId, @RequestParam("mark") double mark, Principal principal,
			RedirectAttributes redirectAttributes) {

		Question question = questionAndFourAnswerModel.getQuestion();
		Chapter chapter = chapterService.findOne(chapterId);
		Exam exam = examService.findOne(examId);
		question.setChapter(chapter);

		if (question.getMediaUrl().contains("watch?v=") == true) {
			String mediaUrl = question.getMediaUrl().substring(32, question.getMediaUrl().length());
			mediaUrl = " https://www.youtube.com/embed/" + mediaUrl;
			question.setMediaUrl(mediaUrl);
		}

		String username = principal.getName();
		User user = userService.findOne(username);
		question.setUser(user);

		Type type = typeService.findOne(typeId);
		question.setType(type);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(createDate);

		question.setAnswers(answerService.findByQuestion(question));

		question.getAnswers().set(0, questionAndFourAnswerModel.getAnswer1());
		questionAndFourAnswerModel.getAnswer1().setQuestion(question);
		question.getAnswers().set(1, questionAndFourAnswerModel.getAnswer2());
		questionAndFourAnswerModel.getAnswer2().setQuestion(question);
		question.getAnswers().set(2, questionAndFourAnswerModel.getAnswer3());
		questionAndFourAnswerModel.getAnswer3().setQuestion(question);
		question.getAnswers().set(3, questionAndFourAnswerModel.getAnswer4());
		questionAndFourAnswerModel.getAnswer4().setQuestion(question);

		question.setEnabled(Byte.parseByte("1"));

		question = questionService.save(question);

		ExamQuestionPK examQuestionPK = new ExamQuestionPK();
		examQuestionPK.setExamId(exam.getExamId());
		examQuestionPK.setQuestionId(question.getQuestionId());

		ExamQuestion examQuestion = new ExamQuestion();
		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(mark);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");
		model.addAttribute("exam", exam);

		return "redirect:/edit-multichoice-question/" + exam.getExamId() + "&" + question.getQuestionId();
	}

	@RequestMapping(value = "/add-media-question/{examId}", method = RequestMethod.GET)
	public String redirectToAddQuestionMedia(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message) {

		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		List<Chapter> chapterList = chapterService.findChapterBySubject(exam.getSubject());
		model.addAttribute("chapterList", chapterList);

		QuestionAndFourAnswerModel questionAndFourAnswerModel = new QuestionAndFourAnswerModel();
		questionAndFourAnswerModel.setQuestion(new Question());
		questionAndFourAnswerModel.setAnswer1(new Answer());
		questionAndFourAnswerModel.setAnswer2(new Answer());
		questionAndFourAnswerModel.setAnswer3(new Answer());
		questionAndFourAnswerModel.setAnswer4(new Answer());

		model.addAttribute("questionAndFourAnswerModel", questionAndFourAnswerModel);

		model.addAttribute("message", message);
		return "addMediaQuestionPage";
	}

	@RequestMapping(value = "/add-media-question/{examId}", method = RequestMethod.POST)
	public String addMediaQuestion(Model model, @PathVariable("examId") int examId,
			@ModelAttribute("questionAndFourAnswerModel") QuestionAndFourAnswerModel questionAndFourAnswerModel,
			ExamQuestion examQuestion, ExamQuestionPK examQuestionPK, @RequestParam("chapterId") int chapterId,
			@RequestParam("typeId") int typeId, @RequestParam("mark") double mark, Principal principal,
			RedirectAttributes redirectAttributes) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		Question question = questionAndFourAnswerModel.getQuestion();
		Chapter chapter = chapterService.findOne(chapterId);
		question.setChapter(chapter);

		String username = principal.getName();
		User user = userService.findOne(username);
		question.setUser(user);

		Type type = typeService.findOne(typeId);
		question.setType(type);

		if (question.getMediaUrl().contains("watch?v=") == true) {
			String mediaUrl = question.getMediaUrl().substring(32, question.getMediaUrl().length());
			mediaUrl = " https://www.youtube.com/embed/" + mediaUrl;
			question.setMediaUrl(mediaUrl);
		}

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(createDate);

		question.setAnswers(new ArrayList<Answer>());

		question.getAnswers().add(questionAndFourAnswerModel.getAnswer1());
		questionAndFourAnswerModel.getAnswer1().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer2());
		questionAndFourAnswerModel.getAnswer2().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer3());
		questionAndFourAnswerModel.getAnswer3().setQuestion(question);
		question.getAnswers().add(questionAndFourAnswerModel.getAnswer4());
		questionAndFourAnswerModel.getAnswer4().setQuestion(question);

		question.setEnabled(Byte.parseByte("1"));

		questionService.save(question);

		examQuestionPK.setExamId(exam.getExamId());
		examQuestionPK.setQuestionId(question.getQuestionId());

		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(mark);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");

		return "redirect:/add-media-question/" + exam.getExamId();
	}

	@RequestMapping(value = "/add-question-free-text/{examId}", method = RequestMethod.GET)
	public String redirectToAddQuestionFreeText(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message) {

		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		List<Chapter> chapterList = chapterService.findChapterBySubject(exam.getSubject());
		model.addAttribute("chapterList", chapterList);

		model.addAttribute("question", new Question());

		model.addAttribute("message", message);
		return "addQuestionFreeTextPage";
	}

	@RequestMapping(value = "/add-free-text-question/{examId}", method = RequestMethod.POST)
	public String addQuestionFreeText(Model model, @PathVariable("examId") int examId,
			@ModelAttribute("question") Question question, ExamQuestion examQuestion, ExamQuestionPK examQuestionPK,
			@RequestParam("chapterId") int chapterId, @RequestParam("typeId") int typeId,
			@RequestParam("mark") double mark, Principal principal, RedirectAttributes redirectAttributes) {

		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		int questionCount = questionList.size();
		model.addAttribute("questionCount", questionCount);

		Chapter chapter = chapterService.findOne(chapterId);
		question.setChapter(chapter);

		String username = principal.getName();
		User user = userService.findOne(username);
		question.setUser(user);

		if (question.getMediaUrl().contains("watch?v=") == true) {
			String mediaUrl = question.getMediaUrl().substring(32, question.getMediaUrl().length());
			mediaUrl = " https://www.youtube.com/embed/" + mediaUrl;
			question.setMediaUrl(mediaUrl);
		}

		Type type = typeService.findOne(typeId);
		question.setType(type);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		question.setCreateDate(createDate);

		question.setEnabled(Byte.parseByte("1"));

		questionService.save(question);

		examQuestionPK.setExamId(exam.getExamId());
		examQuestionPK.setQuestionId(question.getQuestionId());

		examQuestion.setExam(exam);
		examQuestion.setQuestion(question);
		examQuestion.setMark(mark);
		examQuestion.setId(examQuestionPK);

		examQuestionService.save(examQuestion);

		redirectAttributes.addAttribute("message", "Question saved.");
		return "redirect:/add-question-free-text/" + exam.getExamId();
	}

	@RequestMapping(value = "/question-list/{examId}", method = RequestMethod.GET)
	public String redirectToQuestionList(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		List<Question> questionList = questionService.findQuestionByExam(exam);
		model.addAttribute("questionList", questionList);

		message = (String) model.asMap().get("message");

		model.addAttribute("questionCount", questionList.size());
		model.addAttribute("message", message);

		return "questionListPage";
	}

	@RequestMapping(value = "/simple-exam", method = RequestMethod.POST)
	public String addExam(Model model, Exam exam, @RequestParam("examName") String examName) {
		model.addAttribute("examName", examName);
		return "redirect:/add-exam";
	}

	@RequestMapping(value = "/add-exam", method = RequestMethod.GET)
	public String redirectToAddExam(Model model, @RequestParam("examName") String examName,
			@RequestParam(value = "message", required = false) String message) {

		List<Subject> subjectList = subjectService.findAll();
		model.addAttribute("subjectList", subjectList);

		model.addAttribute("examName", examName);
		Exam exam = (Exam) model.asMap().get("exam");
		model.addAttribute(BindingResult.MODEL_KEY_PREFIX + "exam", model.asMap().get("errors"));

		if (exam == null) {
			model.addAttribute("exam", new Exam());
		} else {
			model.addAttribute("exam", exam);
		}

		message = (String) model.asMap().get("message");
		model.addAttribute("message", message);

		return "addExamPage";
	}

	@RequestMapping(value = "/add-exam", method = RequestMethod.POST)
	public String addExam(Model model, @ModelAttribute("exam") @Valid Exam exam, BindingResult bindingResult,
			@RequestParam(value = "subjectId", required = false) String subjectId, Principal principal,
			RedirectAttributes redirectAttributes) {
		examValidator.validate(exam, bindingResult);
		if (bindingResult.hasErrors()) {
			String message = "Your form is not valid. Please check and input again!";
			String hasError = "true";

			redirectAttributes.addFlashAttribute("message", message);
			redirectAttributes.addFlashAttribute("hasError", hasError);
			redirectAttributes.addFlashAttribute("exam", exam);
			redirectAttributes.addFlashAttribute("errors", bindingResult);
			return "redirect:/add-exam?examName=" + exam.getName();
		} else {
			String userId = principal.getName();
			User user = userService.findOne(userId);
			exam.setUser(user);

			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date createDate = null;
			try {
				String myCreateDate = formatter.format(new Date());
				createDate = formatter.parse(myCreateDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			double totalMark = 0;
			List<Double> markList = examService.getTotalMarkByExam(exam);
			for (int i = 0; i < markList.size(); i++) {
				totalMark += markList.get(i);
			}

			if (totalMark % 2 == 0) {
				exam.setPassMark(totalMark / 2);
			} else {
				exam.setPassMark((totalMark + 1) / 2);
			}
			exam.setCreateDate(createDate);

			exam = examService.save(exam);

			redirectAttributes.addFlashAttribute("message", "Exam has been saved!");
			return "redirect:/exam-detail/" + exam.getExamId();
		}
	}

	@RequestMapping(value = "/delete-exam", method = RequestMethod.POST)
	public String deleteExam(Model model, @RequestParam("examId") int examId, Principal principal,
			RedirectAttributes redirectAttributes) {

		String message = null;
		String hasError = null;
		Exam exam = examService.findOne(examId);
		if (exam != null) {
			List<AnswerSheet> list = answerSheetService.findByExam(exam);
			if (list.size() == 0) {
				examService.delete(exam);
				message = "Delete complete!";
			} else {
				message = "This exam is being used, so that you cant delete it!";
				hasError = "true";
			}
		}
		redirectAttributes.addAttribute("message", message);
		redirectAttributes.addAttribute("hasError", hasError);
		return "redirect:/exams";
	}

	@RequestMapping(value = "/exam-setting/{examId}", method = RequestMethod.GET)
	public String redirectToExamSetting(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "message", required = false) String message,
			@RequestParam(value = "hasError", required = false) String hasError) {
		Exam exam = null;

		exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		model.addAttribute(BindingResult.MODEL_KEY_PREFIX + "exam", model.asMap().get("errors"));

		List<Subject> subjectList = subjectService.findAll();
		model.addAttribute("subjectList", subjectList);

		message = (String) model.asMap().get("message");
		hasError = (String) model.asMap().get("hasError");

		Double totalMark = 0d;
		List<Double> markList = examService.getTotalMarkByExam(exam);
		for (Double mark : markList) {
			totalMark += mark;
		}
		model.addAttribute("totalMark", totalMark);
		model.addAttribute("message", message);
		model.addAttribute("hasError", hasError);

		return "examSettingPage";
	}

	@RequestMapping(value = "/exam-setting/{examId}", method = RequestMethod.POST)
	public String saveQuestionSetting(Model model, @PathVariable("examId") int examId,
			@RequestParam(value = "examSourceId", required = false) String examSourceId,
			@ModelAttribute("exam") @Valid Exam exam, BindingResult bindingResult, Principal principal,
			RedirectAttributes redirectAttributes) {

		examValidator.validate(exam, bindingResult);
		if (bindingResult.hasErrors()) {
			String message = "Your form is not valid. Please check and input again!";
			redirectAttributes.addFlashAttribute("message", message);
			redirectAttributes.addFlashAttribute("errors", bindingResult);
			return "redirect:/exam-setting/" + examId;
		} else {
			if (exam.getEnabled() == 2) {
				redirectAttributes.addFlashAttribute("message",
						"This exam is chosen to be an official exam. So that you cant change this exam's information anymore!");
				redirectAttributes.addFlashAttribute("hasError", "true");
			} else {
				if (examSourceId != null) {
					int newExamSourceId = Integer.parseInt(examSourceId);
					Exam examSource = examService.findOne(newExamSourceId);
					exam.setExam(examSource);
				}

				User user = userService.findOne(principal.getName());
				exam.setUser(user);

				DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String today = formatter.format(new Date());
				try {
					exam.setUpdateDate(formatter.parse(today));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				exam = examService.save(exam);
				model.addAttribute("exam", exam);
				redirectAttributes.addFlashAttribute("message", "Exam setting saved.");
			}
			return "redirect:/exam-setting/" + exam.getExamId();
		}
	}

	@RequestMapping(value = "/start-exam/{examId}", method = RequestMethod.GET)
	public String redirectToStartExam(Model model, @PathVariable("examId") int examId) {
		Exam exam = examService.findOne(examId);
		model.addAttribute("exam", exam);

		return "startExamPage";
	}

	@RequestMapping(value = "/all-question/{examId}", method = RequestMethod.GET)
	public String redirectExamPage(Model model, @PathVariable("examId") int examId, HttpSession session,
			AnswerSheet answerSheet, Principal principal) {
		User user = userService.findOne(principal.getName());
		Exam exam = examService.findOne(examId);

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date createDate = null;
		try {
			String myCreateDate = formatter.format(new Date());
			createDate = formatter.parse(myCreateDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		answerSheet.setUser(user);
		answerSheet.setExam(exam);
		answerSheet.setTestTimeBegin(createDate);
		answerSheet.setEnabled(new Byte("0"));
		answerSheet.setAnswerSheetDetails(new ArrayList<AnswerSheetDetail>());
		answerSheetService.save(answerSheet);

		List<QuestionAndListAnswerModel2> questionAndListAnswerModelList = new ArrayList<QuestionAndListAnswerModel2>();
		List<Question> questionList = questionService.findQuestionByExam(exam);

		QuestionAndListAnswerModel2 questionAndListAnswerModel = null;
		for (Question question : questionList) {
			questionAndListAnswerModel = new QuestionAndListAnswerModel2();
			questionAndListAnswerModel.setListAnswer(new TempListAnswerModel(new ArrayList<AnswerModel>()));
			questionAndListAnswerModel.setQuestion(question);

			List<Answer> answerList = answerService.findByQuestion(question);
			for (int j = 0; j < answerList.size(); j++) {
				AnswerModel answerModel = new AnswerModel();
				answerModel.setAnswer(answerList.get(j));
				answerModel.setFuck(1);

				questionAndListAnswerModel.getListAnswer().getAnswerModelList().add(answerModel);
			}
			questionAndListAnswerModelList.add(questionAndListAnswerModel);
		}
		model.addAttribute("questionAndListAnswerModelList", questionAndListAnswerModelList);
		Temp temp = new Temp();
		temp.setQuestionAndListAnswerModelList(questionAndListAnswerModelList);

		model.addAttribute("temp", temp);
		model.addAttribute("testMinute", exam.getTestMinute());
		session.setAttribute("examId", examId);
		session.setAttribute("answerSheet", answerSheet);
		return "allQuestionPage";
	}

	@RequestMapping(value = "/loading/{examId}", method = RequestMethod.GET)
	public String redirectToLoading(Model model, @PathVariable("examId") int examId, Principal principal,
			HttpSession session, AnswerSheet answerSheet, RedirectAttributes redirectAttributes) throws ParseException {

		Exam exam = examService.findOne(examId);

		String specificExam = exam.getSpecificExam();
		if (specificExam.equals("Quiz")) {
			List<ExamQuestion> examQuestionList = examQuestionService.findByExam(exam);

			// Start random and remove that answer from the list
			int size = examQuestionList.size();
			int index = new Random().nextInt(size);

			ExamQuestion examQuestion = examQuestionList.get(index);
			Question question = examQuestion.getQuestion();

			model.addAttribute("questionId", question.getQuestionId());
			examQuestionList.remove(examQuestion);

			// model này dùng làm modelattribute, chứa câu hỏi và list câu trả
			// lời đưa ra để người dùng tương tác
			session.setAttribute("userAnswerList", new ArrayList<UserAnswer>());

			// model này dùng để tính tổng số lượng câu hỏi của exam
			session.setAttribute("examQuestionList", examQuestionList);
			// model này dùng để xác định index câu hỏi của exam
			session.setAttribute("countIndex", 0);
			session.setAttribute("examId", examId);
			// model này dùng để xác định đếm giây của câu hỏi
			session.setAttribute("timeleft", 30);
			model.addAttribute("examId", examId);
			return "loadingQuizPage";
		} else {
			User user = userService.findOne(principal.getName());
			if (user.getRole().getName().equals("Role_Student") == true
					&& answerSheetService.findAnswerSheetByUserAndExam(principal.getName(), examId) != null) {
				redirectAttributes.addAttribute("message", "You are already done this exam");
				return "redirect:/exam-warning";
			} else if (user.getRole().getName().equals("Role_Student") == true
					&& answerSheetService.findAnswerSheetByUserAndExam(principal.getName(), examId) == null) {
				Calendar cal = Calendar.getInstance();
				long t = cal.getTimeInMillis();
				cal.add(Calendar.MINUTE, -10);
				Date currentDateDecreaseTenMins = new Date(t - (10 * 60000));
				Date currentDate = new Date();
				System.out.println("time :" + currentDate);

				if (currentDateDecreaseTenMins.after(exam.getTestDatetimeBegin())
						|| currentDate.before(exam.getTestDatetimeBegin())) {
					redirectAttributes.addAttribute("message", "This is not a right time to do this exam");
					redirectAttributes.addAttribute("hasError", "true");
					return "redirect:/exam-warning";
				} else {
					model.addAttribute("specificExam", "Exam");
					model.addAttribute("examId", examId);
				}

			} else {
				if (exam.getEnabled() == 2) {
					redirectAttributes.addAttribute("message", "You can not touch this exam anymore");
					redirectAttributes.addAttribute("hasError", "true");
					return "redirect:/exam-warning";
				} else {
					model.addAttribute("specificExam", "Exam");
					model.addAttribute("examId", examId);

					return "loadingQuizPage";
				}
			}
			return "";
		}
	}

	@RequestMapping(value = "/exam-result", method = RequestMethod.GET)
	public String redirectToQuizResult(Model model, Principal principal, HttpSession session, AnswerSheet answerSheet) {

		int examId = (Integer) session.getAttribute("examId");
		Exam exam = examService.findOne(examId);

		double totalMark = 0;
		int countAnswerRight = 0;

		String userId = principal.getName();
		User user = userService.findOne(userId);

		List<UserAnswer> userAnswerList = (ArrayList<UserAnswer>) session.getAttribute("userAnswerList");
		answerSheet.setAnswerSheetDetails(new ArrayList<AnswerSheetDetail>());

		// Kiểm tra list UserAnswer bao gồm 1 id câu hỏi và 1 list id câu
		// trả
		// lời, xong tính điểm
		for (UserAnswer userAnswer : userAnswerList) {
			Question question = questionService.findOne(userAnswer.getQuestionId());
			List<Integer> answerIdList = userAnswer.getAnswerIdList();

			for (Integer answerId : answerIdList) {
				Answer answer = answerService.findOne(answerId);
				AnswerSheetDetail answerSheetDetail = new AnswerSheetDetail();
				answerSheetDetail.setAnswer(answer);
				answerSheetDetail.setQuestion(question);
				answerSheetDetail.setAnswerSheet(answerSheet);
				answerSheet.getAnswerSheetDetails().add(answerSheetDetail);
			}
		}

		answerSheet.setEnabled(new Byte("1"));
		answerSheet.setExam(exam);
		answerSheet.setUser(user);
		answerSheet.setTestTimeBegin(exam.getTestDatetimeBegin());

		answerSheet = answerSheetService.save(answerSheet);

		List<Question> questionList = questionService.findQuestionByExam(answerSheet.getExam());
		for (int i = 0; i < questionList.size(); i++) {
			Question question = questionList.get(i);

			// Những câu trả lời của người dùng theo câu hỏi
			List<AnswerSheetDetail> list = answerSheetDetailService.findByQuestionAndAnswerSheet(question, answerSheet);

			List<Answer> answerList = new ArrayList<Answer>();
			for (AnswerSheetDetail answerSheetDetail : list) {
				answerList.add(answerSheetDetail.getAnswer());
			}

			// Kiểm tra những câu trả lời của người dùng với những câu trả
			// lời
			// đúng
			if ((answerList.size() > 0) && (answerService.checkRightListAnswer(question, answerList))) {
				ExamQuestion examQuestion = examQuestionService.findOne(exam, question);
				totalMark += examQuestion.getMark();
				countAnswerRight++;
			}
		}

		answerSheet.setTotalMark(totalMark);
		answerSheet = answerSheetService.save(answerSheet);

		String result = (totalMark >= exam.getPassMark()) ? "You passed the game. Not bad!"
				: "Oops, stupid lose the game. LOSERR!!";

		model.addAttribute("totalMark", totalMark);
		model.addAttribute("answerRightCount", countAnswerRight);
		model.addAttribute("questionCount", examQuestionService.findByExam(exam).size());
		model.addAttribute("result", result);

		session.removeAttribute("userAnswerList");
		session.removeAttribute("examQuestionList");
		session.removeAttribute("countIndex");
		model.addAttribute("answerSheetId", answerSheet.getAnswerSheetId());

		return "examResultPage";
	}

	@RequestMapping(value = "/exam-last-result", method = RequestMethod.POST)
	public String redirectToExamResult(Model model, Principal principal, HttpSession session,
			@ModelAttribute("temp") Temp temp) {
		AnswerSheet answerSheet = (AnswerSheet) session.getAttribute("answerSheet");
		Exam exam = answerSheet.getExam();

		double totalMark = 0;
		int countAnswerRight = 0;

		List<QuestionAndListAnswerModel2> questionAndListAnswerModelList = temp.getQuestionAndListAnswerModelList();

		Question question = null;
		for (int i = 0; i < questionAndListAnswerModelList.size(); i++) {
			QuestionAndListAnswerModel2 t = questionAndListAnswerModelList.get(i);
			question = t.getQuestion();
			question = questionService.findOne(question.getQuestionId());
			AnswerSheetDetail answerSheetDetail = new AnswerSheetDetail();
			answerSheetDetail.setQuestion(question);

			List<Answer> answerList = null;
			if (t.getListAnswer() != null) {
				List<AnswerModel> answerModelList = t.getListAnswer().getAnswerModelList();
				answerList = new ArrayList<Answer>();
				for (int j = 0; j < answerModelList.size(); j++) {
					if (answerModelList.get(j).getFuck() == 1) {
						answerList.add(answerModelList.get(j).getAnswer());
						answerSheetDetail.setAnswer(answerModelList.get(j).getAnswer());
						answerSheetDetail.setAnswerSheet(answerSheet);
						answerSheet.getAnswerSheetDetails().add(answerSheetDetail);
					}
				}
				if (answerService.checkRightListAnswer(question, answerList)) {
					double mark = examQuestionService.findOne(exam, question).getMark();
					totalMark += mark;
					countAnswerRight++;
				}
			}
		}
		answerSheet.setTotalMark(totalMark);
		answerSheet = answerSheetService.save(answerSheet);
		String result = (totalMark >= exam.getPassMark()) ? "You passed the game. Not bad!"
				: "Oops, stupid lose the game. LOSERR!!";

		model.addAttribute("totalMark", totalMark);
		model.addAttribute("answerRightCount", countAnswerRight);
		model.addAttribute("questionCount", questionAndListAnswerModelList.size());
		model.addAttribute("result", result);
		model.addAttribute("answerSheetId", answerSheet.getAnswerSheetId());
		return "examResultPage";
	}

	@RequestMapping(value = "/result/{answerSheetId}", method = RequestMethod.GET)
	public String redirectToResult(Model model, Principal principal, HttpSession session,
			@PathVariable("answerSheetId") int answerSheetId) {

		AnswerSheet answerSheet = answerSheetService.findOne(answerSheetId);
		Exam exam = answerSheet.getExam();
		List<Question> questionList = questionService.findQuestionByExam(exam);

		// Model chứa câu hỏi và danh sách câu trả lời (AnswerModel, model này
		// có thêm trường kiểm tra có được chọn hay ko)
		List<QuestionAndListAnswerModel> listModel = new ArrayList<QuestionAndListAnswerModel>();

		QuestionAndListAnswerModel item = null;
		for (Question question : questionList) {
			item = new QuestionAndListAnswerModel();
			item.setListAnswer(new ArrayList<AnswerModel>());

			// Set danh sách câu trả lời cho câu hỏi
			List<Answer> answerList = answerService.findByQuestion(question);

			// thêm câu hỏi và cho biết câu trả lời nào chính là câu trả lời
			// người dùng đã chọn
			item.setQuestion(question);
			item.setListAnswer(new ArrayList<AnswerModel>());

			// Lấy điểm của câu hỏi
			ExamQuestion examQuestion = examQuestionService.findOne(exam, question);
			double mark = examQuestion.getMark();

			item.setMark(mark);
			item.setRealMark(0);

			for (int i = 0; i < answerList.size(); i++) {
				Answer answer = answerList.get(i);
				AnswerModel answerModel = new AnswerModel();
				if (answerSheetDetailService.checkIsSelected(question, answer, answerSheet)) {
					answerModel.setFuck(1);
					item.setRealMark(mark);
				} else {
					answerModel.setFuck(0);
				}
				answerModel.setAnswer(answer);
				item.setMark(mark);
				item.getListAnswer().add(answerModel);
			}

			listModel.add(item);
		}
		model.addAttribute("listModel", listModel);
		return "resultPage";
	}

	@RequestMapping(value = "/normal-question/{questionId}", method = RequestMethod.GET)
	public String redirectToNormalQuestionPage(Model model, @PathVariable("questionId") int questionId,
			HttpSession session) {

		Question question = questionService.findOne(questionId);
		question.setAnswers(answerService.findByQuestion(question));

		int countIndex = (Integer) session.getAttribute("countIndex");
		countIndex++;
		session.setAttribute("countIndex", countIndex);
		model.addAttribute("question", question);

		// Xét loại câu hỏi và trả về view tương ứng
		if (question.getType().getTypeId() == 1) {
			return "normalQuestionPage";
		} else if (question.getType().getTypeId() == 2) {
			return "multichoiceQuestionPage";
		} else {
			return "mediaQuestionPage";
		}
	}

	@RequestMapping(value = "/normal-question", method = RequestMethod.POST)
	public String answerNormalQuestion(Model model, @RequestParam("questionId") int questionId,
			@RequestParam(value = "answerId", required = false) List<String> answerIdListTemp, HttpSession session) {
		ArrayList<UserAnswer> userAnswerList = (ArrayList<UserAnswer>) session.getAttribute("userAnswerList");

		int answerId = 0;
		List<Integer> answerIdList = null;
		// Kiểm tra list câu trả lời và add danh sách các câu trả lời vào
		// session attribute ''
		if (answerIdListTemp != null) {
			answerIdList = new ArrayList<Integer>();
			for (int i = 0; i < answerIdListTemp.size(); i++) {
				answerId = Integer.parseInt(answerIdListTemp.get(i));
				answerIdList.add(answerId);
			}
			UserAnswer userAnswer = new UserAnswer(questionId, answerIdList);
			userAnswerList.add(userAnswer);
		}

		List<ExamQuestion> examQuestionList = (List<ExamQuestion>) session.getAttribute("examQuestionList");

		Question question = null;
		int size = examQuestionList.size();

		// Kiểm tra danh sách câu hỏi của đề thi, nếu còn câu hỏi thì tiếp tục
		// get, hết rồi thì trả về exam result
		if (size != 0) {
			int index = new Random().nextInt(size);

			ExamQuestion examQuestion = examQuestionList.get(index);
			question = examQuestion.getQuestion();

			model.addAttribute("questionId", question.getQuestionId());
			examQuestionList.remove(examQuestion);

			return "redirect:/normal-question/" + question.getQuestionId();
		} else {
			return "redirect:/exam-result";
		}
	}

	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String redirectToHelp(Model model) {

		return "helpPage";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String redirectToContact(Model model) {

		return "contactPage";
	}

	@RequestMapping(value = "/features", method = RequestMethod.GET)
	public String redirectToFeatures(Model model) {

		return "featuresPage";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String redirectToRegister(Model model) {

		return "registerPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String redirectToLogin(Model model) {
		return "loginPage";
	}

	@RequestMapping(value = "/logout-successful", method = RequestMethod.GET)
	public String redirectToLogout(Model model) {

		return "logoutPage";
	}

	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String redirectToTerms(Model model) {

		return "termsPage";
	}

	@RequestMapping(value = "/courses", method = RequestMethod.GET)
	public String redirectToCourses(Model model, Principal principal) {
		String userId = principal.getName();
		User user = userService.findOne(userId);

		Semester currentSemester = semesterService.findCurrentSemester();
		model.addAttribute("currentSemester", currentSemester);

		List<Semester> semesterList = semesterService.findAll(new Sort(Direction.DESC, "semesterId"));
		model.addAttribute("semesterList", semesterList);

		List<com.softech.elearning.data.domain.Class> classList = null;
		if (user.getRole().getName().equals("Role_Teacher")) {
			classList = classService.findCurrentClassForTeacherInCurrentSemester(currentSemester, user);
		} else {
			classList = classUserService.findAllClassForStudent(user, currentSemester);
		}
		model.addAttribute("classList", classList);
		return "coursesPage";
	}

	@RequestMapping(value = "/courses", method = RequestMethod.POST)
	public String selectCourses(Model model, Principal principal, @RequestParam("semesterId") String semesterId) {
		String userId = principal.getName();
		User user = userService.findOne(userId);

		Semester currentSemester = semesterService.findOne(semesterId);
		model.addAttribute("currentSemester", currentSemester);

		List<Semester> semesterList = semesterService.findAll(new Sort(Direction.DESC, "semesterId"));
		model.addAttribute("semesterList", semesterList);

		List<com.softech.elearning.data.domain.Class> classList = classService
				.findCurrentClassForTeacherInCurrentSemester(currentSemester, user);
		model.addAttribute("classList", classList);

		return "coursesPage";
	}

	@RequestMapping(value = "/class-detail/{classId}", method = RequestMethod.GET)
	public String redirectToCourses(Model model, @PathVariable("classId") String classId) {

		com.softech.elearning.data.domain.Class myClass = classService.findOne(classId);
		model.addAttribute("myClass", myClass);

		Exam exam = examService.getExamSelectedForSubject(myClass.getSubject().getSubjectId());
		model.addAttribute("exam", exam);

		return "classDetailPage";
	}

	@RequestMapping(value = "/not-found", method = RequestMethod.GET)
	public String redirectToNotFound(Model model) {

		return "notFoundPage";
	}

	@RequestMapping(value = "/access-denied", method = RequestMethod.GET)
	public String redirectToAccessDenied(Model model) {

		return "accessDeniedPage";
	}

}
