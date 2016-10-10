<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="page-header">
	<h1>
		List <small> <i class="ace-icon fa fa-angle-double-right"></i>
			question
		</small>
	</h1>
</div>
<!-- /.page-header -->
<script src="/elearning/resources/Admin/assets/js/jquery.js"></script>
<script type="text/javascript">
	
</script>
<div>
	<div class="row">
		<div class="col-xs-12">
			<button style="margin-left: 0" id="btnAdd" class="btn btn-info"
				type="button" >
				<i class="ace-icon fa fa-plus bigger-110"></i> Add question
			</button>
		</div>

	</div>
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
						aria-label="Domain: activate to sort column ascending">Question ID</th>

					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Content</th>

					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Question Level</th>
					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Chapter</th>
					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Create By</th>
					
					<th class="sorting" tabindex="0" aria-controls="dynamic-table"
						rowspan="1" colspan="1"
						aria-label="Price: activate to sort column ascending">Type</th>

					<th class="hidden-480 sorting" tabindex="0"
						aria-controls="dynamic-table" rowspan="1" colspan="1"
						aria-label="Status: activate to sort column ascending">Status</th>
					<th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="question" items="${listQuestion.getContent()}">
					<tr role="row" class="even">
						<td class="center"><label class="pos-rel"> <input
								type="checkbox" class="ace"> <span class="lbl"></span>
						</label></td>

						<td><a href="#">${question.questionId}</a></td>
						<td>${question.content}</td>
						<td>${question.questionLevel}</td>
						<td>${question.chapter.name}</td>
						<td>${question.user.lastName} ${question.user.firstName}</td>
						<td>${question.type.contentType}</td>
						<c:set var="enabled"
							value='${question.getEnabled()==1?"success":"danger" }' />
						<td class="hidden-480"><span
							class="label label-sm label-${enabled} ">${question.getEnabled()==1?"Enabled":"Disabled" }</span></td>
						<td>
							<div class="hidden-sm hidden-xs action-buttons">
								<a class="blue" href="edit-user-${question.questionId}"> <i
									class="ace-icon fa fa-search-plus bigger-130"></i>
								</a> <a class="green" href="edit-user--${question.questionId}"> <i
									class="ace-icon fa fa-pencil bigger-130"></i>
								</a> <a class="red" href="delete-user-${question.questionId}"> <i
									class="ace-icon fa fa-trash-o bigger-130"></i>
								</a>
							</div>

							<div class="hidden-md hidden-lg">
								<div class="inline pos-rel">
									<button class="btn btn-minier btn-yellow dropdown-toggle"
										data-toggle="dropdown" data-position="auto">
										<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
									</button>

									<ul
										class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
										<li><a href="#" class="tooltip-info" data-rel="tooltip"
											title="" data-original-title="View"> <span class="blue">
													<i class="ace-icon fa fa-search-plus bigger-120"></i>
											</span>
										</a></li>

										<li><a href="#" class="tooltip-success"
											data-rel="tooltip" title="" data-original-title="Edit"> <span
												class="green"> <i
													class="ace-icon fa fa-pencil-square-o bigger-120"></i>
											</span>
										</a></li>

										<li><a href="#" class="tooltip-error" data-rel="tooltip"
											title="" data-original-title="Delete"> <span class="red">
													<i class="ace-icon fa fa-trash-o bigger-120"></i>
											</span>
										</a></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6">
				<div class="dataTables_info" id="dynamic-table_info" role="status"
					aria-live="polite">
					View <c:out value="${beginRcIdx!=null?beginRcIdx:0}" /> - <c:out value="${endRcIdx!=null?endRcIdx:0}" /> of
					<c:out value="${countRecord}" />
					Records
				</div>
			</div>
			<div class="col-xs-6">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dynamic-table_paginate">
					<ul class="pagination">
						<c:choose>
							<c:when test="${keyword!=null}">
								<c:set var="kwpr" value="?kw=${keyword}&"/>
							</c:when>
							<c:otherwise>
								<c:set var="kwpr" value="?"/>
							</c:otherwise>
						</c:choose>
						<c:if var="x" test="${listSem.getTotalPages()>0}">
							<li class="paginate_button previous "
								aria-controls="dynamic-table" tabindex="0" id="firstButton"
								onclick=""><a href="${kwpr}page=1${pageSize!=null?'&size=':''}${pageSize!=null?pageSize:''}">First</a></li>
						</c:if>
						
						
						<li class="paginate_button previous ${currentIndex==1?'disabled':''}"
							aria-controls="dynamic-table" tabindex="0"
							id="dynamic-table_previous"><a href="${kwpr}page=${currentIndex-1 }${pageSize!=null?'&size=':''}${pageSize!=null?pageSize:''}">Previous</a></li>
						
						<c:forEach var="i" begin="${beginIndex }" end="${endIndex }">
							<li class="paginate_button ${i==currentIndex?'active':''}" aria-controls="dynamic-table"
							tabindex="0"><a href="${kwpr}page=${i }${pageSize!=null?'&size=':''}${pageSize!=null?pageSize:''}">${i}</a></li>
						</c:forEach>
						<li class="paginate_button next ${currentIndex==listSem.getTotalPages()?'disabled':''}"
							aria-controls="dynamic-table" tabindex="0"
							id="dynamic-table_next"><a href="${kwpr}page=${currentIndex+1 }${pageSize!=null?'&size=':''}${pageSize!=null?pageSize:''}">Next</a></li>
						<c:if var="x" test="${listSem.getTotalPages()>0}">
						<li class="paginate_button previous "
								aria-controls="dynamic-table" tabindex="0"
								id="dynamic-table_previous"><a href="${kwpr}page=${listSem.getTotalPages()}${pageSize!=null?'&size=':''}${pageSize!=null?pageSize:''}">Last</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">	
