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
				<p class="questioncount"></p>
				<p class="timecount"></p>
			</div>
			<div class="contentbox">
				<header>
					<h1>
						Your mark is <span>${totalMark}</span>
					</h1>
				</header>

				<table class="leaderboard">
					<caption></caption>
					<thead>
						<tr>
							<th>Position</th>
							<th>Player</th>
							<th class="rank"></th>
							<th class="scorebarheading"></th>
						</tr>
					</thead>
					<tbody>
						<tr class="scorerow odd rank1 myscore" id="myscore">
							<td class="rank td_rank"><span class="medal ir">1</span></td>
							<td class="td_player"><span class="rankname">${pageContext.request.userPrincipal.name}</span></td>
							<td class="td_score scorenumber"></td>
							<td class="scorebarcell"><div>
									<div>
										<span class="scorebar" style="width: 100%"><span></span></span>
									</div>
								</div></td>
						</tr>
						<tr class="myscoreinfo" id="topListmyscore">
							<td colspan="4">
								<h2>Good game well played, you've answered all the
									questions!</h2>
								<p class="position">You've answered ${answerRightCount}
									questions correctly of
								<p style="color: red">${questionCount}</p> questions.
								</p>
								<p style="color: red; font-size: 15">${result}!</p>
								<div class="row scoreactions">
									<div class="col12 last">
										<a class="button playagain"
											href="${pageContext.request.contextPath}/result/${answerSheetId}">View
											result &rsaquo;</a>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div id="getsat-widget-3590"></div>