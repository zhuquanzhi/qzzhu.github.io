<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<header>
		<div class="am-g am-g-fixed">
			<div class="logo f_l">
				<a href="${ctx}/index.html">
					<img src="${ctx}/jsp/webviews/blogs/resources/images/logo.png" width="185px" height="60px">
				</a>
			</div>
			<nav id="topnav" class="classify">
				<ul>
					<li><a href="${ctx}/index.html" <c:if test='${fn:contains(currentUrl, "index.html")}'>class="current"</c:if>><i class="icon homeIcon"></i>首页</a></li>
					<li><a href="${ctx}/article/46.html" <c:if test='${fn:contains(currentUrl, "/article/46.html")}'>class="current"</c:if>><i class="icon aboutUs"></i>关于本站</a></li>
					<li><a href="javascript:;" ><i class="icon production"></i>我的作品</a></li>
					<li><a href="javascript:;" ><i class="icon leave"></i>文章类型</a></li>
					<li><a href="javascript:;"><i class="icon sponsor"></i>赞助团队</a></li>
				</ul>
			</nav>
			<div class="searchBox">
				<form action="/search" method="get">
					<div class="searchCon">
						<input type="text" placeholder="站内搜索" name="search.searchword" value=""> <i class="icon icon-search"></i>
					</div>
					<div class="searchBtn">
						<input type="submit" value="搜索">
					</div>
				</form>
			</div>
			
		</div>
	</header>