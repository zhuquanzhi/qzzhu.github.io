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
				<li><a href="#"><i class="icon-home home-icon"></i>Home</a><span class="divider"><i class="icon-caret-right"></i></span></li>
				<li>用户中心<span class="divider"><i class="icon-caret-right"></i></span></li>
				<li><a href="${ctx}/manager/security/user/list/1">用户管理</a><span class="divider"><i class="icon-caret-right"></i></span></li>
				<li class="text-info">用户新增</li>
			</ul>
		    <div class="fixed-top clearfix">
				<div class="left labtitle">
					<i class="icon-minus i-rotate-d"></i>用户新增
				</div>
			</div>
		    <!-- post wrapper -->
		    <form class="myform" action="${ctx}/manager/security/user/save" method="post">
		    <div class="well widget ">		    
		    		<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#collapse-four" data-parent="#accordion-one" data-toggle="collapse">
									用户基础<i class="icon-chevron-down right panel-title_icon-color"></i>
								</a>
							</h4>
						</div>
						</br>
						<div class="clearfix"></div>
							<div class="span6-b left">
								<div class="excerpt excerpt-wid clearfix" >
									<span class="excerpt-span">
										<label class="text-success">登陆账号：</label>
										<span class="input-pro-det"><input class="validate[required,maxSize[128],ajax[ajaxUserNameCheck]] span3" type="text" name="user.username" id="username"/></span>
									</span>
									<span class="excerpt-span">
				                        <label class="text-success">用户姓名：</label>
										<span class="input-pro-det"><input class="validate[required,maxSize[50]] span3" name="user.fullname" type="text"/></span>
				                    </span>
								</div>
							</div>
							<div class="span6-b right">
								<div class="excerpt clearfix">
									<span class="excerpt-span">
										<label class="text-success">登陆密码：</label>
										<span class="input-pro-det"><input class="validate[required,maxSize[128]] span3" type="password" id="password" name="user.password"/></span>
									</span>
									<span class="excerpt-span">
				                        <label class="text-success">密码确认：</label>
										<span class="input-pro-det"><input class="validate[required,maxSize[128],equals[password]] span3" type="password"/></span>
				                    </span>
								</div>
							</div>
					</div>
					<div class="clearfix"></div>
		    		<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#collapse-four" data-parent="#accordion-one" data-toggle="collapse">
									状态信息<i class="icon-chevron-down right panel-title_icon-color"></i>
								</a>
							</h4>
						</div>
						</br>
						<div class="excerpt excerpt-wid clearfix">
							<span class="excerpt-span">
								<label class="text-success">账号状态：</label>
								<span class="input-pro-det">
								 	<label class="radio"><input type="radio" name="user.status" value="1" class="fancy" checked="checked"/>激活</label>
			                    	<label class="radio"><input type="radio" name="user.status" value="0" class="fancy"/>禁用</label>
								</span>
							</span>
						</div>									
					</div>
					<div class="clearfix"></div>
		    		<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="#collapse-three" data-parent="#accordion" data-toggle="collapse"> 角色选择<i class="icon-chevron-down right panel-title_icon-color"></i> </a>
							</h4>
						</div>
						<div id="collapse-three" class="panel-collapse collapse in">
							<div class="panel-body">
								<div id="accorder_b" class="info_content_big info_info_02 clearfix open_mdpadding">								
									<table  cellspacing="0" cellpadding="0" border="0" align="left" width="480">
										<tr>
											<td colspan="4" class="td_t">备选角色</td>
											<td align="center">&nbsp;</td>
											<td colspan="4" class="td_t"><font class="index_pages_redcolor">*</font>已选角色</td>
											<td align="center">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="4">
												<select name="Select1" id="Select1" multiple="multiple" size="10" class="sel_box01">
												<c:forEach items="${roles}" var="role"><option value="${role.id}">${role.name}</option></c:forEach>
												</select>
											</td>
											<td align="center">
												<input id="Button1" type="button" class="btn" value=" > " />
												<br />
												<input id="Button2" type="button" class="btn" value=" < " />
												<br />
												<input id="Button3" type="button" class="btn" value=" >> " />
												<br />
												<input id="Button4" type="button" class="btn" value=" << " />
												<br />
											</td>
											<td colspan="4">
												<select id="Select2" multiple="multiple" class="validate[required] sel_box01" name="roleIds" size="10"></select>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
		   	</div>
		   	
		   	<input class="btn btn-info" type="submit" value="新增">
			<input class="btn btn-ay" type="button" value="取 消" onclick="javascript: history.back(-1)">
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
	$(".myform").validationEngine();
});

$(document).ready(function() {
$("#Button1").click(function() {
	//获取id为Select1 下的option 并且是选中状态的进行移除；
		var items = $("#Select1 option:selected").remove();
		//获取id为Select2，通过append方法，进行填充；
		$("#Select2").append(items);
	});
$("#Button2").click(function() {
	//获取id为Select2 下的option 并且是选中状态的进行移除；
		var items = $("#Select2 option:selected").remove();
		//获取id为Select1，通过append方法，进行填充；
		$("#Select1").append(items);
	});
$("#Button3").click(function() {
	var items = $("#Select1 option").remove();
	$("#Select2").append(items);
});
$("#Button4").click(function() {
	var items = $("#Select2 option").remove();
	$("#Select1").append(items);
});
});
</script>

</body>
</html>