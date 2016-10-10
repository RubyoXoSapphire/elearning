<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
							<li><a href="">Hoc Ky 1</a>&rsaquo;</li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/exam-fail-pass/${examId}">Pass
									/ Fail</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">

			<div class="rowbox managecontainer">
				<div class="row border_bottom manageheader">
					<div class="col3">
						<div class="contentbox">
							<strong class="heading h3">Exam</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>Pass / Fail</h1>
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
							<nav>
								<ul class="menu level1">
									<li><a class="icon-home"
										href="${pageContext.request.contextPath}/exam-detail/${examId}">Exam
											dashboard</a></li>
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/question-list/${examId}">Questions</a></li>
									<li class="hier open"><a class="icon-shuffle"
										href="${pageContext.request.contextPath}/exam-fail-pass/${examId}">Pass
											/ Fail</a></li>
									<li><a class="icon-cog"
										href="${pageContext.request.contextPath}/exam-setting/${examId}">Settings</a></li>
									<li><a class="icon-palette" href="">Layout & styling</a></li>
									<li><a class="icon-chat" href="">Social media</a></li>
									<li><a class="icon-chart-line"
										href="${pageContext.request.contextPath}/results-stats/${examAndQuestionCountModel.exam.examId}">Results
											& Stats</a></li>
									<li><a class="icon-user" href="">User Management</a></li>
									<li><a class="icon-paper-plane" href="">Publish &
											share</a></li>
									<li><a class="icon-cog" href="">Custom Features</a></li>
									<li><a class="icon-cog" href="">3rd Party Integrations</a></li>
									<li><a class="icon-certificateprize-award" href="">Certificate</a></li>
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/print-exam/${exam.examId}">Print
											exam</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<div class="pagecontent">
								<div class="intro">
									<p>
										<span class="editable writefocus" contenteditable="true"
											data-language="en">You can set the different
											result-categories you want to create for the test-takers.</span>
									</p>
									<p>Results&nbsp;that you&nbsp;might want to consider
										(besides "Passed" and "Failed") are: "Room for improvement",
										"Excellent", "Good Job", "Satisfactory", "Not quite there
										yet..", "Awesome", etc.</p>
								</div>
							</div>
							<form class="catcreate quizsettings" id="compositeformmodel"
								action="${pageContext.request.contextPath}/exam-fail-pass/${examId}"
								method="post">
								<div class="categories categoriecontainer clearfix">
									<div class="inputs">
										<div class="item">
											<fieldset>
												<input name="examId" id="ExamCategoryModel_0_id"
													type="hidden" value="${examId}" />
												<div class="required">
													<label for="ExamCategoryModel_0_title" class="required">Title&nbsp;<span
														class="required">*</span></label><input
														name="ExamCategoryModel[0][title]"
														id="ExamCategoryModel_0_title" placeholder="Title"
														type="text" maxlength="100" value="Passed" />
													<div id="ExamCategoryModel_0_title_em_"
														class="errorMessage hide"></div>
												</div>
												<div class="richtextfield">
													<label for="ExamCategoryModel_0_description">Category
														description</label>
													<textarea rows="15" cols="65"
														id="ExamCategoryModel_0_description"
														data-tinymce="3c70ff27ee1f68283b1faf4069ff60cc"
														name="ExamCategoryModel[0][description]"
														placeholder="Category description"></textarea>
													<div id="ExamCategoryModel_0_description_em_"
														class="errorMessage hide"></div>
												</div>
												<p class="uitleg">
													This is the minimum score needed to fall in this category.
													So if this is 50%, the taker of the test needs at least 50%
													of the points to fall in this category.<br /> The maximum
													score is determined by the minimum score of the next
													category (and it's 100% for your top-category).
												</p>
												<div class="required">
													<label for="ExamCategoryModel_0_value" class="required">Category
														value (mark)&nbsp;<span class="required">*</span>
													</label><input name="passMark" id="ExamCategoryModel_0_value"
														placeholder="Pass Mark" type="number" value="${passMark}" />
													<div id="ExamCategoryModel_0_value_em_"
														class="errorMessage hide"></div>
												</div>
											</fieldset>
										</div>
										<div class="item">
											<fieldset>
												<input name="ExamCategoryModel[1][id]"
													id="ExamCategoryModel_1_id" type="hidden" value="130608" />
												<div class="required">
													<label for="ExamCategoryModel_1_title" class="required">Title&nbsp;<span
														class="required">*</span></label><input
														name="ExamCategoryModel[1][title]"
														id="ExamCategoryModel_1_title" placeholder="Title"
														type="text" maxlength="100" value="Failed" />
													<div id="ExamCategoryModel_1_title_em_"
														class="errorMessage hide"></div>
												</div>
												<div class="richtextfield">
													<label for="ExamCategoryModel_1_description">Category
														description</label>
													<textarea rows="15" cols="65"
														id="ExamCategoryModel_1_description"
														data-tinymce="3c70ff27ee1f68283b1faf4069ff60cc"
														name="ExamCategoryModel[1][description]"
														placeholder="Category description"></textarea>
													<div id="ExamCategoryModel_1_description_em_"
														class="errorMessage hide"></div>
												</div>
												<p class="uitleg">
													This is the minimum score needed to fall in this category.
													So if this is 50%, the taker of the test needs at least 50%
													of the points to fall in this category.<br /> The maximum
													score is determined by the minimum score of the next
													category (and it's 100% for your top-category).
												</p>
												<div class="required">
													<label for="ExamCategoryModel_1_value" class="required">Category
														value (mark)&nbsp;<span class="required">*</span>
													</label><input name="fail_pass" id="ExamCategoryModel_1_value"
														placeholder="Category value (%)" type="number" value="0" />
													<div id="ExamCategoryModel_1_value_em_"
														class="errorMessage hide"></div>
												</div>
											</fieldset>
										</div>
									</div>
									<a class="button tinyadd catedit add"
										href="/my-dashboard/exams/exam-dashboard/categories/item8111?quizId=63026#startedit">+
										Add category</a>
								</div>

								<div class="row prevnext">
									<input class="new" type="submit" name="yt0" value="Save" />
								</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



