<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>


<c:if test="${pageContext['request'].userPrincipal != null}">
	<div class="navbar mainnavbar">
		<div class="wrapper clearfix">
			<a class="qwlogo" href="${pageContext.request.contextPath}/home">
				<img
				src="${pageContext.request.contextPath}/resources/images/logo8.png"
				alt="Quizworks">
			</a>
			<nav class="langswitch">
				<button data-dropdown="language-select"
					aria-controls="language-select" aria-expanded="false"
					class="dropdown">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/flags/en.gif"
						alt="en"> English
				</button>
				<div id="language-select" data-dropdown-content=""
					class="f-dropdown" aria-hidden="true">
					<ul id="languageSwitch">
						<li id="languageSwitch_en" class="default active"><a
							title="English" href=""><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/en.gif"
								alt="en"> English</a></li>
						<li id="languageSwitch_nl" class=""><a title="Dutch"
							href="/nl/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/nl.gif"
								alt="nl"> Dutch</a></li>
						<li id="languageSwitch_it" class=""><a title="Italian"
							href="/it/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/it.gif"
								alt="it"> Italian</a></li>
						<li id="languageSwitch_de" class=""><a title="German"
							href="/de/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/de.gif"
								alt="de"> German</a></li>
						<li id="languageSwitch_es" class=""><a title="Spanish"
							href="/es/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/es.gif"
								alt="es"> Spanish</a></li>
						<li id="languageSwitch_pt" class=""><a title="Portuguese"
							href="/pt/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/pt.gif"
								alt="pt"> Portuguese</a></li>
						<li id="languageSwitch_da" class=""><a title="Danish"
							href="/da/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/da.gif"
								alt="da"> Danish</a></li>
						<li id="languageSwitch_no" class=""><a title="Norwegian"
							href="/no/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/no.gif"
								alt="no"> Norwegian</a></li>
						<li id="languageSwitch_ja" class=""><a title="Japanese"
							href="/ja/"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/ja.gif"
								alt="ja"> Japanese</a></li>
					</ul>
				</div>
			</nav>
			<a class="navlink" id="show-main-navigation" href="#"></a>
			<div class="mainnav navigation clearfix">
				<nav>
					<ul class="menu">
						<li class="hier"><a
							href="${pageContext.request.contextPath}/home">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/exams">Exam
								Software</a></li>
						<li><a href="${pageContext.request.contextPath}/features">Features</a></li>
						<li><a href="pageContext.request.contextPath}/terms">Terms</a></li>
						<li><a href="${pageContext.request.contextPath}/help">Help</a></li>
						<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="navbar menubar" style="position: relative;">
		<div class="wrapper clearfix">
			<div class="row">
				<div class="col8">
					<div class="dashtabs">
						<a class="navlink" id="show-quizmaster-navigation" href="#"></a>
						<div class="contentbox">
							<div class="subnav navigation">
								<nav>
									<ul class="menu level1">
										<li class="first haschildren"><a
											href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/quizzes">Quizzes</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/register-class">Register
												class</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/exams">Exams</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/courses">Courses</a></li>
										<li><a href="/my-dashboard/reporting/item10079">Reporting</a></li>
										<li class="last haschildren"><a
											href="${pageContext.request.contextPath}/account">User
												overview</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="col4 last">
					<div class="accountbar">
						<div class="loggedinas floatright dropdownify alignright">
							<strong class="dropdowntitle" id="dropdowntitle"> <img
								alt="" class="gravatar"
								src="//www.gravatar.com/avatar/aaa3b4d7458897e91a3d41cf11ffb08f?s=24&amp;d=https%3A%2F%2Fd134jvmqfdbkyi.cloudfront.net%2Fimages%2Fempty.gif&amp;r=">
								<security:authentication property="principal.username" />
							</strong>
							<ul class="dropdownblock hide">
								<li><a href="${pageContext.request.contextPath}/account"
									class="myaccount">My account</a></li>
								<li><a class="${pageContext.request.contextPath}/logout"
									href="/logout">Logout</a></li>
							</ul>
						</div>
					</div>

					<div id="account_menu" style="display: block;">
						<span class="arrow"></span>
						<div style="clear: both; overflow: hidden; background: #fff;">
							<div class="useremail">
								<div
									style="font-size: 11px; overflow: hidden; font-weight: normal; padding-bottom: 3px;">
									Welcome,
									<security:authentication property="principal.username" />
									!
								</div>
								<a href="javascript:void(0)" class="profile-verify-button"
									style="padding: 0 !important; position: relative;">
									<div
										style="height: 18px; background: #ccc; margin: 0px; position: relative;">
										<div
											style="border-radius: 0; position: absolute; background: #f58552; width: 30%; float: left; top: 0; left: 0; height: 18px;"></div>
									</div>
									<div
										style="color: #fff; padding-left: 5px; top: 0; left: 0; font-size: 10px; text-shadow: none; font-weight: normal; position: absolute;">
										<!-- <b>30%</b> xác thực -->
									</div>
								</a>
							</div>
							<div>
								<a class="headerlabel"
									href="${pageContext.request.contextPath}/exams"> <i
									class="fa fa-plus-square"></i> Exams
								</a>
							</div>
							<%-- <div>
								<a href="${pageContext.request.contextPath}/exams"> <span
									style="float: left; font-size: 12px; color: #333; padding: 0;">
										Exam count</span> <span>${sessionScope.examCount}</span></a>
							</div> --%>
							<div style="border-top: #eee 1px solid; clear: both;">
								<a href="${pageContext.request.contextPath}/quizzes"
									class="headerlabel"> <i class="fa fa-bookmark"></i> Quizzes
								</a>
							</div>
							<%-- <div>
								<a href="/thanh-vien/booooom_ohlala/lists"> <span
									style="float: left; font-size: 12px; color: #333; padding: 0;">Quiz
										count</span> <span>${sessionScope.quizCount}</span></a>
							</div> --%>
							<div style="border-top: #eee 1px solid; clear: both;">
								<a class="headerlabel"
									href="${pageContext.request.contextPath}/account"> <i
									class="fa fa-user"></i> Account
								</a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/account">Account
									information </a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/edit-account"> <span
									style="float: left; font-size: 12px; color: #333; padding: 0;">Edit
										account</span> <span
									style="background: none; padding: 0; color: #333; font-size: 12px;"></span></a>
							</div>
							<div>
								<a href=""> <span
									style="float: left; font-size: 12px; color: #333; padding: 0;">Role</span>
									<span
									style="background: none; padding: 0; color: #fc9551; font-size: 12px;"><b><c:out
												value="${sessionScope.myRole}" /></b></span></a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/change-password">Change
									password </a>
							</div>
							<div
								style="margin-top: 5px; border-top: #eee 1px solid; padding-top: 5px;">
								<a href="${pageContext.request.contextPath}/logout"
									class="register">Logout</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</c:if>






