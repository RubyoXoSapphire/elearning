<!DOCTYPE>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="shortcut icon" type="image/x-icon"
	href="data:image/x-icon;base64,AAABAAEAEBAAAAAAAABoAwAAFgAAACgAAAAQAAAAIAAAAAEAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Gx8bGx8bGx8bGx8bGx8bGx8bGx8bGx8bGx8bGx8bGx8bGx8b///////////8ACAAACAAACAAACAAACAAACAAACAAACAAACAAACAAACAAACADGx8b///////////8ACAD////////GhoyEAPfGhoz///////////////////8ACADGx8b///////////8ACAD////v196EAPeEAPeEAPf///////////////////8ACADGx8b///////////8ACAD///+EAPeEAPeEAPeEAPelQUr///////////////8ACADGx8b///////////8ACACEAPeEAPeEAPf35++EAPeEAPf35+////////////8ACADGx8b///////////8ACACEAPeEAPf///////+EAPeEAPeEAPf///////////8ACADGx8b///////////8ACAD///////////////////+EAPeEAPfOnpz///////8ACADGx8b///////////8ACAD////////////////////evr2EAPeEAPfv197///8ACADGx8b///////////8ACAD///////////////////////+1YWuEAPeEAPf35+8ACADGx8b///////////8ACAD///////////////////////////+EAPeEAPeEAPcACADGx8b///////////8ACAD///////////////////////////////+EAPeEAPcACADGx8b///////////8ACAAACAAACAAACAAACAAACAAACAAACAAACAAACAAACAAACAD///////////////////////////////////////////////////////////////////////////8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />

<title>All question</title>
<!--
	 Responsive Web Design is the most talked about topic nowadays. ResultFirst.com here gives you an insight on some basic terms related to Responsive Web Design. For more information, visit: http://www.resultfirst.com/design-and-development/	-->
<META Name="description"
	Content="Responsive Web Design is the most talked about topic nowadays. ResultFirst.com here gives you an insight on some basic terms related to Responsive Web Design. For more information, visit: http://www.resultfirst.com/design-and-development/">
<META Name="keywords"
	Content="Getting Closer With Responsive Web Design quizzes test quiz tests trivia">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>
	
</script>
<link rel="canonical"
	href="http://www.allthetests.com/quiz31/quiz/1398413084/Getting-Closer-With-Responsive-Web-Design" />
<meta name="DC.language" content="en">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Linked webfonts -->
<link
	href='https://fonts.googleapis.com/css?family=Quattrocento+Sans:400,700'
	rel='stylesheet' type='text/css'>


<!-- Stylesheets -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style3.css" />

<!--[if lte IE 8]>
			<link rel="stylesheet" type="text/css" href="/css/desktop.css" />
			<![endif]-->