document.getElementById("btnAdd").onclick = function() {
	location.href = "add-question";
};
document.addEventListener("DOMContentLoaded",function () {
		$('#txtSearch').bind("enterKey",function(e){
			location.href = "list-question?kw="+$(this).val();
			});
		$('#txtSearch').keyup(function(event){
		    if(event.which === 13){
		        $('#txtSearch').trigger('enterKey');
		    }
		});
		$('.deleterecord').on("click",function (e){
			//display a modal
			
			event.preventDefault(); 
			var semid=$(this).data("id");
			var modal = 
			'<div class="modal fade">\
			  <div class="modal-dialog">\
			   <div class="modal-content">\
			   <form class="no-margin" action="delete-question-'+ semid + '" method="POST">\
					 <div class="modal-body">\
					   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
						  <label >Are you sure delete </label>\
						  <span class="btn-danger" >'+ semid + '</span> ?\
					 </div>\
					 <div class="modal-footer">\
						<button type="submit" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete</button>\
						<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
					 </div>\
				 </form>\
			  </div>\
			 </div>\
			</div>';
		
		
			var modal = $(modal).appendTo('body');
			modal.modal('show');
		
		});
		$('.disabled').click(function(e){
		     e.preventDefault();
		  });
		function addParameterToURL(_url,param){
			if(param != ""){
		    	_url += (_url.split('?')[1] ? '&':'?') + param;
			}
		    return _url;
		}
		$('#pageSizeSelect').on('change',function(){ 
		    var pageSize = this.value;
		    pageSize= "size="+pageSize;
			var pageNumber = "${currentIndex!=null?'page=':''}${currentIndex!=null?currentIndex:''}";
			var kword="${keyword}";
			var rshref= "list-question";
			if(kword != ""){
				kword="kw="+kword;
				rshref=addParameterToURL(rshref,kword);
			}
			rshref=addParameterToURL(rshref,pageNumber);
			rshref=addParameterToURL(rshref,pageSize);
			window.location = rshref;
		});
});
</script>