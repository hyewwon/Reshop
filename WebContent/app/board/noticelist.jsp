<!-- 윤건 : 게시판 리스트 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
	table {
		margin: 0 auto !important;
	}
	th {
		background-color: #d7ebc2 !important;
	}
	a{
		border-bottom:none !important;
	}
	a:visited {
		text-decoration: none !important;
	}
	a:link {
		text-decoration: none !important;
	}
	a:hover {
		font-weight:bold !important;
	}

</style>
</head>
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

 	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/index.jsp");
		</script> 
	</c:if>
	<c:if test="${not empty param.flag}">
		<script>alert("글쓰기 실패! 다시 시도하세요!");</script>
	</c:if>
	<c:if test="${param.delete==false}">
		<script>alert("삭제 실패! 다시 시도하세요!");</script>
	</c:if>
	<!-- BoardListAction.java 에서 보내주는 데이터들로 변수 만들기 -->
	<c:set var="noticeList" value="${requestScope.noticeList}"/>
	<c:set var="page" value="${requestScope.page }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>
	<div style="text-align:center;">
		<table style="border:0px;width:900px;">
			<tr align="right" valign="middle">
				<td align="right">
					<a style="font-weight: bold; color: blue;"> ${login_id}</a> <a>님 환영합니다.</a>&nbsp;&nbsp;
				<!-- 	<a class="button primary small" href="${pageContext.request.contextPath}/user/UserLogoutOk.us">로그아웃</a>  -->
				</td>			
			</tr>
		</table>
		<!-- 제목과 글 개수 띄워주는 테이블 -->
		<table style="width:900px; border:0px;">
			<tr align="center" valign="middle" style="padding: 0.75em 0.75em;" >
				<td style="width: 100%; height: 100px;"><h3 style="text-align: center; font-weight: bold; font-size: 250%">공지 사항</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>총 게시글 : NO.${totalCnt}</td>
			</tr>
		</table>
		<!-- 게시글 리스트 띄우는 테이블 -->
		<table border="1" style="border-collapse:collapse; border-spacing:0; width:900px;">
			<tr align="center" valign="middle" style="background-color:grayblue">
				<th width="8%" style="text-align: center; font-weight: bold;">No.</th>
				<th width="50%"style="text-align: center; font-weight: bold;">제목</th>
				<th width="15%"style="text-align: center; font-weight: bold;">작성자</th>
				<th width="17%"style="text-align: center; font-weight: bold;">날짜</th>
				<th width="10%"style="text-align: center; font-weight: bold;">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${noticeList != null and fn:length(noticeList)>0 }">
					<!-- 보여줄 게시글 목록이 있음 -->
					<!-- for(NoticeDTO notice : noticeList) -->
					<c:forEach items="${noticeList}" var="notice">
						<tr onmouseover="this.style.background='#f9fbe7'" onmouseout="this.style.background=''">
							<td height="25">${notice.notice_num}</td>
							<td>
								<a href="${pageContext.request.contextPath }/board/NoticeView.bo?notice_num=${notice.notice_num}">
									${notice.notice_title}
								</a>
							</td>
							<td>${notice.userid }</td>
							<td>${notice.regdate }</td>
							<td>${notice.notice_cnt }</td>
						</tr>
					</c:forEach>
				</c:when>			
				<c:otherwise>
					<!-- 보여줄 게시글 목록이 없음 -->
					<tr>
						<td colspan="5" align="center">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table><br>

		<!-- 페이징 처리하는 테이블 -->
		<table style="border:0px;width:900px;" >
			<tr height="70px;" align="center" valign="middle">
				<td>
					<c:if test="${page>1}">
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeList.bo?page=${page-1}">&lt;</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
						<c:choose>
							<c:when test="${page == i}"><a href="#" class="button small">${i}</a></c:when>
							<c:otherwise>
								<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeList.bo?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page<totalPage}">
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeList.bo?page=${page+1}">&gt;</a>
					</c:if>
				</td>
			</tr>
		</table> 
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table style="border:0px; width:900px;" >
			<tr align="right" valign="middle">
				<td>
					<c:if test="${login_id == 'admin'}">
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeWrite.bo?page=${requestScope.page}">글쓰기</a>
					</c:if>		
				</td>
			</tr>
		</table>
	</div>
	<!--  -->
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>