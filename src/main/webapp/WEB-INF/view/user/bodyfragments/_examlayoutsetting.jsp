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
							<li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>&rsaquo;</li>
							<li><a href="${pageContext.request.contextPath}/exams">Exams</a>&rsaquo;</li>
							<li><a href="">Hoc Ky 1</a>&rsaquo;</li>
							<li class="last hier"><a href="">Layout &amp; styling</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">

			<div class="rowbox managecontainer">
				<div class="row border_bottom manageheader">
					<div class="col3">
						<div class="contentbox">
							<strong class="heading h3">Exam</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>Layout &amp; styling</h1>
								</div>
							</div>
							<div class="col3">
								<div class="contentbox alignright">
									<p class="readmore">
										<a target="_blank"
											href="${pageContext.request.contextPath}/start-exam/${examId}">Try
											the exam</a>
									</p>
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
									<li><a class="icon-home"
										href="${pageContext.request.contextPath}/exam-detail/${examId}">Exam
											dashboard</a></li>
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/question-list/${examId}">Questions</a></li>
									<li><a class="icon-shuffle"
										href="${pageContext.request.contextPath}/exam-fail-pass/${examId}">Pass
											/ Fail</a></li>
									<li><a class="icon-cog"
										href="${pageContext.request.contextPath}/exam-setting/${examId}">Settings</a></li>
									<li class="hier open"><a class="icon-palette"
										href="${pageContext.request.contextPath}/exam-fail-pass/${examId}">Layout
											& styling</a></li>
									<li><a class="icon-chat" href="">Social media</a></li>
									<li><a class="icon-chart-line"
										href="${pageContext.request.contextPath}/results-stats/${examAndQuestionCountModel.exam.examId}">Results
											& Stats</a></li>
									<li><a class="icon-user" href="">User Management</a></li>
									<li><a class="icon-paper-plane" href="">Publish &
											share</a></li>
									<li><a class="icon-cog" href="">Custom Features</a></li>
									<li><a class="icon-cog" href="">3rd Party Integrations</a></li>
									<li><a class="icon-certificateprize-award" href="">Certificate</a></li>
									<li><a class="icon-docs"
										href="${pageContext.request.contextPath}/print-exam/${exam.examId}">Print
											exam</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form class="quizsettings" id="exammodel"
								enctype="multipart/form-data" action="" method="post">
								<div class="masterfield">
									<fieldset>
										<div data-field="logo" class=" input-image logo uploadfield">
											<div class="uploadtooltip">
												<div class="uploadinfobutton">i</div>
												<div class="uploadinfo">Will be scaled to 150px by
													50px if bigger (maintaining aspect ratio)</div>
											</div>
											<label for="ExamModel_logo">Logo</label>
											<div class="fileinput-button">
												<div class="tooltip popleft">
													<p>You can upload your logo here</p>
													<img
														src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
														alt="" />
												</div>
												<input name="ExamModel[logo]" id="ExamModel_logo"
													accept="image/*" type="file" />
												<p>
													<em>Allowed: .png, .gif, .jpg.</em>
												</p>
												<strong class="guide">Click<em>or drag an
														image</em></strong>
												<div class="filescontainer" id="files_logo"></div>
												<input name="ExamModel[logo_src]" id="ExamModel_logo_src"
													type="hidden" value="" /> <a class="btn img-delete"
													href="https://www.#/my-dashboard/exams/exam-dashboard/layout-styling/item10041#"
													title="Delete image" style="display: none;">&times;</a>
											</div>
											<div class="errorMessage hide" id="ExamModel_logo_src_em_"></div>
										</div>
										<div class="selectfield">
											<div class="tooltip popleft">
												<p>The main text color</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_stylesheet">Style</label><select
												id="ExamModel_stylesheet" name="ExamModel[stylesheet]">
												<option value="0">Light</option>
												<option value="1">Dark</option>
												<option value="2">Dark Photo Background</option>
												<option value="3" selected="selected">Minimalist</option>
											</select>
											<div class="errorMessage hide" id="ExamModel_stylesheet_em_"></div>
										</div>
										<div class="colorpickercontainer required">
											<div class="tooltip popleft">
												<p>The main text color</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_color_primary_text" class="required">Text
												color&nbsp;<span class="required">*</span>
											</label><input placeholder="Text color"
												id="ExamModel_color_primary_text"
												name="ExamModel[color_primary_text]" type="text"
												value="#52555b" />
											<div class="errorMessage hide"
												id="ExamModel_color_primary_text_em_"></div>
										</div>
										<div class="colorpickercontainer required">
											<div class="tooltip popleft">
												<p>Color for the basic layout elements</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_color_primary_color" class="required">Primary
												color&nbsp;<span class="required">*</span>
											</label><input placeholder="Primary color"
												id="ExamModel_color_primary_color"
												name="ExamModel[color_primary_color]" type="text"
												value="#00b5d6" />
											<div class="errorMessage hide"
												id="ExamModel_color_primary_color_em_"></div>
										</div>
										<div class="colorpickercontainer required">
											<div class="tooltip popleft">
												<p>Color for buttons and the time bar</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_color_sub_color" class="required">Button
												color&nbsp;<span class="required">*</span>
											</label><input placeholder="Button color"
												id="ExamModel_color_sub_color"
												name="ExamModel[color_sub_color]" type="text"
												value="#00b5d6" />
											<div class="errorMessage hide"
												id="ExamModel_color_sub_color_em_"></div>
										</div>
										<div class="colorpickercontainer required">
											<div class="tooltip popleft">
												<p>Color for button text and other light elements</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_color_light_color" class="required">Button
												text color&nbsp;<span class="required">*</span>
											</label><input placeholder="Button text color"
												id="ExamModel_color_light_color"
												name="ExamModel[color_light_color]" type="text"
												value="#ffffff" />
											<div class="errorMessage hide"
												id="ExamModel_color_light_color_em_"></div>
										</div>
										<div class="colorpickercontainer required">
											<div class="tooltip popleft">
												<p>Color for the background of the page</p>
												<img
													src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
													alt="" />
											</div>
											<label for="ExamModel_color_background" class="required">Background
												color&nbsp;<span class="required">*</span>
											</label><input placeholder="Background color"
												id="ExamModel_color_background"
												name="ExamModel[color_background]" type="text"
												value="#f7f7f7" />
											<div class="errorMessage hide"
												id="ExamModel_color_background_em_"></div>
										</div>
										<div class="buttonrow border_top">
											<button class="button" type="submit" name="setting_tab"
												value="styles">Save</button>
										</div>
									</fieldset>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>