<script src="/js/vendor/modernizr-2.6.2.min.js"></script>
<!-- Bestimme groesse vom fenster -->
</head>
<body>
	<div class="header">
		<p class="activeuser"
			style="float: right; margin-right: 200px; padding-top: 20px; margin-bottom: 0">
			Logged in as ${pageContext.request.userPrincipal.name} | <a
				class="logout" href="${pageContext.request.contextPath}/logout">Logout</a>
		</p>
	</div>
	<div class="clearfix"></div>
	<hr>
	<div id="clock"
		style="font-size: 200%; color: #707070; position: fixed; right: 8px; top: 0; text-align: center; background-color: white; padding: 20px 10px 0px 10px; border-radius: 0px 10px 0px 0px; padding-bottom: 20px; border: 1px dashed #E54B6B; border-top: 5px solid #E54B6B; border-left: 2px solid #E54B6B; margin-top: 20px; margin-right: 20px; padding-bottom: 20px;">
		<div id="clock-a">15 : 00</div>
		<hr>
		<div id="score"></div>
	</div>
	<div id="mainWrapper">
		<div id="contentArea">
			<section id="mainContent">
				<form:form
					action="${pageContext.request.contextPath}/exam-last-result"
					modelAttribute="temp" id="myForm">
					<c:forEach items="${questionAndListAnswerModelList}"
						var="questionAndListAnswerModel" varStatus="loop">
						<ul class="questions">
							<li>
								<div class="frage">
									<div class="number">${loop.index+1}</div>
									<fieldset>
										<form:hidden
											path="questionAndListAnswerModelList[${loop.index}].question.questionId" />
										<div>${questionAndListAnswerModel.question.content}</div>
									</fieldset>
									<c:if
										test="${not empty questionAndListAnswerModel.question.mediaUrl}">
										<iframe width="854" height="480"
											src="${questionAndListAnswerModel.question.mediaUrl}"
											frameborder="0" allowfullscreen=""
											style="margin-top: 20px; margin-left: 16px;"></iframe>
									</c:if>
								</div>
								<div class="antworten">
									<fieldset>
										<c:forEach var="answerModel"
											items="${questionAndListAnswerModel.listAnswer.answerModelList}"
											varStatus="loop2">
											<c:if
												test="${((loop2.index)%2!=0) && (questionAndListAnswerModelList[loop.index].question.type.typeId == 2)}">
												<div class="antwort1">
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].fuck"
														value="0" />
													<input type="checkbox" class="checkBoxForMulti" />
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].answer.answerId" />
													<span class="answer">${answerModel.answer.content}</span>
												</div>
											</c:if>
											<c:if
												test="${((loop2.index)%2==0) && (questionAndListAnswerModelList[loop.index].question.type.typeId == 2)}">
												<div class="antwort2">
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].fuck"
														value="0" class="checkBoxForMulti" />
													<input type="checkbox" class="checkBoxForMulti" />
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].answer.answerId" />
													<span class="answer">${answerModel.answer.content}</span>
												</div>
											</c:if>


											<c:if
												test="${((loop2.index)%2!=0)  && (questionAndListAnswerModelList[loop.index].question.type.typeId != 2)}">
												<div class="antwort1">
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].fuck"
														value="0" class="tambay" />
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].answer.answerId" />
													<input type="radio" class="selectedd"
														name="selectedd${loop.index}" /> <span class="answer">${answerModel.answer.content}</span>
												</div>
											</c:if>
											<c:if
												test="${((loop2.index)%2==0)  && (questionAndListAnswerModelList[loop.index].question.type.typeId != 2)}">
												<div class="antwort2">
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].fuck"
														value="0" class="tambay" />
													<form:hidden
														path="questionAndListAnswerModelList[${loop.index}].listAnswer.answerModelList[${loop2.index}].answer.answerId" />
													<input type="radio" class="selectedd"
														name="selectedd${loop.index}" /> <span class="answer">${answerModel.answer.content}</span>
												</div>
											</c:if>
										</c:forEach>
									</fieldset>
								</div>
							</li>
						</ul>
					</c:forEach>
					<input type=submit class="button" value="Test Results">
				</form:form>
				<div class="clear"></div>
				<p></p>
			</section>
		</div>
	</div>
	<footer> </footer>
	<!-- End page content -->

	<script>
		jQuery(document).ready(function(e) {
			function twoNumber(num) {
				if (num.toString().length === 1) {
					num = "0" + num;
				}
				return num;
			}
			var min = ${testMinute};
			var sec = 0;
			$('#clock').html(twoNumber(min) + " : " + twoNumber(sec));
			setInterval(function() {
				sec -= 1;
				if (sec < 0) {
					if (min > 0)
						min -= 1;
					sec = 59;
				}

				$('#clock').html(twoNumber(min) + " : " + twoNumber(sec));

				if (min === 0 && sec === 0) {
					$("#myForm").submit();
				}

			}, 1000);

			$('.answer').css("padding-top", "3px");
			$('.antwort1').css("padding-top", "25px");
			$('.antwort2').css("padding-top", "25px");
		});

		$('.selectedd').click(function() {
			$(this).parent().parent().find(".tambay").each(function() {
				$(this).val("0")
			});
			$(this).parent().children("input[type=hidden]").first().val("1");
		});

		$('.checkBoxForMulti').click(function() {
			var primaryCheckBox = $(this).parent().children("input").first();
			if (primaryCheckBox.attr('value') == 0) {
				primaryCheckBox.attr('value', '1');
			} else {
				primaryCheckBox.attr('value', '0');
			}
		});
	</script>
</body>
</html>