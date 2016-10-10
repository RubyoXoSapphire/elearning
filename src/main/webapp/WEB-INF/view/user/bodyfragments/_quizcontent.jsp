<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />








<div class="contentcontainer">
	<div class="row">
		<div class="col12">
			<div id="quizcontainer" class="loading quizcontainer">
				<div class="scorechangebox scorechange">
					<strong id="scorechange" class="label_positive"></strong>
				</div>

				<div class="timechangebox scorechange scoreadd">
					<strong id="timechange" class="label_positive"></strong>
				</div>

				<div class="ribbon">
					<p class="scorecount">
						<span>Score</span> <strong id="score"></strong>
					</p>
					<p class="questioncount" id="questioncount"></p>
					<p class="timecount">
						<span>Time</span> <strong id="timeLeftover">1m 5s</strong>
					</p>
				</div>

				<div class="contentbox">
					<form id="questioncontainer"
						action="/site/index.php?r=quiz/answer&language=en"></form>
				</div>
				<div class="bottombar">
					<div class="progresscontainer">
						<div class="progress" id="timeColor"
							style="background-color: #caf977;">
							<span class="bar" id="timeProgress"></span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<div id="getsat-widget-3590"></div>
