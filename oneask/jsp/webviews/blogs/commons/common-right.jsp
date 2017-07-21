<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<div class="r_box f_r">
			<div class="cloud">
				<h3>标签云</h3>
				<ul>
					<c:forEach items="${tags}" var="item">
						<li><a href="/">${item.name}</a></li>	
					</c:forEach>
				</ul>
			</div>
			<div class="moreSelect" id="lp_right_select">
				<script>
					window.onload = function ()
					{
						var oLi = document.getElementById("tab").getElementsByTagName("li");
						var oUl = document.getElementById("ms-main").getElementsByTagName("div");
						
						for(var i = 0; i < oLi.length; i++)
						{
							oLi[i].index = i;
							oLi[i].onmouseover = function ()
							{
								for(var n = 0; n < oLi.length; n++) oLi[n].className="";
								this.className = "cur";
								for(var n = 0; n < oUl.length; n++) oUl[n].style.display = "none";
								oUl[this.index].style.display = "block"
							}	
						}
					}
					</script>
				<div class="ms-top">
					<ul class="hd" id="tab">
						<li class="cur"><a href="/">点击排行</a></li>
						<li><a href="/">最新文章</a></li>
						<li><a href="/">站长推荐</a></li>
					</ul>
				</div>
				<div class="ms-main" id="ms-main">
					<div style="display: block;" class="bd bd-news">
						<ul>
							<c:forEach items="${pageForBrowse.list}" var="item">
								<li><a href="${ctx}/article/${item.id}.html">${item.title}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="bd bd-news">
						<ul>
							<c:forEach items="${pageForNew.list}" var="item">
								<li><a href="${ctx}/article/${item.id}.html">${item.title}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="bd bd-news">
						<ul>
							<c:forEach items="${pageForRecommend.list}" var="item">
								<li><a href="${ctx}/article/${item.id}.html">${item.title}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--ms-main end -->
			</div>
			<!--切换卡 moreSelect end -->

			
			<div class="tuwen">
				<h3>图文推荐</h3>
				<ul>
					<c:forEach items="${pageForImage}" var="item">
						<li><a href="${ctx}/article/${item.id}.html">
							<img src="${ctxfile}${item.cover_image}"><b>${item.title}</b>
						</a>
						<p>
							<span class="tulanmu">
							<c:set var="tagCount" value="0"></c:set>
							<c:forEach items="${fn:split(item.tag,';')}" var="tag" varStatus="i">
								<c:forEach items="${tags}" var="tags">
									<c:if test="${tags.id eq tag and tagCount<1}">
										<a href="javascript:;">${tags.name}</a>
										<c:set var="tagCount" value="${tagCount+1}"></c:set>
									</c:if>
								</c:forEach>
							</c:forEach>
							</span><span class="tutime"><fmt:formatDate value="${item.push_time}" pattern="yyyy-MM-dd"/></span>
						</p></li>
					</c:forEach>
				</ul>
			</div>
			<!--tit01 end-->
			<div class="ad300x100">
				<img src="${ctx}/jsp/webviews/blogs/resources/images/ad300x100.jpg">
			</div>
			<div class="ad">
				<img src="${ctx}/jsp/webviews/blogs/resources/images/03.jpg">
			</div>
			<div class="links">
				<h3>
					<span>[<a href="/">申请友情链接</a>]
					</span>友情链接
				</h3>
				<ul>
					<c:forEach items="${friendList}" var="item">
						<li><a href="${item.jump_url }" target="_blank">${item.name}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>