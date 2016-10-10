<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>





<div class="header">
	<p class="activeuser">
		Logged in as ${pageContext.request.userPrincipal.name} | <a
			class="logout" href="${pageContext.request.contextPath}/logout">Logout</a>
	</p>
</div>
<div class="contentcontainer">
	<div class="row">
		<div class="col12">
			<div class="ribbon">
				<p class="scorecount"></p>
				<p class="questioncount">Result</p>
			</div>
			<div class="contentbox">
				<div class="examresult">
					<ol class="examquestions">
						<c:forEach var="questionAndListAnswerModel" items="${listModel}"
							varStatus="index">
							<li class="clearfix examquestion">
								<h2>${index.index+1}.
									${questionAndListAnswerModel.question.content}</h2>
								<ol class="examanswers clearfix">
									<c:forEach items="${questionAndListAnswerModel.listAnswer}"
										var="answerModel">
										<c:if
											test="${answerModel.fuck == 1 && answerModel.answer.right == false}">
											<li class="youranswer"><div class="clearfix">
													<span class="answer">${answerModel.answer.content}</span> <em>Your
														answer/ Scored 0 of the ${questionAndListAnswerModel.mark}
														point</em>
												</div></li>
										</c:if>
										<c:if
											test="${answerModel.fuck == 1 && answerModel.answer.right == true}">
											<li class="youranswer correct"><div class="clearfix">
													<span class="answer">${answerModel.answer.content}</span> <em>Your
														answer/ Scored ${questionAndListAnswerModel.realMark} of
														the ${questionAndListAnswerModel.mark} point</em>
												</div></li>
										</c:if>
										<c:if test="${answerModel.fuck == 0}">
											<li class=""><div class="clearfix">
													<span class="answer">${answerModel.answer.content}</span>
												</div></li>
										</c:if>
									</c:forEach>
								</ol>
						</c:forEach>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="getsat-widget-3590"></div>