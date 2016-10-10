<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<div class="page-header">
	<h1>Update Profile</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="delete-semester-${id}" class="form-horizontal"
			role="form" modelAttribute="command">
			<!-- #section:elements.form -->

			<div class="form-group">
				<form:label path="semesterId"
					class="col-sm-3 control-label no-padding-right" for="form-field-1"> Semester ID </form:label>

				<div class="col-sm-9">
					<form:input path="semesterId" readonly="true" type="text"
						id="form-field-1" placeholder="Semester ID"
						class="col-xs-10 col-sm-5" />
				</div>
			</div>

			<div class="form-group">
				<form:label path="name"
					class="col-sm-3 control-label no-padding-right" for="form-field-1"> Semester Name </form:label>

				<div class="col-sm-9">
					<form:input path="name" type="text" id="form-field-1"
						placeholder="Semester Name" class="col-xs-10 col-sm-5"
						readonly="true" />
				</div>
			</div>

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

			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">


					<form:button class="btn btn-danger" type="submit"
						style="margin-left:20px">
						<i class="ace-icon fa fa-trash bigger-110"></i>
						Delete
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
