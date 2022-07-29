<!--영환 : 아이디찾기를해서 찾았을때 아이디를 출력해주는 페이지  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
	<br>
	<br>
	<br>
	<div style="margin: auto; text-align: center;">
		<p>회원님 아이디는 ${lostId}</p>
		<a class="button" href="${pageContext.request.contextPath}/app/user/loginview.jsp">로그인</a>
	</div>


	<!--  -->


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>