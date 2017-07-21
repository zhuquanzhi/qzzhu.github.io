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
      <li>
        <a href="javascript:;">标签列表</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li class="text-info">编辑标签</li>
    </ul>
    <div class="fixed-top clearfix">
      <div class="left labtitle">
        <i class="icon-minus i-rotate-d"></i>编辑标签
      </div>
    </div>
    <form action="${ctx}/manager/business/tag/update" method="post"  id="myform">
    <input class="span3" type="hidden" name="tag.id" value="${tag.id}">
    <input class="span3" type="hidden" name="tag.status" value="${tag.status}">
    <div class="well widget">
      <div class="excerpt">
        <div class="excerpt-span-long">
          <label class="text-success">标签名称：</label>
          <span>
            <input class="span3" type="text" name="tag.name" value="${tag.name}">
          </span>
        </div>
        <div class="excerpt-span-long">
          <label class="text-success">是否启用：</label>
          <span>
            <label class="tuozhiyx_span">
              <input type="radio" name="tag.is_use" value="0" class="fancy" <c:if test="${tag.is_use eq 0 }">checked="checked"</c:if>/> 是
            </label>
            <label class="tuozhiyx_span">
              <input type="radio" name="tag.is_use" value="-1" class="fancy" <c:if test="${tag.is_use eq -1 }">checked="checked"</c:if>/> 否
            </label>
          </span>
        </div>
      </div>
    </div>
    <input class="btn btn-info" type="submit" value="保存">
    <input class="btn btn-ay" type="button" onclick="javascript:history.go(-1);" value="取消">
    </form>
  <!-- end main content -->
  </div>
   <jsp:include page="../../../commons/manager/common-menu.jsp"></jsp:include>
</div>
	<script type="text/javascript">
		$(function() {
			$("#myform").validationEngine();
		});
	</script>
</body>
</html>