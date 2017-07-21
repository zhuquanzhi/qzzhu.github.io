<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<ul id="sidebar" class="nav nav-pills nav-stacked">
	<li class="dropdown active">
		<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
			<i class="micon-calendar"></i> <span class="hidden-phone">业务管理</span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="${ctx}/manager/business/article/list">文章管理</a></li>
		</ul>
	</li>
	<li class="dropdown active">
		<a href="${ctx}/manager/business/tag/list" class="dropdown-toggle" >
			<i class="micon-calendar"></i> <span class="hidden-phone">标签管理</span>
		</a>
	</li>
	<li class="dropdown active">
		<a href="${ctx}/manager/business/friendLinks/list" class="dropdown-toggle" >
			<i class="micon-calendar"></i> <span class="hidden-phone">友链管理</span>
		</a>
	</li>
	<li class="dropdown active">
		<a href="${ctx}/manager/business/banner/list" class="dropdown-toggle" >
			<i class="micon-calendar"></i> <span class="hidden-phone">横幅管理</span>
		</a>
	</li>
	<li class="dropdown active">
		<a href="${ctx}/manager/business/notice/list" class="dropdown-toggle" >
			<i class="micon-calendar"></i> <span class="hidden-phone">通知管理</span>
		</a>
	</li>
	<li class="dropdown <c:if test='${fn:contains(currentUrl, "/security/")}'>active</c:if>">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="micon-user-3"></i><span class="hidden-phone">用户中心</span></a>
		<ul class="dropdown-menu">
			<li><a <c:if test='${fn:contains(currentUrl, "/user/")}'>class="current"</c:if> href="${ctx}/manager/security/user/list">用户管理</a></li>
			<li><a <c:if test='${fn:contains(currentUrl, "/role/")}'>class="current"</c:if> href="${ctx}/manager/security/role/list">角色管理</a></li>
			<li><a <c:if test='${fn:contains(currentUrl, "/permission/")}'>class="current"</c:if> href="${ctx}/manager/security/permission/list">权限管理</a></li>
		</ul>
	</li>
</ul>
