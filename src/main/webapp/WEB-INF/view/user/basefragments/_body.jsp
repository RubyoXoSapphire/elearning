<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<div class="page-wrap">
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
				<div class="row">
					<div class="col12">
						<div class="intro">
							<p>
								<span>Good direction , good future</span> Study, study <strong>more</strong>,
								study<strong> forever </strong> !
							</p>
						</div>
					</div>
				</div>
				<div class="row clearfix introbar">
					<div class="col7">
						<h1>Lowl School</h1>
						<div class="pageintro">
							<p>
								is devoted to <strong>excellence</strong> in teaching, learning,
								and research, and to developing leaders in many disciplines who
								make a difference globally. The University, which is based in
								Cambridge and Boston, Massachusetts, has an enrollment of over <strong>20,000</strong>
								degree candidates, including undergraduate, graduate, and
								professional students. Lowl School has more than <strong>360,000</strong>
								alumni around the world.
							</p>
						</div>
						<p class="createyourown handwritten">Choose your own feature</p>
					</div>
					<div class="col5">
						<div class="contentbox createquiz">
							<h2>Have any question?</h2>
							<p>It has no time for you to waste! Just believe in yourseft!</p>
							<form id="newquizformmodel"
								action="/site/index.php?r=createFreeQuiz/start&amp;language=en"
								method="post">
								<fieldset>
									<div class="required">
										<label for="NewQuizFormModel_title" class="required">Input
											your email here&nbsp;<span class="required">*</span>
										</label><input placeholder="Input email here"
											id="NewQuizFormModel_title" name="NewQuizFormModel[title]"
											type="text" required />
										<div class="errorMessage hide" id="NewQuizFormModel_title_em_"></div>
									</div>
									<input class="liftoff" type="submit" name="yt0"
										value="Takeoff!" />
								</fieldset>
							</form>
							<p class="text-center registerfirst">
								See <a href="${pageContext.request.contextPath}/help">FAQ</a>
								here
							</p>
							<div class="customquiz">
								<p>
									<span>Or contact us!</span><br /> <span>Take a look at
										the&nbsp;</span><a href="">possibilities</a><span>&nbsp;or</span><br />
									<span>send us an&nbsp;</span><a href="">e-mail</a><span>.</span>
								</p>
							</div>
						</div>
						<div class="owly"
							title="I've done too many exams! They are so educational!"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="breakout customers">
	<div class="wrapper">
		<div class="row">
			<div class="col12">
				<p>
					Some of our <strong>Allies</strong> company
				</p>
				<ul class="customerlist">
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_unilever.png"
						alt="Unilever"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_heineken.png"
						alt="Heineken"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_kaplan.png"
						alt="Kaplan"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_surveymonkey.png"
						alt="SurveyMonkey"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_shell.png"
						alt="Shell"></li>
				</ul>
				<ul class="customerlist">
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_hiu.png"
						alt="Hope International University"
						title="Hope International University"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_uov.png"
						alt="The University of Virginia"
						title="The University of Virginia"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_cccs.png"
						alt="Colorado Community College System"
						title="Colorado Community College System"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_gg.png"
						alt="Generating Genius" title="Generating Genius"></li>
					<li><img
						src="//d134jvmqfdbkyi.cloudfront.net/images/customer_casteilleja.png"
						alt="Castilleja School" title="Castilleja School"></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="breakout benefits">
	<div class="wrapper">
		<div class="row">
			<div class="col4 fun">
				<h3>Friendly enviroment</h3>
				<p>The school is a significant personal and social environment
					in the lives of its students. A child-friendly shool ensures every
					child an environment that is physically safe, emotionally secure
					and psychologically enabling!</p>
			</div>
			<div class="col4 engaging">
				<h3>Engaging</h3>
				<p>In aiming for full engagement, it is essential that students
					perceive activities as being meaningful. Research has shown that if
					students do not consider a learning activity worthy of their time
					and effort, they might not engage in a satisfactory way, or may
					even disengage entirely in response (Fredricks, Blumenfeld, &
					Paris, 2004).</p>
			</div>
			<div class="col4 educational last">
				<h3>Good educational</h3>
				<p>A good education may bring a desired job with good pay or
					opportunity for promotion. A good education may bring opportunity
					for advancement in academia. A good education may bring pleasure
					through fitting into the modern culture, and even greater social
					standing.</p>
			</div>
		</div>
	</div>
</div>
<div class="breakout examples row0">
	<div class="wrapper">
		<div class="row">
			<div class="col12">
				<h2>View an example exam here:</h2>
				<a href="/exam-7961" class="demo button floatleft">Example exam</a>
			</div>
		</div>
	</div>
</div>
<div class="breakout targets row1">
	<div class="wrapper">
		<h2>What can an online exam do for you or your organisation?</h2>
		<div class="row">
			<div class="col4 brands">
				<h3>For Brands</h3>
				<p>
					Do you want to engage your target audience in a <strong>fun
						and playful</strong> way? Do you want them to share your campaign on
					Facebook and Twitter? Then let them interact through an online exam
					from Quizworks in your branded environment, it’ll be fun.
				</p>
			</div>
			<div class="col4 elearning">
				<h3>For E-Learning</h3>
				<p>
					Are you looking for a fun and effective way to let your students,
					patients or customers learn something? Combine <strong>the
						power of fun with</strong> repetitive coding and let them interact through
					an online exam from Quizworks in your branded environment. Using
					the exam maker is fun, addictive and meaningful.
				</p>
			</div>
			<div class="col4 publishers last">
				<h3>For Publishers</h3>
				<p>
					Do you have great content? Are you looking for <strong>new
						ways to publish and monetize</strong> your content? Quizworks could have a
					solution for you.
				</p>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	/*<![CDATA[*/
	jQuery(function($) {
		owlyBlink();
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