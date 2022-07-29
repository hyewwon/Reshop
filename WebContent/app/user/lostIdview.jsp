<!--영환 : 아이디 찾는 페이지  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
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
	<div style="margin: auto; text-align: center;">
		<form name="lostform"
			action="${pageContext.request.contextPath}/user/UserlostIdOk.us"
			method="post">
			<p>
				<input name="username" placeholder="이름">
			</p>
			<p>
				<input name="userphone" placeholder="핸드폰번호">
			</p>
			<p>
				<input type="button" value="ID찾기" onclick="lostId();">
			</p>
		</form>
	</div>



	<!--  -->
	<section class="wrapper style3 special">
		<div class="inner">
			<header>
				<h2>Amet ullamcorper</h2>
				<p>
					Aptent taciti sociosqu litora torquent et conubia sed etiam.<br />
					Phasellus convallis elit id ullamcorper pulvinar. Duis aliquam<br />
					turpis mauris, ultricies erat malesuada quis.
				</p>
			</header>
			<footer>
				<ul class="actions special">
					<li><a href="#" class="button big">Get Started</a></li>
				</ul>
			</footer>
		</div>
	</section>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="user.js"></script>
	<!--  -->

</body>
<script>
	let frm = document.lostform;
	let nameTag = frm.username;
	let phoneTag = frm.userphone;

	function lostId() {
		if (nameTag.value == "" || nameTag.value == null) {
			alert("이름을 입력하세요!");
			idTag.focus();
			return false;
		}
		if (phoneTag.value == "" || phoneTag.value == null) {
			alert("핸드폰 번호를 입력하세요!");
			pwTag.focus();
			return false;
		}
		frm.submit();
	}
</script>
</html>