<c:if test="${pageContext['request'].userPrincipal == null}">
	<div class="navbar mainnavbar">
		<div class="wrapper clearfix">
			<a class="qwlogo" href="${pageContext.request.contextPath}/home">
				<img
				src="${pageContext.request.contextPath}/resources/images/logo8.png"
				alt="Exam Builder" />
			</a>
			<nav class="langswitch">
				<button data-dropdown="language-select"
					aria-controls="language-select" aria-expanded="false"
					class="dropdown">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/flags/en.gif"
						alt="en" /> English
				</button>
				<div id="language-select" data-dropdown-content class="f-dropdown"
					aria-hidden="true">
					<ul id="languageSwitch">
						<li id="languageSwitch_en" class="default active"><a
							title="English" href="#/my-dashboard/item3239?id=114"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/en.gif"
								alt="en" /> English</a></li>
						<li id="languageSwitch_nl" class=""><a title="Dutch"
							href="#/nl/mijn-dashboard/item3239?id=114"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/nl.gif"
								alt="nl" /> Dutch</a></li>
						<li id="languageSwitch_de" class=""><a title="German"
							href="#/de/dashboard/item3239?id=114"><img
								src="${pageContext.request.contextPath}/resources/images/icons/flags/de.gif"
								alt="de" /> German</a></li>
					</ul>
				</div>
			</nav>
			<a class="navlink" id="show-main-navigation"
				href="#/my-dashboard/item3239#"></a>
			<div class="mainnav navigation clearfix">
				<nav>
					<ul class="menu">
						<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/exams">Exam
								Software</a></li>
						<li><a href="${pageContext.request.contextPath}/features">Features</a></li>
						<li><a href="pageContext.request.contextPath}/terms">Terms</a></li>
						<li><a href="${pageContext.request.contextPath}/help">Help</a></li>
						<li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="navbar menubar">
		<div class="wrapper clearfix">
			<div class="row">
				<div class="col8">
					<div class="dashtabs">
						<a class="navlink" id="show-quizmaster-navigation"
							href="#/my-dashboard/item3239#"></a>
						<div class="contentbox">
							<div class="subnav navigation">
								<nav>
									<ul class="menu level1">
										<li class="first hier haschildren"><a
											href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/quizzes">Quizzes</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/register-class">Register
												class</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/exams">Exams</a></li>
										<li class="haschildren"><a
											href="${pageContext.request.contextPath}/courses">Courses</a></li>
										<li><a href="#/my-dashboard/reporting/item10079">Reporting</a></li>
										<li class="last haschildren"><a
											href="${pageContext.request.contextPath}/account">User
												overview</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="col4 last">
					<div class="accountbar">
						<div class="loggedinas floatright dropdownify alignright">
							<strong class="dropdowntitle" id="dropdowntitle"> <img
								alt="" class="gravatar"
								src="//www.gravatar.com/avatar/aaa3b4d7458897e91a3d41cf11ffb08f?s=24&amp;d=https%3A%2F%2Fd134jvmqfdbkyi.cloudfront.net%2Fimages%2Fempty.gif&amp;r=" />
								RubyoXoSapphire
							</strong>
							<ul class="dropdownblock hide">
								<li><a href="${pageContext.request.contextPath}/account"
									class="myaccount">My account</a></li>
								<li><a class="logout"
									href="${pageContext.request.contextPath}/logout">Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>

<script>
	$(document).ready(function() {
		$("#account_menu").css("margin-right", "60px");
		$("#account_menu").hide();

		$("#dropdowntitle").click(function() {
			$("#account_menu").toggle();
		});

		$("#account_menu").mouseup(function() {
			return !1
		});
	});
</script>

