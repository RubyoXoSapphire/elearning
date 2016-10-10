<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<div class="page-header">
	<h1>Add Subject</h1>
</div>
<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form action="edit-subject" class="form-horizontal" role="form"
			modelAttribute="subject">
			<!-- #section:elements.form -->
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Subject ID </form:label>
				<div class="col-sm-9">
					<form:input path="subjectId" type="text" id="form-field-1"
						placeholder="Subject ID ..." class="col-xs-10 col-sm-5"  readonly="true"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="" class="col-sm-3 control-label no-padding-right"
					for="form-field-1">Subject Name </form:label>
				<div class="col-sm-9">
					<form:input path="name" type="text" id="form-field-1"
						placeholder="Subject Name ..." class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<!-- 
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-tags">Chapter</label>

				<div class="col-sm-9">
					#section:plugins/input.tag-input
					<div class="inline">
						<div class="tags" style="width:100%;">
							<input type="text" placeholder="Chapter added ..." readonly="true">
						</div>
					</div>
					/section:plugins/input.tag-input
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3"></div>
				<div class="col-sm-9">
					<div class="col-xs-10 col-sm-5">
						<button style="margin-left: 0" id="btnAddChapter" class="btn btn-success" type="button" >
							<i class="ace-icon fa fa-plus bigger-110"></i> Add Chapter
						</button>
					</div>
				</div>
			</div>  -->
			

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
<!-- <script type="text/javascript">
	var counter=1;
	function removeChapter(caller) {
		var id = $(caller).data("id");
	    $("*[data-id=btn-" + id + "]").parent().remove();   
	};
	function AddChapter(){
		var chapterName = $("*[data-id=cname-" + counter + "]");
		var chapterelement=
			'<span class="tag">\
				<span data-id=""'+chapterName.val()+'\
				<button type="button" class="close remove-chapter" data-id="btn-'+counter+'" onclick="removeChapter(this)">×</button>\
			</span>';
		$(".tags").append(chapterelement);
		counter=counter+1;
	};
	$("#btnAddChapter").on('click',function(){
		var modal = 
			'<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				 <div class="modal-body">\
				   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
				   <div class="row">\
					  <div class="col-xs-12">\
						  <form class="form-horizontal">\
							  <div class="form-group">\
							  	<label class="col-sm-3 control-label no-padding-right">Chapter Name &nbsp;</label>\
							  	<div class="col-sm-9">\
							  		<input class="col-xs-10 col-sm-10" type="text" value="" data-id="cname-'+counter+'"/>\
							  	</div>\
							  </div>\
							  <div class="form-group">\
							  	<label class="col-sm-3 control-label no-padding-right">Notes &nbsp;</label>\
							  	<div class="col-sm-9">\
							  	<textarea  rows="5" class="col-xs-10 col-sm-10" data-id="cnotes-'+counter+'"></textarea>\
							  	</div>\
							  </div>\
						  </form>\
				      </div>\
				   </div>\
				 </div>\
				 <div class="modal-footer">\
				 	<button type="button" class="btn btn-sm btn-success" onclick="return AddChapter();" data-dismiss="modal"><i class="ace-icon fa fa-check"></i> Save</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';
		var modal = $(modal).appendTo('body');
		modal.modal('show');
	});
</script> -->