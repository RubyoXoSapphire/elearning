<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="page-header">
	<h1>
		View <small> <i class="ace-icon fa fa-angle-double-right"></i>
			Subject: ${subject.name }
		</small>
	</h1>
</div>
<div class="row">
	<div class="col-xs-12">
	</div>
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->

		<div class="row">
							<!-- #section:pages/dashboard.comments -->
							<div class="comments ace-scroll" style="position: relative;">
								<div class="scroll-track scroll-active scroll-hover" style="display: none; height: 300px;">
									<div class="scroll-bar" style="height: 288px; top: 0px;"></div>
								</div>
								<div class="scroll-content">
									<c:forEach var="chapter" items="${listChapter}">
											<div class="itemdiv commentdiv">
												
		
												<div class="body">
													<div class="name">
														<a href="#">${chapter.name }</a>
													</div>
		
													
		
													<div class="text">
														 ${chapter.notes }
													</div>
												</div>
												<div class="tools">
													<div class="action-buttons bigger-125">
														<a href="view-subject-${subject.subjectId }/edit-chapter-${chapter.chapterId}" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
															<i class="ace-icon fa fa-pencil blue"></i>
														</a>
			
														<a href="#" class="tooltip-success deleterecord" data-rel="tooltip" title="" data-id="${chapter.chapterId }" data-original-title="Delete">
															<i class="ace-icon fa fa-trash-o red"></i>
														</a>
													</div>
												</div>
											</div>
									</c:forEach>		
								</div>
							</div>

							<div class="hr hr8"></div>

							<div class="center">
								<i class="ace-icon fa fa-comments-o fa-2x green middle"></i>

								&nbsp; <a href="view-subject-${subject.subjectId }/add-chapter" class="btn btn-sm btn-white btn-info">
									Add chapter &nbsp; <i class="ace-icon fa fa-arrow-right"></i>
								</a>
							</div>

							<div class="hr hr-double hr8"></div>

							<!-- /section:pages/dashboard.comments -->
						</div>
		

		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<!-- /.page-header -->
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	$('.deleterecord').on("click",function (e){
		//display a modal
		e.preventDefault();
		var chapid=$(this).data("id");
		var modal = 
		'<div class="modal fade" id="delete-modal">\
		  <div class="modal-dialog">\
		   <div class="modal-content">\
			<div class="modal-body">\
			 	<button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
					  <label >Are you sure delete </label>\
					  <span class="btn-danger" >'+ chapid + '</span> ?\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-dismiss="modal" id="btn-delete-record"><i class="ace-icon fa fa-trash-o"></i> Delete</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
		  </div>\
		 </div>\
		</div>';
		var modal = $(modal).appendTo('body');
		$("#btn-delete-record").on('click',function(e){
			e.preventDefault();
			window.location.href="view-subject-${subject.subjectId }/delete-chapter-"+chapid;
		});
		$('.modal').on('hidden.bs.modal' , function () {
			  $(this).remove();
		});
		modal.modal('show');
	});
});

</script>