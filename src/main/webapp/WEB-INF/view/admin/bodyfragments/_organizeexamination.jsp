<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<h4 class="lighter">
			<i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer blue"></i>
			<a href="#modal-wizard" data-toggle="modal" class="blue"> Organize Examination </a>
		</h4>

		<div class="hr hr-18 hr-double dotted"></div>

		<div class="widget-box">
			<div class="widget-header widget-header-blue widget-header-flat">
				<h4 class="widget-title lighter">Examination Infomation</h4>

				
			</div>

			<div class="widget-body">
				<div class="widget-main">
					<!-- #section:plugins/fuelux.wizard -->
					<div id="fuelux-wizard-container">
						<div>
							<!-- #section:plugins/fuelux.wizard.steps -->
							<ul class="steps">
								<li data-step="1" class="active">
									<span class="step">1</span>
									<span class="title">Basic Information</span>
								</li>

								<li data-step="2">
									<span class="step">2</span>
									<span class="title">Classes & Exams</span>
								</li>

								<li data-step="3">
									<span class="step">3</span>
									<span class="title">Examination Schedule</span>
								</li>

								<li data-step="4">
									<span class="step">4</span>
									<span class="title">Finish</span>
								</li>
							</ul>

							<!-- /section:plugins/fuelux.wizard.steps -->
						</div>

						<hr />

						<!-- #section:plugins/fuelux.wizard.container -->
						<div class="step-content pos-rel">
							<div class="step-pane active" data-step="1">
								<h3 class="lighter block green">Enter the following information</h3>

								<form class="form-horizontal" id="sample-form">
									<!-- #section:elements.form.input-state -->
									<div class="form-group">
										<label path="role"
											class="col-sm-3 control-label no-padding-right"
											for="form-field-mask-2">
																						For Semester
																					</label>
										<div class="input-group col-sm-9" style="padding-left: 12px;">
											<select class="col-xs-10 col-sm-5" id="form-field-select-1"
												path="role">
												<option value="SM001">Semester 001</option>
												<option value="SM002">Semester 002</option>
											</select>
										</div>
									</div>
									
								</form>

								<form class="form-horizontal hide" id="validation-form" method="get">
									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">Email Address:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<input type="email" name="email" id="email" class="col-xs-12 col-sm-6" />
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password">Password:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<input type="password" name="password" id="password" class="col-xs-12 col-sm-4" />
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="password2">Confirm Password:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<input type="password" name="password2" id="password2" class="col-xs-12 col-sm-4" />
											</div>
										</div>
									</div>

									<div class="hr hr-dotted"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">Company Name:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<input type="text" id="name" name="name" class="col-xs-12 col-sm-5" />
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">Phone Number:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="ace-icon fa fa-phone"></i>
												</span>

												<input type="tel" id="phone" name="phone" />
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="url">Company URL:</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<input type="url" id="url" name="url" class="col-xs-12 col-sm-8" />
											</div>
										</div>
									</div>

									<div class="hr hr-dotted"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right">Subscribe to</label>

										<div class="col-xs-12 col-sm-9">
											<div>
												<label>
													<input name="subscription" value="1" type="checkbox" class="ace" />
													<span class="lbl"> Latest news and announcements</span>
												</label>
											</div>

											<div>
												<label>
													<input name="subscription" value="2" type="checkbox" class="ace" />
													<span class="lbl"> Product offers and discounts</span>
												</label>
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right">Gender</label>

										<div class="col-xs-12 col-sm-9">
											<div>
												<label class="line-height-1 blue">
													<input name="gender" value="1" type="radio" class="ace" />
													<span class="lbl"> Male</span>
												</label>
											</div>

											<div>
												<label class="line-height-1 blue">
													<input name="gender" value="2" type="radio" class="ace" />
													<span class="lbl"> Female</span>
												</label>
											</div>
										</div>
									</div>

									<div class="hr hr-dotted"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="state">State</label>

										<div class="col-xs-12 col-sm-9">
											<select id="state" name="state" class="select2" data-placeholder="Click to Choose...">
												<option value="">&nbsp;</option>
												<option value="AL">Alabama</option>
												<option value="AK">Alaska</option>
												<option value="AZ">Arizona</option>
												<option value="AR">Arkansas</option>
												<option value="CA">California</option>
												<option value="CO">Colorado</option>
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="FL">Florida</option>
												<option value="GA">Georgia</option>
												<option value="HI">Hawaii</option>
												<option value="ID">Idaho</option>
												<option value="IL">Illinois</option>
												<option value="IN">Indiana</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
												<option value="LA">Louisiana</option>
												<option value="ME">Maine</option>
												<option value="MD">Maryland</option>
												<option value="MA">Massachusetts</option>
												<option value="MI">Michigan</option>
												<option value="MN">Minnesota</option>
												<option value="MS">Mississippi</option>
												<option value="MO">Missouri</option>
												<option value="MT">Montana</option>
												<option value="NE">Nebraska</option>
												<option value="NV">Nevada</option>
												<option value="NH">New Hampshire</option>
												<option value="NJ">New Jersey</option>
												<option value="NM">New Mexico</option>
												<option value="NY">New York</option>
												<option value="NC">North Carolina</option>
												<option value="ND">North Dakota</option>
												<option value="OH">Ohio</option>
												<option value="OK">Oklahoma</option>
												<option value="OR">Oregon</option>
												<option value="PA">Pennsylvania</option>
												<option value="RI">Rhode Island</option>
												<option value="SC">South Carolina</option>
												<option value="SD">South Dakota</option>
												<option value="TN">Tennessee</option>
												<option value="TX">Texas</option>
												<option value="UT">Utah</option>
												<option value="VT">Vermont</option>
												<option value="VA">Virginia</option>
												<option value="WA">Washington</option>
												<option value="WV">West Virginia</option>
												<option value="WI">Wisconsin</option>
												<option value="WY">Wyoming</option>
											</select>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="platform">Platform</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<select class="input-medium" id="platform" name="platform">
													<option value="">------------------</option>
													<option value="linux">Linux</option>
													<option value="windows">Windows</option>
													<option value="mac">Mac OS</option>
													<option value="ios">iOS</option>
													<option value="android">Android</option>
												</select>
											</div>
										</div>
									</div>

									<div class="space-2"></div>

									<div class="form-group">
										<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="comment">Comment</label>

										<div class="col-xs-12 col-sm-9">
											<div class="clearfix">
												<textarea class="input-xlarge" name="comment" id="comment"></textarea>
											</div>
										</div>
									</div>

									<div class="space-8"></div>

									<div class="form-group">
										<div class="col-xs-12 col-sm-4 col-sm-offset-3">
											<label>
												<input name="agree" id="agree" type="checkbox" class="ace" />
												<span class="lbl"> I accept the policy</span>
											</label>
										</div>
									</div>
								</form>
							</div>

							<div class="step-pane" data-step="2">
								<div class="col-sm-12">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-top" for="duallist">
											Classes </label>
									
										<div class="col-sm-8">
											<!-- #section:plugins/input.duallist -->
											<div class="bootstrap-duallistbox-container row moveonselect">
												<div class="box1 col-md-6">
													<label
														for="bootstrap-duallistbox-nonselected-list_duallistbox_demo1[]"
														style="display: none;"></label> <span class="info-container">
														<span class="info">Showing all 8</span>
														<button type="button"
															class="btn clear1 pull-right btn-default btn-xs btn-white btn-bold btn-info">show
															all</button>
													</span> <input class="filter form-control" type="text" placeholder="Filter">
													<div class="btn-group buttons">
														<button type="button"
															class="btn moveall btn-white btn-bold btn-info" title="Move all">
															<i class="glyphicon glyphicon-arrow-right"></i> <i
																class="glyphicon glyphicon-arrow-right"></i>
														</button>
														<button type="button" class="btn move btn-white btn-bold btn-info"
															title="Move selected">
															<i class="glyphicon glyphicon-arrow-right"></i>
														</button>
													</div>
													<select multiple="multiple"
														id="bootstrap-duallistbox-nonselected-list_duallistbox_demo1[]"
														class="form-control" name="duallistbox_demo1[]_helper1"
														style="height: 270px;"><option value="option1">Option
															1</option>
														<option value="option2">Option 2</option>
														<option value="option4">Option 4</option>
														<option value="option5">Option 5</option>
														<option value="option7">Option 7</option>
														<option value="option8">Option 8</option>
														<option value="option9">Option 9</option>
														<option value="option0">Option 10</option></select>
												</div>
												<div class="box2 col-md-6">
													<label for="bootstrap-duallistbox-selected-list_duallistbox_demo1[]"
														style="display: none;"></label> <span class="info-container">
														<span class="info">Showing all 2</span>
														<button type="button"
															class="btn clear2 pull-right btn-default btn-xs btn-white btn-bold btn-info">show
															all</button>
													</span> <input class="filter form-control" type="text" placeholder="Filter">
													<div class="btn-group buttons">
														<button type="button"
															class="btn remove btn-white btn-bold btn-info"
															title="Remove selected">
															<i class="glyphicon glyphicon-arrow-left"></i>
														</button>
														<button type="button"
															class="btn removeall btn-white btn-bold btn-info"
															title="Remove all">
															<i class="glyphicon glyphicon-arrow-left"></i> <i
																class="glyphicon glyphicon-arrow-left"></i>
														</button>
													</div>
													<select multiple="multiple"
														id="bootstrap-duallistbox-selected-list_duallistbox_demo1[]"
														class="form-control" name="duallistbox_demo1[]_helper2"
														style="height: 270px;"><option value="option3"
															selected="selected">Option 3</option>
														<option value="option6" selected="selected">Option 6</option></select>
												</div>
											</div>
											<select multiple="multiple" size="10" name="duallistbox_demo1[]"
												id="duallist" style="display: none;">
												<option value="option1">Option 1</option>
												<option value="option2">Option 2</option>
												<option value="option3" selected="selected">Option 3</option>
												<option value="option4">Option 4</option>
												<option value="option5">Option 5</option>
												<option value="option6" selected="selected">Option 6</option>
												<option value="option7">Option 7</option>
												<option value="option8">Option 8</option>
												<option value="option9">Option 9</option>
												<option value="option0">Option 10</option>
											</select>
									
											<!-- /section:plugins/input.duallist -->
											<div class="hr hr-16 hr-dotted"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="step-pane" data-step="3">
								<div class="center">
									<h3 class="blue lighter">This is step 3</h3>
								</div>
							</div>

							<div class="step-pane" data-step="4">
								<div class="center">
									<h3 class="green">Congrats!</h3>
									Your product is ready to ship! Click finish to continue!
								</div>
							</div>
						</div>

						<!-- /section:plugins/fuelux.wizard.container -->
					</div>

					<hr />
					<div class="wizard-actions">
						<!-- #section:plugins/fuelux.wizard.buttons -->
						<button class="btn btn-prev">
							<i class="ace-icon fa fa-arrow-left"></i>
							Prev
						</button>

						<button class="btn btn-success btn-next" data-last="Finish">
							Next
							<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
						</button>

						<!-- /section:plugins/fuelux.wizard.buttons -->
					</div>

					<!-- /section:plugins/fuelux.wizard -->
				</div><!-- /.widget-main -->
			</div><!-- /.widget-body -->
		</div>

		<div id="modal-wizard" class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="modal-wizard-container">
						<div class="modal-header">
							<ul class="steps">
								<li data-step="1" class="active">
									<span class="step">1</span>
									<span class="title">Validation states</span>
								</li>

								<li data-step="2">
									<span class="step">2</span>
									<span class="title">Alerts</span>
								</li>

								<li data-step="3">
									<span class="step">3</span>
									<span class="title">Payment Info</span>
								</li>

								<li data-step="4">
									<span class="step">4</span>
									<span class="title">Other Info</span>
								</li>
							</ul>
						</div>

						<div class="modal-body step-content">
							<div class="step-pane active" data-step="1">
								<div class="center">
									<h4 class="blue">Step 1</h4>
								</div>
							</div>

							<div class="step-pane" data-step="2">
								<div class="center">
									<h4 class="blue">Step 2</h4>
								</div>
							</div>

							<div class="step-pane" data-step="3">
								<div class="center">
									<h4 class="blue">Step 3</h4>
								</div>
							</div>

							<div class="step-pane" data-step="4">
								<div class="center">
									<h4 class="blue">Step 4</h4>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer wizard-actions">
						<button class="btn btn-sm btn-prev">
							<i class="ace-icon fa fa-arrow-left"></i>
							Prev
						</button>

						<button class="btn btn-success btn-sm btn-next" data-last="Finish">
							Next
							<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
						</button>

						<button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
							<i class="ace-icon fa fa-times"></i>
							Cancel
						</button>
					</div>
				</div>
			</div>
		</div><!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<script type="text/javascript">
