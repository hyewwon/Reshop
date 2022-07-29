<!-- 윤건 : 게시글 수정 -->

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
	table{
		margin:0 auto !important;
		width:900px !important;
	}
	th{
		background-color:#d7ebc2 !important;
	}
	.finput{
		position:absolute !important;
		width:1px !important;
		height:1px !important;
		padding:0 !important;
		margin:-1px !important;	
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
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>  
	<div>
		<table style="border:0px;width:900px;">
			<tr align="right" valign="middle">
				<td align="right">
					<a style="font-weight: bold; color: blue;"> ${login_id}</a> <a>님 환영합니다.</a>&nbsp;&nbsp;
				<!-- 	<a class="button primary small" href="${pageContext.request.contextPath}/user/UserLogoutOk.us">로그아웃</a>  -->
				</td>			
			</tr>
		</table>
		<br>
		<br>
		<table style="width: 900px; border: 0px;">
			<tr align="center" valign="middle">
				<td><h3>공지 사항</h3></td>
			</tr>
		</table>
		<c:set var="board" value="${requestScope.notice}"/>
		<c:set var="files" value="${requestScope.files}"/>
		<form method="post" name="boardForm" action="${pageContext.request.contextPath}/board/NoticeModifyOk.bo?notice_num=${notice.notice_num}" enctype="multipart/form-data">
			<!-- 게시글 작성하는 인풋들 배치 테이블 -->
			<table border="1" style="border-collapse:collapse;">
				<tr height="30px">
					<th width="150px" style="text-align: center; font-weight: bold;">
						제 목
					</th>
					<td>
						<input name="notice_title" size="50" maxlength="100" value="${notice.notice_title}">
					</td>
				</tr>
				<tr height="30px">
					<th width="150px" style="text-align: center; font-weight: bold;">
						글쓴이
					</th>
					<td>
						<input name="userid" size="10" maxlength="20" value="${notice.userid}" readonly>
					</td>
				</tr>
				<tr height="300px">
					<th width="150px" style="text-align: center; font-weight: bold;">
						내 용
					</th>
					<td>
						<textarea name="notice_contents" style="width:700px;height:250px;resize:none;">${notice.notice_contents}</textarea>					
					</td>
				</tr>
				<c:choose>
					<c:when test="${files != null and fn:length(files)>0}">
						<c:forEach var="i" begin="0" end="1">
							<tr>
								<th width="150px" style="text-align: center; font-weight: bold;">첨부파일${i+1}</th>
								<td>
									<c:choose>
										<c:when test="${i<fn:length(files)}">
											<p class="filename" name ="filename${i+1}" id="file${i+1}">${files[i].orgname}</p>
											<input type="hidden" name="filename" value="${files[i].orgname}">								
										</c:when>
										<c:otherwise>
											<p class="filename" name ="filename${i+1}" id="file${i+1}"></p>
											<input type="hidden" name="filename">								
										</c:otherwise>									
									</c:choose>		
									<label class="button primary small" for="fileInput${i+1}">파일 변경하기</label>
									<input class="finput" name="file${i+1}" id="fileInput${i+1}" type="file">
								<!--	<label class="button primary small" for="deletefilebyName${i+1}">첨부삭제</label>  -->
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">첨부 파일이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<table style="border:0px;">
				<tr align="right" valign="middle">
					<td>
						<a class="button primary small" href="javascript:sendit()">수정완료</a>&nbsp;&nbsp;
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeList.bo">목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	function sendit(){
		//유효성 검사
		document.boardForm.submit();
	}
	//HTML이 다 로딩된 이후에 넘겨주는 함수 호출
	$(document).ready(function(){
		//클래스명이 finput인것이 변화가 생겼다면 넘겨주는 함수 호출
		$('.finput').change(function(e){
			//$(this) : 변화가 생긴 그 객체(input type="file") - 방금 파일을 첨부한 input 요소
			//새로운 파일을 올렸다면 그 위에 있는 요소중 <p>의 내부에 방금 올린 파일명을 써주어야 한다.
			//3번 이전으로 가서 있는 요소가 p태그이므로 prev을 3번 써주고 그 안에있는 text를 올린 파일명으로 바꾸어준다.
			//e.target.files[0].name : 방금 선택한 파일의 파일명 추출
			
			$(this).prev().prev().prev().text(e.target.files[0].name);
			$(this).prev().prev().val(e.target.files[0].name);
		
		})
	})

</script>
</html>




