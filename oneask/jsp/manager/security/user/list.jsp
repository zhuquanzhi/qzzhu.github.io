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
				<li class="text-info">用户管理</li>
			</ul>
			<!-- post wrapper -->
			<div class="fixed-top clearfix">
				<span class="input-pro-detH3">用户管理</span>
			</div>
			<div class="index_marginTopBottom">
				<form action="${ctx}/manager/security/user/list" class="search_submit_form" method="get">
					<span class="in_mptb"><input type="text" placeholder="用户名称 关键词" class="span4" name="search.searchword" value="${searchMap['search.searchword']}"></span> <span class="in_mptb"><input type="submit" value="搜索" class="btn btn-info"></span>
				</form>
			</div>
			<div class="well widget">
				<div class="widget-header">
					<h3 class="title">用户管理列表</h3>
					<span class="right"><shiro:hasPermission name="user:add">
							<a class="btn" href="${ctx}/manager/security/user/create">
								<i class="icon-plus-sign"></i>新增用户
							</a>
						</shiro:hasPermission></span>
				</div>
				<div class="clear"></div>
				<div class="widget-content">
					<div class="alert alert-block">
						<a class="close" data-dismiss="alert" href="#">
							<i class="icon-large icon-remove-circle"></i>
						</a>
						操作提示:
						<shiro:hasPermission name="user:edit">
							<i class="icon-edit" title="编辑"></i>编辑</shiro:hasPermission>
					</div>
					<c:if test="${message eq 'SUCCESS'}">
						<div class="alert alert-block alert-success">
							<a class="close" data-dismiss="alert" href="#">
								<i class="icon-large icon-remove-circle"></i>
							</a>
							修改<strong> 用户用户 </strong>权限信息成功！
						</div>
					</c:if>
					<div class="custom-content" style="overflow: auto; width: 100%;">
						<table class="table table-striped" id="item-table">
							<thead>
								<tr>
									<th>编号</th>
									<th>登陆账号</th>
									<th>用户名称</th>
									<th>创建时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty page.list}">
										<c:forEach items="${page.list}" var="item">
											<tr>
												<td><small class="text-error">${item.id}</small></td>
												<td>${item.username}</td>
												<td>${item.fullname}</td>
												<td>${item.createtime}</td>
												<td>${item.status eq '1'?'正常':'锁定'}</td>
												<td><shiro:hasPermission name="user:edit">
														<a class="top_tooltip" data-original-title="编辑" href="${ctx}/manager/security/user/edit?id=${item.id}">
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
								<jsp:param name="pageUrl" value="${ctx}/manager/security/user/list"></jsp:param>
							</jsp:include>
						</c:when>
					</c:choose>
				</div>
			</div>
			<!-- ./ post wrapper -->
		</div>
		<!-- end main content -->
		<%-- sidebar jsp include S--%>
		<jsp:include flush="true" page="/jsp/commons/manager/common-menu.jsp"></jsp:include>
		<%-- sidebar jsp include E--%>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			/* $(".choose_role_submit_form").validationEngine();//jquery-validation import
			$('.choose_role_submit_form').submit(function() { 
			     $(".choose_role_submit_form").validationEngine();
			     return true;
			});  */
		});
		function toUrl(url, nowPage) {
			$("#nowPage").val(nowPage);
			$(".search_submit_form").submit();
		}
		$(function() {
			//ICMS.security.role().ready().list("${ctx}");
		});
	</script>

</body>
</html>