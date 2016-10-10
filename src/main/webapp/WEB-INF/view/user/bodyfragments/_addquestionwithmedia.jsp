<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<div class="page-wrap">
	<div class="crumbrow">
		<div class="wrapper">
			<div class="row">
				<div class="col12">
					<nav>
						<ul class="crumbpath clearfix">
							<li class="first"><a
								href="${pageContext.request.contextPath}/home">Home</a>&rsaquo;</li>
							<li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>&rsaquo;</li>
							<li><a href="${pageContext.request.contextPath}/exams">Exams</a>&rsaquo;</li>
							<li><a
								href="${pageContext.request.contextPath}/exam-detail/${exam.examId}">${exam.name}</a>&rsaquo;</li>
							<li><a
								href="${pageContext.request.contextPath}/question-list/${exam.examId}">Questions</a>&rsaquo;</li>
							<li class="last hier"><a href="">Question
									${questionCount+1}</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">
			<c:if test="${not empty message}">
				<div data-alert="alert" class="alert-message alert ${not empty hasError ? 'error' : 'success'}">
					<a
						href="/my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026"
						class="close">×</a>
					<p>${message}</p>
				</div>
			</c:if>
			<div class="rowbox managecontainer">
				<div class="row border_bottom manageheader">
					<div class="col3">
						<div class="contentbox">
							<strong class="heading h3"><a
								href="${pageContext.request.contextPath}/question-list/${examId}">‹
									Back to questions</a></strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>Question</h1>
								</div>
							</div>
							<div class="col3">
								<div class="contentbox alignright">
									<p class="readmore">
										<a target="_blank"
											href="${pageContext.request.contextPath}/start-exam/${exam.examId}">Try
											the exam</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col3">
						<div class="navigation quiznav">
							<div class="questiontype">
								<ul>
									<li><strong>Text</strong>
										<ul class="menu level1">
											<li class="text hier"><a
												href="${pageContext.request.contextPath}/add-/add-multichoice-question/${examId}">Multiple
													choice</a></li>
											<li class="fib"><a
												href="my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026&amp;type=fib">Fill
													in the blanks</a></li>
											<li class="freeText"><a
												href="${pageContext.request.contextPath}/add-question-free-text/${examId}">Free
													text</a></li>
										</ul></li>
									<li><strong>Image</strong>
										<ul class="menu level1">
											<li class="image"><a
												href="my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026&amp;type=image">One
													big image</a></li>
											<li class="smallImages"><a
												href="my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026&amp;type=smallImages">Small
													images</a></li>
											<li class="mediumImages"><a
												href="my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026&amp;type=mediumImages">Medium
													images</a></li>
											<li class="largeImages"><a
												href="my-dashboard/exams/exam-dashboard/questions/edit/item8107?quizId=63026&amp;type=largeImages">Large
													images</a></li>
										</ul></li>
									<li><strong>Media</strong>
										<ul class="menu level1">
											<li class="media"><a
												href="${pageContext.request.contextPath}//add-media-question/${examId}">Video
													or Audio</a></li>
										</ul></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form:form class="quizsettings" id="examquestionmodel"
								enctype="multipart/form-data"
								action="${pageContext.request.contextPath}/add-media-question/${exam.examId}"
								method="post" modelAttribute="questionAndFourAnswerModel">
								<fieldset>
									<div class="richtextfield">
										<label for="ExamQuestionModel_question">Question</label>
										<form:textarea rows="8" cols="65"
											id="ExamQuestionModel_question"
											data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
											placeholder="Question" name="ExamQuestionModel[question]"
											path="question.content"></form:textarea>
										<div class="errorMessage hide"
											id="ExamQuestionModel_question_em_"></div>
									</div>
									<div class="richtextfield">
										<label for="ExamQuestionModel_question">Chapter</label> <select
											name="chapterId">
											<option value="None">--None Chapter--</option>
											<c:forEach var="chapter" items="${chapterList}">
												<option value="${chapter.chapterId}">${chapter.name}</option>
											</c:forEach>
										</select>
										<div class="errorMessage hide"
											id="ExamQuestionModel_question_em_"></div>
									</div>
									<div class="richtextfield">
										<label for="ExamQuestionModel_question">Level</label>
										<form:select path="question.questionLevel">
											<option value="easy">Easy</option>
											<option value="medium">Medium</option>
											<option value="hard">Hard</option>
										</form:select>
										<div class="errorMessage hide"
											id="ExamQuestionModel_question_em_"></div>
									</div>
									<div class="points required">
										<label for="ExamQuestionModel_points" class="required">Points&nbsp;<span
											class="required">*</span></label><input step="0.01" min="0"
											name="mark" id="mark" type="number" value="1.00" />
										<div class="errorMessage hide"
											id="ExamQuestionModel_points_em_"></div>
									</div>
								</fieldset>
								<fieldset>
									<div class="fieldgroup">
										<div>
											<label for="ExamMultipleChoiseQuestionTypeModel_media">Media</label>
											<form:input placeholder="Media"
												id="ExamMultipleChoiseQuestionTypeModel_media"
												name="mediaUrl" type="text" value=""
												path="question.mediaUrl" />
											<div class="errorMessage hide"
												id="ExamMultipleChoiseQuestionTypeModel_media_em_"></div>
										</div>
										<div class="pad-box">
											<p>In this field you can place a link to:</p>
											<ul>
												<li>Youtube (Example:
													https://www.youtube.com/watch?v=MG8KADiRbOU)</li>
											</ul>
										</div>
									</div>
								</fieldset>
								<fieldset class="createanswers">
									<div class="fieldgroup">
										<h2>Answer 1</h2>
										<div>
											<label for="ExamMultipleChoiseQuestionTypeModel_answer_1">Answer</label>
											<form:textarea rows="8" cols="65"
												id="ExamQuestionModel_question"
												data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
												placeholder="Answer 1" name="ExamQuestionModel[answer_1]"
												path="answer1.content" />
											<div class="errorMessage hide"
												id="ExamQuestionModel_question_em_"></div>
										</div>
										<div class="radiobuttonfield" data-field="correct_1">
											<label> Correct Answer <form:radiobutton
													name="ExamMultipleChoiseQuestionTypeModel[correct_answer]"
													path="answer1.right" value="1" cssClass="radiobutton" />
											</label>
										</div>
									</div>
									<div class="fieldgroup">
										<h2>Answer 2</h2>
										<div>
											<label for="ExamMultipleChoiseQuestionTypeModel_answer_2">Answer</label>
											<form:textarea rows="8" cols="65"
												id="ExamQuestionModel_question"
												data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
												placeholder="Answer 2" name="ExamQuestionModel[answer_2]"
												path="answer2.content" />
											<div class="errorMessage hide"
												id="ExamQuestionModel_question_em_"></div>
										</div>
										<div class="radiobuttonfield" data-field="correct_2">
											<label> Correct Answer <form:radiobutton
													name="ExamMultipleChoiseQuestionTypeModel[correct_answer]"
													path="answer2.right" value="1" cssClass="radiobutton" />
											</label>
										</div>
									</div>
									<div class="fieldgroup">
										<h2>Answer 3</h2>
										<div>
											<label for="ExamMultipleChoiseQuestionTypeModel_answer_3">Answer</label>
											<form:textarea rows="8" cols="65"
												id="ExamQuestionModel_question"
												data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
												placeholder="Answer 3" name="ExamQuestionModel[answer_3]"
												path="answer3.content" />
											<div class="errorMessage hide"
												id="ExamQuestionModel_question_em_"></div>
										</div>
										<div class="radiobuttonfield" data-field="correct_3">
											<label> Correct Answer <form:radiobutton
													name="ExamMultipleChoiseQuestionTypeModel[correct_answer]"
													path="answer3.right" value="1" cssClass="radiobutton" />
											</label>
										</div>
									</div>
									<div class="fieldgroup">
										<h2>Answer 4</h2>
										<div>
											<label for="ExamMultipleChoiseQuestionTypeModel_answer_4">Answer</label>
											<form:textarea rows="8" cols="65"
												id="ExamQuestionModel_question"
												data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
												placeholder="Answer 4" name="ExamQuestionModel[answer_4]"
												path="answer4.content" />
											<div class="errorMessage hide"
												id="ExamQuestionModel_question_em_"></div>
										</div>
										<div class="radiobuttonfield" data-field="correct_4">
											<label> Correct Answer <form:radiobutton
													name="ExamMultipleChoiseQuestionTypeModel[correct_answer]"
													path="answer4.right" value="1" cssClass="radiobutton" />
											</label>
										</div>
									</div>
								</fieldset>
								<fieldset class="explainquestion">
									<h2>Explanation</h2>
									<div class="fieldgroup">
										<div
											class="question_image input-image explanation_image uploadfield"
											data-field="explanation_image">
											<div class="uploadtooltip">
												<div class="uploadinfobutton">i</div>
												<div class="uploadinfo">Will be scaled to different
													formats. For the best result make sure the image has a
													minimum width of 568px and a mininum height of 240px.</div>
											</div>
											<label for="ExamQuestionModel_explanation_image">Explanation
												image</label>
											<div class="fileinput-button">
												<input name="ExamQuestionModel[explanation_image]"
													id="ExamQuestionModel_explanation_image" accept="image/*"
													type="file" />
												<p>
													<em>Allowed: .png, .gif, .jpg.</em>
												</p>
												<strong class="guide">Click<em>or drag an
														image</em></strong>
												<div class="filescontainer" id="files_explanation_image"></div>
												<input name="ExamQuestionModel[explanation_image_src]"
													id="ExamQuestionModel_explanation_image_src" type="hidden" />
												<a class="btn img-delete"
													href="#/my-dashboard/exams/exam-dashboard/questions/edit/item8107#"
													title="Delete image" style="display: none;">&times;</a>
											</div>
											<div class="errorMessage hide"
												id="ExamQuestionModel_explanation_image_src_em_"></div>
										</div>
										<div class="richtextfield">
											<label for="ExamQuestionModel_explanation">Explanation
												(will be shown when the exam is over)</label>
											<textarea rows="15" cols="65"
												id="ExamQuestionModel_explanation"
												data-tinymce="0b1f461d8c2d42e8a902a54737039d9d"
												placeholder="Explanation (will be shown when the exam is over)"
												name="ExamQuestionModel[explanation]"></textarea>
											<div class="errorMessage hide"
												id="ExamQuestionModel_explanation_em_"></div>
										</div>
										<div>
											<label for="ExamQuestionModel_explanation_url">Explanation
												link</label><input placeholder="Explanation link"
												id="ExamQuestionModel_explanation_url"
												name="ExamQuestionModel[explanation_url]" type="text" />
											<div class="errorMessage hide"
												id="ExamQuestionModel_explanation_url_em_"></div>
										</div>
									</div>
								</fieldset>
								<fieldset>
									<input type="hidden" name="typeId" value="4" />
								</fieldset>
								<fieldset>
									<div class="radiobuttonlistfield">
										<label>Shuffle answers</label>
										<div class="radiobuttonlist">
											<input
												id="ytExamMultipleChoiseQuestionTypeModel_shuffle_answers"
												type="hidden" value=""
												name="ExamMultipleChoiseQuestionTypeModel[shuffle_answers]" /><span
												id="ExamMultipleChoiseQuestionTypeModel_shuffle_answers"><span><input
													id="ExamMultipleChoiseQuestionTypeModel_shuffle_answers_0"
													value="0" type="radio"
													name="ExamMultipleChoiseQuestionTypeModel[shuffle_answers]" />
													<label
													for="ExamMultipleChoiseQuestionTypeModel_shuffle_answers_0">Show
														answers in random order when playing exam</label></span><span><input
													id="ExamMultipleChoiseQuestionTypeModel_shuffle_answers_1"
													value="1" type="radio"
													name="ExamMultipleChoiseQuestionTypeModel[shuffle_answers]" />
													<label
													for="ExamMultipleChoiseQuestionTypeModel_shuffle_answers_1">Show
														answers in current order when playing exam</label></span></span>
										</div>
										<div class="errorMessage hide"
											id="ExamMultipleChoiseQuestionTypeModel_shuffle_answers_em_"></div>
									</div>
									<div class="errorMessage hide"
										id="ExamQuestionModel_correct_answer_em_"></div>
								</fieldset>
								<div class="button-container">
									<div class="clearfix row">
										<div class="col6 save-quiz"></div>
										<div class="col6 floatright prevnext">
											<input class="new" name="new" type="submit"
												value="+ Add question" />
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>








<div id="myModal" class="reveal-modal">
	<h1>Modal Title</h1>
	<p>Any content could go in here.</p>
	<a class="close-reveal-modal">&#215;</a>
</div>





<script>
	$(document).ready(function() {
		$(".radiobutton").click(function() {
			$('.radiobutton').prop('checked', false);
			$(this).prop('checked', true);
		});

		tinymce.init({
			selector : 'textarea'
		});
	})
</script>