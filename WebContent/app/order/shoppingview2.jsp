<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Re#</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
	
	<style>
	.imgs {
	  width: 300px !important;
	  height: 300px !important;
	  object-fit: cover !important;
	}
	
	</style>
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<c:set var="prodList" value="${requestScope.prodList}" />
	<c:set var="page" value="${requestScope.page}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />

	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
			<section>
				<h3 style="text-align:center;">업사이클링 상품 목록</h3><hr>
				<c:choose>
						<c:when test="${prodList !=null and fn : length(prodList)>0}">
							<!--보여줄 상품 목록이 있음 -->
								<div class="box alt">
								<div class="row gtr-uniform">
							<c:forEach items="${prodList}" var="product">
								<c:if test="${product.classify eq '업사이클링 상품'}">
								<div class="col-4"><span class="image fit">
										<a href="${pageContext.request.contextPath}/user/UpcyledSelected.us?prodnum=${product.prodnum}">
										<img style="margin:0 auto;" class="imgs" src="${pageContext.request.contextPath}/app/file/${product.systemname}" alt="이미지 없음" />
											<div style="text-align:center;">
											상품번호 : ${product.prodnum}<br>
											<h3 style="text-align:center;">${product.prodname}</h3>
											<h4 style="text-align:center;">
											
														<script>
															function addComma(num) {
																	var regexp = /\B(?=(\d{3})+(?!\d))/g;
																	return num.toString().replace(regexp, ',');
																	}
																var price = '<c:out value="${product.price}"/>';
																document.write(addComma(price)+'원');
														</script>
											
											</h4><br>
											</div>
										</a>
								</span></div>
									</c:if>
							</c:forEach>
								</div></div>
						</c:when>
						<c:otherwise>
							<!-- 보여줄 상품이 없음 -->
							<tr>
								<td colspan="7" align="center">판매 상품이 없습니다.</td>
							</tr>
						</c:otherwise>
				</c:choose>
								
								
				<div style="margin: 2%">
					<!-- 페이징 처리하는 테이블 -->
					<table style="border: 10%; width: 100%">
						<tr align="center" valign="middle">
							<td><c:if test="${page>1}">
									<a
										href="${pageContext.request.contextPath}/admin/ProductListForUser2.pd?page=${page-1}">[&lt;]</a>
								</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
									var="i">
									<c:choose>
										<c:when test="${page == i}">[${i}]</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/admin/ProductListForUser2.pd?page=${i}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${page<totalPage}">
									<a
										href="${pageContext.request.contextPath}/admin/ProductListForUser2.pd?page=${page+1}">[&gt;]</a>
								</c:if></td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>


	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>