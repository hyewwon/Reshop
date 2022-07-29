<!-- 윤건 : 게시글 작성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<c:import url="../../header.jsp" charEncoding="UTF-8"/>

 	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<div>
		<table style="border:0px;width:900px;">
			<tr>
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
		<form method="post" name="newsForm" action="${pageContext.request.contextPath}/board/NewsWriteOk.bo" enctype="multipart/form-data">	
			<!-- 게시글 작성하는 인풋들 배치 테이블 -->
			<table border="1" style="border-collapse:collapse;">
				<tr height="30px">
					<th width="150px" style="text-align: center; font-weight: bold;">
						제 목
					</th>
					<td>
						<input name="notice_title" size="50" maxlength="100" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr height="300px">
					<th width="150px" style="text-align: center; font-weight: bold;">
						내 용
					</th>
					<td>
						<textarea name="news_contents" style="width:700px;height:250px;resize:none;"></textarea>					
					</td>
					
				</tr>
				
				<tr>
					<th width="150px" style="text-align: center; font-weight: bold;">파일 첨부1</th>
						<td>
							<input type="file" name='file1'>
							<input type="button" value="첨부삭제" onclick="cancelFile('file1')">
						</td>
					</tr>
					<tr>
						<th width="150px" style="text-align: center; font-weight: bold;">파일 첨부2</th>
						<td>
							<input type="file" name="file2">
							<input type="button" value="첨부삭제" onclick="cancelFile('file2')">
						</td>
					</tr>
			</table>
			<table style="border:0px;">
				<tr align="right" valign="middle">
					<td>
						<a class="button primary small" href="javascript:sendit()">등록</a>&nbsp;&nbsp;
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NewsList.bo">목록</a> <!--?page=${page} -->
					</td>
				</tr>
			</table>
		</form>
	</div>
		<!--  -->
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	function sendit(){
		//유효성 검사
		document.newsForm.submit();
		
	}
	function cancelFile(filename){
		if($.browser.msie){
			//input[name='		file1	']
			$("input[name='"+filename+"']").replaceWith($("input[name='"+filename+"']").clone(true));
		}else{
			$("input[name='"+filename+"']").val("");
		}
	}
</script>

</html>




