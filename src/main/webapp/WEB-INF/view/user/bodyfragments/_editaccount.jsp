<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



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
								href="${pageContext.request.contextPath}/edit-account">Edit
									my profile</a></li>
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
									<h1>Edit my profile</h1>
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
									<li class="hier open"><a class="icon-vcard"
										href="${pageContext.request.contextPath}/edit-account">Edit
											my profile</a></li>
									<li><a class="icon-key"
										href="${pageContext.request.contextPath}/change-password">Edit
											password</a></li>
									<li><a class="icon-star" href="">My Credits</a></li>
									<li><a class="icon-box" href="">My subscriptions</a></li>
									<li><a class="icon-cart" href="">Purchase Subscription</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">
							<form:form class="quizsettings" id="profilemodel"
								action="edit-account" method="post" commandName="user">
								<fieldset>
									<div class="required">
										<label for="ProfileModel_name" class="required">user
											ID </label>
										<form:input placeholder="User Id" id="ProfileModel_name"
											path="userId" value="${user.userId}" readonly="true" />
										<div class="errorMessage hide" id="ProfileModel_name_em_"></div>
									</div>
									<div class="required">
										<label for="ProfileModel_email" class="required">Email
											address&nbsp;<span class="required">*</span>
										</label>
										<form:input placeholder="Email address"
											id="ProfileModel_email" type="email" path="email"
											required="required" />
										<div class="errorMessage hide" id="ProfileModel_email_em_"></div>
									</div>
									<div class="checkboxfield">
										<input id="ytProfileModel_email_update" type="hidden"
											value="0" name="ProfileModel[email_update]" /><input
											id="ProfileModel_email_update"
											name="ProfileModel[email_update]" value="1" type="checkbox" /><label
											for="ProfileModel_email_update">Send me an email when
											have something new!</label>
										<div class="errorMessage hide"
											id="ProfileModel_email_update_em_"></div>
									</div>
									<div>
										<label for="ProfileModel_invoice_name">First Name *</label>
										<form:input placeholder="First Name"
											id="ProfileModel_invoice_name" type="text" path="firstName"
											required="required" />
										<div class="errorMessage hide"
											id="ProfileModel_invoice_name_em_"></div>
									</div>
									<div>
										<label for="ProfileModel_invoice_name">Last Name *</label>
										<form:input placeholder="Last Name"
											id="ProfileModel_invoice_name" type="text" path="lastName"
											required="required" />
										<div class="errorMessage hide"
											id="ProfileModel_invoice_name_em_"></div>
									</div>
									<div>
										<label for="ProfileModel_invoice_name">Card ID *</label>
										<form:input placeholder="Card ID"
											id="ProfileModel_invoice_name" type="text" path="idCard"
											required="required" />
										<div class="errorMessage hide"
											id="ProfileModel_invoice_name_em_"></div>
									</div>
									<div>
										<div class="tooltip popleft">
											<p></p>
											<img
												src="//d134jvmqfdbkyi.cloudfront.net/images/icons/uploadinfo.png"
												alt="" />
										</div>
										<label for="ExamModel_time_limit">Sex</label>
										<form:select id="ExamModel_time_limit" path="sex">
											<c:if test="${user.sex eq 'Male'}">
												<option value="Male" selected="selected">Male</option>
												<option value="Female">Female</option>
											</c:if>
											<c:if test="${user.sex eq 'Female'}">
												<option value="Male">Male</option>
												<option value="Female" selected="selected">Female</option>
											</c:if>
										</form:select>
										<div class="errorMessage hide" id="ExamModel_time_limit_em_"></div>
									</div>
									<div>
										<label for="ProfileModel_invoice_name">Date of birth</label>
										<form:input placeholder="Date Of Birth"
											id="ProfileModel_invoice_name" path="dateOfBirth"
											class="datetimepicker" data-date-format="yyyy-MM-dd" />

										<div class="errorMessage hide"
											id="ProfileModel_invoice_name_em_"></div>
									</div>
									<div>
										<label for="ProfileModel_address">Address *</label>
										<form:textarea rows="5" cols="65" placeholder="Address"
											id="ProfileModel_address" path="address" required="required" />
										<div class="errorMessage hide" id="ProfileModel_address_em_"></div>

									</div>
									<div class="selectfield">
										<label for="ProfileModel_country">Country</label><select
											id="ProfileModel_country" name="ProfileModel[country]">
											<option value="">Country</option>
											<option value="AF" data-dialcode="+93">Afghanistan</option>
											<option value="AX" data-dialcode="+358-18">Åland
												Islands</option>
											<option value="AL" data-dialcode="+355">Albania</option>
											<option value="DZ" data-dialcode="+213">Algeria</option>
											<option value="AS" data-dialcode="+1-684">American
												Samoa</option>
											<option value="AD" data-dialcode="+376">Andorra</option>
											<option value="AO" data-dialcode="+244">Angola</option>
											<option value="AI" data-dialcode="+1-264">Anguilla</option>
											<option value="AQ" data-dialcode="">Antarctica</option>
											<option value="AG" data-dialcode="+1-268">Antigua
												and Barbuda</option>
											<option value="AR" data-dialcode="+54">Argentina</option>
											<option value="AM" data-dialcode="+374">Armenia</option>
											<option value="AW" data-dialcode="+297">Aruba</option>
											<option value="AU" data-dialcode="+61">Australia</option>
											<option value="AT" data-dialcode="+43">Austria</option>
											<option value="AZ" data-dialcode="+994">Azerbaijan</option>
											<option value="BS" data-dialcode="+1-242">Bahamas</option>
											<option value="BH" data-dialcode="+973">Bahrain</option>
											<option value="BD" data-dialcode="+880">Bangladesh</option>
											<option value="BB" data-dialcode="+1-246">Barbados</option>
											<option value="BY" data-dialcode="+375">Belarus</option>
											<option value="BE" data-dialcode="+32">Belgium</option>
											<option value="BZ" data-dialcode="+501">Belize</option>
											<option value="BJ" data-dialcode="+229">Benin</option>
											<option value="BM" data-dialcode="+1-441">Bermuda</option>
											<option value="BT" data-dialcode="+975">Bhutan</option>
											<option value="BO" data-dialcode="+591">Bolivia,
												Plurinational State of</option>
											<option value="BA" data-dialcode="+387">Bosnia and
												Herzegovina</option>
											<option value="BW" data-dialcode="+267">Botswana</option>
											<option value="BV" data-dialcode="">Bouvet Island</option>
											<option value="BR" data-dialcode="+55">Brazil</option>
											<option value="IO" data-dialcode="+246">British
												Indian Ocean Territory</option>
											<option value="BN" data-dialcode="+673">Brunei
												Darussalam</option>
											<option value="BG" data-dialcode="+359">Bulgaria</option>
											<option value="BF" data-dialcode="+226">Burkina Faso</option>
											<option value="BI" data-dialcode="+257">Burundi</option>
											<option value="KH" data-dialcode="+855">Cambodia</option>
											<option value="CM" data-dialcode="+237">Cameroon</option>
											<option value="CA" data-dialcode="+1">Canada</option>
											<option value="CV" data-dialcode="+238">Cape Verde</option>
											<option value="KY" data-dialcode="+1-345">Cayman
												Islands</option>
											<option value="CF" data-dialcode="+236">Central
												African Republic</option>
											<option value="TD" data-dialcode="+235">Chad</option>
											<option value="CL" data-dialcode="+56">Chile</option>
											<option value="CN" data-dialcode="+86">China</option>
											<option value="CX" data-dialcode="+61">Christmas
												Island</option>
											<option value="CC" data-dialcode="+61">Cocos
												(keeling) Islands</option>
											<option value="CO" data-dialcode="+57">Colombia</option>
											<option value="KM" data-dialcode="+269">Comoros</option>
											<option value="CG" data-dialcode="+242">Congo</option>
											<option value="CD" data-dialcode="+243">Congo, The
												Democratic Republic of the</option>
											<option value="CK" data-dialcode="+682">Cook Islands</option>
											<option value="CR" data-dialcode="+506">Costa Rica</option>
											<option value="CI" data-dialcode="+225">Côte
												D&#039;Ivoire</option>
											<option value="HR" data-dialcode="+385">Croatia</option>
											<option value="CU" data-dialcode="+53">Cuba</option>
											<option value="CY" data-dialcode="+357">Cyprus</option>
											<option value="CZ" data-dialcode="+420">Czech
												Republic</option>
											<option value="DK" data-dialcode="+45">Denmark</option>
											<option value="DJ" data-dialcode="+253">Djibouti</option>
											<option value="DM" data-dialcode="+1-767">Dominica</option>
											<option value="DO" data-dialcode="+1-809 and 1-829">Dominican
												Republic</option>
											<option value="EC" data-dialcode="+593">Ecuador</option>
											<option value="EG" data-dialcode="+20">Egypt</option>
											<option value="SV" data-dialcode="+503">El Salvador</option>
											<option value="GQ" data-dialcode="+240">Equatorial
												Guinea</option>
											<option value="ER" data-dialcode="+291">Eritrea</option>
											<option value="EE" data-dialcode="+372">Estonia</option>
											<option value="ET" data-dialcode="+251">Ethiopia</option>
											<option value="FK" data-dialcode="+500">Falkland
												Islands (malvinas)</option>
											<option value="FO" data-dialcode="+298">Faroe
												Islands</option>
											<option value="FJ" data-dialcode="+679">Fiji</option>
											<option value="FI" data-dialcode="+358">Finland</option>
											<option value="FR" data-dialcode="+33">France</option>
											<option value="GF" data-dialcode="+594">French
												Guiana</option>
											<option value="PF" data-dialcode="+689">French
												Polynesia</option>
											<option value="TF" data-dialcode="">French Southern
												Territories</option>
											<option value="GA" data-dialcode="+241">Gabon</option>
											<option value="GM" data-dialcode="+220">Gambia</option>
											<option value="GE" data-dialcode="+995">Georgia</option>
											<option value="DE" data-dialcode="+49">Germany</option>
											<option value="GH" data-dialcode="+233">Ghana</option>
											<option value="GI" data-dialcode="+350">Gibraltar</option>
											<option value="GR" data-dialcode="+30">Greece</option>
											<option value="GL" data-dialcode="+299">Greenland</option>
											<option value="GD" data-dialcode="+1-473">Grenada</option>
											<option value="GP" data-dialcode="+590">Guadeloupe</option>
											<option value="GU" data-dialcode="+1-671">Guam</option>
											<option value="GT" data-dialcode="+502">Guatemala</option>
											<option value="GG" data-dialcode="+44-1481">Guernsey</option>
											<option value="GN" data-dialcode="+224">Guinea</option>
											<option value="GW" data-dialcode="+245">Guinea-bissau</option>
											<option value="GY" data-dialcode="+592">Guyana</option>
											<option value="HT" data-dialcode="+509">Haiti</option>
											<option value="HM" data-dialcode="">Heard Island and
												Mcdonald Islands</option>
											<option value="VA" data-dialcode="+379">Holy See
												(vatican City State)</option>
											<option value="HN" data-dialcode="+504">Honduras</option>
											<option value="HK" data-dialcode="+852">Hong Kong</option>
											<option value="HU" data-dialcode="+36">Hungary</option>
											<option value="IS" data-dialcode="+354">Iceland</option>
											<option value="IN" data-dialcode="+91">India</option>
											<option value="ID" data-dialcode="+62">Indonesia</option>
											<option value="IR" data-dialcode="+98">Iran, Islamic
												Republic of</option>
											<option value="IQ" data-dialcode="+964">Iraq</option>
											<option value="IE" data-dialcode="+353">Ireland</option>
											<option value="IM" data-dialcode="+44-1624">Isle Of
												Man</option>
											<option value="IL" data-dialcode="+972">Israel</option>
											<option value="IT" data-dialcode="+39">Italy</option>
											<option value="JM" data-dialcode="+1-876">Jamaica</option>
											<option value="JP" data-dialcode="+81">Japan</option>
											<option value="JE" data-dialcode="+44-1534">Jersey</option>
											<option value="JO" data-dialcode="+962">Jordan</option>
											<option value="KZ" data-dialcode="+7">Kazakhstan</option>
											<option value="KE" data-dialcode="+254">Kenya</option>
											<option value="KI" data-dialcode="+686">Kiribati</option>
											<option value="KP" data-dialcode="+850">Korea,
												Democratic People&#039;s Republic of</option>
											<option value="KR" data-dialcode="+82">Korea,
												Republic of</option>
											<option value="KW" data-dialcode="+965">Kuwait</option>
											<option value="KG" data-dialcode="+996">Kyrgyzstan</option>
											<option value="LA" data-dialcode="+856">Lao
												People&#039;s Democratic Republic</option>
											<option value="LV" data-dialcode="+371">Latvia</option>
											<option value="LB" data-dialcode="+961">Lebanon</option>
											<option value="LS" data-dialcode="+266">Lesotho</option>
											<option value="LR" data-dialcode="+231">Liberia</option>
											<option value="LY" data-dialcode="+218">Libyan Arab
												Jamahiriya</option>
											<option value="LI" data-dialcode="+423">Liechtenstein</option>
											<option value="LT" data-dialcode="+370">Lithuania</option>
											<option value="LU" data-dialcode="+352">Luxembourg</option>
											<option value="MO" data-dialcode="+853">Macao</option>
											<option value="MK" data-dialcode="+389">Macedonia,
												The Former Yugoslav Republic of</option>
											<option value="MG" data-dialcode="+261">Madagascar</option>
											<option value="MW" data-dialcode="+265">Malawi</option>
											<option value="MY" data-dialcode="+60">Malaysia</option>
											<option value="MV" data-dialcode="+960">Maldives</option>
											<option value="ML" data-dialcode="+223">Mali</option>
											<option value="MT" data-dialcode="+356">Malta</option>
											<option value="MH" data-dialcode="+692">Marshall
												Islands</option>
											<option value="MQ" data-dialcode="+596">Martinique</option>
											<option value="MR" data-dialcode="+222">Mauritania</option>
											<option value="MU" data-dialcode="+230">Mauritius</option>
											<option value="YT" data-dialcode="+262">Mayotte</option>
											<option value="MX" data-dialcode="+52">Mexico</option>
											<option value="FM" data-dialcode="+691">Micronesia,
												Federated States of</option>
											<option value="MD" data-dialcode="+373">Moldova,
												Republic of</option>
											<option value="MC" data-dialcode="+377">Monaco</option>
											<option value="MN" data-dialcode="+976">Mongolia</option>
											<option value="ME" data-dialcode="+382">Montenegro</option>
											<option value="MS" data-dialcode="+1-664">Montserrat</option>
											<option value="MA" data-dialcode="+212">Morocco</option>
											<option value="MZ" data-dialcode="+258">Mozambique</option>
											<option value="MM" data-dialcode="+95">Myanmar</option>
											<option value="NA" data-dialcode="+264">Namibia</option>
											<option value="NR" data-dialcode="+674">Nauru</option>
											<option value="NP" data-dialcode="+977">Nepal</option>
											<option value="NL" data-dialcode="+31">Netherlands</option>
											<option value="AN">Netherlands Antilles</option>
											<option value="NC" data-dialcode="+687">New
												Caledonia</option>
											<option value="NZ" data-dialcode="+64">New Zealand</option>
											<option value="NI" data-dialcode="+505">Nicaragua</option>
											<option value="NE" data-dialcode="+227">Niger</option>
											<option value="NG" data-dialcode="+234">Nigeria</option>
											<option value="NU" data-dialcode="+683">Niue</option>
											<option value="NF" data-dialcode="+672">Norfolk
												Island</option>
											<option value="MP" data-dialcode="+1-670">Northern
												Mariana Islands</option>
											<option value="NO" data-dialcode="+47">Norway</option>
											<option value="OM" data-dialcode="+968">Oman</option>
											<option value="PK" data-dialcode="+92">Pakistan</option>
											<option value="PW" data-dialcode="+680">Palau</option>
											<option value="PS" data-dialcode="+970">Palestinian
												Territory, Occupied</option>
											<option value="PA" data-dialcode="+507">Panama</option>
											<option value="PG" data-dialcode="+675">Papua New
												Guinea</option>
											<option value="PY" data-dialcode="+595">Paraguay</option>
											<option value="PE" data-dialcode="+51">Peru</option>
											<option value="PH" data-dialcode="+63">Philippines</option>
											<option value="PN" data-dialcode="+870">Pitcairn</option>
											<option value="PL" data-dialcode="+48">Poland</option>
											<option value="PT" data-dialcode="+351">Portugal</option>
											<option value="PR" data-dialcode="+1-787 and 1-939">Puerto
												Rico</option>
											<option value="QA" data-dialcode="+974">Qatar</option>
											<option value="RE" data-dialcode="+262">Reunion</option>
											<option value="RO" data-dialcode="+40">Romania</option>
											<option value="RU" data-dialcode="+7">Russian
												Federation</option>
											<option value="RW" data-dialcode="+250">Rwanda</option>
											<option value="BL" data-dialcode="+590">Saint
												Barthélemy</option>
											<option value="SH" data-dialcode="+290">Saint
												Helena, Ascension and Tristan Da Cunha</option>
											<option value="KN" data-dialcode="+1-869">Saint
												Kitts And Nevis</option>
											<option value="LC" data-dialcode="+1-758">Saint
												Lucia</option>
											<option value="MF" data-dialcode="+590">Saint Martin</option>
											<option value="PM" data-dialcode="+508">Saint Pierre
												and Miquelon</option>
											<option value="VC" data-dialcode="+1-784">Saint
												Vincent and The Grenadines</option>
											<option value="WS" data-dialcode="+685">Samoa</option>
											<option value="SM" data-dialcode="+378">San Marino</option>
											<option value="ST" data-dialcode="+239">Sao Tome and
												Principe</option>
											<option value="SA" data-dialcode="+966">Saudi Arabia</option>
											<option value="SN" data-dialcode="+221">Senegal</option>
											<option value="RS" data-dialcode="+381">Serbia</option>
											<option value="SC" data-dialcode="+248">Seychelles</option>
											<option value="SL" data-dialcode="+232">Sierra Leone</option>
											<option value="SG" data-dialcode="+65">Singapore</option>
											<option value="SK" data-dialcode="+421">Slovakia</option>
											<option value="SI" data-dialcode="+386">Slovenia</option>
											<option value="SB" data-dialcode="+677">Solomon
												Islands</option>
											<option value="SO" data-dialcode="+252">Somalia</option>
											<option value="ZA" data-dialcode="+27">South Africa</option>
											<option value="GS" data-dialcode="">South Georgia
												and the South Sandwich Islands</option>
											<option value="ES" data-dialcode="+34">Spain</option>
											<option value="LK" data-dialcode="+94">Sri Lanka</option>
											<option value="SD" data-dialcode="+249">Sudan</option>
											<option value="SR" data-dialcode="+597">Suriname</option>
											<option value="SJ" data-dialcode="+47">Svalbard and
												Jan Mayen</option>
											<option value="SZ" data-dialcode="+268">Swaziland</option>
											<option value="SE" data-dialcode="+46">Sweden</option>
											<option value="CH" data-dialcode="+41">Switzerland</option>
											<option value="SY" data-dialcode="+963">Syrian Arab
												Republic</option>
											<option value="TW" data-dialcode="+886">Taiwan</option>
											<option value="TJ" data-dialcode="+992">Tajikistan</option>
											<option value="TZ" data-dialcode="+255">Tanzania,
												United Republic of</option>
											<option value="TH" data-dialcode="+66">Thailand</option>
											<option value="TL" data-dialcode="+670">Timor-leste</option>
											<option value="TG" data-dialcode="+228">Togo</option>
											<option value="TK" data-dialcode="+690">Tokelau</option>
											<option value="TO" data-dialcode="+676">Tonga</option>
											<option value="TT" data-dialcode="+1-868">Trinidad
												And Tobago</option>
											<option value="TN" data-dialcode="+216">Tunisia</option>
											<option value="TR" data-dialcode="+90">Turkey</option>
											<option value="TM" data-dialcode="+993">Turkmenistan</option>
											<option value="TC" data-dialcode="+1-649">Turks and
												Caicos Islands</option>
											<option value="TV" data-dialcode="+688">Tuvalu</option>
											<option value="UG" data-dialcode="+256">Uganda</option>
											<option value="UA" data-dialcode="+380">Ukraine</option>
											<option value="AE" data-dialcode="+971">United Arab
												Emirates</option>
											<option value="GB" data-dialcode="+44">United
												Kingdom</option>
											<option value="US" data-dialcode="+1">United States</option>
											<option value="UM" data-dialcode="+1">United States
												Minor Outlying Islands</option>
											<option value="UY" data-dialcode="+598">Uruguay</option>
											<option value="UZ" data-dialcode="+998">Uzbekistan</option>
											<option value="VU" data-dialcode="+678">Vanuatu</option>
											<option value="VE" data-dialcode="+58">Venezuela,
												Bolivarian Republic of</option>
											<option value="VN" selected="selected" data-dialcode="+84">Viet
												Nam</option>
											<option value="VG" data-dialcode="+1-284">Virgin
												Islands, British</option>
											<option value="VI" data-dialcode="+1-340">Virgin
												Islands, U.s.</option>
											<option value="WF" data-dialcode="+681">Wallis And
												Futuna</option>
											<option value="EH" data-dialcode="+212">Western
												Sahara</option>
											<option value="YE" data-dialcode="+967">Yemen</option>
											<option value="ZM" data-dialcode="+260">Zambia</option>
											<option value="ZW" data-dialcode="+263">Zimbabwe</option>
										</select>
										<div class="errorMessage hide" id="ProfileModel_country_em_"></div>
									</div>
									<div class="row collapse combofield">
										<div>
											<label for="ProfileModel_phonenumber">Phone number *</label><span
												class="prefix col2"></span>
											<form:input class="col4" placeholder="Phone number"
												id="ProfileModel_phonenumber" path="phone"
												required="required" />
											<div class="errorMessage hide"
												id="ProfileModel_phonenumber_em_"></div>
										</div>
									</div>
									<div class="buttonrow">
										<input type="submit" id="submitButton" value="Save changes" />
									</div>
								</fieldset>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>









<script type="text/javascript">
	$.datetimepicker.setLocale('en');

	$('.datetimepicker').datetimepicker({
		dayOfWeekStart : 1,
		lang : 'en',
		disabledDates : [ '1986/01/08', '1986/01/09', '1986/01/10' ],
		startDate : $('.datetimepicker').attr('value')
	});
	$('#datetimepicker').datetimepicker({
		value : $('.datetimepicker').attr('value'),
		step : 10
	});
</script>