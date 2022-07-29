<!-- 예찬 : 관리자가 배송 상세정보 보는 view -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reshop 배송 확정하기</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<%-- 	<c:if test="${login_id == null}">
		<script>
			alert("관리자 로그인 필요");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${login_id != admin}">
		<script>
			alert("관리자만 이용할 수 있습니다!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if> --%>

	<c:set var="order" value="${requestScope.order}" />
	<c:set var="back" value="${requestScope.back}" />
	${back}
	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
				<section>
					<h2 align="center" valign="middle">배송 정보</h2>
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							주문날짜 <input type="text" value="${order.orderdate}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							유저아이디 <input type="text" value="${order.userid}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							주문관리번호 <input type="text" value="${order.mng_num}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							상품번호 <input type="text" value="${order.prodnum}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							상품이름 <input type="text" value="${order.prodname}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							수량 <input type="text" value="${order.ordercnt}" readonly />
						</div>


						<div class="col-6 col-12-xsmall">
							<b>수령인</b> <input type="text"
								value="${order.deli_name}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<b>수령인 전화번호</b> <input
								type="text" value="${order.deli_phone}" readonly />
						</div>
						<div class="col-12">
							<h4>
								<b>배송 주소</b>
							</h4>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="25" value="${order.deli_addr}" readonly>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="17" value="${order.deli_addr_detail}"
								readonly>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="8" value="${order.deli_addr_etc}"
								readonly>
						</div>
					</div><hr>
					
					<c:choose>
						<c:when test="${order.deli_progress == null}">
							<h2 align="center" valign="middle"><b>송장 번호 입력</b></h2>
							<form method="post" name="deliverform"
								action="${pageContext.request.contextPath}/admin/DeliverOK.ad?mng_num=${order.mng_num}">
								<div class="row gtr-uniform">
									<div class="col-12">
										<input type="text" name="invoicenum" size="8" placeholder="송장 번호" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</div>
									<br>
									<div class="col-12">
										<ul class="actions fit" align="middle">
											<li><input onclick="sendit()" type="button" value="배송 확정(배송 출발)"
												class="primary" /></li>
											<li><a
												href="${pageContext.request.contextPath}/admin/ManageOrder.ad"
												class="button">주문 목록으로 돌아가기</a></li>
										</ul>
									</div>
								</div>
							</form>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${back=='refundlist'}">
							<div class="col-12">
								<ul class="actions fit" align="middle">
									<li><a
										href="${pageContext.request.contextPath}/admin/ManageRefund.ad"
										class="button">환불목록으로 돌아가기</a></li>
								</ul>
							</div>
						</c:when>
						<c:when test="${back=='deliverlist'}">
							<div class="col-12">
								<ul class="actions fit" align="middle">
									<li><a
										href="${pageContext.request.contextPath}/admin/ManageDeliver.ad"
										class="button">배송목록으로 돌아가기</a></li>
								</ul>
							</div>
						</c:when>
					</c:choose>
					
					
				</section>
			</div>
		</section>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
		<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
         </script>
         <script>
		function sendit() {
			let deliverform = document.deliverform;
			let invoicenum = deliverform.invoicenum;
		
			if (invoicenum.value == "" || invoicenum.value == null) {
				alert("송장번호를 입력하세요!");
				invoicenum.focus();
				return false;
			}
			// 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
			deliverform.submit();
		}
</script>
</body>
</html>