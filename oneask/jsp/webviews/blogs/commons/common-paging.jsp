<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%><%@ include file="/jsp/commons/webviews/front-common-taglib.jsp" %>
<c:set var="totalPages" value="${(page.totalPage gt 2000)?'2000':(page.totalPage)}"></c:set>
<div class="paging pagingBox fl">
<c:if test="${totalPages gt 1}">
	<c:if test="${page.pageNumber gt 1}">
		<a href="${param.pagingUrl}?pageNo=${(page.pageNumber-1)>0?(page.pageNumber-1):(page.pageNumber)}${param.paramsUrl}">${lang eq 'en'?'Previous':'<'}</a>
	</c:if>
	<c:choose>
		<c:when test="${page.pageNumber eq 1}"><span class="current" href="${param.pagingUrl}?pageNo=1${param.paramsUrl}">1</span>&nbsp;</c:when>
		<c:otherwise>
		<c:if test="${totalPages gt 5 or page.pageNumber lt totalPages}">
			<a href="${param.pagingUrl}?pageNo=1${param.paramsUrl}">1</a>&nbsp;
		</c:if>
		<c:if test="${(totalPages eq page.pageNumber && page.pageNumber eq 3) or (totalPages eq page.pageNumber && page.pageNumber eq 4) or (totalPages eq page.pageNumber && page.pageNumber eq 2)}">
			<a href="${param.pagingUrl}?pageNo=1${param.paramsUrl}">1</a>&nbsp;
		</c:if>
		</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${page.pageNumber lt 5}">
		<c:if test="${page.pageNumber ge 2}">
		<c:forEach var="i" begin="2" end="${page.pageNumber}">
			<c:choose>
				<c:when test="${page.pageNumber eq i}">
				<span class="current" href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</span>&nbsp;
				</c:when>
				<c:otherwise>
				<a href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</a>&nbsp;  
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${totalPages gt 5 or page.pageNumber lt totalPages}">
		 	 ...&nbsp;
		  </c:if>
		  <c:choose>
			<c:when test="${page.pageNumber eq totalPages-1 or page.pageNumber eq totalPages}">
				<c:if test="${page.pageNumber eq totalPages-1}">
					<c:set var="j" value="3"></c:set>
				</c:if>
				<c:if test="${page.pageNumber eq totalPages}">
					<c:set var="j" value="4"></c:set>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:set var="j" value="2"></c:set>
			</c:otherwise>
			</c:choose>
		  
		  <c:forEach var="i" begin="${page.pageNumber-j}" end="${page.pageNumber}">
			<c:choose>
				<c:when test="${page.pageNumber eq i}">
				<span class="current" href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</span>&nbsp;
				</c:when>
				<c:otherwise>
				<a href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</a>&nbsp;  
				</c:otherwise>
			</c:choose>
		  </c:forEach>
	</c:otherwise>		
	</c:choose>
	<c:choose>
	<c:when test="${(page.pageNumber ge totalPages-2) or (totalPages-2 le 0)}">
		<c:if test="${page.pageNumber+1 le totalPages}">
		<c:forEach var="i" begin="${page.pageNumber+1}" end="${totalPages}">
			<a href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</a>&nbsp;  
			<c:if test="${page.pageNumber eq i}">
				<span class="current" href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</span>&nbsp;
			</c:if>
		</c:forEach>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${page.pageNumber eq 1 or page.pageNumber eq 2}">
				<c:if test="${page.pageNumber eq 1}">
					<c:choose>
						<c:when test="${totalPages ge 5}"><c:set var="i" value="4"></c:set></c:when>
						<c:otherwise><c:set var="i" value="3"></c:set></c:otherwise>				
					</c:choose>
				</c:if>
				<c:if test="${page.pageNumber eq 2}">
					<c:set var="i" value="3"></c:set>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:set var="i" value="2"></c:set>
			</c:otherwise>
		</c:choose>
	
		<c:forEach var="i" begin="${page.pageNumber+1}" end="${page.pageNumber+i}">
			<c:choose>
				<c:when test="${page.pageNumber eq i}">
					<span class="current" href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</span>&nbsp;
				</c:when>
				<c:otherwise>
					<a href="${param.pagingUrl}?pageNo=${i}${param.paramsUrl}">${i}</a>&nbsp;  
				</c:otherwise>
			</c:choose>
		</c:forEach>
		  <c:if test="${totalPages gt 5}">
		  ...&nbsp;
		  	<a href="${param.pagingUrl}?pageNo=${totalPages}${param.paramsUrl}">${totalPages}</a>&nbsp;  
		  </c:if>  
	</c:otherwise>
	</c:choose>
	
	<c:if test="${page.pageNumber lt totalPages}">
		<a class="next-page" href="${param.pagingUrl}?pageNo=${(page.pageNumber+1 lt totalPages)?(page.pageNumber+1):(totalPages)}${param.paramsUrl}">${lang eq 'en'?'Next':'>'}</a>
	</c:if>	
	<span class="page-num"><c:choose><c:when test="${lang eq 'en'}">${page.totalRow}Total Row, ${page.totalPage}Total Page</c:when><c:otherwise>共有${page.totalRow}条记录,共 ${page.totalPage}页</c:otherwise></c:choose></span>
</c:if>
</div>