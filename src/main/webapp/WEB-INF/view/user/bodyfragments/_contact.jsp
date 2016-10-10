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
							<li class="last hier"><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">
			<div class="wrapper clearfix">
				<div class="rowbox">
					<div class="row">
						<div class="col8 content">

							<h1>Contact</h1>
							<div class="intro">
								<p>
									Quizworks is a company specialized in the creation of online
									quizzes and education technology. We&rsquo;re a team&nbsp;of
									education-specialist, psychologists and technology experts.
									Check out everything we do on our super <a
										href="#">corporate
										website</a>. You'll be impressed by the image of professionality
									we are able to convey!
								</p>
							</div>
							<p>Do you have question? Do you want a custom feature or a
								custom tool especially for you? A whitelabel quiztool or
								learning management system? Just send us an email with the form
								below.</p>
							<p>
								Are you looking for support? We're <a href="#/help/item10021"
									data-uv-trigger="">right here</a>.
							</p>
							<form class="form-vertical" id="contactformmodel"
								action="/contact/item4" method="post">
								<fieldset>
									<div class="required">
										<label for="ContactFormModel_name" class="required">Name&nbsp;<span
											class="required">*</span></label><input placeholder="Name"
											id="ContactFormModel_name" name="ContactFormModel[name]"
											type="text" />
										<div class="errorMessage hide" id="ContactFormModel_name_em_"></div>
									</div>
									<div class="required">
										<label for="ContactFormModel_email" class="required">Email
											address&nbsp;<span class="required">*</span>
										</label><input placeholder="Email address" id="ContactFormModel_email"
											name="ContactFormModel[email]" type="email" />
										<div class="errorMessage hide" id="ContactFormModel_email_em_"></div>
									</div>
									<div>
										<label for="ContactFormModel_phone">Phone number</label><input
											placeholder="Phone number" id="ContactFormModel_phone"
											name="ContactFormModel[phone]" type="text" />
										<div class="errorMessage hide" id="ContactFormModel_phone_em_"></div>
									</div>
									<div class="required">
										<label for="ContactFormModel_question" class="required">Question
											or Remark&nbsp;<span class="required">*</span>
										</label>
										<textarea rows="5" cols="65" placeholder="Question or Remark"
											id="ContactFormModel_question"
											name="ContactFormModel[question]"></textarea>
										<div class="errorMessage hide"
											id="ContactFormModel_question_em_"></div>
									</div>
									<div class="captchafield required">
										<label for="ContactFormModel_captcha" class="required">Enter
											the following code&nbsp;<span class="required">*</span>
										</label><img id="yw0"
											src="/site/index.php?r=site/captcha&amp;v=56d947b568dd3&amp;mode=0&amp;language=en"
											alt="" /><input placeholder="Enter the following code"
											id="ContactFormModel_captcha"
											name="ContactFormModel[captcha]" type="text" />
										<div class="errorMessage hide"
											id="ContactFormModel_captcha_em_"></div>
									</div>
								</fieldset>
								<p>
									<input type="submit" name="yt0" value="Send" />
								</p>
							</form>
						</div>
						<div class="col4 last"></div>
					</div>
				</div>
			</div>

			<div class="contentbox createquiz customquizcta">
				<p>
					<strong>Need a custom quiz?</strong><br />Take a look at the <a
						onclick="_gaq.push(['_trackEvent','cta','click-possibilites', 'cta-footer']);"
						href="http://pricing.onlinequizcreator.com">possibilities</a> or
					send us an <a onclick="" href="#/contact/item4">email</a>.
				</p>
			</div>

		</div>
	</div>
</div>


















<script type="text/javascript">
	/*<![CDATA[*/

	jQuery(function($) {
		jQuery('#yw0')
				.after(
						"<p class=\"captchafresh\"><a id=\"yw0_button\" href=\"\/site\/index.php?r=site\/captcha&amp;refresh=1&amp;mode=0&amp;language=en\">Get a new code<\/a><\/p>");
		jQuery('#yw0_button')
				.live(
						'click',
						function() {
							jQuery
									.ajax({
										url : "\/site\/index.php?r=site\/captcha&refresh=1&mode=0&language=en",
										dataType : 'json',
										cache : false,
										success : function(data) {
											jQuery('#yw0').attr('src',
													data['url']);
											jQuery('body').data(
													'captcha.hash',
													[ data['hash1'],
															data['hash2'] ]);
										}
									});
							return false;
						});

		jQuery('#contactformmodel')
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
							'attributes' : [
									{
										'id' : 'ContactFormModel_name',
										'inputID' : 'ContactFormModel_name',
										'errorID' : 'ContactFormModel_name_em_',
										'model' : 'ContactFormModel',
										'name' : 'name',
										'enableAjaxValidation' : false,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Name cannot be blank.");
											}

										}
									},
									{
										'id' : 'ContactFormModel_email',
										'inputID' : 'ContactFormModel_email',
										'errorID' : 'ContactFormModel_email_em_',
										'model' : 'ContactFormModel',
										'name' : 'email',
										'enableAjaxValidation' : false,
										'clientValidation' : function(value,
												messages, attribute) {

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
									},
									{
										'id' : 'ContactFormModel_phone',
										'inputID' : 'ContactFormModel_phone',
										'errorID' : 'ContactFormModel_phone_em_',
										'model' : 'ContactFormModel',
										'name' : 'phone',
										'enableAjaxValidation' : false
									},
									{
										'id' : 'ContactFormModel_question',
										'inputID' : 'ContactFormModel_question',
										'errorID' : 'ContactFormModel_question_em_',
										'model' : 'ContactFormModel',
										'name' : 'question',
										'enableAjaxValidation' : false,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Question or Remark cannot be blank.");
											}

										}
									},
									{
										'id' : 'ContactFormModel_captcha',
										'inputID' : 'ContactFormModel_captcha',
										'errorID' : 'ContactFormModel_captcha_em_',
										'model' : 'ContactFormModel',
										'name' : 'captcha',
										'enableAjaxValidation' : false,
										'clientValidation' : function(value,
												messages, attribute) {

											var hash = $('body').data(
													'captcha.hash');
											if (hash == null)
												hash = 663;
											else
												hash = hash[1];
											for (var i = value.length - 1, h = 0; i >= 0; --i)
												h += value.toLowerCase()
														.charCodeAt(i);
											if (h != hash) {
												messages
														.push("The verification code is incorrect.");
											}

											if (jQuery.trim(value) == '') {
												messages
														.push("Enter the following code cannot be blank.");
											}

										}
									} ],
							'errorCss' : 'error'
						});
	});
	/*]]>*/
</script>