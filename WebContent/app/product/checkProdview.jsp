<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>상품 관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<c:set var="product" value="${requestScope.product}" />
	<c:set var="page" value="${requestScope.page}" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalCnt" value="${requestScope.totalCnt }" />
	<c:set var="totalPage" value="${requestScope.totalPage }" />

	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
				<header class="major">
					<h2>
						<b>상품 관리</b>
					</h2>
					<p></p>
					<form name="passView" method="post"
						action="${pageContext.request.contextPath}/admin/ProductCheck.pd">
						<div class="pass">
							<table style="margin: 0 auto;">
								<tr>
									<th style="width: 250px">상품번호를 입력해 주세요</th>
									<td  style="width: 300px"><input type="text" name="prodnum"
										style="width: 400px;"></td>
									<td align="left"><input type="submit" value="검색">
									</td>
								</tr>
							</table>
						</div>
					</form>

				</header>
			</div>
		</section>
		<table class="alt">
			<thead>
				<h3>상품 목록</h3>
				<tr>
					<th>상품 번호</th>
					<th>상품 이름</th>
					<th>상품 설명</th>
					<th>상품 가격</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${product !=null}">
						<!--보여줄 상품 목록이 있음 -->
							<tr onmouseover="this.style.background='#f9fbe7'"
								onmouseout="this.style.background=''">
								<td><a
									href="${pageContext.request.contextPath}/admin/ProductView.pd?prodnum=${product.prodnum}">
										${product.prodnum} </a></td>
								<td>${product.prodname}</td>
								<td>${product.prodexplain}</td>
								<td>${product.price}</td>
							</tr>
					</c:when>
					<c:otherwise>
						<!-- 보여줄 상품이 없음 -->
						<tr>
							<td colspan="7" align="center">판매 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br>
		<!-- 페이징 처리하는 테이블 -->
		<table style="border: 10%; width: 100%">
			<tr align="center" valign="middle">
				<td><c:if test="${page>1}">
						<a
							href="${pageContext.request.contextPath}/admin/ProdList.pd?page=${page-1}">[&lt;]</a>
					</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${page == i}">[${i}]</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/ProdList.pd?page=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${page<totalPage}">
						<a
							href="${pageContext.request.contextPath}/admin/ProdList.pd?page=${page+1}">[&gt;]</a>
					</c:if></td>
			</tr>
		</table>
		<!-- 상품 등록하는 테이블 -->
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<div class="col-12">
			<ul class="actions">
				<li><a
					href="${pageContext.request.contextPath}/admin/ProductUpdate.pd?page=${page}">
						<input type="submit" value="상품 등록하기" class="primary" />
				</a></li>
			</ul>
		</div>
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