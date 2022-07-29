<!-- 예찬 : 관리자가 기부/매입리스트 보는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>reshop 기부/매입 관리</title>
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
		<c:when test="${param.update==true}">
			<script>alert("완료!")</script>
		</c:when>
		<c:when test="${param.update==false}">
			<script>alert("완료 실패!")</script>
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
	<c:set var="donaSellList" value="${requestScope.donaSellList}" />
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
						<b>기부/매입 관리</b>
					</h1>
					<p></p>
				</header>
			</div>
			<div style="margin:5%">
			<h3>
				<b>전체 기부/매입 관리</b>
			</h3>
			<div class="table-wrapper">
				<table class="alt" style="text-align: center;">
					<thead>
						<tr>
							<th style="text-align: center">신청일자</th>
							<th style="text-align: center">신청자 아이디</th>
							<th style="text-align: center">신청자 전화번호</th>
							<th style="text-align: center">상태</th>
							<th style="text-align: center">의류 개수</th>
							
							<th style="text-align: center">내용/주소</th>
							
							<th style="text-align: center">감정가</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${donaSellList != null and fn:length(donaSellList)>0 }">
								<!-- 보여줄 게시글 목록이 있음 -->
								<c:forEach items="${donaSellList}" var="donaSell">
									<tr onmouseover="this.style.background='#ffebee'"
										onmouseout="this.style.background=''">
										<td>${donaSell.uploadtime}</td>
										<td>${donaSell.userid}</td>
										<td>
												<script>
												var phoneNum = '<c:out value="${donaSell.userphone}"/>';
												phoneNum = phoneNum.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
												
												document.write(phoneNum);
												</script>
										</td>
										<c:choose>
											<c:when test="${donaSell.dosdivision=='매입요청'}">
												<!-- 빨간글씨 -->
												<td><b style="color:#F20101">${donaSell.dosdivision}</b></td>
											</c:when>									
											<c:when test="${donaSell.dosdivision=='기부요청'}">
												<!-- 파란글씨 -->
												<td><b style="color:#2E64FE">${donaSell.dosdivision}</b></td>
											</c:when>									
											<c:otherwise>
												<!-- 그외 기부완료/매입완료 시에는 검정글씨 -->
												<td>${donaSell.dosdivision}</td>
											</c:otherwise>
										</c:choose>
										<td>${donaSell.clothingcnt}벌</td>
										<td><a href="${pageContext.request.contextPath}/admin/DonaSellInfo.ad?dosnum=${donaSell.dosnum}&priceon=off" class="button">내용/주소</a></td>
										<c:choose>
											<c:when test="${donaSell.dosdivision=='매입완료'}">
												<td style="color:red">
												<script>
												function addComma(num) {
	 														 var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  												return num.toString().replace(regexp, ',');
													}
													var price = '<c:out value="${donaSell.connoisseur}"/>';
													document.write(addComma(price)+'원');
												</script></td>
											</c:when>
											<c:when test="${donaSell.dosdivision=='기부요청'}">
												<td><a href="${pageContext.request.contextPath}/admin/DonaDone.ad?dosnum=${donaSell.dosnum}" class="button">수거 완료</a></td>
											</c:when>					
											<c:when test="${donaSell.dosdivision=='매입요청'}">
												<td><a href="${pageContext.request.contextPath}/admin/DonaSellInfo.ad?dosnum=${donaSell.dosnum}&priceon=on" class="button primary">수거 완료/감정가 결정</a></td>
											</c:when>					
											<c:otherwise>
												<td>완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 보여줄 게시글 목록이 없음 -->
								<tr>
									<td colspan="9" align="center">배송 내역이 없습니다.</td>
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
									href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad?page=${page-1}">[ &lt; ]</a>
							</c:if>
							 <c:forEach begin="${startPage}" end="${endPage}" step="1"
								var="i">
								<c:choose>
									<c:when test="${page == i}"><b style="color:blue;">[ ${i} ]</b></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad?page=${i}">[ ${i} ]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page<totalPage}">
								<a
									href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad?page=${page+1}">[ &gt; ]</a>
							</c:if></td>
					</tr>
				</table>

			</div>
			</div>
		</section>
	</div>

	<script	src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>