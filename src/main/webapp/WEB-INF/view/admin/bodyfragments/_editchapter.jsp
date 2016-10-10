<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<div class="page-header">
	<h1>Add Chapter</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="edit-chapter" class="form-horizontal" role="form"
			modelAttribute="chapter">
			<!-- #section:elements.form -->
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Chapter Name </form:label>
				<div class="col-sm-9">
					<form:input path="name" type="text" id="form-field-1"
						placeholder="Chapter name ..." class="col-xs-10 col-sm-5" readonly="true" />
				</div>
			</div>
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Serial of chapter </form:label>
				<div class="col-sm-9">
					<form:input path="chaperSerial" type="number" id="form-field-1"
						placeholder="Type number ..." class="col-xs-10 col-sm-5" />
				</div>
			</div>
			

			<div class="space-4"></div>
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Notes </form:label>
				<div class="col-sm-9">
					<form:textarea path="notes" id="form-field-1"
						placeholder="Notes ..." class="col-xs-10 col-sm-5" />
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