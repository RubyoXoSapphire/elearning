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
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/courses">Courses</a></li>
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
							<strong class="heading h3">Course</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row" id="semesterDiv">
							<div class="col5">
								<div class="contentbox noLeftPadding noBottomPadding">
									<div class="richtextfield">
										<label for="ExamQuestionModel_question">Semester</label>
										<form action="${pageContext.request.contextPath}/courses"
											method="post" id="form_semester">
											<select name="semesterId" id="semester_div">
												<option value="${currentSemester.semesterId}">${currentSemester.name}
													(From ${currentSemester.beginDate} To
													${currentSemester.endDate})</option>
												<option value="${currentSemester.semesterId}"
													disabled="disabled">------</option>
												<c:forEach items="${semesterList}" var="mySemester">
													<option value="${mySemester.semesterId}">${mySemester.name}
														(From ${mySemester.beginDate} To ${mySemester.endDate})</option>
												</c:forEach>
											</select>
										</form>
									</div>
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
										href="${pageContext.request.contextPath}/courses">Courses</a></li>
									<li><a class="icon-chart-line"
										href="#/my-dashboard/courses/reporting/item10107">Reporting</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form class="quicknewquiz quizsettings" id="newcourseformmodel"
								action="/my-dashboard/courses/item10012" method="post">
								<fieldset>
									<div id="formdiv">
										<div class="required">
											<label for="NewCourseFormModel_title" class="required">Title
												of your course&nbsp;<span class="required">*</span>
											</label><input placeholder="Title of your course"
												id="NewCourseFormModel_title"
												name="NewCourseFormModel[title]" type="text" />
											<div class="errorMessage hide"
												id="NewCourseFormModel_title_em_"></div>
										</div>
									</div>
								</fieldset>
							</form>
							<table class="items table">
								<thead>
									<tr>
										<th id="yw0_c0">Number</th>
										<th id="yw0_c1">Class Name</th>
										<th id="yw0_c1">Subject</th>
										<th class="button-column" id="yw0_c2">&nbsp;</th>
									</tr>
								</thead>
								<c:set var="index" value="0" />
								<tbody>
									<c:forEach var="myClass" items="${classList}" varStatus="i">
										<tr class="items[]_500702">
											<td>${(i.index)+1}</td>
											<td>${myClass.name}</td>
											<td>${myClass.subject.name}</td>
											<td class="button-column"><a class="update"
												title="See detail"
												href="${pageContext.request.contextPath}/class-detail/${myClass.classId}">See
													detail</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>







<script>
	$('#semesterDiv').css('margin-bottom', '8px');
</script>






<script>
	$('#semester_div').change(function() {
		var selectvalue = $('#semester_div').val();
		$('#form_semester').submit();
	});
</script>






<script type="text/javascript">
	/*<![CDATA[*/

	jQuery(function($) {

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

		jQuery('#newcourseformmodel')
				.yiiactiveform(
						{
							'validateOnSubmit' : true,
							'afterValidate' : function(form, data, hasError) {
								if (hasError) {
									var errors = data;
									var i = 0;
									for (error in errors) {
										// focus op de eerste error
										if (i == 0) {

											var $input = $("#" + error, form);
											if (!$input.size()) {
												$input = $("#"
														+ error.replace(/_id/,
																""));
											}
											if ($input) {
												$(window)
														.scrollTop(
																$input
																		.parents(
																				":visible:first")
																		.offset().top);
												// Gebruik de omliggende container, zodat dit ook werkt bij bv het datumveld, die ipv het
												// hier gegeven inputid overal "_dag", "_maand" "_jaar" bij heeft.
											}

											if ($input.is("input")) {
												$input.focus();
											}
											break;
										}
									}
									return false;
								}
								return true;
							},
							'attributes' : [ {
								'id' : 'NewCourseFormModel_title',
								'inputID' : 'NewCourseFormModel_title',
								'errorID' : 'NewCourseFormModel_title_em_',
								'model' : 'NewCourseFormModel',
								'name' : 'title',
								'enableAjaxValidation' : false,
								'clientValidation' : function(value, messages,
										attribute) {

									if (jQuery.trim(value) == '') {
										messages
												.push("Title of your course cannot be blank.");
									}

								}
							} ],
							'errorCss' : 'error'
						});
	});
	/*]]>*/
</script>