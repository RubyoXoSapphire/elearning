<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
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
							<li><a href="${pageContext.request.contextPath}/account">My
									account</a>&rsaquo;</li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/edit-password">Edit
									password</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">
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
							<strong class="heading h3">My account</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>Change Password</h1>
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
									<li><a class="icon-user"
										href="${pageContext.request.contextPath}/account">My
											account</a></li>
									<li><a class="icon-vcard"
										href="${pageContext.request.contextPath}/edit-account">Edit
											my profile</a></li>
									<li class="hier open"><a class="icon-key"
										href="${pageContext.request.contextPath}/change-password">Edit
											password</a></li>
									<li><a class="icon-star"
										href="#/my-account/my-credits/item8114">My Credits</a></li>
									<li><a class="icon-box"
										href="#/my-account/my-subscriptions/item7642">My
											subscriptions</a></li>
									<li><a class="icon-cart"
										href="#/my-account/purchase-subscription/item7641">Purchase
											Subscription</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form class="quizsettings" id="editpasswordformmodel"
								action="${pageContext.request.contextPath}/change-password"
								method="post">
								<fieldset>
									<div>
										<label for="EditPasswordFormModel_password_old"
											class="required">Old Password &nbsp;<span
											class="required">*</span></label><input placeholder="Old Password"
											id="password" name="password" type="password"
											required="required" />
										<div class="errorMessage hide"
											id="EditPasswordFormModel_password_old_em_"></div>
									</div>
									<div class="required">
										<label for="EditPasswordFormModel_password" class="required">New
											Password&nbsp;<span class="required">*</span>
										</label><input placeholder="Password" id="newPassword"
											name="newPassword" type="password" required="required" />
										<div class="errorMessage hide"
											id="EditPasswordFormModel_password_em_"></div>
									</div>
									<div class="required">
										<label for="EditPasswordFormModel_password_repeat"
											class="required">Repeat Password&nbsp;<span
											class="required">*</span></label><input placeholder="Repeat password"
											id="repeatNewPassword" name="repeatNewPassword"
											type="password" required="required" />
										<div class="errorMessage hide"
											id="EditPasswordFormModel_password_repeat_em_"></div>
									</div>
									<div class="buttonrow">
										<input type="submit" id="submitButton" value="Change" />
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>












<script type="text/javascript">
	function check() {
		var newPassword = $('#newPassword').attr('value');
		var repeatNewPassword = $('#repeatNewPassword').attr('value');
		if (newPassword != repeatNewPassword) {

			$('#newPassword').attr('value', '');
			$('#repeatNewPassword').attr('value', '');

			$('#newPassword').focus();
			return false;
		} else {
			return true;
		}

	}
</script>