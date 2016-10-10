<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="page-header">
	<h1>Update Profile</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="add-semester" class="form-horizontal" role="form"
			modelAttribute="command">
			<!-- #section:elements.form -->
			<spring:bind path="semesterId">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="semesterId"
					class="col-sm-3 control-label no-padding-right" for="form-field-1"> Semester ID </form:label>

				<div class="col-sm-9">
					<form:input path="semesterId" type="text" id="form-field-1"
						placeholder="Semester ID" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="semesterId"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			
			</spring:bind>
			<spring:bind path="name">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="name"
					class="col-sm-3 control-label no-padding-right" for="form-field-1"> Semester Name </form:label>

				<div class="col-sm-9 ">
					<form:input path="name" type="text" id="form-field-1"
						placeholder="Semester Name" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="name"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<spring:bind path="beginDate">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="beginDate" class="col-sm-3 control-label no-padding-right"
					for="form-field-mask-2">
																Begin Date
															</form:label>
				<div class="input-group col-sm-9" style="padding-left: 12px;">
					<span class="input-group-addon"> <i
						class="fa fa-calendar bigger-110"></i>
					</span>
					<form:input path="beginDate"
						class="date-picker col-xs-10 col-sm-5" id="id-date-picker-1"
						type="text" placeholder="Begin Date"
						data-date-format="dd/mm/yyyy" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="beginDate"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<spring:bind path="endDate">
			<div class="form-group ${status.error?'has-error':''}">
				<form:label path="endDate" class="col-sm-3 control-label no-padding-right"
					for="form-field-mask-2">
																End Date
															</form:label>
				<div class="input-group col-sm-9" style="padding-left: 12px;">
					<span class="input-group-addon"> <i
						class="fa fa-calendar bigger-110"></i>
					</span>
					<form:input path="endDate"
						class="date-picker col-xs-10 col-sm-5" id="id-date-picker-1"
						type="text" placeholder="End Date"
						data-date-format="dd/mm/yyyy" />
				</div>
			</div>
			<c:choose>
			<c:when test="${status.error}">
			<div class="form-group  " style="~margin-bottom:15px;">
				<div class=" col-xs-10 col-sm-4 col-sm-offset-3 " >
					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<form:errors path="endDate"  element="span" delimiter="<br/><span class=\"glyphicon glyphicon-exclamation-sign\" aria-hidden=\"true\"></span> " >
							
						</form:errors>
					</div>
				</div>
			</div>
			</c:when>
			</c:choose>
			</spring:bind>
			
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right">Enabled</form:label>
				<div class="radio">
					<label> <form:radiobutton path="enabled"
							name="form-field-radio" class="ace" value="1"/> <span
						class="lbl">True</span>
					</label> <label> <form:radiobutton path="enabled"
							name="form-field-radio" class="ace" value="0" /> <span
						class="lbl">False</span>
					</label>
				</div>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<form:button path="" class="btn btn-info" type="submit">
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
	<!-- /.col -->
</div>
<!-- /.row -->
<%-- <c:choose >
	<c:when test="${message}">
		<script type="text/javascript">
			alert("${message}");
		</script>
	</c:when>
</c:choose> --%>
