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
							<li><a href="${pageContext.request.contextPath}/courses">Hoc
									Ky 1</a>&rsaquo;</li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}">Add exam</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">s
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
										href="${pageContext.request.contextPath}/add-exam">Add
											exam</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form:form class="quizsettings" id="exammodel"
								action="${pageContext.request.contextPath}/add-exam"
								method="post" modelAttribute="exam">
								<div class="masterfield">
									<fieldset>
										<c:set var="nameHasBindError">
											<form:errors path="name" />
										</c:set>
										<div
											class="required ${not empty nameHasBindError? 'error' : ''} ">
											<div class="tooltip popleft">
												<p>Title of exam</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_title" class="required">Exam
												title&nbsp;<span class="required">*</span>
											</label>
											<form:input placeholder="Exam title" id="ExamModel_title"
												name="ExamModel[title]" type="text" maxlength="200"
												value="${examName}" path="name" />
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;">
												<form:errors path="name" />
											</div>
										</div>
										<div class="selectfield">
											<c:set var="subjectHasBindError">
												<form:errors path="subject" />
											</c:set>
											<div
												class="required ${not empty subjectHasBindError? 'error' : ''} ">
												<div class="tooltip popleft">
													<p>Choose the subject of exam.</p>
													<img
														src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
														alt="" />
												</div>
												<label for="ExamModel_subject">Subject <span
													class="required">*</span></label>
												<form:select path="subject">
													<option value="${exam.subject.subjectId}"
														selected="selected">${exam.subject.name}</option>
													<option value="${exam.subject.subjectId}"
														disabled="disabled">------</option>
													<c:forEach var="subjectTemp" items="${subjectList}">
														<option value="${subjectTemp.subjectId}">${subjectTemp.name}</option>
													</c:forEach>
												</form:select>
												<div class="errorMessage hide" id="ExamModel_title_em_"
													style="display: block;">
													<form:errors path="subject" />
												</div>
											</div>

										</div>
										<div class="richtextfield">
											<div class="tooltip popleft">
												<p>Exam Source</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_intro">Exam Source</label>
											<c:if test="${not empty exam.exam}">
												<input placeholder="Exam Source" id="ExamModel_title"
													name="ExamModel[title]" type="text" maxlength="200"
													value="${exam.exam.name}" readonly />
												<input type="hidden" name="examSourceId"
													value="${exam.exam.examId}" />
											</c:if>
											<c:if test="${empty exam.exam}">
												<input placeholder="Exam Source" id="ExamModel_title"
													name="ExamModel[title]" type="text" maxlength="200"
													value="--None--" readonly>
											</c:if>
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div class="richtextfield">
											<div class="tooltip popleft">
												<p>Text on introduction page</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_intro">Introduction</label>
											<form:textarea rows="7" cols="65" placeholder="Introduction"
												name="ExamModel[intro]" path="notes"></form:textarea>
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div class="selectfield">
											<label for="ExamModel_taal">language</label><select
												id="ExamModel_taal" name="ExamModel[taal]">
												<option value="nl">Dutch</option>
												<option value="en" selected="selected">English</option>
												<option value="fr">French</option>
												<option value="it">Italian</option>
												<option value="de">German</option>
												<option value="es">Spanish</option>
												<option value="sk">Slovak</option>
												<option value="fi">Finnish</option>
												<option value="pt">Portuguese</option>
												<option value="no">Norwegian</option>
												<option value="mk">Macedonian</option>
												<option value="hu">Hungarian</option>
												<option value="el">Greek</option>
												<option value="ja">Japanese</option>
												<option value="lt">Lithuanian</option>
												<option value="sl">Slovenian</option>
												<option value="da">Danish</option>
												<option value="pl">Polish</option>
											</select>
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div>
											<div class="tooltip popleft">
												<p>The text that will be shown on the start button for
													this exam</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_start_button_text">Start exam
												button text</label><input placeholder="Start exam button text"
												id="ExamModel_start_button_text"
												name="ExamModel[start_button_text]" type="text"
												value="Start test" />
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<c:set var="markMaxHasBindError">
											<form:errors path="markMax" />
										</c:set>
										<div
											class="required ${not empty markMaxHasBindError? 'error' : '' } ">
											<div class="tooltip popleft">
												<p>Max mark</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="">
											</div>
											<label for="ExamModel_mark_max" class="required">Max
												mark&nbsp; </label>
											<form:input placeholder="Exam mark_max"
												id="ExamModel_mark_max" name="ExamModel[mark_max]"
												type="number" maxlength="3" path="markMax"
												value="${markMax}" />
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;">
												<form:errors path="markMax" />
											</div>
											<form:hidden path="passMark" value="${exam.passMark}" />
										</div>
										<div class="selectfield">
											<div class="tooltip popleft">
												<p>Choose the type of exam you want to create.</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_type">Exam type</label>
											<form:select id="ExamModel_type" name="ExamModel[type]"
												path="type">
												<c:if test="${exam.type==0}">
													<option value="0" selected="selected">User can
														change answers</option>
												</c:if>
												<c:if test="${exam.type==1}">
													<option value="1" selected="selected">User cannot
														change answers</option>
												</c:if>
												<c:if test="${exam.type==2}">
													<option value="2" selected="selected">User can see
														the correct answer after answering a question</option>
												</c:if>
												<c:if test="${exam.type==3}">
													<option value="3" selected="selected">User has
														multiple attempts per question</option>
												</c:if>
												<c:if test="${exam.type==4}">
													<option value="4" selected="selected">All
														questions are shown on a single page (beta)</option>
												</c:if>
												<c:if test="${exam.type==5}">
													<option value="5" selected="selected">Users can
														skip questions</option>
												</c:if>

												<option value="${exam.type}" disabled="disabled">---------------</option>

												<option value="0">User can change answers</option>
												<option value="5">Users can skip questions</option>
												<option value="1">User cannot change answers</option>
												<option value="2">User can see the correct answer
													after answering a question</option>
												<option value="3">User has multiple attempts per
													question</option>
												<option value="4">All questions are shown on a
													single page (beta)</option>
											</form:select>
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div class="required">
											<div class="tooltip popleft">
												<p>How many attempts does an exam-taker get?</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_number_of_attempts" class="required">Number
												of attempts per question&nbsp;<span class="required">*</span>
											</label><input placeholder="Number of attempts per question"
												id="ExamModel_number_of_attempts"
												name="ExamModel[number_of_attempts]" type="number" value="1" />
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div class="selectfield">
											<div class="tooltip popleft">
												<p>Choose the type of time limit you want your exam to
													have.</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_time_limit">Specific <span
												class="required">*</span></label>
											<form:select id="ExamModel_time_limit"
												name="ExamModel[time_limit]" path="specificExam">
												<c:if test="${empty exam.specificExam}">
													<option value="Quiz" selected="selected">Quiz</option>
												</c:if>
												<c:if test="${not empty exam.specificExam}">
													<option value="${exam.specificExam}" selected="selected">${exam.specificExam}</option>
												</c:if>
												<option disabled="disabled">-----</option>
												<option value="Quiz">Quiz</option>
												<option value="Exam">Exam</option>
											</form:select>
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div id="StartDateTimeBlock">
											<c:set var="testDateTimeBeginHasBindError">
												<form:errors path="testDatetimeBegin" />
											</c:set>
											<div
												class="required ${not empty testDateTimeBeginHasBindError? 'error' : ''}">
												<div class="tooltip popleft">
													<p>Start date (UTC Time)</p>
													<img
														src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
														alt="">
												</div>
												<label for="ExamModel_date_start">Start date (UTC
													Time)<span class="required">*</span>
												</label>
												<form:input path="testDatetimeBegin" class="datetimepicker"
													data-date-format="yyyy-MM-dd hh:mm:ss" />
												<div class="errorMessage hide" id="ExamModel_title_em_"
													style="display: block;">
													<form:errors path="testDatetimeBegin" />
												</div>
											</div>
										</div>
										<div id="TimeLimitBlock">
											<c:set var="testMinuteHasBindError">
												<form:errors path="testMinute" />
											</c:set>
											<div
												class="required ${not empty testMinuteHasBindError? 'error' : ''}">
												<div class="tooltip popleft">
													<p>Time for the exam (in minutes).</p>
													<img
														src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
														alt="" />
												</div>
												<label for="ExamModel_time">Time (m) <span
													class="required">*</span></label>
												<form:input placeholder="Time (s)" id="ExamModel_time"
													name="ExamModel[time]" type="number" path="testMinute" />
												<div class="errorMessage hide" id="ExamModel_title_em_"
													style="display: block;">
													<form:errors path="testMinute" />
												</div>
											</div>
										</div>
										<div class="richtextfield">
											<div class="tooltip popleft">
												<p>Enabled</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_intro" style="margin-top: -10px;">Enabled
												<span class="required">*</span>
											</label>

											<c:if test="${exam.enabled==1}">
												<div class="radiobuttonfield" data-field="correct_1">
													<label> True <form:radiobutton name="enabled"
															id="enabled" value="1" path="enabled"
															class="myRadioButton" checked="checked" />
													</label> <label> False <form:radiobutton name="enabled"
															class="myRadioButton" id="enabled" value="0"
															path="enabled" />
													</label>
												</div>
											</c:if>
											<c:if test="${exam.enabled==0}">
												<div class="radiobuttonfield" data-field="correct_1">
													<label> True <form:radiobutton name="enabled"
															class="myRadioButton" id="enabled" value="1"
															path="enabled" />
													</label> <label> False <form:radiobutton name="enabled"
															class="myRadioButton" id="enabled" value="0"
															path="enabled" checked="checked" />
													</label>
												</div>
											</c:if>
											<form:errors path="enabled" />
											<div class="errorMessage hide" id="ExamModel_title_em_"
												style="display: block;"></div>
										</div>
										<div class="buttonrow border_top">
											<button class="button" type="submit" name="setting_tab">Save</button>
										</div>
									</fieldset>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>










