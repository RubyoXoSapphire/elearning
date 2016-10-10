<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>






<div class="contentcontainer">
	<div class="row">
		<div class="col12 exam">
			<div id="quizcontainer" class="quizcontainer">
				<div class="ribbon">
					<p class="scorecount"></p>
					<p class="questioncount" id="questioncount">Have
						${sessionScope.examQuestionList.size()+1} question left</p>
				</div>
				<div class="contentbox">
					<form id="questioncontainer"
						action="${pageContext.request.contextPath}/normal-question"
						method="post">
						<fieldset class="autosubmit">
							<header>
								<h1>
									<span class="questionid"></span>${question.content}
								</h1>
								<input type="hidden" name="questionId" value=${questionId } />
							</header>
							<div class="media-youtube">
								<div class="fluidvids">
									<iframe width="699" height="420" src="${question.mediaUrl}"
										frameborder="0" allowfullscreen
										style="padding-bottom: 30px; margin-left: 70"></iframe>
								</div>
							</div>
							<ul class="answers answersexam">
								<c:forEach var="answer" items="${question.answers}">
									<li class=""><label> <span> <input
												id="answer_0" name="answerId" type="radio"
												value="${answer.answerId}">${answer.content}
										</span>
									</label> <span class="question-progress"></span></li>
								</c:forEach>
							</ul>
							<div class="errorMessage hide" id="QuizForm_answer_500702_em_"></div>
							<c:forEach var="answer" items="${question.answers}">
								<c:if test="${answer.right == true}">
									<input type="hidden" id="isRight" value="${answer.answerId}" />
								</c:if>
							</c:forEach>
						</fieldset>
					</form>
				</div>
				<div class="bottombar clearfix">

					<p>Time is RUNNING OUT!! Hahahaha, stupid!!</p>
					<a class="next" id="nextquestion" title="Next"
						href="https://www.onlineexambuilder.com/hoc-ky-1/exam-63026#"
						style="display: none;"><span class="arrow">›</span></a> <input
						type="hidden" value="${sessionScope.timeleft}" id="timeCountdown" />
					<p id="countdown"></p>
				</div>
			</div>
		</div>
	</div>
</div>






<script>
	jQuery.fn.countDown = function(settings, to) {
		settings = jQuery.extend({
			startFontSize : "36px",
			endFontSize : "12px",
			duration : 1000,
			startNumber : 10,
			endNumber : 0,
			callBack : function() {
			}
		}, settings);
		return this.each(function() {

			//where do we start?
			if (!to && to != settings.endNumber) {
				to = settings.startNumber;
			}

			//set the countdown to the starting number
			jQuery(this).text(to).css("fontSize", settings.startFontSize);

			//loopage
			jQuery(this).animate(
					{
						fontSize : settings.endFontSize
					},
					settings.duration,
					"",
					function() {
						if (to > settings.endNumber + 1) {
							jQuery(this)
									.css("fontSize", settings.startFontSize)
									.text(to - 1).countDown(settings, to - 1);
						} else {
							settings.callBack(this);
						}
					});
		});
	};

	jQuery("#countdown").countDown({
		startNumber : $('#timeCountdown').val(),
		callBack : function(me) {
			/* jQuery(me).text(
					"All done! This is where you give the reward!")
					.css("color", "#090"); */
			/* $('#answer_0').attr('value', 0); */
			$('#questioncontainer').submit();
		}
	});
</script>









<script>
	$('.answers.answersexam').children("li").hover(function() {
		$(this).attr('class', 'hover');
	}, function() {
		$(this).attr('class', '');
	});

	function countdown() {
		var timeCountdown = $('#timeCountdown').val();

	}

	$('.answers.answersexam').children("li").click(function() {
		$(this).attr('class', '');
	});

	$('.answers.answersexam').children("li").click(function() {
		var value = $('#isRight').val();
		if ($(this).find('input').attr('value') == value) {
			$(this).attr('class', 'pressed correct');
		} else {
			$(this).attr('class', 'pressed wrong');
		}
		$('#questioncontainer').submit();
	});
</script>

<!-- <script>
	$(document).ready(function() {
		$.ajax({
			url : "loading",
			type : "get",
			dataType : "html",
			data : {},
			success : function(result) {
				$('#ajax_content').html(result);
			}
		})
	});
</script> -->