<script type="text/javascript">
	/*<![CDATA[*/

	jQuery(function($) {

		initQuizSettingsUpdate({
			'spectrum' : {
				'showInput' : true,
				'cancelText' : 'Cancel',
				'chooseText' : 'Choose',
				'change' : function(color) {
					$(this).val(color.toHexString());
				},
				'show' : function(color) {
					color.toHexString();
				}
			},
			'settingGroups' : true,
			'image' : {
				'type' : 'Exam',
				'baseUrl' : ''
			},
			'defaultColors' : [ {
				'primaryText' : '52555b',
				'primaryColor' : '00b5d6',
				'subColor' : '00b5d6',
				'lightColor' : 'ffffff',
				'backgroundColor' : 'f7f7f7'
			}, {
				'primaryText' : 'ffffff',
				'primaryColor' : '00b5d6',
				'subColor' : '00b5d6',
				'lightColor' : 'ffffff',
				'backgroundColor' : '0a0a0a'
			}, {
				'primaryText' : 'ffffff',
				'primaryColor' : '00b5d6',
				'subColor' : '00b5d6',
				'lightColor' : 'ffffff',
				'backgroundColor' : '3b3b3b'
			}, {
				'primaryText' : '52555b',
				'primaryColor' : '00b5d6',
				'subColor' : '00b5d6',
				'lightColor' : 'ffffff',
				'backgroundColor' : 'ffffff'
			} ],
			'modelName' : 'ExamModel'
		});

		jQuery('#exammodel')
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
							'beforeValidate' : function(form) {
								$(".colorpickercontainer input").each(
										function() {
											var c = $(this).spectrum("get");
											$(this).val(c.toHexString());
										});
								return true;
							},
							'attributes' : [
									{
										'id' : 'ExamModel_logo',
										'inputID' : 'ExamModel_logo_src',
										'errorID' : 'ExamModel_logo_src_em_',
										'model' : 'ExamModel',
										'name' : 'logo',
										'enableAjaxValidation' : false,
										'status' : 1
									},
									{
										'id' : 'ExamModel_stylesheet',
										'inputID' : 'ExamModel_stylesheet',
										'errorID' : 'ExamModel_stylesheet_em_',
										'model' : 'ExamModel',
										'name' : 'stylesheet',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) != ''
													&& jQuery.inArray(value,
															[ "0", "1", "2",
																	"3" ]) < 0) {
												messages
														.push("Style is not in the list.");
											}

										}
									},
									{
										'id' : 'ExamModel_color_primary_text',
										'inputID' : 'ExamModel_color_primary_text',
										'errorID' : 'ExamModel_color_primary_text_em_',
										'model' : 'ExamModel',
										'name' : 'color_primary_text',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Text color cannot be blank.");
											}

										}
									},
									{
										'id' : 'ExamModel_color_primary_color',
										'inputID' : 'ExamModel_color_primary_color',
										'errorID' : 'ExamModel_color_primary_color_em_',
										'model' : 'ExamModel',
										'name' : 'color_primary_color',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Primary color cannot be blank.");
											}

										}
									},
									{
										'id' : 'ExamModel_color_sub_color',
										'inputID' : 'ExamModel_color_sub_color',
										'errorID' : 'ExamModel_color_sub_color_em_',
										'model' : 'ExamModel',
										'name' : 'color_sub_color',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Button color cannot be blank.");
											}

										}
									},
									{
										'id' : 'ExamModel_color_light_color',
										'inputID' : 'ExamModel_color_light_color',
										'errorID' : 'ExamModel_color_light_color_em_',
										'model' : 'ExamModel',
										'name' : 'color_light_color',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Button text color cannot be blank.");
											}

										}
									},
									{
										'id' : 'ExamModel_color_background',
										'inputID' : 'ExamModel_color_background',
										'errorID' : 'ExamModel_color_background_em_',
										'model' : 'ExamModel',
										'name' : 'color_background',
										'enableAjaxValidation' : false,
										'status' : 1,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Background color cannot be blank.");
											}

										}
									} ],
							'errorCss' : 'error'
						});
		initExamSettingsUpdate();
	});
	/*]]>*/
</script>