<script>
	$('#TimeLimitBlock').css('display', 'none');
	$('#StartDateTimeBlock').css('display', 'none');

	var selectvalue = $('#ExamModel_time_limit').val();
	if (selectvalue == "Quiz") {
		$('#TimeLimitBlock').slideUp();
		$('#StartDateTimeBlock').slideUp();
	} else {
		$('#StartDateTimeBlock').slideDown();
		$('#TimeLimitBlock').slideDown();
	}

	$('#ExamModel_time_limit').change(function() {
		var selectvalue = $('#ExamModel_time_limit').val();
		if (selectvalue == "Quiz") {
			$('#TimeLimitBlock').slideUp();
			$('#StartDateTimeBlock').slideUp();
		} else {
			$('#StartDateTimeBlock').slideDown();
			$('#TimeLimitBlock').slideDown();
		}
	});

	tinymce.init({
		selector : 'textarea'
	});

	$('.myRadioButton').css({
		'height' : '18px',
		'width' : '18px'
	})
</script>








<script>
	/*
	window.onerror = function(errorMsg) {
	$('#console').html($('#console').html()+'<br>'+errorMsg)
	}*/

	$.datetimepicker.setLocale('en');

	$('.datetimepicker').datetimepicker({
		dayOfWeekStart : 1,
		lang : 'en',
		disabledDates : [ '1986/01/08', '1986/01/09', '1986/01/10' ],
		startDate : $('.datetimepicker').attr('value'),
		format:"Y-m-d H:i"
	});
	/* 	$('#datetimepicker').datetimepicker({
	 value : $('#datetimepicker').attr('value'),
	 step : 10
	 }); */
</script>
