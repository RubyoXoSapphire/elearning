<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/import-questions/${exam.examId}">Import
									Questions</a></li>
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
							<strong class="heading h3">Exam</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>Import Questions</h1>
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
										href="${pageContext.request.contextPath}/exam-detail/${exam.examId}">Exam
											dashboard</a></li>
									<li class="hier open"><a class="icon-docs"
										href="${pageContext.request.contextPath}/question-list/${exam.examId}">Questions</a>
										<ul class="menu level2">
											<li class="first "><a
												href="#/my-dashboard/exams/exam-dashboard/questions/reuse/item8112?quizId=63026">Reuse</a></li>
											<li class=""><a
												href="${pageContext.request.contextPath}/import-question/${exam.examId}">Import
													Questions</a></li>
											<li class=""><a
												href="${pageContext.request.contextPath}/export-question/${exam.examId}">Export
													Questions</a></li>
										</ul></li>
									<li><a class="icon-shuffle"
										href="${pageContext.request.contextPath}/exam-fail-pass/${exam.examId}">Pass
											/ Fail</a></li>
									<li><a class="icon-cog"
										href="${pageContext.request.contextPath}/exam-setting/${exam.examId}">Settings</a></li>
									<li><a class="icon-palette"
										href="#/my-dashboard/exams/exam-dashboard/layout-styling/item10041?quizId=63026">Layout
											& styling</a></li>
									<li><a class="icon-chat"
										href="#/my-dashboard/exams/exam-dashboard/social-media/item10040?quizId=63026">Social
											media</a></li>
									<li><a class="icon-chart-line"
										href="#/my-dashboard/exams/exam-dashboard/results-stats/item8110?quizId=63026">Results
											& Stats</a></li>
									<li><a class="icon-user"
										href="#/my-dashboard/exams/exam-dashboard/player-information/item10031?quizId=63026">User
											Management</a></li>
									<li><a class="icon-paper-plane"
										href="#/my-dashboard/exams/exam-dashboard/publish-share/item8109?quizId=63026">Publish
											& share</a></li>
									<li><a class="icon-cog"
										href="#/my-dashboard/exams/exam-dashboard/custom/item10032?quizId=63026">Custom
											Features</a></li>
									<li><a class="icon-cog"
										href="#/my-dashboard/exams/exam-dashboard/3rd-party-integrations/item10069?quizId=63026">3rd
											Party Integrations</a></li>
									<li><a class="icon-certificateprize-award"
										href="#/my-dashboard/exams/exam-dashboard/certificate/item10111?quizId=63026">Certificate</a></li>
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
									<p>Do you have a lot of questions you want to add?</p>
									<br>
									<p>With an import you can upload a lot of
										exam&nbsp;questions in one go.</p>
									<br>
									<p>
										Click <a
											href="//d134jvmqfdbkyi.cloudfront.net/upload/downloads/example_import_questions_exam.csv">here</a>&nbsp;to
										download an example .csv file with the correct structure for
										the import to work correctly.
									</p>
									<br>
									<p>Just keep the top-row unchanged and enter your content
										below in the specified columns.</p>
									<br>
								</div>
							</div>
							<form:form class="quizsettings" modelAttribute="myUploadForm"
								enctype="multipart/form-data"
								action="${pageContext.request.contextPath}/import-questions/${exam.examId}"
								method="post">
								<div class="question-import csv-import">
									<div class="fieldsetintro">
										<p>Import quiz questions with a .csv</p>
										<br>
									</div>
									<div class="uploadfield required">
										<label for="WEmptyFormModel_import_csv" class="required">Bulk
											upload your questoins with a .CSV file. &nbsp;<span
											class="required">*</span>
										</label>
										<form:input path="fileDatas" type="file" />
										<p>
											<em>Allowed: .csv.</em>
										</p>
										<div class="errorMessage hide"
											id="WEmptyFormModel_import_csv_em_"></div>
									</div>
									<div class="buttonrow">
										<input name="import-csv" type="submit" value="Upload CSV" />
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







