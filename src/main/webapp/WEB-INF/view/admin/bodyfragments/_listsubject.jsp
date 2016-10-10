<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="page-header">
	<h1>
		List <small> <i class="ace-icon fa fa-angle-double-right"></i>
			Subject
		</small>
	</h1>
</div>
<!-- /.page-header -->

<div>
	<div class="row">
		<div class="col-xs-12">
			<button style="margin-left: 0" id="btnAdd" class="btn btn-info"
				type="button" >
				<i class="ace-icon fa fa-plus bigger-110"></i> Add Subject
			</button>
		</div>

	</div>
	<div id="feedback"></div>
	<div id="dynamic-table_wrapper"
		class="dataTables_wrapper form-inline no-footer">

		<div class="row">
			<div class="col-xs-6">
				<div class="dataTables_length" id="dynamic-table_length">
					<label>Display <select name="dynamic-table_length" id="pageSizeSelect"
						aria-controls="dynamic-table" class="form-control input-sm"><option
								value="10" ${pageSize==10?'selected':'' }>10</option>
							<option value="25" ${pageSize==25?'selected':'' }>25</option>
							<option value="50" ${pageSize==50?'selected':'' }>50</option>
							<option value="100" ${pageSize==100?'selected':'' }>100</option></select> records
					</label>
				</div>
			</div>
			<div class="col-xs-6">
				<div id="dynamic-table_filter" class="dataTables_filter">
					<label>Search:<input type="text"
						class="form-control input-sm" placeholder="Input keyword..."
						aria-controls="dynamic-table" id="txtSearch" value="${keyword }"></label>
					
				</div>
			</div>
		</div>
		<table id="dynamic-table"
			class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
			role="grid" aria-describedby="dynamic-table_info">

			<thead>
				<tr role="row">

					<th class="center sorting_disabled" rowspan="1" colspan="1"
						aria-label=""><label class="pos-rel"> <input
							type="checkbox" class="ace"> <span class="lbl"></span>
					</label></th>

					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Domain: activate to sort column ascending">Subject
						ID</th>

					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Subject Name</th>

					<th class="hidden-480 sorting" tabindex="0"
						aria-controls="dynamic-table" rowspan="1" colspan="1"
						aria-label="Status: activate to sort column ascending">Status</th>
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
				</tr>
			</thead>

			<tbody id="display_data">
				
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6">
				<div class="dataTables_info" id="page_info" role="status"
					aria-live="polite">
				</div>
			</div>
			<div class="col-xs-6">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dynamic-table_paginate">
					<ul class="pagination">
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	var search = $("#txtSearch").val();
	var pagesize=$("#pageSizeSelect").val();
	var pagenumber=1;
	 $('#txtSearch').keyup(function(event){
		search = $("#txtSearch").val();
		ajaxData();
	}); 
	$('#pageSizeSelect').on('change',function(event){
		pagesize=$("#pageSizeSelect").val();
		ajaxData();
	});
	ajaxData();
	initPagination();
	$("#btnAdd").on('click', function(event) {
		location.href = "add-subject";
	});
	function initPagination(){
		$(".page_a").on('click',function (e){
			e.preventDefault();
			if(!$(this).parent().hasClass('disabled')){
				pagenumber=$(this).data('id');
				ajaxData();
			}
				
		});
		$('.deleterecord').on("click",function (e){
			//display a modal
			event.preventDefault();
			var subjectid=$(this).data("id");
			var modal = 
			'<div class="modal fade" id="delete-modal">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
				<div class="modal-body">\
				 	<button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
						  <label >Are you sure delete </label>\
						  <span class="btn-danger" >'+ subjectid + '</span> ?\
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
				ajaxDelete(subjectid);
			});
			$('.modal').on('hidden.bs.modal' , function () {
				  $(this).remove();
			});
			modal.modal('show');
		});
	}
	
	function ajaxDelete(id){
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "delete-subject",
			data : JSON.stringify(id),
			async: false,
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		ajaxData();
	}
	function ajaxData(){
		$.ajax({
			type : "POST",
			contentType : "application/json; charset=utf-8",
			url : "list-subject/search?pagesize="+pagesize+"&pagenumber="+pagenumber,
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	function display(data) {
		/*   var json = "<h4>Ajax Response</h4><pre>"
				+ JSON.stringify(data, null, 4) + "</pre>";
		$('#feedback').html(json);   */ 
		$("#display_data").html("");
		for (var i=0;i<data.result.content.length;i++){
			var item=data.result.content[i];
			var display_data=
				'<tr role="row" class="even">\
					<td class="center"><label class="pos-rel"> <input type="checkbox" class="ace"> <span class="lbl"></span>\
				</label></td>\
					<td><a href="#">'+item.subjectId+'</a></td>\
					<td>'+item.name+'</td>\
					<td class="hidden-480"><span\
						class="label label-sm label-'+(item.enabled?"success":"danger")+' ">'+(item.enabled?"Enabled":"Disabled")+'</span></td>\
					<td>\
						<div class="hidden-sm hidden-xs action-buttons">\
							<a class="blue" href="view-subject-'+item.subjectId+'">\
								<i class="ace-icon fa fa-search-plus bigger-130"></i>\
							</a> <a class="green" href="edit-subject-'+item.subjectId+'">\
								<i class="ace-icon fa fa-pencil bigger-130"></i>\
							</a> <a class="red deleterecord" href="#" data-id="'+item.subjectId+'">\
								<i class="ace-icon fa fa-trash-o bigger-130"></i>\
							</a>\
						</div>\
						<div class="hidden-md hidden-lg">\
							<div class="inline pos-rel">\
								<button class="btn btn-minier btn-yellow dropdown-toggle"\
									data-toggle="dropdown" data-position="auto">\
									<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>\
								</button>\
								<ul\
									class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">\
									<li><a href="view-subject-'+item.subjectId+'" class="tooltip-info" data-rel="tooltip"\
										title="" data-original-title="View"> <span class="blue">\
												<i class="ace-icon fa fa-search-plus bigger-120"></i>\
										</span>\
									</a></li>\
									<li><a href="edit-subject-'+item.subjectId+'" class="tooltip-success"\
										data-rel="tooltip" title="" data-original-title="Edit"> <span\
											class="green"> <i\
												class="ace-icon fa fa-pencil-square-o bigger-120"></i>\
										</span>\
									</a></li>\
									<li><a href="#" class="tooltip-error deleterecord" data-rel="tooltip"\
										title="" data-id="'+item.subjectId+'" data-original-title="Delete"> <span class="red">\
												<i class="ace-icon fa fa-trash-o bigger-120"></i>\
										</span>\
									</a></li>\
								</ul>\
							</div>\
						</div>\
					</td>\
				</tr>';
				$("#display_data").append(display_data);
				
		}
		var begin = Math.max(1, data.result.number - 5);
		var end = Math.min(begin + 10, data.result.totalPages);
		var endRcIdx = ((pagenumber-1) * pagesize) + data.result.content.length;
		var beginRcIdx=((pagenumber-1) * pagesize) + 1;
		$("#page_info").html('View '+beginRcIdx+' - '+endRcIdx+' of '+(data.result.totalElements)+' Records');
		$(".pagination").html("");
		if(data.result.first==false){
			$(".pagination").append('<li class="paginate_button previous " \
					aria-controls="dynamic-table" tabindex="0" id="first-page-button">\
					<a href="#" class="page_a" data-id="1">First</a></li>');
		}
		$(".pagination").append('<li class="paginate_button previous '+(data.result.number+1==1?"disabled":"")+' "\
				aria-controls="dynamic-table" tabindex="0"\
				id="previous-page-button"><a href="#" class="page_a" data-id="'+(pagenumber-1)+'">Previous</a></li>');
		for(var i=begin;i<=end;i++){
			$(".pagination").append('<li class="paginate_button '+(data.result.number+1==i?"active":"")+' aria-controls="dynamic-table" \
					tabindex="0" ><a href="#" class="page_a" data-id="'+i+'">'+i+'</a></li>');
		}
		
		$(".pagination").append('<li class="paginate_button next '+(data.result.number+1==data.result.totalPages?"disabled":"")+'"\
			aria-controls="dynamic-table" tabindex="0" id="next-page-button"><a class="page_a" data-id="'+(pagenumber+1)+'">Next</a></li>');
		if(data.result.last==false){
			$(".pagination").append('<li class="paginate_button previous "\
					aria-controls="dynamic-table" tabindex="0"\
						id="last-page-button"><a href="#" class="page_a" data-id="'+(data.result.totalPages)+'">Last</a></li>');
		}
		initPagination(search);
	}
});
</script>