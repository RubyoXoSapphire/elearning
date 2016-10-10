<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="page-header">
	<h1>Update Profile</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="add-user" class="form-horizontal" role="form"
			modelAttribute="user">
			<!-- #section:elements.form -->
			<spring:bind path="userId">
			<div class="form-group ${status.error?'has-error':''}">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-input-readonly"> ID </label>

				<div class="col-sm-9">
					<form:input path="userId" type="text"
						class="col-xs-10 col-sm-5" />

				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  ${status.error?'has-error':''}" style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="userId"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			
			</spring:bind>
			<spring:bind path="password">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="password" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">New Password </form:label>
				<div class="col-sm-9">
					<form:input path="password" type="password" id="form-field-1"
						placeholder="New Password" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="password"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			
			</spring:bind>
			<spring:bind path="role">
			<div class="form-group">
				<form:label path="role.roleId"
					class="col-sm-3 control-label no-padding-right"
					for="form-field-mask-2">
																Role
															</form:label>
				<div class="input-group col-sm-9" style="padding-left: 12px;">
					<form:select class="col-xs-10 col-sm-5" id="form-field-select-1"
						path="role.roleId">
						<option value=""></option>
						<c:forEach var="role" items="${listRole}">
							<option value="${role.roleId}">${role.name}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="role.roleId"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			
			</spring:bind>
			
			<spring:bind path="firstName">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">First Name </form:label>
				<div class="col-sm-9">
					<form:input path="firstName" type="text" id="form-field-1"
						placeholder="First Name" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group ${status.error?'has-error':''} " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="firstName"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			<spring:bind path="lastName">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Last Name </form:label>
				<div class="col-sm-9">
					<form:input path="lastName" type="text" id="form-field-1"
						placeholder="Last Name" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="lastName"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right">Sex</form:label>
				<div class="radio">
					<label> <form:radiobutton path="sex"
							name="form-field-radio" class="ace" value="1" checked="checked"/> <span
						class="lbl">Male</span>
					</label> <label> <form:radiobutton path="sex"
							name="form-field-radio" class="ace" value="0" /> <span
						class="lbl">Female</span>
					</label>
				</div>
			</div>
			
			
			
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Address </form:label>
				<div class="">
					<form:textarea path="address" class="col-xs-7 col-sm-4" id="form-field-9"
						maxlength="50" placeholder="Address" style="margin-left: 10px"></form:textarea>
				</div>
			</div>


			<spring:bind path="phone">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-mask-2">
																Phone
																<small class="text-warning">(090) 999-9999</small>
				</form:label>

				<div class="input-group col-sm-9" style="padding-left: 12px;">
					<span class="input-group-addon"> <i
						class="ace-icon fa fa-phone"></i>
					</span>

					<form:input path="phone" class="col-xs-10 col-sm-5 " type="text"
						id="form-field-mask-2" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="userId"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<spring:bind path="dateOfBirth">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-mask-2">
																Date of birth
															</form:label>
				<div class="input-group col-sm-9" style="padding-left: 12px;">
					<span class="input-group-addon"> <i
						class="fa fa-calendar bigger-110"></i>
					</span>
					<form:input path="dateOfBirth"
						class="date-picker col-xs-10 col-sm-5" id="id-date-picker-1"
						type="text" placeholder="Date of birth"
						data-date-format="dd/mm/yyyy" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error} ">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="dateOfBirth"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			<!-- /section:elements.form -->
			<div class="space-4"></div>
			<spring:bind path="email">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right">Email</form:label>

				<div class="col-sm-9">
					<!-- #section:elements.form.input-icon -->
					<span
						class="input-icon input-icon-right col-xd-10 col-sm-5 input-group">
						<form:input path="email" type="text" id="form-field-icon-2"
							class="col-xd-12 col-sm-12" placeholder="Email" /> <i
						class="ace-icon glyphicon glyphicon-envelope"></i>
					</span>

				</div>

				<!-- /section:elements.form.input-icon -->
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="email"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<div class="space-4"></div>
			
			<spring:bind path="idCard">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="" class="col-sm-3 control-label no-padding-right">Identity Card</form:label>

				<div class="col-sm-9">
					<!-- #section:elements.form.input-icon -->
					<span
						class="input-icon input-icon-right col-xd-10 col-sm-5 input-group">
						<form:input path="idCard" type="text" id="form-field-icon-2"
							class="col-xd-12 col-sm-12" placeholder="Card ID" /> <i
						class="ace-icon glyphicon glyphicon-credit-card"></i>
					</span>

				</div>

				<!-- /section:elements.form.input-icon -->
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="idCard"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<div class="space-4"></div>

			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right">Enabled</form:label>
				<div class="radio">
					<label> <form:radiobutton path="enabled"
							name="form-field-radio" class="ace" value="1" /> <span
						class="lbl">True</span>
					</label> <label> <form:radiobutton path="enabled"
							name="form-field-radio" class="ace" value="0" /> <span
						class="lbl">False</span>
					</label>
				</div>
			</div>

			<div class="form-group">
				<%-- <jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" dateStyle="long" />
				<fmt:formatDate var="dateNow" value="${now}" pattern="yyyy-MM-dd" />
				<form:input path="createDate" type="hidden" /> --%>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<form:button path="" class="btn btn-info" type="submit"
						style="">
						<i class="ace-icon fa fa-check bigger-110"></i>
												Submit
											</form:button>

					&nbsp; &nbsp; &nbsp;
					<form:button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>
												Reset
											</form:button>
				</div>
			</div>

			<div class="hr hr-24"></div>
		</form:form>
	</div>
</div>