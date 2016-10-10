<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
	<h1>Add New Class</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="add-class" class="form-horizontal" role="form"
			modelAttribute="class">
			<!-- #section:elements.form -->
			<spring:bind path="semester.semesterId">
				<div class="form-group" ${status.error?'has-error':''}>
					<form:label path="subject.subjectId"
						class="col-sm-3 control-label no-padding-right"
						for="form-field-mask-2">
																Semester
															</form:label>
					<div class="col-sm-9">
						<form:input path="semester.semesterId" type="hidden"
							id="form-field-1" value="${currentSemester.semesterId }"
							class="col-xs-10 col-sm-5" />
						<form:input path="" type="text" id="form-field-1"
							value="${currentSemester.name }" class="col-xs-10 col-sm-5"
							readonly="true" />
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group  " style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="semester.semesterId" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>

			</spring:bind>
			<spring:bind path="subject">
				<div class="form-group ${status.error?'has-error':''}">
					<form:label path="subject.subjectId"
						class="col-sm-3 control-label no-padding-right"
						for="form-field-mask-2">
																Subject
															</form:label>
					<div class="input-group col-sm-9" style="padding-left: 12px;">
						<form:select class="col-xs-10 col-sm-5" id="form-field-select-1"
							path="subject">
							<option value=""></option>
							<form:options items="${listSubject}" itemValue="subjectId"
								itemLabel="name" />

							<%-- <c:forEach var="subject" items="${listSubject}">
							<option value="${subject.subjectId}">${subject.name}</option>
						</c:forEach> --%>
						</form:select>
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group has-error " style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="subject" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>

			</spring:bind>
			<spring:bind path="user">
				<div class="form-group ${status.error?'has-error':''}">
					<form:label path="user.userId"
						class="col-sm-3 control-label no-padding-right"
						for="form-field-mask-2">
																Teacher
															</form:label>
					<div class="input-group col-sm-9" style="padding-left: 12px;">
						<form:select class="col-xs-10 col-sm-5" id="form-field-select-1"
							path="user">
							<option value=""></option>
							<form:options items="${listTeacher}" itemValue="userId"
								itemLabel="firstName" />
							<%-- <c:forEach var="teacher" items="${listTeacher}">
							
							<option value="${teacher.userId}">${teacher.firstName} ${teacher.lastName}</option>
						</c:forEach> --%>
						</form:select>
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group has-error " style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="user" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>

			</spring:bind>
			<spring:bind path="numberMax">
				<div class="form-group ${status.error?'has-error':''}">
					<form:label path="" class="col-sm-3 control-label no-padding-right"
						for="form-field-1">Number of Stud Max </form:label>
					<div class="col-sm-9">
						<form:input path="numberMax" type="number" id="form-field-1"
							placeholder="Number of Stud Max" class="col-xs-10 col-sm-5" />
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group ${status.error?'has-error':''} "
							style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="numberMax" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</spring:bind>

			<spring:bind path="beginDate">
				<div class="form-group ${status.error?'has-error':''}">
					<form:label path="" class="col-sm-3 control-label no-padding-right"
						for="form-field-mask-2">
																Begin Date
															</form:label>
					<div class="input-group col-sm-9" style="padding-left: 12px;">
						<span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
						<form:input path="beginDate"
							class="date-picker col-xs-10 col-sm-5" id="id-date-picker-1"
							type="text" placeholder="Date of birth"
							data-date-format="dd/mm/yyyy" />
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group has-error " style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="beginDate" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</spring:bind>
			<spring:bind path="endDate">
				<div class="form-group ${status.error?'has-error':''}">
					<form:label path="" class="col-sm-3 control-label no-padding-right"
						for="form-field-mask-2">
																End Date
															</form:label>
					<div class="input-group col-sm-9" style="padding-left: 12px;">
						<span class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span>
						<form:input path="endDate" class="date-picker col-xs-10 col-sm-5"
							id="id-date-picker-1" type="text" placeholder="Date of birth"
							data-date-format="dd/mm/yyyy" />
					</div>
				</div>
				<c:choose>
					<c:when test="${status.error}">
						<div class="form-group has-error " style="margin-bottom: 15px;">
							<div class=" col-xs-10 col-sm-4 col-sm-offset-3 ">
								<div class="alert alert-danger">
									<span class="glyphicon glyphicon-exclamation-sign"
										aria-hidden="true"></span>
									<form:errors path="endDate" element="span"
										delimiter="<br/><span class=\" glyphicon
										glyphicon-exclamation-sign\" aria-hidden=\"true\">
										</span> " >
							
						</form:errors>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</spring:bind>
			<!-- /section:elements.form -->


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
					<form:button path="" class="btn btn-info" type="submit" style="">
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