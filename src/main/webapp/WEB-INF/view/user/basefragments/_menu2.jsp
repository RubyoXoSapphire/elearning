<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>







<div class="header">
	<p class="activeuser">
		Logged in as ${pageContext.request.userPrincipal.name} | <a class="logout"
			href="${pageContext.request.contextPath}/logout">Logout</a>
	</p>
</div>