<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../commons/manager/common-header.jsp"></jsp:include>
</head>
<body>
<!-- header -->
<jsp:include page="../../../commons/manager/common-navbar.jsp"></jsp:include>
<!-- end header -->
<div id="left_layout">
  <!-- main content -->
  <div id="main_content" class="container-fluid">
    <ul class="breadcrumb breadcrumb-main">
      <li>
        <a href="javascript:;">标签管理</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li class="text-info">友链列表</li>
    </ul>
    <div class="index_marginBottom">
      <span class="in-dfyq-gl-span-mtb">友链名称：
        <input type="text" class="span2" value=""/>
      </span>
      <span class="in-dfyq-gl-span-mtb">状态：
        <select class="span2">
          <option value="选择状态">选择状态</option>
        </select>
      </span>
      <span class="in-dfyq-gl-span-mtb">所属模块：
        <select class="span2">
          <option value="选择所属模块">选择所属模块</option>
        </select>
      </span>
      <span class="in-dfyq-gl-span-mtb">发布人：
        <input type="text" class="span2" value=""/>
      </span>
      <span class="in-dfyq-gl-span-mtb">
        <input type="text" class="span3" placeholder="请输入关键词查询"/>
      </span>
      <span class="in-dfyq-gl-span-mtb">
        <input type="button" name="button" value="搜索" class="btn btn-info">
      </span>
    </div>
    <div class="well widget">
      <div class="widget-header">
        <h3 class="title">友链列表</h3>
        <span class="right in_wh_r">
          <a href="${ctx}/manager/business/friendLinks/create" class="btn">
            <i class="icon-plus"></i>新增
          </a>
        </span>
      </div>
      <div class="alert alert-block" style="display: block;">
        <a href="#" data-dismiss="alert" class="close">
          <i class="icon-large icon-remove-circle"></i>
        </a>
        操作提示:
        <i title="查看" class="icon-search"></i>查看
        <i title="编辑" class="icon-edit"></i>编辑
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>
              <input type="checkbox" class="fancy"/>
            </th>
            <th>友链名称</th>
            <th>状态</th>
            <th>更新时间</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach items="${page.list}" var="item">
	          <tr>
	            <td>
	              <input type="checkbox" class="fancy"/>
	            </td>
	            <td>${item.name}</td>
	            <td><c:if test="${item.is_use eq 0}">已启用</c:if><c:if test="${item.is_use eq -1}">未启用</c:if></td>
	            <td><fmt:formatDate value="${item.update_time}" pattern="yyyy-MM-dd"/></td>
	            <td>
	              <a href="tag-show.html" target="_blank" class="in_Font_color">
	                <i class="icon-search"></i>
	              </a>
	              <a href="${ctx}/manager/business/friendLinks/edit?id=${item.id}" class="in_Font_color">
	                <i class="icon-edit"></i>
	              </a>
	            </td>
	          </tr>
          </c:forEach>
        </tbody>
      </table>
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
							<jsp:param name="pageUrl" value="${ctx}/manager/business/article/list"></jsp:param>
							<jsp:param name="paramsUrl" value="&search.classify_name=${searchMap['search.classify_name']}&search.classify=${searchMap['search.classify']}&search.searchword=${searchMap['search.searchword']}&search.is_top=${searchMap['search.is_top']}&search.is_headline=${searchMap['search.is_headline']}"></jsp:param>
						</jsp:include>
					</c:when>
				</c:choose>
      </div>
    </div>

  <!-- end main content -->
  </div>
  <jsp:include page="../../../commons/manager/common-menu.jsp"></jsp:include>
</div>
</body>
</html>