<!-- 성훈 : 회원현황을 보는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML>
<!--
   Reflex by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->

<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
   table{
      margin: 0 auto;
      text-align: center;
      valign: middle;
   }

</style>
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

   <c:set var="user" value="${requestScope.user}" />
   
   <div id="wrapper">
      <section id="main" class="wrapper style1">
            <div class="inner">
            <header class="major">
               <h1>
                  <b>고객 정보 관리</b>
               </h1>
               <p></p>
            </header>
         </div>
   
   <div style="margin:2%">      
   <form name="passView"
      action="${pageContext.request.contextPath}/user/PassengerCheck.us">
      <div class="pass">
         <table style="margin: 0 auto;">
            <tr>
               <th style="width:200px">
                     아이디를 입력해주세요. 
               </th>
               <td style="width:50px">
                  <input type="text" name="userid" style="width:400px;">
               </td>
               <td align="left">
                  <input type="submit" value="검색">
               </td>
            </tr>
         </table>
      </div>
   </form>

      <div class="table-wrapper">
         <table>
            <tbody>
               <tr>
 <td>아이디</td>
                  <td>이름</td>
                  <td>닉네임</td>
                  <td>나이</td>
                  <td>핸드폰 번호</td>
                  <td>우편번호</td>
                  <td>주소</td>
                  <td>상세주소</td>
                  <td>동주소</td>
                  <td>구매금액</td>
                  <td>수정하기</td>
               </tr>
      <c:choose>
           <c:when test="${user != null}">
              <!-- 보여줄 게시글 목록이 있음 -->
               <tr style="height:55px">
                  <td>${user.userid}</td>
                           <c:choose>
                           <c:when test="${user.userpw}=='d'">
                              <td colspan="15">삭제된 아이디입니다.</td>
                           </c:when>
                           <c:otherwise>
                           <td>${user.username}</td>
                           <td>${user.usernick}</td>
                           <td>${user.userage}</td>
                           <td>${user.userphone}</td>
                           <td>${user.zipcode}</td>
                           <td>${user.useraddr}</td>
                           <td>${user.useraddrdetail}</td>
                           <td>${user.useraddretc}</td>                     
                           <td>${user.buy}</td>                        
                           <td><a href="${pageContext.request.contextPath}/user/PassUpdateCheck.us?userid=${user.userid}" style="color:red;">수정하기</a></td>
                       </c:otherwise></c:choose>
               </tr>
            </c:when>
            <c:otherwise>
              <!-- 보여줄 게시글 목록이 없음 -->
                    <script>
                       alert("없는 아이디 입니다.");
                    </script>                                    
           </c:otherwise>
        </c:choose>
            </tbody>
         </table>
         </div>
      </div>
</section>
</div>
              

      <!-- Scripts -->
      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/browser.min.js"></script>
      <script src="assets/js/breakpoints.min.js"></script>
      <script src="assets/js/util.js"></script>
      <script src="assets/js/main.js"></script>
</body>