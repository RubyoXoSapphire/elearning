<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/resources/Admin/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/resources/Admin/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/resources/Admin/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/jquery-ui.custom.js"></script>
		<tiles:importAttribute name="pluginscripts"/>
		<c:forEach var="script" items="${pluginscripts}">
        	<script src="<c:url value="${script}"/>"></script>
    	</c:forEach>
		
		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.scroller.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.colorpicker.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.fileinput.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.typeahead.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.spinner.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.treeview.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.wizard.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.aside.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.ajax-content.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.touch-drag.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.sidebar.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.widget-box.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.settings.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.settings-skin.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->
		<tiles:importAttribute name="inlinescripts"/>
		<c:forEach var="item" items="${inlinescripts}">
        	<script src="<c:url value="${item}"/>"></script>
    	</c:forEach>
		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Admin/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/elements.onpage-help.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/assets/js/ace/ace.onpage-help.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/rainbow.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/language/generic.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/language/html.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/language/css.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Admin/docs/assets/js/language/javascript.js"></script>