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
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/exams">Exams</a></li>
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
									<h1>Exams</h1>
								</div>
							</div>
							<div class="col3">
								<div class="contentbox alignright">
									<p class="readmore"></p>
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
									<li class="hier open"><a class="icon-menu"
										href="${pageContext.request.contextPath}/exams">Exams</a></li>
									<li><a class="icon-tag"
										href="#/my-dashboard/exams/manage-tags/item10099">Manage
											tags</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form class="quicknewquiz quizsettings" id="newexamformmodel"
								action="simple-exam" method="post">
								<fieldset>
									<div id="formdiv">
										<div class="required">
											<label for="NewExamFormModel_title" class="required">Title
												for your exam&nbsp;<span class="required">*</span>
											</label><input placeholder="Title for your exam"
												id="NewExamFormModel_title" name="examName" type="text"
												required="required" />
											<div class="errorMessage hide"
												id="NewExamFormModel_title_em_"></div>
										</div>
									</div>
									<input class="addquiz button medium" type="submit" name="yt0"
										value="+ New exam" />
								</fieldset>
							</form>
							<table class="quizindex">
								<thead>
									<tr>
										<th>Exam title</th>
										<th class="alignright">Questions</th>
									</tr>
								</thead>
								<c:forEach items="${list}" var="examAndQuestionCountModel">
									<tbody>
										<tr class="titlerow">
											<td rowspan="1"><a class="title"
												href="exam-detail/${examAndQuestionCountModel.exam.examId}"><strong>${examAndQuestionCountModel.exam.name}</strong></a></td>
											<td class="alignright" rowspan="2">${examAndQuestionCountModel.countQuestion}</td>
										</tr>
										<tr class="actionrow">
											<td><a target="_blank"
												href="${pageContext.request.contextPath}/start-exam/${examAndQuestionCountModel.exam.examId}">Try
													the exam</a> | <a
												href="${pageContext.request.contextPath}/question-list/${examAndQuestionCountModel.exam.examId}">Manage
													questions</a> | <a
												href="${pageContext.request.contextPath}/exam-setting/${examAndQuestionCountModel.exam.examId}">Settings</a>
												| <a href="${pageContext.request.contextPath}">Manage
													categories</a> | <a
												href="${pageContext.request.contextPath}/results-stats/${examAndQuestionCountModel.exam.examId}">Statistics</a>
												| <a href="${pageContext.request.contextPath}">User
													Management</a> | <a href="${pageContext.request.contextPath}">Publish</a>
												| <a class="myText">Delete<input type="hidden"
													value="${examAndQuestionCountModel.exam.examId}" /></a></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<form action="${pageContext.request.contextPath}/delete-exam"
	method="POST" id="tempForm">
	<input type="hidden" id="tempExamId" name="examId" />
</form>


<!-- href="#modal" -->

<div class="remodal" data-remodal-id="modal" role="dialog"
	aria-labelledby="modal1Title" aria-describedby="modal1Desc">
	<button data-remodal-action="close" class="remodal-close"
		aria-label="Close"></button>
	<div>
		<h2 id="modal1Title">Warning!</h2>
		<p id="modal1Desc">Are you sure you want to delete?</p>
	</div>
	<br>
	<button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
	<button data-remodal-action="confirm" class="remodal-confirm">OK</button>
</div>












<script type="text/javascript">
	/*<![CDATA[*/

	jQuery(function($) {
		$('.myText').click(function() {
			var examId = $(this).children('input').attr('value');
			$('#tempExamId').attr('value', examId);
			$(this).attr('href', '#modal');
		});

		$('.remodal-confirm').click(function() {
			$('#tempForm').submit();
		});

		$('#myText').hover(function() {
			$(this).css("text-decoration", "underline");
		}, function() {
			$(this).css("text-decoration", "none");
		});

		var formOpen = false;
		$("html").click(function() {
			$(".quicknewquiz #formdiv").hide();
			$(".quicknewquiz").removeClass("active");
			$(".quicknewquiz input[type=submit]").bind
			formOpen = false;
		});
		$(".quicknewquiz #formdiv").hide();
		$(".quicknewquiz #formdiv").click(function(e) {
			e.stopPropagation();
		});
		$(".quicknewquiz input[type=submit]").click(function(e) {
			if (!formOpen) {
				e.preventDefault();
				formOpen = true;
				$(".quicknewquiz").addClass("active");
				$(".quicknewquiz #formdiv").css("display", "inline-block");
				$(".quicknewquiz input[type=text]").focus();
			}
			e.stopPropagation();
		});
	});
</script>
