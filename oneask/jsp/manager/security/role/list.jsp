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
				<li class="text-info">角色管理</li>
			</ul>
			<!-- post wrapper -->
			<div class="fixed-top clearfix">
				<span class="input-pro-detH3">角色管理</span>
			</div>
			<div class="index_marginTopBottom">
				<form action="${ctx}/manager/security/role/list" class="search_submit_form" method="get">
					<span class="in-dfyq-gl-span-mtb"><input type="text" placeholder="角色名称 关键词" class="span4" name="search.searchword" value="${searchMap['search.searchword']}"></span> <span class="in-dfyq-gl-span-mtb"><input type="submit" value="搜索" class="btn btn-info"></span>
				</form>
			</div>
			<div class="well widget">
				<div class="widget-header">
					<h3 class="title">角色管理列表</h3>
					<span class="right"><shiro:hasPermission name="role:add">
							<a class="btn" href="${ctx}/manager/security/role/create">
								<i class="icon-plus-sign"></i>新增角色
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
						<shiro:hasPermission name="role:edit">
							<i class="icon-edit" title="编辑"></i>编辑</shiro:hasPermission>
						<shiro:hasPermission name="role:setpermission">
							<i class="icon-reorder" title="匹配权限"></i>匹配权限</shiro:hasPermission>
					</div>
					<c:if test="${message eq 'SUCCESS'}">
						<div class="alert alert-block alert-success">
							<a class="close" data-dismiss="alert" href="#">
								<i class="icon-large icon-remove-circle"></i>
							</a>
							修改<strong> 用户角色 </strong>权限信息成功！
						</div>
					</c:if>
					<div class="custom-content" style="overflow: auto; width: 100%;">
						<table class="table table-striped" id="item-table">
							<thead>
								<tr>
									<th>编号</th>
									<th>角色名称</th>
									<th>角色描述</th>
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
												<td>${item.desc}</td>
												<td><shiro:hasPermission name="role:edit">
														<a class="top_tooltip" data-original-title="编辑" href="${ctx}/manager/security/role/edit?id=${item.id}">
															<i class="icon-edit"></i>
														</a>
													</shiro:hasPermission> <shiro:hasPermission name="role:setpermission">
														<a class="top_tooltip" data-original-title="匹配权限" data-value="${item.id}" data-name="${item.name}" href="javascript:void(0);" id="setPermissions">
															<i class="icon-reorder"></i>
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
								<jsp:param name="pageUrl" value="${ctx}/manager/security/role/list/"></jsp:param>
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
	<%--------设置权限 modal S--------%>
	<div id="set_permissions_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<form action="${ctx}/manager/security/role/setPermissions" class="set_permissions_submit_form" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<i class="icon-remove-circle"></i>
				</button>
				<h3 id="myModalLabel" class="left">角色权限设置</h3>
				<div class="clear"></div>
			</div>
			<div class="modal-body">
				<div class="clear"></div>
				<div class="index_margin">
					<div class="excerpt-span-long">
						<label class="text-success">角色名称：</label><span><strong id="beautiful_pjname"></strong></span> <input type="hidden" name="roleid" id="roleid" />
					</div>
				</div>
				<div class="index_margin" id="inputs-box">
					<c:forEach var="item" items="${permissions}">
						<div class="excerpt-span-long">
							<label class="text-success">${item.key}：</label> <span class="int-spanDivMaging"> <c:forEach var="it" items="${item.value}">
									<span class="in-dfyq-gl-span-mtb-width"><input type="checkbox" class="fancy" value="${it.id}" name="permission_id">${it.name}</span>
								</c:forEach>
							</span>
						</div>
					</c:forEach>
				</div>
				<div class="clear"></div>
				<div class="alert alert-block">
					<a href="#" data-dismiss="alert" class="close">
						<i class="icon-large icon-remove-circle"></i>
					</a>
					温馨提示:完成设置后，可切换到“设置权限”弹出框查看。
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-ay" data-dismiss="modal" aria-hidden="true">取消</button>
				<button class="btn btn-primary" type="submit">确认</button>
			</div>
		</form>
	</div>
	<%--------设置权限 modal E--------%>
	<script type="text/javascript">
		/* $(document).ready(function() {
			$(".choose_role_submit_form").validationEngine();//jquery-validation import
			$('.choose_role_submit_form').submit(function() { 
			     $(".choose_role_submit_form").validationEngine();
			     return true;
			}); 
		}); */
		function toUrl(url, nowPage) {
			$("#nowPage").val(nowPage);
			$(".search_submit_form").submit();
		}
		$(function() {
			ICMS.security.role().ready().list("${ctx}");
		});
	</script>
</body>
</html>