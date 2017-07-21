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
				<li><a href="javascript:;">业务模块</a> <span class="divider"> <i class="icon-caret-right"></i>
				</span></li>
				<li><a href="javascript:;">文章管理</a> <span class="divider"> <i class="icon-caret-right"></i>
				</span></li>
				<li class="text-info">新增文章</li>
			</ul>
			<div class="fixed-top clearfix">
				<div class="left labtitle">
					<i class="icon-minus i-rotate-d"></i>新增文章
				</div>
			</div>
			<form action="${ctx}/manager/business/article/save" method="post" id="myform">
			<div class="well widget">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapse-four" data-parent="#accordion" data-toggle="collapse">
							文章描述<i class="icon-chevron-down right panel-title_icon-color"></i>
						</a>
					</h4>
				</div>
				</br>
				<div class="clearfix"></div>
				<div class="excerpt">
					<div class="excerpt-span-long">
						<label class="text-success">文章标题：</label> <span class="input-pro-det">
						<input class="validate[required,maxSize[100]] span7" type="text" name="article.title"></span>
					</div>
					<p class="excerpt excerpt-wid clearfix">
						<span class="excerpt-span"> <label class="text-success">文章作者：</label> <span class="input-pro-det"><input class="validate[required,maxSize[50]] span3" type="text" name="article.author"></span></span>
						<span class="excerpt-span"> <label class="text-success">文章头衔：</label> <span class="input-pro-det"><input class="validate[required,maxSize[50]] span3" type="text" name="article.honor"></span></span>
						<span class="excerpt-span"> <label class="text-success">发布时间：</label> <span class="input-pro-det"><input class=" dateWithDay datetimePicker span2 validate[required]" type="text" name="article.push_time"></span>
						</span>
					</p>
					<div class="excerpt excerpt-wid clearfix">
						<span class="excerpt-span">
							<label class="text-success">是否发布： </label> 
							<span class="input-pro-det"> 
							<label class="radio"><span><input type="radio" name="article.is_show" value="0" class="fancy" style="opacity: 0;" checked="checked" ></span>是</label> 
							<label class="radio"><span><input type="radio" name="article.is_show" value="1" class="fancy"  style="opacity: 0;"></span>否</label>
							</span>
						</span> 
						<span class="excerpt-span"> 
							<label class="text-success">是否原创： </label> 
							<span class="input-pro-det"> 
							<label class="radio"><span><input type="radio" name="article.is_original" value="0" class="fancy" style="opacity: 0;" checked="checked" ></span>是</label> 
							<label class="radio"><span><input type="radio" name="article.is_original" value="1" class="fancy"  style="opacity: 0;"></span>否</label>
							</span>
						</span>
						<span class="excerpt-span"> 
							<label class="text-success">是否推荐： </label> 
							<span class="input-pro-det"> 
							<label class="radio"><span><input type="radio" name="article.is_recommend" value="0" class="fancy" style="opacity: 0;"></span>是</label> 
							<label class="radio"><span><input type="radio" name="article.is_recommend" value="1" class="fancy"  style="opacity: 0;"  checked="checked" ></span>否</label>
							</span>
						</span>
					</div>
					<div class="excerpt-span-long">
						<label class="text-success">文章标签：</label> <span>
							<p>
								<c:forEach items="${tags}" var="item">
									<label class="tuozhiyx_span"> <input type="checkbox" name="tags" value="${item.id}" class="fancy" />${item.name }</label> 
								</c:forEach>
							</p>
						</span>
					</div>
					<div class="excerpt-span-long">
						<label class="text-success">文章简介：</label> <span> <textarea rows="4" name="article.summary" class="input-block-level"></textarea>
						</span>
					</div>

					<div class="excerpt-span-long">
						<label class="text-success">视频地址： </label> <span> <input class="span5" type="text" name="article.video">
						</span>
					</div>
					<div id="accordion" class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse-three" data-parent="#accordion" data-toggle="collapse">文章封面（必须）<i class="icon-chevron-down right panel-title_icon-color"></i></a>
									<span>&nbsp;&nbsp;参考尺寸（1920×700）</span>
								</h4>
							</div>
							<div id="collapse-three" class="panel-collapse in">
								<div class="panel-body">
									<div id="accorder_b" class="info_content_big">
										<div class="photo-list clearfix">
											<ul class="picture-box"></ul>
			                                <ul class="clearfix">
			                                	<li class="pic-plus" id="img-upload"><a id="uploadPicture"><i class="icon-plus"></i>添加图片</a></li>
			                                </ul>
			                            </div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="accordion" class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse-three" data-parent="#accordion" data-toggle="collapse">
										文章附件<i class="icon-chevron-down right panel-title_icon-color"></i>
									</a>
								</h4>
							</div>
							<div id="collapse-three" class="panel-collapse in">
								<div class="panel-body">
									<div id="accorder_b" class="info_content_big">
										<div class="excerpt clearfix">
											<span class="excerpt-span-long"> <label class="text-success">附件上传：</label> <span class="input-pro-det"><a href="javascript:void(0);" id="uploadAttachment" class="color-red">
														<i class="icon-plus"></i>添加附件
													</a>（双击文件可编辑名称）</span>
											</span> <span class="excerpt-span-long"> <span class="input-pro-det attachment-box"> </span>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="panel-heading">
						<h4 class="panel-title">
							<a href="#collapse-four" data-parent="#accordion" data-toggle="collapse">
								文章描述<i class="icon-chevron-down right panel-title_icon-color"></i>
							</a>
						</h4>
					</div>
					<div id="editor-container" class="container">
						<div id="editor-trigger"></div>
					</div>
					<textarea name="article.content" id="content" style="visibility: hidden;"></textarea> -->
					<div id="accordion" class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="#collapse-four" data-parent="#accordion" data-toggle="collapse">
										文章描述<i class="icon-chevron-down right panel-title_icon-color"></i>
									</a>
								</h4>
							</div>
							<div id="collapse-four" class="panel-collapse in collapse">
								<div class="panel-body">
									<script id="container" name="content" type="text/plain">
        								这里写你的初始化内容
    								</script>	
									<textarea style="width: 80%;" name="article.content" id="newsDesc"></textarea>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<input class="btn btn-info" type="submit" value="保存">
			<input class="btn btn-ay" type="button" onclick="javascript:history.go(-1);" value="取消">
			<!-- end main content -->
			</form>
		</div>
		<jsp:include page="../../../commons/manager/common-menu.jsp"></jsp:include>
	</div>
	<script charset="utf-8" type="text/javascript" src="${ctx}/resources/manager/js/plugins/img-ueditor/ueditor.all.js"></script>
	<script charset="utf-8" type="text/javascript" src="${ctx}/resources/manager/js/plugins/img-ueditor/ueditor.config.js"></script>
	<script type="text/plain" id="upload_ue"></script>
