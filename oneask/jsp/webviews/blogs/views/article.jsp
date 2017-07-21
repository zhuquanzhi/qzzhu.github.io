<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="currentUrl" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxfile" value="${ctx}/resources/uploadfiles" />
<!DOCTYPE html>
<html>
<head>
<title>我的maven项目</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="${ctx}/jsp/webviews/blogs/resources/css/base.css" rel="stylesheet">
<link href="${ctx}/jsp/webviews/blogs/resources/css/index.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/jsp/webviews/blogs/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/jsp/webviews/blogs/resources/js/sliders.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!-- 返回顶部调用 begin -->
<script type="text/javascript" src="${ctx}/jsp/webviews/blogs/resources/js/textScroll.js"></script>
<!-- 返回顶部调用 end-->
<style type="text/css">
</style>
</head>
<body class="">
<jsp:include page="../commons/common-header.jsp"></jsp:include>
<article>
  <div class="l_box f_l">
    <div id="qing-notice-cnt">
		<div class="qing-notice"> <i class="icon fengche"></i>
			<span id="zhu-notice-text" ></span>
		</div>
	</div>
	<div class="qing-blog-nav">
		<a href="${ctx}/index.html" _hover-ignore="1"><i class="icon homeIcon"></i>首页</a> ﹥<a href="javascript:;" _hover-ignore="1">${article.title }</a>
	</div>
	<div class="qing-content">
		<!-- blog header start -->
		<div class="qing-blog-header qing-text-center">
				<input type="hidden" id="qing-blog-id" value="093dcae887cd4904b2d244fcdca5473a">
				<h1 class="am-article-title">${article.title }</h1>
		  <div class="qing-blog-tips">
					<span class="qing-blog-tip-c"><i class="icon author2" title="作者"></i> ${article.author } &nbsp;</span>
					 <span class="qing-blog-tip-c"><i class="dtime" title="时间"></i> <fmt:formatDate value="${article.push_time}" pattern="yyyy-MM-dd"/></span>
					<span class="qing-blog-tip-c"><i class="viewnum" title="阅读"></i> 阅读(<span id="blog-readNum">${article.browse_count}</span>)</span>
					<span class="qing-blog-tip-c"><i class="pingl" title="评论"></i> 评论(<span id="blog-commentNum">${article.comment_count }</span>)</span>
					<span class="qing-blog-tip-c"><i class="icon aixin" title="点赞"></i> 点赞(<span id="blog-heartNum">126</span>)</span>
			  </div>
		</div>
	</div>
	<div class="zhu-content-footer">
	<div class="articleDiv" style="word-wrap: break-word">
		${article.content}
	</div>
	<div class="qing-blog-zhuanzai">
		转载请注明：<a href="http://www.huding.name">青菜萝卜胡丁博客</a> » <a href="http://www.huding.name//B20170221222457.html">剑指Offer之第一个只出现一次的字符位置</a>
	</div>
	<div class="qing-blog-social">
 			<span class="qing-blog-action qing-blog-like"> 
 				<i class="icon-heart"></i> 喜欢 (<span id="blog-content-like" class="count">115</span>)
 			</span>
			<span class="or">or</span>
			<span class="qing-blog-action qing-blog-share">
				<i class="icon-share-alt"></i> 分享 (<span id="blog-content-share" class="bds_count" data-cmd="count" title="累计分享0次">0</span>)
				<!-- <div class="action-popover">
					<div class="popover top in">
						<div class="arrow"></div>
						<div class="popover-content">
							<a href="#" class="sinaweibo fa fa-weibo" data-cmd="tsina" title="" data-original-title="分享到新浪微博"></a>
							<a href="#" class="bds_qzone fa fa-star" data-cmd="qzone" title="" data-original-title="分享到QQ空间"></a>
							<a href="#" class="tencentweibo fa fa-tencent-weibo" data-cmd="tqq" title="" data-original-title="分享到腾讯微博"></a>
							<a href="#" class="qq fa fa-qq" data-cmd="sqq" title="" data-original-title="分享到QQ好友"></a>
							<a href="#" class="bds_renren fa fa-renren" data-cmd="renren" title="" data-original-title="分享到人人网"></a>
							<a href="#" class="bds_weixin fa fa-weixin" data-cmd="weixin" title="" data-original-title="分享到微信"></a>
							<a href="#" class="bds_more fa fa-ellipsis-h" data-cmd="more" data-original-title="" title=""></a>
						</div>
					</div>
				</div> -->
			</span>	
	</div>
	<div class="qing-blog-donate qing-text-center">
  			<p>您的支持是博主写作最大的动力，如果您喜欢我的文章，感觉我的文章对您有帮助，请狠狠点击下面的</p>
  			<input type="button" id="btn-donate" value="我要小额赞助" class="qing-btn-donate">
  	</div>
  	<div class="qing-margin-top qing-blog-tag">
		<i class="am-icon-tags"> &nbsp;</i>
		<span class="lm f_l" style="padding-left: 20px;">
				<a href="javascript:;">#PHP</a>
		</span>
	</div>
	</div>
	<div class="qing-blog-next-pre">
		<c:if test="${not empty previous}">
			<a href="${ctx}/article/${previous.id}.html" _hover-ignore="1" class="a_left"><< ${previous.title}</a>
		</c:if>
		<c:if test="${empty previous}">
			<a href="javascript:;" _hover-ignore="1" class="a_left">&nbsp;</a>
		</c:if>
		<c:if test="${not empty next}">
			<a href="${ctx}/article/${next.id}.html" _hover-ignore="1" class="a_right">${next.title} >></a>
		</c:if>
		<c:if test="${empty next}">
			<a href="javascript:;" _hover-ignore="1" class="a_left">&nbsp;</a>
		</c:if>
	</div>
    
  </div>
  <jsp:include page="../commons/common-right.jsp"></jsp:include>
  <!--r_box end --> 
</article>
<jsp:include page="../commons/common-footer.jsp"></jsp:include>
</body>
<script language="javascript">

　　function saveRequestFrom(){

　　　　var form = document.getElementById("form1");

　　　　form.action="<%=path%>/list";

　　　　form.submit();

　　}
</script>
<script type="text/javascript">
var message = new Array();
<c:forEach items="${notice}" var="item" varStatus="i">
	message[${i.index}]="${item.title}";
</c:forEach>
var reps = 2;
var speed = 2000;
var p = message.length;
var T = "";
var C = 0;
var mC = 0;
var s = 0;
var sT = null;
if (reps < 1)
	reps = 1;
function doTheThing() {
	T = message[mC];
	A();
}
function A() {
	$("#zhu-notice-text").html(T);
	if (C < (1 * reps)) {
		sT = setTimeout("A()", speed);
		C++;
	} else {
		C = 0;
		mC++;
		if (mC > p - 1)
			mC = 0;
		sT = null;
		doTheThing();
	}
}
doTheThing();
</script>
</html>
