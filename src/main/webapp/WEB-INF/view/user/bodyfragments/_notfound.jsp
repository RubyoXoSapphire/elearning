<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />






<div class="page-wrap">
	<div class="crumbrow">
		<div class="wrapper">
			<div class="row">
				<div class="col12">
					<nav>
						<ul class="crumbpath clearfix">
							<li class="first last"><a
								href="${pageContext.request.contextPath}/home">Home</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">
			<div class="wrapper clearfix">
				<div class="rowbox">
					<div class="row">
						<div class="col8 content">

							<h1>Page not found</h1>
							<div class="intro"></div>
							<p>
								We couldn't find this page. Go to the <a
									href="${pageContext.request.contextPath}/home">homepage</a>
							</p>
						</div>
						<div class="col4 last"></div>
					</div>
				</div>
			</div>

			<div class="contentbox createquiz customquizcta">
				<p>
					<strong>Need a custom quiz?</strong><br />Take a look at the <a
						onclick="_gaq.push(['_trackEvent','cta','click-possibilites', 'cta-footer']);"
						href="http://pricing.onlinequizcreator.com">possibilities</a> or
					send us an <a onclick="_gaq.push(['_trackEvent',"
						href="#/contact/item4">email</a>.
				</p>
			</div>


		</div>
	</div>
</div>
