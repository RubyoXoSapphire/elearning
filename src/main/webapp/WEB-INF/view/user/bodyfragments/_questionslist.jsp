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
							<li><a
								href="${pageContext.request.contextPath}/exam-detail/${exam.examId}">${exam.name}</a>&rsaquo;</li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/question-list/${exam.examId}">Questions</a></li>
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
									<h1>Questions</h1>
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
												href="${pageContext.request.contextPath}/import-questions/${exam.examId}">Import
													Questions</a></li>
											<li class=""><a
												href="${pageContext.request.contextPath}/export-questions/${exam.examId}">Export
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
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/print-exam/${exam.examId}">Print
											exam</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<div class="buttongroup">
								<a class="button addquestion"
									href="${pageContext.request.contextPath}/add-question/${exam.examId}">+
									New question</a> <a class="button"
									href="${pageContext.request.contextPath}/import-questions/${exam.examId}">Import
									questions</a> <a class="button"
									href="${pageContext.request.contextPath}/export-questions/${exam.examId}">Export
									questions</a>
							</div>
							<div class="questionlist">
								<div id="yw0" class="grid-view">
									<div class="summary">Total ${questionCount} results.</div>
									<table class="items table">
										<thead>
											<tr>
												<th id="yw0_c0">Number</th>
												<th id="yw0_c1">Question</th>
												<th id="yw0_c1">Level</th>
												<th class="button-column" id="yw0_c2">&nbsp;</th>
											</tr>
										</thead>
										<c:set var="index" value="0" />
										<tbody>
											<c:forEach var="question" items="${questionList}"
												varStatus="i">
												<tr class="items[]_500702">
													<td>${(i.index)+1}</td>
													<td>${question.content}</td>
													<td>${question.questionLevel}</td>
													<td class="button-column"><a class="update"
														title="Edit"
														href="${pageContext.request.contextPath}/edit-question/${exam.examId}&${question.questionId}">Edit</a><a
														class="delete" title="Delete"><input type="hidden"
															value="${exam.examId}&${question.questionId}" />Delete</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<div class="extended-summary"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form action="${pageContext.request.contextPath}/delete-question"
	method="POST" id="tempForm">
	<input type="hidden" id="examIdAndQuestionId"
		name="examIdAndQuestionId" />
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

		$('.delete').click(function() {
			var value = $(this).children('input').attr('value');
			$('#examIdAndQuestionId').attr('value', value);
			$(this).attr('href', '#modal');
		});

		$('.remodal-confirm').click(function() {
			$('#tempForm').submit();
		});

		initExamQuestionIndex({
			'title' : 'Select question to reuse',
			'allowRecycle' : false
		});
		initSortableQuestionsIndex({
			'url' : '/site/index.php?r=manageExam/questionUpdateSort&quizId=63026&language=en',
			'error' : 'An error occured. Refresh the page and try again.'
		})
		jQuery(document).on('click', '#yw0 a.delete', function() {
			if (!confirm('Are you sure you want to remove this question?'))
				return false;
			var th = this, afterDelete = function() {
			};
			jQuery('#yw0').yiiGridView('update', {
				type : 'POST',
				url : jQuery(this).attr('href'),
				success : function(data) {
					jQuery('#yw0').yiiGridView('update');
					afterDelete(th, true, data);
				},
				error : function(XHR) {
					return afterDelete(th, false, XHR);
				}
			});
			return false;
		});
		jQuery('body').tooltip({
			'selector' : '[rel=tooltip]'
		});
		jQuery('body').popover({
			'selector' : '[rel=popover]'
		});

		$grid = $("#yw0");

		if ($(".extended-summary", $grid).length) {
			$(".extended-summary", $grid).html(
					$("#yw0-extended-summary", $grid).html());
		}

		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			var qs = $.deparam.querystring(options.url);
			if (qs.hasOwnProperty("ajax") && qs.ajax == "yw0") {
				options.realsuccess = options.success;
				options.success = function(data) {
					if (options.realsuccess) {
						options.realsuccess(data);
						var $data = $("<div>" + data + "</div>");
						// we need to get the grid again... as it has been updated
						if ($(".extended-summary", $("#yw0"))) {
							$(".extended-summary", $("#yw0")).html(
									$("#yw0-extended-summary", $data).html());
						}

					}
				}
			}
		});
		jQuery('#yw0')
				.yiiGridView(
						{
							'ajaxUpdate' : [ 'yw0' ],
							'ajaxVar' : 'ajax',
							'pagerClass' : 'pagination',
							'loadingClass' : 'grid-view-loading',
							'filterClass' : 'filters',
							'tableClass' : 'items table',
							'selectableRows' : 1,
							'enableHistory' : false,
							'updateSelector' : '{page}, {sort}',
							'filterSelector' : '{filter}',
							'url' : '/my-dashboard/exams/exam-dashboard/questions/item8106?quizId=63026',
							'afterAjaxUpdate' : function() {
								jQuery('.popover').remove();
								jQuery('body').popover();
								jQuery('.tooltip').remove();
								jQuery('body').tooltip();
							}
						});
	});
	/*]]>*/
</script>
