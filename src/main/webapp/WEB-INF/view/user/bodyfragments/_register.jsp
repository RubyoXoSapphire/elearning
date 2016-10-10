<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />





<div class="page-wrap">
	<div class="bgwrap">
		<div class="wrapper clearfix">
			<div class="rowbox managecontainer nocols top-offset-30">
				<div class="row">
					<div class="col12">
						<div class="contentbox">
							<div class="contentbox header-contentbox">
								<div class="content-header">
									<h1>Create an account</h1>
								</div>
							</div>

							<form class="quizsettings" id="createquizprofileformmodel"
								action="/create-an-account/item10053?subscription=2"
								method="post">
								<fieldset>
									<div class="required">
										<label for="CreateQuizProfileFormModel_email" class="required">Your
											email address&nbsp;<span class="required">*</span>
										</label><input placeholder="Your email address"
											id="CreateQuizProfileFormModel_email"
											name="CreateQuizProfileFormModel[email]" type="email" />
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_email_em_"></div>
									</div>
									<div class="required">
										<label for="CreateQuizProfileFormModel_email_repeat"
											class="required">Repeat your email address&nbsp;<span
											class="required">*</span></label><input
											placeholder="Repeat your email address"
											id="CreateQuizProfileFormModel_email_repeat"
											name="CreateQuizProfileFormModel[email_repeat]" type="email" />
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_email_repeat_em_"></div>
									</div>
									<div class="required">
										<label for="CreateQuizProfileFormModel_name" class="required">Your
											username&nbsp;<span class="required">*</span>
										</label><input placeholder="Your username"
											id="CreateQuizProfileFormModel_name"
											name="CreateQuizProfileFormModel[name]" type="text" />
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_name_em_"></div>
									</div>
									<div class="required">
										<label for="CreateQuizProfileFormModel_password"
											class="required">Your password&nbsp;<span
											class="required">*</span></label><input placeholder="Your password"
											id="CreateQuizProfileFormModel_password"
											name="CreateQuizProfileFormModel[password]" type="password" />
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_password_em_"></div>
									</div>
									<div class="required">
										<label for="CreateQuizProfileFormModel_password_repeat"
											class="required">Repeat your password&nbsp;<span
											class="required">*</span></label><input
											placeholder="Repeat your password"
											id="CreateQuizProfileFormModel_password_repeat"
											name="CreateQuizProfileFormModel[password_repeat]"
											type="password" />
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_password_repeat_em_"></div>
									</div>
									<div class="selectfield">
										<label for="CreateQuizProfileFormModel_country">Country</label><select
											id="CreateQuizProfileFormModel_country"
											name="CreateQuizProfileFormModel[country]">
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
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_country_em_"></div>
									</div>
									<div class="row collapse combofield">
										<div>
											<label for="CreateQuizProfileFormModel_phone">Phone
												number</label><span class="prefix col2"></span><input class="col4"
												placeholder="Phone number"
												id="CreateQuizProfileFormModel_phone"
												name="CreateQuizProfileFormModel[phone]" type="text" />
											<div class="errorMessage hide"
												id="CreateQuizProfileFormModel_phone_em_"></div>
										</div>
									</div>
									<div class="checkboxfield required">
										<input id="ytCreateQuizProfileFormModel_voorwaarden"
											type="hidden" value="0"
											name="CreateQuizProfileFormModel[voorwaarden]" /><input
											id="CreateQuizProfileFormModel_voorwaarden"
											name="CreateQuizProfileFormModel[voorwaarden]" value="1"
											type="checkbox" /><label
											for="CreateQuizProfileFormModel_voorwaarden" class="required">I
											agree with the <a
											href="https://www.onlineexambuilder.com/terms/item64">terms</a>&nbsp;<span
											class="required">*</span>
										</label>
										<div class="errorMessage hide"
											id="CreateQuizProfileFormModel_voorwaarden_em_"></div>
									</div>
									<input name="CreateQuizProfileFormModel[timezone]"
										id="CreateQuizProfileFormModel_timezone" type="hidden" />
								</fieldset>
								<div class="button-container clearfix buttonrow">
									<input class="afterpreview save" type="submit" name="yt0"
										value="Save" />
									<p>
										<a href="https://www.onlineexambuilder.com/log-in/item114">I
											already have an account</a>
									</p>
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
		initDialCode({
			'watchField' : '#CreateQuizProfileFormModel_country',
			'preview' : '#createquizprofileformmodel span.prefix'
		})
		jQuery('#createquizprofileformmodel')
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
										'id' : 'CreateQuizProfileFormModel_email',
										'inputID' : 'CreateQuizProfileFormModel_email',
										'errorID' : 'CreateQuizProfileFormModel_email_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'email',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Your email address cannot be blank.");
											}

											if (jQuery.trim(value) != ''
													&& !value
															.match(/^[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/)) {
												messages
														.push("Your email address is not a valid email address.");
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_email_repeat',
										'inputID' : 'CreateQuizProfileFormModel_email_repeat',
										'errorID' : 'CreateQuizProfileFormModel_email_repeat_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'email_repeat',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Repeat your email address cannot be blank.");
											}

											if (jQuery.trim(value) != ''
													&& !value
															.match(/^[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$/)) {
												messages
														.push("Repeat your email address is not a valid email address.");
											}

											if (value != jQuery(
													'#CreateQuizProfileFormModel_email')
													.val()) {
												messages
														.push("Repeat your email address must be repeated exactly."
																.replace(
																		'{compareValue}',
																		jQuery(
																				'#CreateQuizProfileFormModel_email')
																				.val()));
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_name',
										'inputID' : 'CreateQuizProfileFormModel_name',
										'errorID' : 'CreateQuizProfileFormModel_name_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'name',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Your username cannot be blank.");
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_password',
										'inputID' : 'CreateQuizProfileFormModel_password',
										'errorID' : 'CreateQuizProfileFormModel_password_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'password',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Your password cannot be blank.");
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_password_repeat',
										'inputID' : 'CreateQuizProfileFormModel_password_repeat',
										'errorID' : 'CreateQuizProfileFormModel_password_repeat_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'password_repeat',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Repeat your password cannot be blank.");
											}

											if (value != jQuery(
													'#CreateQuizProfileFormModel_password')
													.val()) {
												messages
														.push("Repeat your password must be repeated exactly."
																.replace(
																		'{compareValue}',
																		jQuery(
																				'#CreateQuizProfileFormModel_password')
																				.val()));
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_country',
										'inputID' : 'CreateQuizProfileFormModel_country',
										'errorID' : 'CreateQuizProfileFormModel_country_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'country',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) != ''
													&& jQuery.inArray(value, [
															"", "AF", "AX",
															"AL", "DZ", "AS",
															"AD", "AO", "AI",
															"AQ", "AG", "AR",
															"AM", "AW", "AU",
															"AT", "AZ", "BS",
															"BH", "BD", "BB",
															"BY", "BE", "BZ",
															"BJ", "BM", "BT",
															"BO", "BA", "BW",
															"BV", "BR", "IO",
															"BN", "BG", "BF",
															"BI", "KH", "CM",
															"CA", "CV", "KY",
															"CF", "TD", "CL",
															"CN", "CX", "CC",
															"CO", "KM", "CG",
															"CD", "CK", "CR",
															"CI", "HR", "CU",
															"CY", "CZ", "DK",
															"DJ", "DM", "DO",
															"EC", "EG", "SV",
															"GQ", "ER", "EE",
															"ET", "FK", "FO",
															"FJ", "FI", "FR",
															"GF", "PF", "TF",
															"GA", "GM", "GE",
															"DE", "GH", "GI",
															"GR", "GL", "GD",
															"GP", "GU", "GT",
															"GG", "GN", "GW",
															"GY", "HT", "HM",
															"VA", "HN", "HK",
															"HU", "IS", "IN",
															"ID", "IR", "IQ",
															"IE", "IM", "IL",
															"IT", "JM", "JP",
															"JE", "JO", "KZ",
															"KE", "KI", "KP",
															"KR", "KW", "KG",
															"LA", "LV", "LB",
															"LS", "LR", "LY",
															"LI", "LT", "LU",
															"MO", "MK", "MG",
															"MW", "MY", "MV",
															"ML", "MT", "MH",
															"MQ", "MR", "MU",
															"YT", "MX", "FM",
															"MD", "MC", "MN",
															"ME", "MS", "MA",
															"MZ", "MM", "NA",
															"NR", "NP", "NL",
															"AN", "NC", "NZ",
															"NI", "NE", "NG",
															"NU", "NF", "MP",
															"NO", "OM", "PK",
															"PW", "PS", "PA",
															"PG", "PY", "PE",
															"PH", "PN", "PL",
															"PT", "PR", "QA",
															"RE", "RO", "RU",
															"RW", "BL", "SH",
															"KN", "LC", "MF",
															"PM", "VC", "WS",
															"SM", "ST", "SA",
															"SN", "RS", "SC",
															"SL", "SG", "SK",
															"SI", "SB", "SO",
															"ZA", "GS", "ES",
															"LK", "SD", "SR",
															"SJ", "SZ", "SE",
															"CH", "SY", "TW",
															"TJ", "TZ", "TH",
															"TL", "TG", "TK",
															"TO", "TT", "TN",
															"TR", "TM", "TC",
															"TV", "UG", "UA",
															"AE", "GB", "US",
															"UM", "UY", "UZ",
															"VU", "VE", "VN",
															"VG", "VI", "WF",
															"EH", "YE", "ZM",
															"ZW" ]) < 0) {
												messages
														.push("Country is not in the list.");
											}

										}
									},
									{
										'id' : 'CreateQuizProfileFormModel_phone',
										'inputID' : 'CreateQuizProfileFormModel_phone',
										'errorID' : 'CreateQuizProfileFormModel_phone_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'phone',
										'enableAjaxValidation' : true
									},
									{
										'id' : 'CreateQuizProfileFormModel_voorwaarden',
										'inputID' : 'CreateQuizProfileFormModel_voorwaarden',
										'errorID' : 'CreateQuizProfileFormModel_voorwaarden_em_',
										'model' : 'CreateQuizProfileFormModel',
										'name' : 'voorwaarden',
										'enableAjaxValidation' : true,
										'clientValidation' : function(value,
												messages, attribute) {

											if (jQuery.trim(value) == '') {
												messages
														.push("Terms cannot be blank.");
											}

										}
									} ],
							'errorCss' : 'error'
						});
		$(function() {
			window.onbeforeunload = function() {
				return 'Are you sure you don\'t wan\'t to complete and save your quiz?';
			}
			$('form').submit(function() {
				window.onbeforeunload = null;
			});
			$('a').click(function(ev) {
				if (!/^#/.test(this.href)) {
					window.onbeforeunload = null;
				}
				;
			});
		});

		$(document)
				.ready(
						function() {
							var time = new Date();
							var timezone = -time.getTimezoneOffset() / 60;
							$
									.ajax({
										type : 'GET',
										url : 'https://www.onlineexambuilder.com/site/index.php?r=profile/timezone&language=en',
										data : 'time=' + timezone,
										dataType : 'json',
										success : function(data) {
											$(
													'#CreateQuizProfileFormModel_timezone')
													.val(data['timezone']);
										},
									});
						});
	});
	/*]]>*/
</script>