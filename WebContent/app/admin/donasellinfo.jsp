<!-- 예찬 : 관리자가 기부/매입 상세정보 보는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reshop 기부매입정보</title>
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

	<c:set var="dsdto" value="${requestScope.dsdto}" />
	<c:set var="priceon" value="${requestScope.priceon}" />
	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
				<section>
					<h2 align="center" valign="middle">수거 주소 정보</h2>
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							신청날짜 <input type="text" value="${dsdto.uploadtime}" readonly />
						</div>

						<div class="col-6 col-12-xsmall">
							<b>신청자 아이디</b> <input type="text"
								value="${dsdto.userid}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<b>수거할 의류 개수</b> <input
								type="text" value="${dsdto.clothingcnt}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<b>신청자 전화번호</b> <input
								type="text" value="${dsdto.userphone}" readonly />
						</div>
						<div class="col-12">
							<b>의류 카테고리</b> <input
								type="text" value="${dsdto.classify_prod}" readonly />
						</div>
						<div class="col-12">
							<b>브랜드</b> <input
								type="text" value="${dsdto.brand}" readonly />
						</div>
						
						
						
						<div class="col-12">
							<h4>
								<b>주소</b>
							</h4>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="25" value="${dsdto.useraddr}" readonly>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="17" value="${dsdto.useraddrdetail}" readonly>
						</div>
						<div class="col-4 col-12-small">
							<input type="text" size="8" value="${dsdto.useraddretc}" readonly>
						</div>
						<div class="col-4 col-12-small">
							건물 비밀번호
							<input type="text" size="8" value="${dsdto.doorpw}" readonly>
						</div>
					</div><hr>
						
						
						<c:choose>
						<c:when test="${priceon=='off'}">
							<div class="col-12">
								<ul class="actions fit" align="middle">
									<li><a
										href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad"
										class="button">기부/매입 목록으로 돌아가기</a></li>
								</ul>
							</div>
						</c:when>
						<c:when test="${priceon=='on'}">
						<h2 align="center" valign="middle"><b>감정가 입력</b></h2>
						<h4 align="center" valign="middle" style="color:red">상품 상태를 꼼꼼히 체크 후 작성</h4>
						<form method="post" name="priceForm" action=
						"${pageContext.request.contextPath}/admin/DonaSellPriceOk.ad?dosnum=${dsdto.dosnum}">
							<div class="row gtr-uniform">
							<div class="col-12">
								<input type="text" name="price" size="8" placeholder="감정가" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
							<br>
							<div class="col-12">
								<ul class="actions fit" align="middle">
									<li><input onclick="sendit2()" type="button" value="감정가 확정"
												class="primary" /></li>
									<li><a href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad" class="button">기부/매입 목록으로 돌아가기</a></li>
								</ul>
							</div>	
							</div>
						</form>
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
	  <script>
		function sendit2() {
			let priceForm = document.priceForm;
			let price = priceForm.price;
		
			if (price.value == "" || price.value == null) {
				alert("감정가를 입력하세요!");
				price.focus();
				return false;
			}
			// 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
			priceForm.submit();
		}
</script>
</body>
</html>