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
        <a href="javascript:;">横幅管理</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li>
        <a href="javascript:;">横幅列表</a>
        <span class="divider">
          <i class="icon-caret-right"></i>
        </span>
      </li>
      <li class="text-info">编辑横幅</li>
    </ul>
    <div class="fixed-top clearfix">
      <div class="left labtitle">
        <i class="icon-minus i-rotate-d"></i>编辑横幅
      </div>
    </div>
    <form action="${ctx}/manager/business/banner/update" method="post" id="myform">
    <input class="span3" type="hidden" name="banner.id" value="${banner.id}">
    <input class="span3" type="hidden" name="banner.status" value="${banner.status}">
    <div class="well widget">
      <div class="excerpt">
        <div class="excerpt-span-long">
			<label class="text-success">横幅标题：</label> <span> <input class="span3 validate[required]" type="text" name="banner.title" value="${banner.title }">
			</span>
		</div>
		<div class="excerpt-span-long">
			<label class="text-success">横幅简介：</label> <span> <textarea rows="4" name="banner.summary" class="input-block-level  validate[required]">${banner.summary }</textarea>
			</span>
		</div>
		<div class="excerpt-span-long">
			<label class="text-success">跳转链接：</label> <span> <input class="span5  validate[required]" type="text" name="banner.jump_url" value="${banner.jump_url }">
			</span>
		</div>
        <div class="excerpt-span-long">
          <label class="text-success">是否启用：</label>
          <span>
            <label class="tuozhiyx_span">
              <input type="radio" name="banner.is_use" value="0" class="fancy" <c:if test="${banner.is_use eq 0 }">checked="checked"</c:if>/> 是
            </label>
            <label class="tuozhiyx_span">
              <input type="radio" name="banner.is_use" value="-1" class="fancy" <c:if test="${banner.is_use eq -1 }">checked="checked"</c:if>/> 否
            </label>
          </span>
        </div>
        <div id="accordion" class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapse-three" data-parent="#accordion" data-toggle="collapse">横幅图片（必须）<i class="icon-chevron-down right panel-title_icon-color"></i></a>
						<span>&nbsp;&nbsp;参考尺寸（1920×700）</span>
					</h4>
				</div>
				<div id="collapse-three" class="panel-collapse in">
					<div class="panel-body">
						<div id="accorder_b" class="info_content_big">
							<div class="photo-list clearfix">
								<ul class="picture-box">										
								<c:if test="${not empty banner.cover_image}">
									<li>
										<img src="${ctxfile}${banner.cover_image}" data-toggle="lightbox" href="#image-lightbox">
										<a rel="delete-picture"><i class="icon-remove color-red"></i></a>																			
										<input type="hidden" name="banner.cover_image"  value="${banner.cover_image}"/>
									</li>
								</c:if>
								</ul>
                                <ul class="clearfix">
	                            	<li class="pic-plus" id="img-upload" <c:if test="${not empty banner.cover_image}">style="display: none;"</c:if>><a id="uploadPicture"><i class="icon-plus"></i>添加图片</a></li>
                                </ul>
                                <div id="image-lightbox" class="lightbox hide fade"  tabindex="-1" role="dialog" aria-hidden="true">
									<div class='lightbox-content'>
										<img src="${ctxfile}${banner.cover_image}">
									</div>
								</div>
                            </div>
						</div>
					</div>
				</div>
			</div>
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
	<!-- base -->
	<script charset="utf-8" type="text/javascript" src="${ctx}/resources/manager/js/plugins/img-ueditor/ueditor.all.js"></script>
	<script charset="utf-8" type="text/javascript" src="${ctx}/resources/manager/js/plugins/img-ueditor/ueditor.config.js"></script>
	<script type="text/plain" id="upload_ue"></script>
	<script type="text/javascript" charset="utf-8">
	//必须加载下面两个js引入前
	window.UEDITOR_HOME_URL="${ctx}/resources/manager/js/plugins/img-ueditor/";
	//document.domain = 'localhost:8080/51summer/';//51summer.com
	var imagepath="${ctx}/resources/uploadfiles";
	
	//上传独立使用
	var _editor_picture = new baidu.editor.ui.Editor({
		imageUrl:'${ctx}/manager/upload/images',
	   //imageUrl:'http://img.51summer.com/wiki/create',
	   fileTypes:"*.gif;*.jpeg;*.png;*.jpg",//默认"*.gif;*.jpeg;*.png;*.jpg",不填则为默认
	   params:'{"savePath":"banner","saveFolder":"banner","perfixName":"banner"}',
	   autoClearinitialContent : true,
	   maxNum:1//设置可上传图片数,默认10
	});
	_editor_picture.render('upload_ue');
	_editor_picture.ready(function () {
		_editor_picture.setDisabled();
		_editor_picture.hide();
		_editor_picture.addListener('beforeInsertImage', function (t, arg) {//侦听图片上传
	        //遍历显示图片
			$.each(arg, function(key, val) {
	        	var original_picture_url=imagepath+"/"+val.url;
	        	$(".picture-box").append("<li><img src='"+original_picture_url+"' title='"+val.title+"'><a rel='delete-picture'><i class='icon-remove color-red'></i></a><input type='hidden' name='banner.cover_image' value='/"+val.url+"'/></li>");			
				$("#img-upload").hide();
	        });
	    });
	})
	
	
	$("#uploadPicture").click(function() {
		_editor_picture.getDialog("insertimage").open();
	});
	
	$(function() {
		ICMS.setsystem.banner().ready().commons();
	});
	$(function() {
		$("#myform").validationEngine();
	});
	</script>
</body>
</html>