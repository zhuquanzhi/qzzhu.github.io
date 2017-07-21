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
<!-- 返回顶部调用 end-->
<style type="text/css">


</style>
</head>
<body>
	<jsp:include page="../commons/common-header.jsp"></jsp:include>
	<article>
		<div class="l_box f_l">
			<div class="banner">
				<div id="slide-holder">
					<div id="slide-runner">
						<c:forEach items="${banner}" var="item" varStatus="i">
							<a href="${item.jump_url}" target="_blank">
								<img id="slide-img-${i.count}" src="${ctxfile}${item.cover_image}" alt="" width="670px" height="280px"/>
							</a>
						</c:forEach>
						<div id="slide-controls">
							<p id="slide-client" class="text">
								<strong></strong><span></span>
							</p>
							<p id="slide-desc" class="text"></p>
							<p id="slide-nav"></p>
						</div>
					</div>
				</div>
				<script>
					if(!window.slider) {
						var slider={};
					}
					slider.data= [
					<c:forEach items="${banner}" var="item" varStatus="i">
					    {
					        "id":"slide-img-${i.count}", // 与slide-runner中的img标签id对应
					        "client":"${item.title}",
					        "desc":"${item.summary}" //这里修改描述
					    }
						 <c:if test="${!i.last}">,</c:if>
					</c:forEach>
					];
				</script>
			</div>
			<!-- banner代码 结束 -->
			<div class="topnews">
				<h2>
					<span><!-- <a href="/" target="_blank">栏目标题</a> <a href="/" target="_blank">栏目标题</a> <a href="/" target="_blank">栏目标题</a> --></span><b>文章</b>推荐
				</h2>
				<c:forEach items="${page.list}" var="item">
					<div class="blogs">
						<%-- <figure>
							<img src="${ctxfile}${item.cover_image}" width="168px" height="137px" style="margin-left: 15px;">
						</figure> --%>
						<ul>
							<h3>
								<span class="zhu-category">${item.honor}<i></i></span><a href="${ctx}/article/${item.id}.html">${item.title}</a>
							</h3>
							<p class="autor_a">
								<span class="author2 f_l" style="width: auto;line-height: 16px;">${item.author }</span>
								<span class="dtime f_l" style="width: auto;line-height: 18px;"><fmt:formatDate value="${item.push_time}" pattern="yyyy-MM-dd"/></span>
								<span class="viewnum f_r" style="width: auto;line-height: 17px;">浏览（<a href="/">${item.browse_count}</a>）
								</span><span class="pingl f_r" style="width: auto;line-height: 17px;">评论（<a href="/">${item.comment_count}</a>）
								</span>
							</p>
							<p id="summary">${item.summary}</p>
							<p class="autor_b">
								<span class="lm f_l">
								<c:forEach items="${fn:split(item.tag,';')}" var="tag">
									
									<c:forEach items="${tags}" var="tags">
										<c:if test="${tags.id eq tag}"><a href="javascript:;">#${tags.name}</a></c:if>
									</c:forEach>
								</c:forEach>
								</span>
								<span onclick="window.location.href='${ctx}/article/${item.id}.html'" class="zhu-read-more">阅读全文&gt;&gt;</span>
							</p>
						</ul>
					</div>
				</c:forEach>
			</div>
			 <c:choose>
				<c:when test="${(not empty page.list) and (page.totalPage gt 1)}">
					<jsp:include page="../commons/common-paging.jsp" flush="true">
						<jsp:param name="pageUrl" value="${ctx}"></jsp:param>
						<jsp:param name="paramsUrl" value=""></jsp:param>
					</jsp:include>
				</c:when>
			</c:choose>
		</div>
		<jsp:include page="../commons/common-right.jsp"></jsp:include>	
		<!--r_box end -->
	</article>
	<jsp:include page="../commons/common-footer.jsp"></jsp:include>
	<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1262530996'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1262530996%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
<script language="javascript">

　　function saveRequestFrom(){

　　　　var form = document.getElementById("form1");

　　　　form.action="<%=path%>/list";

　　　　form.submit();

　　}
</script>
</html>
