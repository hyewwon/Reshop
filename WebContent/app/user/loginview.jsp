<!--영환 : 로그인 페이지  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<style>
#sform {
	display: inline-block;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>loginview</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<c:if test="${param.delete=='delete'}">
         <script>alert("탈퇴 성공!")</script>
   </c:if>
	
	<c:if test="${param.login==false}">
         <script>alert("해당기능은 회원만 이용가능합니다!")</script>
   </c:if>
   
	<c:if test="${not empty param.flag}">
		<script>
			alert("아이디 또는 비밀번호 오류입니다!");
		</script>
	</c:if>
	<div style="margin: auto; text-align: center;">
	<h2 align="center" valign="middle"> </h2>
		<form name="loginform"
			action="${pageContext.request.contextPath}/user/UserLoginOk.us"
			method="post" id="sform">
			<table border="1" style="width: 400px; border-collapse: collapse;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userpw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="로그인하기"
						onclick="sendit();"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="회원가입"
						onclick="location.href='${pageContext.request.contextPath}/app/user/joinview.jsp'">
						<br>
					<br> <input type="button" value="아이디/비밀번호 찾기"
						onclick="location.href='${pageContext.request.contextPath}/app/user/lostIdview.jsp'">
					</td>
				</tr>
			</table>
		</form>
		<!-- Footer -->
					<section id="footer" class="wrapper split style2">
						<div class="inner">
							<section>
								<p> </p>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; Untitled. All rights reserved. Lorem ipsum dolor sit amet nullam.</p>
						</div>
					</section>
	</div>



	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<script>
	let frm = document.loginform;
	let idTag = frm.userid;
	let pwTag = frm.userpw;

	function sendit() {
		if (idTag.value == "" || idTag.value == null) {
			alert("아이디를 입력하세요!");
			idTag.focus();
			return false;
		}
		if (pwTag.value == "" || pwTag.value == null) {
			alert("비밀번호를 입력하세요!");
			pwTag.focus();
			return false;
		}
		frm.submit();
	}
</script>
</html>