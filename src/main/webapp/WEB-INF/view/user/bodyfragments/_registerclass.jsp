<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>






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
								href="${pageContext.request.contextPath}/exam-detail/${exam.examId}"></a>&rsaquo;</li>
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
									<h1>${currentSemester.name}(${currentSemester.beginDate}-${currentSemester.endDate})</h1>
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
										href="${pageContext.request.contextPath}/course">Courses</a></li>
									<li><a class="icon-tag"
										href="#/my-dashboard/exams/manage-tags/item10099">Manage
											tags</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<c:if test="${not empty isValid}">
								<h3 style="color: red">You can not register class at this
									current time</h3>
							</c:if>
							<c:if test="${empty isValid}">
								<form:form
									action="${pageContext.request.contextPath}/register-class"
									method="POST" modelAttribute="registerFormModel">
									<div class="buttongroup" style="float: right">
										<input type="submit" value="Register"
											class="button addquestion" />
									</div>
									<div class="questionlist">
										<div id="yw0" class="grid-view">
											<div class="summary" style="float: right">Total
												${classCount} results.</div>
											<table class="items table">
												<thead>
													<tr>
														<th id="yw0_c0">Class Id</th>
														<th id="yw0_c1">Name</th>
														<th id="yw0_c1">Count</th>
														<th class="button-column" id="yw0_c2">&nbsp;</th>
													</tr>
												</thead>
												<c:set var="index" value="0" />
												<tbody>
													<c:forEach var="classModel"
														items="${registerFormModel.classListModel.clazzList}"
														varStatus="i">
														<tr class="items[]_500702">
															<td>${classModel.clazz.classId}</td>
															<td>${classModel.clazz.name}</td>
															<td>${classModel.clazz.users.size()}<c:out value="/" />${classModel.clazz.numberMax}</td>
															<form:hidden
																path="classListModel.clazzList[${i.index}].clazz.classId"
																value="${classModel.clazz.classId}" />
															<td class="button-column"><form:checkbox
																	path="classListModel.clazzList[${i.index}].fuck"
																	title="Registed" class="myCheckBox" /></td>
														</tr>
													</c:forEach>

												</tbody>
											</table>

											<div class="extended-summary"></div>
										</div>
									</div>
								</form:form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>











<script type="text/javascript">
	/*<![CDATA[*/

	jQuery(function($) {

		/* $('.myCheckBox').click(function() {
			var value = $(this).attr('value');
			if (value == 'true') {
				value = 'false';
			} else {
				value = 'true';
			}
			$(this).attr('value', value);
		}); */

		/*initExamQuestionIndex({
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
										}); */
	});
	/*]]>*/
</script>
