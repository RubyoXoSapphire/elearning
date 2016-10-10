<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />





<div class="breakout feature lightbreak creating">
	<div class="wrapper">
		<div class="row">
			<div class="col7">
				<h1>Create quizzes that are fun to play and offer an engaging
					experience for your audience!</h1>
			</div>
		</div>
	</div>
</div>

<div class="breakout feature darkbreak platforms">
	<div class="wrapper">
		<div class="row">
			<div class="col6"></div>
			<div class="col6 last">
				<h2>Challenge your users on any platform</h2>
				<p>Our tool will allow you to challenge your users on any
					platform.</p>
				<ul>
					<li>Computers</li>
					<li>Tablets</li>
					<li>Smartphones</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="breakout feature questiontypes lightbreak">
	<div class="wrapper">
		<div class="row">
			<div class="col6">
				<h2>Lots of question types to choose from</h2>
				<p>
					Whether you want to use images as answers or as a part of the
					question, we have any question type you might need. And if not, you
					can always <a href="mailto:info@quizworks.com">contact</a> us to
					let us create a custom question type that suits your needs.
				</p>
				<ul>
					<li>Text questions</li>
					<li>Multiple choice questions</li>
					<li>Image questions</li>
					<li>Multiple right answers</li>
				</ul>
			</div>
			<div class="col6 last"></div>
		</div>
	</div>
</div>

<div class="breakout feature statistics darkbreak">
	<div class="wrapper">
		<div class="row">
			<div class="col6 "></div>
			<div class="col6 last">
				<h2>Advanced game statistics and rankings</h2>
				<p>Each quiz has it's own leaderboard in which players battle
					for first place. Keep track of your players progress and the amount
					of games played.</p>
				<ul>
					<li>Leaderboard for each quiz</li>
					<li>Export rankings &amp; statistics</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="breakout feature sharing lightbreak">
	<div class="wrapper">
		<div class="row">
			<div class="col6">
				<h2>Rich tools and sharing</h2>
				<p>We offer a rich set of tools to make your quiz, exam or
					assessment fit your needs. You'll be able to integrate it in your
					own website with our easy to use embed tool. User can share your
					quiz so you can reach a bigger audience.</p>
				<ul>
					<li>Customize look &amp; feel</li>
					<li>Embed in your own website</li>
					<li>Social sharing tools</li>
				</ul>
			</div>
			<div class="col6 last"></div>
		</div>
	</div>
</div>



<div class="breakout page-wrap">
	<div id="clouds">
		<div class="cloud x1"></div>
		<!-- Time for multiple clouds to dance around -->
		<div class="cloud x2"></div>
		<div class="cloud x3"></div>
		<div class="cloud x4"></div>
		<div class="cloud x5"></div>
	</div>
	<div class="bgwrap">
		<div class="wrapper">
			<div class="container">

				<div class="row clearfix introbar">
					<div class="col5">
						<h2>Get started</h2>
						<p>Getting started with our tool is as easy as 1-2-3. Our
							interface has been designed to give you an easy and pleasurable
							experience.</p>
						<p class="createyourown handwritten">Get started right now!</p>
					</div>
					<div class="col2"></div>
					<div class="col5 last">
						<div class="contentbox createquiz">
							<h2>Create your free quiz</h2>
							<p>It's time to create your own in a few simple steps. You'll
								have people playing in no time!</p>
							<form id="newquizformmodel"
								action="/site/index.php?r=createFreeQuiz/start&amp;language=en"
								method="post">
								<fieldset>
									<div class="required">
										<label for="NewQuizFormModel_title" class="required">Title
											for your quiz&nbsp;<span class="required">*</span>
										</label><input placeholder="Title for your quiz"
											id="NewQuizFormModel_title" name="NewQuizFormModel[title]"
											type="text" />
										<div class="errorMessage hide" id="NewQuizFormModel_title_em_"></div>
									</div>
									<input type="submit" name="yt0" value="Takeoff!" />
								</fieldset>
							</form>
							<p class="text-center registerfirst">
								Want to register first instead? <a
									href="#/create-an-account/item10053">Register</a>
							</p>
							<div class="customquiz">
								<p>
									Need a custom quiz?<br />Take a look at the&nbsp;<a
										href="#/pricing/item7640">possibilities</a>
									or<br />send us an <a
										href="#/contact/item4">e-mail</a>.
								</p>
							</div>
						</div>
						<div class="owly"
							title="I've played toooo many quizzes, they are so much fun, i just can't stop!"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>













<script type="text/javascript">
	/*<![CDATA[*/
	jQuery(function($) {
		jQuery('#newquizformmodel')
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
								'id' : 'NewQuizFormModel_title',
								'inputID' : 'NewQuizFormModel_title',
								'errorID' : 'NewQuizFormModel_title_em_',
								'model' : 'NewQuizFormModel',
								'name' : 'title',
								'enableAjaxValidation' : false,
								'clientValidation' : function(value, messages,
										attribute) {

									if (jQuery.trim(value) == '') {
										messages
												.push("Title for your quiz cannot be blank.");
									}

								}
							} ],
							'errorCss' : 'error'
						});
	});
	/*]]>*/
</script>