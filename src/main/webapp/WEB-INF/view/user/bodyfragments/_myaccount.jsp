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
							<li class="first"><a
								href="${pageContext.request.contextPath}/home">Home</a>&rsaquo;</li>
							<li class="last hier"><a
								href="${pageContext.request.contextPath}/account">My account</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="bgwrap">
		<div class="wrapper clearfix">

			<div class="rowbox managecontainer">
				<div class="row border_bottom manageheader">
					<div class="col3">
						<div class="contentbox">
							<strong class="heading h3">My account</strong>
						</div>
					</div>
					<div class="col9">
						<div class="row">
							<div class="col6">
								<div class="contentbox noLeftPadding noBottomPadding">
									<h1>My account</h1>
								</div>
							</div>
							<div class="col3">
								<div class="contentbox alignright">
									<p class="readmore"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col3">
						<div class="navigation quiznav">
							<nav>
								<ul class="menu level1">
									<li class="hier open"><a class="icon-user"
										href="${pageContext.request.contextPath}/account">My
											account</a></li>
									<li><a class="icon-vcard"
										href="${pageContext.request.contextPath}/edit-account">Edit
											my profile</a></li>
									<li><a class="icon-key"
										href="${pageContext.request.contextPath}/change-password">Edit
											password</a></li>
									<li><a class="icon-star"
										href="#/my-account/my-credits/item8114">My Credits</a></li>
									<li><a class="icon-box"
										href="#/my-account/my-subscriptions/item7642">My
											subscriptions</a></li>
									<li><a class="icon-cart"
										href="#/my-account/purchase-subscription/item7641">Purchase
											Subscription</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col9">
						<div class="contentbox noLeftPadding">

							<h2>About</h2>
							<table>
								<tr>
									<th>Name</th>
									<td>${user.userId}</td>
								</tr>
								<tr>
									<th>Email address</th>
									<td>${user.email}</td>
								</tr>
							</table>
							<div class="floatright">
								<img alt="" class="gravatar"
									src="//www.gravatar.com/avatar/aaa3b4d7458897e91a3d41cf11ffb08f?s=100&amp;d=https%3A%2F%2Fd134jvmqfdbkyi.cloudfront.net%2Fimages%2Fempty.gif&amp;r=" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