<script type="text/javascript" charset="utf-8">

	//必须加载下面两个js引入前
	window.UEDITOR_HOME_URL="${ctx}/resources/manager/js/plugins/ueditor/";
	///document.domain = 'moreccc.com';//moreccc.com //127.0.0.1:8080/morec/
	var imagepath="${ctx}/resources/uploadfiles";
	//上传独立使用
	var _editor_picture = new baidu.editor.ui.Editor({
	   imageUrl:'${ctx}/manager/upload/images',
	   fileUrl:'${ctx}/manager/upload/attachment',
	   //imageUrl:'http://img.moreccc.com/article/create',
	   fileTypes:"*.gif;*.jpeg;*.png;*.jpg",//默认"*.gif;*.jpeg;*.png;*.jpg",不填则为默认
	   params:'{"savePath":"article","saveFolder":"article","perfixName":"article"}',
	   fileParams:{"savePath":"article","saveFolder":"article/attachments","perfixName":"article","articleId":""},
	   autoClearinitialContent : true
	   //maxNum:num//设置可上传图片数,默认10
	});
	_editor_picture.render('upload_ue');
	_editor_picture.ready(function () {
		_editor_picture.setDisabled();
		_editor_picture.hide();
		_editor_picture.addListener('beforeInsertImage', function (t, arg) {//侦听图片上传
			 //遍历显示图片
	        $.each(arg, function(key, val) {
	        	var original_picture_url=imagepath+"/"+val.url;
	        	$(".picture-box").append("<li><img src='"+original_picture_url+"' title='"+val.title+"'><a rel='delete-picture'><i class='icon-remove color-red'></i></a><input type='hidden' name='article.cover_image' value='/"+val.url+"'/></li>");			
	        	$("#img-upload").hide();
	        });
	    });
		
		_editor_picture.addListener('afterUpfile', function (t, arg) {//侦听文件上传
	        //遍历显示文件
	        $.each(arg, function(index, file) {
	        	var original =  eval("("+file.original+")");
	        	var original_picture_url=imagepath+"/"+file.url;
	        	$(".attachment-box").append("<span><label class='attachment' data-value='"+original.fileId+"' title='"+original.originalName+"'>"+cutString(original.originalName)+"</label><i class='icon-download-alt'></i><i class='icon-remove'></i>|<input type='hidden' name='fileIds' value='"+original.fileId+"'/></span>");
	        	
	        });
	    });
	})


	var detailEditor;  		
		$(document).ready(function() {
				//初始化uEditor
		       detailEditor = new baidu.editor.ui.Editor( {
		    	   imageUrl:'${ctx}/manager/upload/images',
		    	   imagePath:imagepath+"/",
		    	   fileUrl:'${ctx}/manager/upload/attachment',
		    	   //imageUrl:'http://img.moreccc.com/article/create',
		    	   fileTypes:"*.gif;*.jpeg;*.png;*.jpg",//默认"*.gif;*.jpeg;*.png;*.jpg",不填则为默认
		    	   params:'{"savePath":"article","saveFolder":"article","perfixName":"article"}',
		    	   fileParams:{"savePath":"article","saveFolder":"article/attachments","perfixName":"article","articleId":""},
		    	   initialFrameWidth:document.body.clientWidth*0.8,
		    	   initialFrameHeight:document.body.clientHeight*0.4
				});
					detailEditor.render('newsDesc');  					
				  	
					detailEditor.addListener("ready", function () {
						detailEditor.focus(true);
					});
				 		 detailEditor.ready(function(){
				   		 //需要ready后执行，否则可能报错
				    	 //detailEditor.setContent("${project.projectDetails}");
					});
				
			 		detailEditor.addListener('beforeInsertImage', function (t, arg) {//侦听图片上传
		 	        //遍历显示图片
		 	        $.each(arg, function(key, val) {
		 	        	
		 	        });
		 	    });
		});




function cutString(input){
	if(!input){
		return "";
	}
	if(input.length>25){
		return input.substring(0,24)+"...";
	}else{
		return input;
	}
}

$("#uploadPicture").click(function() {
	_editor_picture.getDialog("insertimage").open();
});

$("#uploadAttachment").click(function() {
	_editor_picture.getDialog("attachment").open();
});

$(function() {
	ICMS.article_crud().ready().add().attachment("${ctx}");
});
$(function() {
	$("#myform").validationEngine();
});
</script>
</body>
</html>
