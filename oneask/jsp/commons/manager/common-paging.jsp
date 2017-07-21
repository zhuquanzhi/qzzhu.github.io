<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@include file="/jsp/commons/manager/common-taglibs.jsp"%>
<c:choose>
<c:when test="${not empty param.pageUrl}">
<ul>
<%--<li><a href="${param.pageUrl}?pageNo=1${param.paramsUrl}" title="第一页">&laquo;</a></li>--%>
<c:if test="${page.pageNumber ne  1}">
<li ><a href="${param.pageUrl}?pageNo=${page.pageNumber-1}${param.paramsUrl}">«</a></li>
</c:if>
<c:choose>
	<c:when test="${page.pageNumber eq 1}">
		<li class=" active"><a  href="${param.pageUrl}?pageNo=1${param.paramsUrl}">1</a></li>
	</c:when>
	<c:otherwise>
		<li><a  href="${param.pageUrl}?pageNo=1${param.paramsUrl}">1</a></li>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${page.totalPage>0}">
		<c:choose>
			<c:when test="${page.pageNumber<10}">
				<c:forEach var="i" begin="2" end="${page.pageNumber}">
					<c:choose>
						<c:when test="${page.pageNumber eq i}">
							<li class=" active"><a  href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a  href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<li><a>...&nbsp;</a></li>
				<c:forEach var="i" begin="${page.pageNumber-1}" end="${page.pageNumber}">
					<c:choose>
						<c:when test="${page.pageNumber eq i }">
							<li class=" active"><a href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a  href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${page.pageNumber>=page.totalPage-1  || page.totalPage-1<=0}">
				<c:forEach var="i" begin="${page.pageNumber+1}" end="${page.totalPage}">
					<li><a  href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
					<c:choose>
						<c:when test="${page.pageNumber eq i }">
							<li class=" active"><a href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="${page.pageNumber+1}" end="${page.pageNumber+1}">
					<c:choose>
						<c:when test="${page.pageNumber eq i}">
							<li class=" active"><a  href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${param.pageUrl}?pageNo=${i}${param.paramsUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li><a>...&nbsp;</a></li>
				<li><a  href="${param.pageUrl}?pageNo=${page.totalPage}${param.paramsUrl}">${page.totalPage}</a></li>
			</c:otherwise>
		</c:choose>
		<c:if test="${page.pageNumber ne  page.totalPage}">
		<li><a href="${param.pageUrl}?pageNo=${page.pageNumber+1}${param.paramsUrl}">»</a></li>
		</c:if>
<%-- <li><span class="page-num">共 <font class="index_pages_redcolor">${page.totalPage}</font> 页</span></li> --%>
</c:when>
</c:choose>
</ul>
</c:when>
</c:choose>