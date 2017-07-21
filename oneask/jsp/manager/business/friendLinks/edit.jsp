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
        <a href="javascript:;">友链管理</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li>
        <a href="javascript:;">友链列表</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li class="text-info">编辑友链</li>
    </ul>
    <div class="fixed-top clearfix">
      <div class="left labtitle">
        <i class="icon-minus i-rotate-d"></i>编辑友链
      </div>
    </div>
    <form action="${ctx}/manager/business/friendLinks/update" method="post" id="myform">
    <input class="span3" type="hidden" name="friendLinks.id" value="${friendLinks.id}">
    <input class="span3" type="hidden" name="friendLinks.status" value="${friendLinks.status}">
    <div class="well widget">
      <div class="excerpt">
        <div class="excerpt-span-long">
          <label class="text-success">友链名称：</label>
          <span>
            <input class="span3" type="text" name="friendLinks.name" value="${friendLinks.name}">
          </span>
        </div>
        <div class="excerpt-span-long">
          <label class="text-success">跳转链接：</label>
          <span>
            <input class="span5" type="text" name="friendLinks.jump_url" value="${friendLinks.jump_url}">
          </span>
        </div>
        <div class="excerpt-span-long">
          <label class="text-success">是否启用：</label>
          <span>
            <label class="tuozhiyx_span">
              <input type="radio" name="friendLinks.is_use" value="0" class="fancy" <c:if test="${friendLinks.is_use eq 0 }">checked="checked"</c:if>/> 是
            </label>
            <label class="tuozhiyx_span">
              <input type="radio" name="friendLinks.is_use" value="-1" class="fancy" <c:if test="${friendLinks.is_use eq -1 }">checked="checked"</c:if>/> 否
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
<script src="${ctx}/resources/manager/library/plugins/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$(function() {
	$("#myform").validationEngine();
});
</script>
</body>
</html>