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
				<li class="text-info">权限管理</li>
			</ul>
			<!-- post wrapper -->
			<div class="index_marginTopBottom">
				<form action="${ctx}/manager/security/permission/list" class="search_submit_form" method="get">
					<span class="in-dfyq-gl-span-mtb"><input type="text" placeholder="权限名称 关键词" class="span4" name="search.searchword" value="${searchMap['search.searchword']}"></span> <span class="in-dfyq-gl-span-mtb"><input type="submit" value="搜索" class="btn btn-info"></span>
				</form>
			</div>
			<div class="well widget">
				<div class="widget-header">
					<h3 class="title">权限管理列表</h3>
					<span class="right"><shiro:hasPermission name="permission:add">
							<a class="btn" href="${ctx}/manager/security/permission/create">
								<i class="icon-plus-sign"></i>新增权限
							</a>
						</shiro:hasPermission></span>
				</div>
				<div class="clear"></div>
				<div class="widget-content">
					<shiro:hasPermission name="permission:edit">
						<div class="alert alert-block">
							<a class="close" data-dismiss="alert" href="#">
								<i class="icon-large icon-remove-circle"></i>
							</a>
							操作提示: <i class="icon-edit" title="编辑"></i>编辑
						</div>
					</shiro:hasPermission>
					<div class="custom-content" style="overflow: auto; width: 100%;">
						<table class="table table-striped" id="item-table">
							<thead>
								<tr>
									<th>编号</th>
									<th>权限名称</th>
									<th>权限编码</th>
									<th>权限模块</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty page.list}">
										<c:forEach items="${page.list}" var="item">
											<tr>
												<td><small class="text-error">${item.id}</small></td>
												<td>${item.name}</td>
												<td>${item.permission}</td>
												<td>${item.category_name}</td>
												<td><shiro:hasPermission name="permission:edit">
														<a class="top_tooltip" data-original-title="编辑" href="${ctx}/manager/security/permission/edit?id=${item.id}">
															<i class="icon-edit"></i>
														</a>
													</shiro:hasPermission></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7" align="center"><b>暂无内容</b></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="pagination pagination-small clearfix">
				<div class="left pagination_left">
					<input type="button" class="btn pull-left-b" value="删 除">
				</div>
				<div class="right">
					<div class="left sumPagesR">共有记录${page.totalRow}条</div>
					<c:choose>
						<c:when test="${(not empty page.list) and (page.totalPage gt 1)}">
							<jsp:include page="/jsp/commons/manager/common-paging.jsp" flush="true">
								<jsp:param name="pageUrl" value="${ctx}/manager/security/permission/list/"></jsp:param>
							</jsp:include>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- end main content -->
		<%-- sidebar jsp include S--%>
		<jsp:include flush="true" page="/jsp/commons/manager/common-menu.jsp"></jsp:include>
		<%-- sidebar jsp include E--%>
	</div>
</body>
</html>