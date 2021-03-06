<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="playpage no-js" lang="en">

<head>
<title><tiles:insertAttribute name="title" /></title>
<tiles:insertAttribute name="header" />
</head>
<body class=" <tiles:getAsString name="bodyclass" />">
	<div class="wrapper">
		<div class="container">
			<tiles:insertAttribute name="menu" />
			<div id="ajax_content">
				<tiles:insertAttribute name="body" />
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>