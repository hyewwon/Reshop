<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>나의 기부/판매정보</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
	a{border-bottom: none;}
	a:hover {text-decoration:none; color: #333; font-weight:bold;}
	a:link { decoration:none;}
</style>
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<section id="main" class="wrapper style1">
			<c:set var="donasellList" value="${requestScope.donasellList}" />
			<c:set var="page" value="${requestScope.page}" />
			<c:set var="startPage" value="${requestScope.startPage}" />
			<c:set var="endPage" value="${requestScope.endPage}" />
			<c:set var="totalCnt" value="${requestScope.totalCnt}" />
			<c:set var="totalPage" value="${requestScope.totalPage}" />
			<c:set var="revenug" value="${requestScope.revenug}" />
			<c:set var="connoisseurList" value="${requestScope.connoisseurList}" />
			<c:set var="rownumList" value="${requestScope.rownumList}" />
			<c:set var="sort" value="${requestScope.sort}" />
			<div class="inner">
				<header class="major">
					<h1>상품 판매/기부 정보</h1>
				</header>
				<ul class="actions small">
					<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad" class="button primary small">기본</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?sort=${1}" class="button primary small">저가순</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?sort=${2}" class="button primary small">고가순</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?sort=${3}" class="button primary small">시간순</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?sort=${4}" class="button primary small">역시간순</a></li>
				</ul>
				<h4 align="right" style="margin-bottom: 0.5rem; padding: 0;">
					상품 판매건수 : ${totalCnt}건</h4>
				
				<div class="table-wrapper">
					<!-- 게시판 리스트 띄우는 테이블 -->
					<table>
						<thead>
							<tr>
								<th>상품번호</th>
								<th>분류</th>
								<th>브랜드</th>
								<th>기부/매입</th>
								<th>등록일</th>
								<th>감정가(원)</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${donasellList != null and fn:length(donasellList)>0 }">
									<c:set var="count" value="-1" />
									<c:forEach items="${donasellList}" var="donasell">
										<c:set var="count" value="${count + 1}" />
										<tr>
											<td>${rownumList[count]}</td>
											<td>${donasell.classify_prod}</td>
											<td>${donasell.brand}</td>
											<td>${donasell.dosdivision}</td>
											<td>${donasell.uploadtime}</td>
											<td>${connoisseurList[count]}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" align="center">등록된 상품이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="8" align="right">총 수익 : ${revenug}원</td>
							</tr>
						</tfoot>
					</table><br>
					<!-- 페이징 테이블 -->
					<table style="border:0px;">
						<tr align="center" valign="middle">
							<td style="background:#ffffff;text-decoration:none;">
								<c:if test="${page>1}">
									<a class="" href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?page=${page-1}&sort=${sort}">[&lt;]</a>
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<c:choose>
										<c:when test="${page == i}"><strong style="color: #333; font-weight:bold;">[${i}]</strong></c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?page=${i}&sort=${sort}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${page<totalPage}">
									<a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?page=${page+1}&sort=${sort}">[&gt;]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>

			</div>
		</section>

		<!-- Footer -->
		<section id="footer" class="wrapper split style2">
			<div class="inner">
				<section>
					<header>
						<h3>Magna lorem ipsum</h3>
					</header>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad
						litora torquent per conubia nostra, per inceptos himenaeos magna
						fames ac turpis egestas amet non lorem amet.</p>
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-snapchat-ghost"><span
								class="label">Snapchat</span></a></li>
						<li><a href="#" class="icon brands fa-github"><span
								class="label">GitHub</span></a></li>
					</ul>
				</section>
				<section>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div>
							<div class="field">
								<textarea name="message" id="message" placeholder="Message"
									rows="4"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send Message" /></li>
						</ul>
					</form>
				</section>
			</div>
			<div class="copyright">
				<p>&copy; Untitled. All rights reserved. Lorem ipsum dolor sit
					amet nullam.</p>
			</div>
		</section>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>