<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>나의 쇼핑정보</title>
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
	
	
	<!-- 아래 둘로 빠지면 설계실패; -->
	<c:if test="${not empty cancelflag}">
		<script>
			alert("상품이 발송되어 취소요청이 불가합니다.");
		</script>
	</c:if>
	<c:if test="${not empty refundflag}">
		<script>
			alert("환불요청이 불가합니다.");
		</script>
	</c:if>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<section id="main" class="wrapper style1">
			<c:set var="shoppingList" value="${requestScope.shoppingList}" />
			<c:set var="page" value="${requestScope.page}" />
			<c:set var="startPage" value="${requestScope.startPage}" />
			<c:set var="endPage" value="${requestScope.endPage}" />
			<c:set var="totalCnt" value="${requestScope.totalCnt}" />
			<c:set var="totalPage" value="${requestScope.totalPage}" />
			<c:set var="sort" value="${requestScope.sort}" />
			<div class="inner">
				<header class="major">
					<h1>나의 쇼핑정보</h1>
				</header>
				<ul class="actions small">
					<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad" class="button primary small">기본</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?sort=${1}" class="button primary small">취소내역 우선조회</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?sort=${2}" class="button primary small">환불내역 우선조회</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?sort=${3}" class="button primary small">시간순</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?sort=${4}" class="button primary small">역시간순</a></li>
				</ul>
				<h4 align="right" style="margin-bottom: 0.5rem; padding: 0;">
					주문 건수 : ${totalCnt}건</h4>
				
				<div class="table-wrapper">
					<!-- 게시판 리스트 띄우는 테이블 -->
					<table>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상품번호</th>
								<th>개수</th>
								<th>주문일자</th>
								<th>상품이름</th>
								<th>취소/환불내역</th>
								<th>취소신청</th>
								<th>환불신청</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${shoppingList != null and fn:length(shoppingList)>0 }">
									<c:set var="count" value="-1" />
									<c:forEach items="${shoppingList}" var="shopping">
										<c:set var="count" value="${count + 1}" />
										<tr>
											<td>${rownumList[count]}</td>
											<td>${shopping.prodnum}</td>
											<td>${shopping.ordercnt}</td>
											<td>${shopping.orderdate}</td>
											<td>${shopping.prodname}</td>
											<td>${shopping.cancel_refund}</td>
											<c:set var="loop_flag" value="true" />
											<td>
												<c:forEach  items="${delnumList}" var="delnum">
													<c:if test="${loop_flag}">
														<c:if test="${shopping.mng_num != delnum}">
															<c:set var="loop_flag" value="false"/>
															<a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?page=${page}&sort=${sort}&cancel=${shopping.mng_num}" class="button small">취소신청</a>
														</c:if>
													</c:if>
												</c:forEach>
											</td>
											<c:set var="count" value="-1" />
											<c:set var="loop_flag" value="true" />
											<td>
												<c:forEach  items="${delnumList}" var="delnum">
													<c:if test="${loop_flag}">
														<c:if test="${shopping.mng_num == delnum}">
															<c:set var="loop_flag" value="false" />
															<a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?page=${page}&sort=${sort}&refund=${shopping.mng_num}" class="button small">환불신청</a>
														</c:if>
													</c:if>
												</c:forEach>
											</td>
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
						</tfoot>
					</table><br>
					<!-- 페이징 테이블 -->
					<table style="border:0px;">
						<tr align="center" valign="middle">
							<td style="background:#ffffff;text-decoration:none;">
								<c:if test="${page>1}">
									<a class="" href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?page=${page-1}&sort=${sort}">[&lt;]</a>
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<c:choose>
										<c:when test="${page == i}"><strong style="color: #333; font-weight:bold;">[${i}]</strong></c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?page=${i}&sort=${sort}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${page<totalPage}">
									<a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?page=${page+1}&sort=${sort}">[&gt;]</a>
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