<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />




<div class="contentcontainer">
	<input type="hidden" id="specificExam" value="${specificExam}" />
	<div class="row">
		<div class="col12">

			<div class="ribbon">
				<p class="scorecount"></p>
				<p class="questioncount">Countdown</p>
				<p class="timecount"></p>
			</div>

			<div class="contentbox">
				<header>
					<h1 data-gogogo="GO! GO! GO!">Are you ready?</h1>
				</header>
				<div class="countdown">
					<strong class="counter">5</strong>
				</div>

			</div>

			<div class="bottombar">
				<div class="progresscontainer">
					<div class="progress">
						<span class="bar"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="getsat-widget-3590"></div>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var counter = 5;
						var $timeProgress = $('.progress > .bar');
						$timeProgress.css('width', '0%');

						var interval = setInterval(
								function() {
									counter--;
									$('.counter').toggleClass('blink');
									$('.counter').text(counter);

									var specificExam = $('#specificExam').attr(
											'value');

									if (counter == 0) {
										$('h1').text($('h1').data('gogogo'));
										if (specificExam == "") {
											window.location = '${pageContext.request.contextPath}/normal-question/${questionId}';
										} else {
											window.location = '${pageContext.request.contextPath}/all-question/${examId}';
										}

										clearInterval(interval);
										return;

									}
								}, 1000);

						var barProgress = counter * 40;
						var barTotal = barProgress;
						var barInterval = setInterval(
								function() {
									if (barProgress > 0) {
										--barProgress;

										var progress = ((barTotal - barProgress) / barTotal) * 100;
										$timeProgress.css('width', progress
												+ '%');

										var h = (89 - 2) * (progress / 100) + 2;
										var colors = hslToRgb(h, 1, 0.64);
										$timeProgress
												.parent()
												.css(
														'background-color',
														'rgb('
																+ colors
																		.join(',')
																+ ')');
									}

								}, 25);
					});
</script>
