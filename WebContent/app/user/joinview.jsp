<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinview</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
      <div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
   <form name="joinform"
      action="${pageContext.request.contextPath}/user/UserJoinOk.us"
      method="post">
      <p style="margin: 0px; padding: 0px">
         <span id="text" style="color: red; font-weight: bold;"></span><br>
         <input type="text" name="userid" class="mylabel" placeholder="아이디">
      </p>
      <h5
         style="text-align: center; width: 100%; margin: 0 10; padding: 0px;">
         <br> <input type="button" value="중복체크" onclick="checkId();">
      </h5>
      <p>
         <input type="password" name="userpw" placeholder="비밀번호">
      </p>
      <p>
         <input type="password" name="userpw_re" placeholder="비밀번호 확인">
      </p>
      <p>
         <input type="text" name="username" placeholder="이름">
      </p>
      <p>
         <input type="text" name="usernick" placeholder="닉네임">
      </p>
      <p>
         <input type="text" name="userage" placeholder="나이">
      </p>
      <p>
         <input type="text" name="userphone" placeholder="핸드폰 번호">
      </p>
      <p>
         <input type="text" name="zipcode" id="sample6_postcode" size="7"
            placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly>
         <br> <input type="button" onclick="sample6_execDaumPostcode()"
            value="우편번호 찾기">
      </p>
      <p>
         <input type="text" name="useraddr" id="sample6_address"
            placeholder="주소" size="25" readonly>
      </p>
      <p>
         <input type="text" name="useraddrdetail" id="sample6_detailAddress"
            size="17" placeholder="상세주소"> <input type="text"
            name="useraddretc" id="sample6_extraAddress" size="8"
            placeholder="참고항목" readonly>
      </p>
      <br>

      <h3
         style="text-align: center; width: 100%; margin: 0 10; padding: 0px;">
         <input type="button" value="회원가입" onclick="sendit()">
      </h3>
   </form>
   <br>
   </div>
</section>
</div>

   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>




</body>
<script>
   let contextPath = "${pageContext.request.contextPath}";
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="user.js"></script>
</html>
