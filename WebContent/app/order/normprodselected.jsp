<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<c:set var="product" value="${requestScope.product}"></c:set>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<section id="main" class="wrapper style1">
			<div class="inner">
				<header class="major">
					<h2>${product.prodname}</h2>
					<p></p>
				</header>
				<c:choose>
					<c:when test="${files != null and fn:length(files)!=0}">
						<!-- for(int i=0;i<=0;i++) -->
						<c:forEach var="i" begin="0" end="${fn:length(files)-1}">
							<img alt="XX"
								src="<c:url value='/app/file/${files[i].systemname}' />" />
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">첨부 파일이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<%-- <span class="image main"><img alt="XX" src="<c:url value='/app/file/${files[i].orgname}'/>"/></span> --%>
				<h3>${product.prodname}</h3>
				<blockquote>${product.prodexplain}</blockquote>
				<div class="col-6 col-12-medium">
					<ul class="alt">
						<li>상품 번호 : ${product.prodnum}</li>
						<li>상품 가격 : ${product.price} 원</li>
						<li>상품 브랜드 : ${product.brand}</li>
						<li>상품 사이즈 : ${product.prodsize}</li>
					</ul>
				</div>
		
			<!-- <h4>상품 수량을 선택해주세요</h4>
			<input type="number" placeholder=1 min=1>
 -->
			<p></p>
			<ul class="actions">
				<li><a href="${pageContext.request.contextPath}/admin/ProductBuyOk.pd?prodnum=${product.prodnum}" class="button primary">주문하기</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/ProductAddCartOk.pd?prodnum=${product.prodnum}" class="button">장바구니에 담기</a></li>
			</ul>
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