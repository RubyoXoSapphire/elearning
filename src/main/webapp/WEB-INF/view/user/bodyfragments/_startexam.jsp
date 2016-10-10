<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>





<div class="contentcontainer">
	<div class="row">
		<div class="col12 quiztitle">
			<div class="contentbox">
				<header>
					<h1>${exam.name}</h1>
				</header>
				<div class="playbuttons">
					<div class="continue-playing">
						<a class="startquiz button continuecourse" href="${pageContext.request.contextPath}/loading/${exam.examId}"><strong>Start
								the exam</strong><span>&rsaquo;</span></a>
					</div>
					<div class="new-session">
						<a class="startquiz"
							href="${pageContext.request.contextPath}/loading/${exam.examId}"><strong>Start
								a new session</strong></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row col_intro">
		<div class="col12">
			<div class="contentbox">
				<div class="content">
					<div class="playbuttons">
						<div class="continue-playing">
							<a class="startquiz button continuecourse"
								href="${pageContext.request.contextPath}/loading/${exam.examId}"><strong>Start the exam</strong><span>&rsaquo;</span></a>
						</div>
						<div class="new-session">
							<a class="startquiz"
								href="${pageContext.request.contextPath}/loading/${exam.examId}"><strong>Start
									a new session</strong></a>
						</div>
					</div>
					<div class="intro" id="intro">${exam.notes}</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$('#intro').css('font-size', '16');
</script>
