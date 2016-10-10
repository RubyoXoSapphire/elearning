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
							<li class="last hier"><a href="">${exam.name}</a></li>
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
									<h1>Exam dashboard</h1>
								</div>
							</div>
							<div class="col3">
								<div class="contentbox alignright">
									<p class="readmore">
										<a target="_blank"
											href="${pageContext.request.contextPath}/start-exam/${examId}">Try
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
									<li class="hier open"><a class="icon-home"
										href="${pageContext.request.contextPath}/exam-detail/${exam.examId}">Exam
											dashboard</a></li>
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/question-list/${exam.examId}">Questions</a></li>
									<li><a class="icon-shuffle"
										href="${pageContext.request.contextPath}/exam-fail-pass/${exam.examId}">Pass
											/ Fail</a></li>
									<li><a class="icon-cog"
										href="${pageContext.request.contextPath}/exam-setting/${exam.examId}">Settings</a></li>
									<li><a class="icon-palette"
										href="">Layout
											& styling</a></li>
									<li><a class="icon-chat"
										href="">Social
											media</a></li>
									<li><a class="icon-chart-line"
										href="${pageContext.request.contextPath}/results-stats/${exam.examId}">Results
											& Stats</a></li>
									<li><a class="icon-user"
										href="">User
											Management</a></li>
									<li><a class="icon-paper-plane"
										href="">Publish
											& share</a></li>
									<li><a class="icon-cog"
										href="">Custom
											Features</a></li>
									<li><a class="icon-cog"
										href="">3rd
											Party Integrations</a></li>
									<li><a class="icon-certificateprize-award"
										href="">Certificate</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<div class="buttongroup">
								<a class="button addquestion"
									href="${pageContext.request.contextPath}/add-question/${exam.examId}">
									New question</a>
							</div>
							<h2>About</h2>
							<table>
								<tr>
									<th>Exam title</th>
									<td>${exam.name}</td>
								</tr>
								<tr>
									<th>URL</th>
									<td><a target="_blank"
										href="${pageContext.request.contextPath}/exam-detail/${exam.examId}">https://elearning.com/start-exam/${exam.examId}</a>
									</td>
								</tr>
								<tr>
									<th>Number of questions</th>
									<td>${questionCount}</td>
								</tr>
							</table>

							<h2>Statistics</h2>
							<table class="stats">
								<tbody>
									<tr>
										<td>Players</td>
										<td>${playersCount}</td>
									</tr>
									<tr>
										<td>Times played</td>
										<td>0</td>
									</tr>
									<tr>
										<td>Times shared on facebook</td>
										<td>0</td>
									</tr>
									<tr>
										<td>Times shared on twitter</td>
										<td>0</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
