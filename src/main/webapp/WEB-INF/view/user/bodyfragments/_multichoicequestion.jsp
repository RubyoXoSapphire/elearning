<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
									<span class="questionid"></span> ${question.content}
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
									<li class=""><label> <span class="checkboxspan"
											style="background-color: white; color: black; border: 1px solid black"><input
												class="answervaluetemp" name="answerId" type="checkbox"
												value="${answer.answerId+''}" onclick="return false" />${answer.content}
										</span>
									</label> <span class="question-progress"></span></li>
								</c:forEach>
								<li class=""><label> <span id="acceptspan"
										style="text-align: center"> Accept </span>
								</label> <span class="question-progress"></span></li>
							</ul>
							<div class="errorMessage hide" id="QuizForm_answer_500701_em_"></div>
							<c:forEach var="answer" items="${question.answers}">
								<c:if test="${answer.right == true}">
									<input type="hidden" class="right" value="${answer.answerId}" />
								</c:if>
							</c:forEach>
						</fieldset>
					</form>
				</div>
				<div class="bottombar clearfix">

					<p>Time is RUNNING OUT!! Hahahaha, stupid!!</p>
					<a class="next" id="nextquestion" title="Next"
						href=""
						style="display: none;"><span class="arrow">›</span></a> <input
						type="hidden" value="${sessionScope.timeleft}" id="timeCountdown" />
					<p id="countdown"></p>
				</div>
			</div>
		</div>
	</div>
</div>






<script>
	
</script>



<script>
	jQuery.fn.countDown = function(settings, to) {
		settings = jQuery.extend({
			startFontSize : "36px",
			endFontSize : "12px",
			duration : 1000,
			startNumber : 30,
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
			$('#questioncontainer').submit();
		}
	});
</script>









<script>
	$.fn.hasAttr = function(name) {
		return this.attr(name) !== undefined;
	};
	$('.checkboxspan').click(function() {
		if ($(this).children('input').hasAttr('checked') == false) {
			$(this).css({
				"background-color" : "#8ec54c",
				"color" : "white"
			});
			$(this).children('.answervaluetemp').attr('checked', true);
		} else {
			$(this).css({
				"background-color" : "white",
				"color" : "black"
			});
			$(this).children('.answervaluetemp').removeAttr('checked');
		}
		return false;
	})

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
		var value = $('.right').val();
		if ($(this).find('input').attr('value') == value) {
			$(this).attr('class', 'pressed correct');
		} else {
			$(this).attr('class', 'pressed wrong');
		}
		$('#questioncontainer').submit();
	});
</script>

