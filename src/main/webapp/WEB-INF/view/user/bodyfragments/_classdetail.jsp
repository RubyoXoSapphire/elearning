<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<li class=""><a
								href="${pageContext.request.contextPath}/courses">Courses</a></li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/class-detail/${myclass.classId}">${myClass.name}</a></li>
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
							<strong class="heading h3">Class</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>${myClass.name}</h1>
								</div>
							</div>
							<div class="col3"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col3">
						<div class="navigation quiznav">
							<nav>
								<ul class="menu level1">
									<li class="hier open"><a class="icon-menu"
										href="${pageContext.request.contextPath}/courses">Courses</a></li>
									<li><a class="icon-chart-line" href="">Reporting</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<h2>About</h2>
							<table>
								<tr>
									<th>Class Id</th>
									<td>${myClass.classId}</td>
								</tr>
								<tr>
									<th>Name</th>
									<td>${myClass.name}</td>
								</tr>
								<tr>
									<th>Number Max</th>
									<td>${myClass.numberMax}</td>
								</tr>
								<tr>
									<th>Semester</th>
									<td>${myClass.semester.name}</td>
								</tr>
								<tr>
									<th>Subject</th>
									<td>${myClass.subject.name}</td>
								</tr>
								<tr>
									<th>Teacher</th>
									<td>${myClass.user.lastName}&nbsp;${myClass.user.firstName}</td>
								</tr>
								<tr>
									<th>Begin Date</th>
									<td>${myClass.beginDate}</td>
								</tr>
								<tr>
									<th>End Date</th>
									<td>${myClass.endDate}</td>
								</tr>
								<tr>
									<th>Exam Start Date</th>
									<td><c:if test="${not empty exam}">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${exam.testDatetimeBegin}" />
											<%-- <c:out value="${exam.testDatetimeBegin}" /> --%>
										</c:if></td>
								</tr>
								<tr>
									<th></th>
									<td><a
										href="${pageContext.request.contextPath}/start-exam/${exam.examId}"
										${examId} target="_blank"><input
											class="addquiz button medium" type="button" name="yt0"
											value="Do Exam" <c:if test="${empty exam}">disabled</c:if>></a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