jQuery(function($) {
	var step=1;
	$('[data-rel=tooltip]').tooltip();
	var $validation = false;
	$('.btn-next').on('click',function(e){
		e.preventDefault();
		$('[data-step='+step+']').removeClass('active');
		$('[data-step='+step+']').data('step',++step);
		$('[data-step='+step+']').addClass('active');
	});
	$('.btn-prev').on('click',function(e){
		e.preventDefault();
		$('[data-step='+step+']').removeClass('active');
		$('[data-step='+step+']').data('step',--step);
		$('[data-step='+step+']').addClass('active');
	});

	//jump to a step
	/**
	var wizard = $('#fuelux-wizard-container').data('fu.wizard')
	wizard.currentStep = 3;
	wizard.setState();
	*/

	//determine selected step
	//wizard.selectedItem().step



	//hide or show the other form which requires validation
	//this is for demo only, you usullay want just one form in your application




	//documentation : http://docs.jquery.com/Plugins/Validation/validate
	
	
	$('#modal-wizard-container').ace_wizard();
	$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
	
	
	/**
	$('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
		$(this).closest('form').validate().element($(this));
	});
	
	$('#mychosen').chosen().on('change', function(ev) {
		$(this).closest('form').validate().element($(this));
	});
	*/
	
	
	$(document).one('ajaxloadstart.page', function(e) {
		//in ajax mode, remove remaining elements before leaving page
		$('[class*=select2]').remove();
	});
})
</script>
					