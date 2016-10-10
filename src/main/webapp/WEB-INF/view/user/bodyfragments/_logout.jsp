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
							<li class="first"><a href="${pageContext.request.contextPath}/home">Home</a>&rsaquo;</li>
							<li class="last hier"><a href="${pageContext.request.contextPath}/login">Login</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">
			<div data-alert="alert" class="alert-message alert ${not empty hasError ? 'error' : 'success'}">
				<a href="/log-in/item114?logout=1" class="close">&times;</a>
				<p>You just logged out.</p>
			</div>
			<div class="rowbox managecontainer nocols top-offset-30">
				<div class="row">
					<div class="col12">
						<div class="contentbox">
							<div class="contentbox header-contentbox">
								<div class="content-header">
									<h1>Login</h1>
								</div>
							</div>
							<a href="#/log-in/item114?fb=1&amp;redirect="
								class="facebbutton alignleft button">Facebook login</a>
							<form id="" action="j_spring_security_check" method="POST">
								<h2>Regular login</h2>
								<fieldset>
									<div class="required">
										<label for="LoginFormModel_email" class="required">Student
											ID&nbsp;<span class="required">*</span>
										</label><input placeholder="ID" id="user_id" name="user_id"
											type="text" value="TCH01" required="required" />
										<div class="errorMessage hide" id="LoginFormModel_email_em_"></div>
									</div>
									<div class="required">
										<label for="LoginFormModel_password" class="required">Password&nbsp;<span
											class="required">*</span></label><input placeholder="Password"
											id="password" name="password" type="password" value="12345"
											required="required" />
										<div class="errorMessage hide"
											id="LoginFormModel_password_em_"></div>
									</div>
								</fieldset>
								<p class="fpwlink">
									<a href="#/log-in/item114#" id="forgotpw">Oh no! I forgot
										my password!</a>
								</p>
								<input class="button" type="submit" name="submit" value="Login" />
							</form>
							<div id="forgotpwcontainer" class="hidden">
								<div>
									<h2>Forgot password</h2>
									<form id="forgotpasswordformmodel" action="/log-in/item114"
										method="post">
										<fieldset>
											<div class="required">
												<label for="ForgotPasswordFormModel_email" class="required">Email
													address&nbsp;<span class="required">*</span>
												</label><input id="ForgotPasswordFormModel_email"
													name="ForgotPasswordFormModel[email]" type="email"
													required="required" />
												<div class="errorMessage hide"
													id="ForgotPasswordFormModel_email_em_"></div>
											</div>
											<input class="button" type="submit" name="yt1"
												value="Send new password" />
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>








<script type="text/javascript">
	/*<![CDATA[*/
	window.fbAsyncInit = function() {
		FB.init({
			'appId' : '347511172074091',
			'version' : 'v2.2',
			'cookie' : true,
			'status' : true,
			'xfbml' : true,
			'frictionlessRequests' : false,
			'hideFlashCallback' : null
		});
	};

	jQuery(function($) {
		initLogin();
		jQuery('#forgotpasswordformmodel')
				.yiiactiveform(
						{
							'validateOnSubmit' : true,
							'afterValidate' : function(form, data, hasError) {
								if (hasError) {
									var errors = data;
									var i = 0;
									for (error in errors) {
										// focus op de eerste error
										if (i == 0) {

											var $input = $("#" + error, form);
											if (!$input.size()) {
												$input = $("#"
														+ error.replace(/_id/,
																""));
											}
											if ($input) {
												$(window)
														.scrollTop(
																$input
																		.parents(
																				":visible:first")
																		.offset().top);
												// Gebruik de omliggende container, zodat dit ook werkt bij bv het datumveld, die ipv het
												// hier gegeven inputid overal "_dag", "_maand" "_jaar" bij heeft.
											}

											if ($input.is("input")) {
												$input.focus();
											}
											break;
										}
									}
									return false;
								}
								return true;
							},
							'attributes' : [ {
								'id' : 'ForgotPasswordFormModel_email',
								'inputID' : 'ForgotPasswordFormModel_email',
								'errorID' : 'ForgotPasswordFormModel_email_em_',
								'model' : 'ForgotPasswordFormModel',
								'name' : 'email',
								'enableAjaxValidation' : false,
								'clientValidation' : function(value, messages,
										attribute) {

									if (jQuery.trim(value) == '') {
										messages
												.push("Email address cannot be blank.");
									}

									if (jQuery.trim(value) != ''
											&& !value
													.match(/^[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/)) {
										messages
												.push("Email address is not a valid email address.");
									}

								}
							} ],
							'errorCss' : 'error'
						});
	});
	/*]]>*/
</script>