<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/jsp/commons/manager/common-taglibs.jsp"%><!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../../commons/manager/common-header.jsp"></jsp:include>
</head>
<body>
	<%-- navbar jsp include S--%>
	<jsp:include flush="true" page="/jsp/commons/manager/common-navbar.jsp"></jsp:include>
	<%-- navbar jsp include E--%>
	<div id="left_layout">
		<!-- main content -->
		<div id="main_content" class="container-fluid">
			<ul class="breadcrumb breadcrumb-main">
				<li><a href="#">
						<i class="icon-home home-icon"></i>Home
					</a><span class="divider"><i class="icon-caret-right"></i></span></li>
				<li>用户中心<span class="divider"><i class="icon-caret-right"></i></span></li>
				<li><a href="${ctx}/manager/security/role/list/1">角色管理</a><span class="divider"><i class="icon-caret-right"></i></span></li>
				<li class="text-info">角色新增</li>
			</ul>
			<div class="h4-bigger">
				<h2 id="target-new">
					<i class="icon-minus i-rotate-d"></i>角色新增
				</h2>
			</div>
			<!-- post wrapper -->
			<form class="myform" action="${ctx}/manager/security/role/save" method="post">
				<div class="well widget">
					<div class="excerpt">
						<div class="excerpt-span-long">
							<label class="text-success"><font class="index_pages_redcolor">*</font>角色名称：</label> <span class="input-pro-det"><input type="text" class="input-large validate[required,maxSize[50]]" name="role.name" value="${role.name}"></span>
						</div>
						<div class="excerpt-span-long">
							<label class="text-success"><font class="index_pages_redcolor">*</font>角色编码：</label> <span class="input-pro-det"><textarea class="input-block-level  validate[required]" " name="role.desc">${role.desc}</textarea> </span>
						</div>
					</div>
				</div>
				<input class="btn btn-info" type="submit" value="修改"> <input class="btn btn-ay" type="button" value="取 消" onclick="javascript: history.back(-1)">
			</form>
			<!-- ./ post wrapper -->
		</div>
		<!-- end main content -->
		<%-- sidebar jsp include S--%>
		<jsp:include flush="true" page="/jsp/commons/manager/common-menu.jsp"></jsp:include>
		<%-- sidebar jsp include E--%>
	</div>
	<script type="text/javascript" charset="utf-8">
		$(function() {
			//ICMS.banner_crud().ready().edit();
			$(".myform").validationEngine();
		});
	</script>

</body>
</html>