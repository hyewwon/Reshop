<!-- 예찬 : 관리자가 주문 리스트 보는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>reshop 주문 관리</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>

<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
	<c:if test="${param.db==false}">
			<script>alert("DB 오류!")</script>
	</c:if>
	<c:choose>
		<c:when test="${param.deliver==true}">
			<script>alert("배송 확정 성공!")</script>
		</c:when>
		<c:when test="${param.deliver==false}">
			<script>alert("배송 확정 실패!")</script>
		</c:when>
	</c:choose>

<%-- 	<c:if test="${login_id == null}">
		<script>
			alert("관리자 로그인 필요");
			location.replace("${pageContext.request.contextPath}/app/admin/home.jsp");
		</script>
	</c:if>
	<c:if test="${login_id != admin}">
		<script>
			alert("관리자만 이용할 수 있습니다!");
			location.replace("${pageContext.request.contextPath}/app/admin/home.jsp");
		</script>
	</c:if> --%>

	<!-- BoardListAction.java 에서 보내주는 데이터들로 변수 만들기 -->
	<c:set var="orderList" value="${requestScope.OrderList}" />
	<c:set var="page" value="${requestScope.page }" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalCnt" value="${requestScope.totalCnt }" />
	<c:set var="totalPage" value="${requestScope.totalPage }"/>

	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
				<header class="major">
					<h1>
						<b>주문 관리</b>
					</h1>
					<p></p>
				</header>
			</div>
			<div style="margin:5%">
			<h3>
				<b>전체 주문 관리</b>
			</h3>
			<div class="table-wrapper">
				<table class="alt" style="text-align: center;">
					<thead>
						<tr>
							<th style="text-align: center">주문일자</th>
							<th style="text-align: center">주문번호</th>
							<th style="text-align: center">배송상태</th>
							<th style="text-align: center">취소여부</th>
							<th style="text-align: center">상품이름</th>
							<th style="text-align: center">유저 아이디</th>
							<th style="text-align: center">배송정보변경</th>
							<th style="text-align: center">배송 확정</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${orderList != null and fn:length(orderList)>0 }">
								<!-- 보여줄 게시글 목록이 있음 -->
								<!-- for(BoardDTO board : boardList) -->
								<c:forEach items="${orderList}" var="order">
									<tr onmouseover="this.style.background='#ffebee'"
										onmouseout="this.style.background=''">
										<td>${order.orderdate}</td>
										<td>${order.ordernum}</td>
										<td>
											<c:choose>
												<c:when test="${order.deli_progress==null and order.cancel_refund=='취소'}">
												<del style="color:red;"><span style="color:grey">-결제 완료(배송전)-</span></del>
												</c:when>
												<c:when test="${order.deli_progress==null}">
												<b style="color:#2196f3">결제 완료(배송전)</b>
												</c:when>
												<c:otherwise>
												<b>${order.deli_progress}</b>
												</c:otherwise>
											</c:choose>
										</td>
										<c:choose>
												<c:when test="${order.deli_progress==null}">
												<td style="color:red"><b>${order.cancel_refund}</b></td>
												</c:when>
												<c:otherwise>
												<td>취소 불가</td>
												</c:otherwise>
										</c:choose>
										<td>${order.prodname}</td>
										<td>${order.userid}</td>
										<c:choose>
											<c:when test="${order.deli_progress==null and order.cancel_refund==null}">
												<td><a href="${pageContext.request.contextPath}/admin/OrderView.ad?mng_num=${order.mng_num}" class="button" style="margin:0 auto;">정보변경</a></td>
												<td><a href="${pageContext.request.contextPath}/admin/DeliverInfo.ad?mng_num=${order.mng_num}" class="button primary">배송확정</a></td>
											</c:when>
											<c:otherwise>
												<td>배송 혹은 취소된 주문</td>
												<td>배송 혹은 취소된 주문</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 보여줄 게시글 목록이 없음 -->
								<tr><td colspan="8">주문 목록이 없습니다.</td></tr>
							</c:otherwise>
						</c:choose>
					
					</tbody>
					<!-- <tfoot>
						<tr>
							<td colspan="6"></td>
							<td>100.00</td>
						</tr>
					</tfoot> -->
				</table>
				<br>
				<!-- 페이징 처리하는 테이블 -->
				<table style="border: 10%; width: 100%">
					<tr align="center" valign="middle">
						<td><c:if test="${page>1}">
								<a
									href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${page-1}">[ &lt; ]</a>
							</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
								var="i">
								<c:choose>
									<c:when test="${page == i}"><b style="color:blue;">[ ${i} ]</b></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${i}">[ ${i} ]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page<totalPage}">
								<a
									href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${page+1}">[ &gt; ]</a>
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>
		</section>
	</div>
			<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
         </script>

	<script	src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>