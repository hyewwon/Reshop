<!-- 예찬 : 관리자가 환불관리 보는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>reshop 환불 관리</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
<%-- 	<c:if test="${param.db==false}">
			<script>alert("DB 오류!")</script>
	</c:if> --%>
	<c:choose>
		<c:when test="${param.refunddone==true}">
			<script>alert("환불처리 완료!")</script>
		</c:when>
		<c:when test="${param.refunddone==false}">
			<script>alert("환불처리 실패!")</script>
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
	<c:set var="refundList" value="${requestScope.RefundList}" />
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
						<b>환불 관리</b>
					</h1>
					<p></p>
				</header>
			</div>
			<div style="margin:5%">
			<h3>
				<b>전체 환불 관리</b>
			</h3>
			<div class="table-wrapper">
				<table class="alt" style="text-align: center;">
					<thead>
						<tr>
							<th style="text-align: center">배송일자</th>
							<th style="text-align: center">송장번호</th>
							<th style="text-align: center">환불상태</th>
							<th style="text-align: center">배송상태</th>
							
							<th style="text-align: center">상품번호</th>
							<th style="text-align: center">상품이름<br>(가격)</th>
							<th style="text-align: center">유저아이디</th>
							<th style="text-align: center">수령인</th>
							
							<th style="text-align: center">배송정보</th>
							<th style="text-align: center">환불처리</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${refundList != null and fn:length(refundList)>0 }">
								<!-- 보여줄 게시글 목록이 있음 -->
								<!-- for(OrderDTO refund : refundList) -->
								<c:forEach items="${refundList}" var="refund">
									<tr onmouseover="this.style.background='#ffebee'"
										onmouseout="this.style.background=''">
										<td>${refund.deliver_date}</td>
										<td>${refund.invoicenum}</td>
										<c:choose>
											<c:when test="${refund.cancel_refund=='환불요청'}">
												<td><b style="color:red">${refund.cancel_refund}</b></td>
											</c:when>									
											<c:otherwise>
												<td>${refund.cancel_refund}</td>
											</c:otherwise>
										</c:choose>
										<td>${refund.deli_progress}</td>
										
										<td>${refund.prodnum}</td>
										<td>${refund.prodname}
											<br>
												<script>
												function addComma(num) {
	 														 var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  												return num.toString().replace(regexp, ',');
													}
													var price = '<c:out value="${refund.price}"/>';
													document.write('('+addComma(price)+'원)');
												</script>
										</td>
										<td>${refund.userid}</td>
										<td>${refund.deli_name}</td>
										
										<td><a href="${pageContext.request.contextPath}/admin/DeliverInfo.ad?mng_num=${refund.mng_num}&back=refundlist" class="button">배송정보 보기</a></td>
										<td>
											<c:if test="${refund.cancel_refund=='환불요청'}">
												<a href="${pageContext.request.contextPath}/admin/RefundDone.ad?mng_num=${refund.mng_num}" class="button primary">환불 처리</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 보여줄 게시글 목록이 없음 -->
								<tr>
									<td colspan="10" align="center">환불 내역이 없습니다.</td>
								</tr>
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
									href="${pageContext.request.contextPath}/admin/ManageDeliver.ad?page=${page-1}">[ &lt; ]</a>
							</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
								var="i">
								<c:choose>
									<c:when test="${page == i}"><b style="color:blue;">[ ${i} ]</b></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/admin/ManageDeliver.ad?page=${i}">[ ${i} ]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page<totalPage}">
								<a
									href="${pageContext.request.contextPath}/admin/ManageDeliver.ad?page=${page+1}">[ &gt; ]</a>
							</c:if></td>
					</tr>
				</table>

			</div>
			</div>
		</section>
		
		
		    <form action="2_setProduct.jsp" method="post">
         <h3>로그인 화면</h3>
         <!-- required 입력 하지 않으면 넘어 가지 않는다 -->
         <input type="text" required name="name1"> <input
            type="submit" value="로그인" name="1_login">
      </form>
		
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
















