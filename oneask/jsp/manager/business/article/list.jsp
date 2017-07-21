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
        <a href="javascript:;">报表文档管理</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li class="text-info">报表文档列表</li>
    </ul>
    <div class="index_marginBottom">
      <span class="in-dfyq-gl-span-mtb">所属部门：
        <select class="span2">
          <option value="选择所属部门">选择所属部门</option>
        </select>
      </span>
      <span class="in-dfyq-gl-span-mtb">年份：
        <select class="span2">
          <option value="选择年份">选择年份</option>
        </select>
      </span>
      <span class="in-dfyq-gl-span-mtb">月份：
        <select class="span2">
          <option value="选择月份">选择月份</option>
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
        <h3 class="title">报表文档列表</h3>
        <span class="right in_wh_r">
          <a href="${ctx}/manager/business/article/create" class="btn">
            <i class="icon-plus"></i>新增
          </a>
        </span>
      </div>
      <div class="alert alert-block" style="display: block;">
        <a href="#" data-dismiss="alert" class="close">
          <i class="icon-large icon-remove-circle"></i>
        </a>
        操作提示:
        <i title="删除" class="icon-trash"></i>删除
        <i title="编辑" class="icon-edit"></i>编辑
        <!-- <i title="查看" class="icon-search"></i>查看 -->
      </div>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>
              <input type="checkbox" class="fancy"/>
            </th>
            <th>文章标题</th>
            <th>作者</th>
            <th>是否发布</th>
            <th>是否推荐</th>
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
	            <td>${item.title}</td>
	            <td>${item.author}</td>
	            <td>${item.is_show eq 0 ?'已发布':'未发布'}</td>
	            <td>${item.is_recommend eq 0 ?'是':'否'}</td>
	            <td><fmt:formatDate value="${item.update_time}"/></td>
	            <td>
	              <!-- <a href="report-document-show.html" target="_blank" class="in_Font_color" title="查看">
	                <i class="icon-search"></i>
	              </a> -->
	              <a href="${ctx}/manager/business/article/edit?id=${item.id}" class="in_Font_color" title="编辑">
	                <i class="icon-edit"></i>
	              </a>
	             <!--  <a href="javascript:;" class="in_Font_color">
	                <i class="icon-trash"></i>
	              </a> -->
	              <a class="top_tooltip trash in_Font_color" href="javascript:void(0);" onclick="deleteArticle(this,${item.id})" >
	              	<i class="icon-trash"></i>
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
<script type="text/javascript">
function deleteArticle(item,keyId){
	var	trashURL = '/manager/business/article/delete';
	/* $.confirm("确认该文章放到文章回收站嘛？", "温馨提示", function(result){
		if(result=='ok'){
			
		}
	}); */
	$.confirm({
	    title: 'Confirm!',
	    content: 'Simple confirm!',
	    confirm: function(){
	        $.alert('Confirmed!');
	    },
	    cancel: function(){
	        $.alert('Canceled!')
	    }
	});
	
	/* 
	$.post('${ctx}' + trashURL, {
		keyid: keyId
	}, function(data) {
		$.alert(data.message, '提示', function() {});
		if (data.type == 'SUCCESS') {
			$(item).parents("tr").remove();
		}
	}).error(function() {
		$.alert('该文章放到文章回收站失败!', '提示', function() {})
	}); */
}
</script>
</body>
</html>
