<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><tiles:insertAttribute name="title" /></title>
<tiles:insertAttribute name="header" />
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>


		<tiles:insertAttribute name="menu" />

		<tiles:insertAttribute name="sidebar" />

		<div class="main-content">
			<div class="main-content-inner">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>
		
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>
		
						<li class="active">Dashboard</li>
					</ul>
					<!-- /.breadcrumb -->
		
					<!-- #section:basics/content.searchbox -->
					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off"> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
		
					<!-- /section:basics/content.searchbox -->
				</div>
		
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<!-- #section:settings.box -->
					<div class="ace-settings-container" id="ace-settings-container">
						<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
							id="ace-settings-btn">
							<i class="ace-icon fa fa-cog bigger-130"></i>
						</div>
		
						<div class="ace-settings-box clearfix" id="ace-settings-box">
							<div class="pull-left width-50">
								<!-- #section:settings.skins -->
								<div class="ace-settings-item">
									<div class="pull-left">
										<select id="skin-colorpicker" class="hide">
											<option data-skin="no-skin" value="#438EB9">#438EB9</option>
											<option data-skin="skin-1" value="#222A2D">#222A2D</option>
											<option data-skin="skin-2" value="#C6487E">#C6487E</option>
											<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
										</select>
										<div class="dropdown dropdown-colorpicker">
											<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span
												class="btn-colorpicker" style="background-color: #438EB9"></span></a>
											<ul class="dropdown-menu dropdown-caret">
												<li><a class="colorpick-btn selected" href="#"
													style="background-color: #438EB9;" data-color="#438EB9"></a></li>
												<li><a class="colorpick-btn" href="#"
													style="background-color: #222A2D;" data-color="#222A2D"></a></li>
												<li><a class="colorpick-btn" href="#"
													style="background-color: #C6487E;" data-color="#C6487E"></a></li>
												<li><a class="colorpick-btn" href="#"
													style="background-color: #D0D0D0;" data-color="#D0D0D0"></a></li>
											</ul>
										</div>
									</div>
									<span>&nbsp; Choose Skin</span>
								</div>
		
								<!-- /section:settings.skins -->
		
								<!-- #section:settings.navbar -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-navbar"> <label class="lbl"
										for="ace-settings-navbar"> Fixed Navbar</label>
								</div>
		
								<!-- /section:settings.navbar -->
		
								<!-- #section:settings.sidebar -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-sidebar"> <label class="lbl"
										for="ace-settings-sidebar"> Fixed Sidebar</label>
								</div>
		
								<!-- /section:settings.sidebar -->
		
								<!-- #section:settings.breadcrumbs -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-breadcrumbs"> <label class="lbl"
										for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
								</div>
		
								<!-- /section:settings.breadcrumbs -->
		
								<!-- #section:settings.rtl -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-rtl"> <label class="lbl"
										for="ace-settings-rtl"> Right To Left (rtl)</label>
								</div>
		
								<!-- /section:settings.rtl -->
		
								<!-- #section:settings.container -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-add-container"> <label class="lbl"
										for="ace-settings-add-container"> Inside <b>.container</b>
									</label>
								</div>
		
								<!-- /section:settings.container -->
							</div>
							<!-- /.pull-left -->
		
							<div class="pull-left width-50">
								<!-- #section:basics/sidebar.options -->
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-hover"> <label class="lbl"
										for="ace-settings-hover"> Submenu on Hover</label>
								</div>
		
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-compact"> <label class="lbl"
										for="ace-settings-compact"> Compact Sidebar</label>
								</div>
		
								<div class="ace-settings-item">
									<input type="checkbox" class="ace ace-checkbox-2"
										id="ace-settings-highlight"> <label class="lbl"
										for="ace-settings-highlight"> Alt. Active Item</label>
								</div>
		
								<!-- /section:basics/sidebar.options -->
							</div>
							<!-- /.pull-left -->
						</div>
						<!-- /.ace-settings-box -->
					</div>
					<!-- /.ace-settings-container -->
		
					<!-- /section:settings.box -->
					
					<tiles:insertAttribute name="maincontent" />
					
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<div class="footer">
			<div class="footer-inner">
				#section:basics/footer
				<div class="footer-content">
					<span class="bigger-120"> <span class="blue bolder">Ace</span>
						Application &copy; 2013-2014
					</span> &nbsp; &nbsp; <span class="action-buttons"> <a href="#">
							<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
					</a> <a href="#"> <i
							class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
					</a> <a href="#"> <i
							class="ace-icon fa fa-rss-square orange bigger-150"></i>
					</a>
					</span>
				</div>

				/section:basics/footer
			</div>
		</div>

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<tiles:insertAttribute name="footer" />
</body>
</html>