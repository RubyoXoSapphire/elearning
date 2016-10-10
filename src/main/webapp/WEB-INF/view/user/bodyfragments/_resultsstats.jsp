<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>











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
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/results-stats/${exam.examId}">Results
									&amp; Stats</a></li>
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
									<h1>Results &amp; Stats</h1>
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
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/question-list/${exam.examId}">Questions</a></li>
									<li><a class="icon-shuffle"
										href="${pageContext.request.contextPath}/exam-fail-pass/${exam.examId}">Pass
											/ Fail</a></li>
									<li class="hier open"><a class="icon-cog"
										href="${pageContext.request.contextPath}/exam-setting/${exam.examId}">Settings</a>
										<ul class="menu level2">
											<li class="first "><a
												href="#/my-dashboard/exams/exam-dashboard/settings/advanced/item10033?quizId=63026">Advanced</a></li>
											<li class=""><a
												href="#/my-dashboard/exams/exam-dashboard/settings/terms-conditions/item10058?quizId=63026">Terms
													& conditions</a></li>
											<li class=""><a
												href="#/my-dashboard/exams/exam-dashboard/settings/copy/item8113?quizId=63026">Copy</a></li>
											<li class=""><a
												href="#/my-dashboard/exams/exam-dashboard/settings/delete/item8116?quizId=63026">Delete</a></li>
										</ul></li>
									<li><a class="icon-palette"
										href="#/my-dashboard/exams/exam-dashboard/layout-styling/item10041?quizId=63026">Layout
											& styling</a></li>
									<li><a class="icon-chat"
										href="#/my-dashboard/exams/exam-dashboard/social-media/item10040?quizId=63026">Social
											media</a></li>
									<li><a class="icon-chart-line"
										href="${pageContext.request.contextPath}/results-stats/${exam.examId}">Results
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
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<div class="">
								<div class="row">
									<div class="col4_5">
										<h2>Global</h2>
										<table class="stats floatleft">
											<tbody>
												<tr>
													<th>Amount of finished answer sheet</th>
													<td>${countAnswerSheetWithFullAnswer}(<fmt:formatNumber
															pattern="##.##"
															value="${countAnswerSheetWithFullAnswer/allCountAnswerSheet*100}" />%)
													</td>
												</tr>
												<tr>
													<th>Amount of unfinished answer sheet</th>
													<td>${countAnswerSheetWithNotFullAnswer}(<fmt:formatNumber
															pattern="##.##"
															value="${countAnswerSheetWithNotFullAnswer/allCountAnswerSheet*100}" />%)
													</td>
												</tr>
												<tr>
													<th>Total amount of answer sheet for this exams</th>
													<td>${allCountAnswerSheet}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="col4_5 last">
										<h2>Scores</h2>
										<table class="stats">
											<tbody>
												<tr>
													<th>Average mark</th>
													<td>${averageMark}</td>
												</tr>
												<tr>
													<th>Pass answer sheet</th>
													<td>${countPassAnswerSheet}(<fmt:formatNumber
															pattern="##.##"
															value="${countPassAnswerSheet/allCountAnswerSheet*100}" />%)
													</td>
												</tr>
												<tr>
													<th>Fail answer sheet</th>
													<td>${countFailAnswerSheet}(<fmt:formatNumber
															pattern="##.##"
															value="${countFailAnswerSheet/allCountAnswerSheet*100}" />%)
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="circle-container">
									<div class="circlestat" data-dimension="270"
										data-text="${countPassAnswerSheet/allCountAnswerSheet*100}%"
										data-width="30" data-fontsize="42"
										data-percent="${countPassAnswerSheet/allCountAnswerSheet*100}"
										data-fgcolor="#61a9dc" data-bgcolor="#eee" data-fill="#ddd"
										style="margin-left: 100px"></div>
									<h3 style="margin-left: 100px">Pass</h3>
								</div>
								<div class="circle-container">
									<div class="circlestat" data-dimension="270"
										data-text="${countFailAnswerSheet/allCountAnswerSheet*100}%"
										data-width="30" data-fontsize="42"
										data-percent="${countFailAnswerSheet/allCountAnswerSheet*100}"
										data-fgcolor="#61a9dc" data-bgcolor="#eee" data-fill="#ddd"
										style="margin-left: 20px"></div>
									<h3 style="margin-left: 20px">Fail</h3>
								</div>
								<div class="buttongroup">
									<a
										href="/my-dashboard/exams/exam-dashboard/results-stats/item8110#"
										class="button">View session statistics</a> <a
										href="/my-dashboard/exams/exam-dashboard/results-stats/item8110#"
										class="button">Export statistics</a>
								</div>

								<h2>Question</h2>
								<ul class="questionstats questionlist">
									<c:forEach var="questionContentAndAnswerContent"
										items="${listQuestionContentAndAnswerContent}">
										<li><strong class="heading h3">${questionContentAndAnswerContent.questionContent}</strong>
											<table>
												<thead>
													<tr>
														<th>Question</th>
														<th class="numstat">Count</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="answerContentAndCountAnswered"
														items="${questionContentAndAnswerContent.answerContentAndCountAnsweredList}">
														<tr>
															<td>${answerContentAndCountAnswered.content}</td>
															<td class="numstat">${answerContentAndCountAnswered.count}
																(<fmt:formatNumber pattern="##.##"
																	value="${answerContentAndCountAnswered.count/questionContentAndAnswerContent.countAnswered*100}" />%)
															</td>
														</tr>
													</c:forEach>
													<tr>
														<td class="alignright">Total</td>
														<td class="numstat">${questionContentAndAnswerContent.countAnswered}</td>
													</tr>
												</tbody>
											</table></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<script>
	$(function() {
		$('.circlestat').circliful();
	});
</script>
