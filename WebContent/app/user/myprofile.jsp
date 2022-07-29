<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Re#</title>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
   <c:choose>
      <c:when test="${param.update==true}">
         <script>alert("정보 변경 성공!")</script>
      </c:when>
      <c:when test="${param.update==false}">
         <script>alert("정보 변경 실패!")</script>
      </c:when>
   </c:choose>

   
   <c:set var="user" value="${requestScope.user}"/>
      <div id="wrapper">
         <section id="main" class="wrapper style1">
            <div class="inner">
               <section>
                  <h2 align="center" valign="middle">고객 정보 변경</h2>
                  <form method="post" name="userForm" action="${pageContext.request.contextPath}/user/MyprofileModifyOk.us?userid=${user.userid}">
                     <div class="row gtr-uniform">
                       
                        <div class="col-6 col-12-xsmall">
                        아이디
                           <input type="text" value="${user.userid}" name="userid" readonly/>
                        </div>
                       
                       
                        <div class="col-6 col-12-xsmall">
                        비밀번호<span style="color:blue">(수정 가능)</span>
                           <input type="password" value="${user.userpw}" name="userpw"/>
                        </div>
                        
                        <div class="col-6 col-12-xsmall">
                        이름<span style="color:blue">(수정 가능)</span>
                           <input type="text" value="${user.username}" name="username"/>
                        </div>
                        <div class="col-6 col-12-xsmall">
                        닉네임<span style="color:blue">(수정 가능)</span>
                           <input type="text" value="${user.usernick}" name="usernick"/>
                        </div>
                        
                        <div class="col-6 col-12-xsmall">
                        나이<span style="color:blue">(수정 가능)</span>
                           <input type="text" value="${user.userage}" name="userage"/>
                        </div>
                       
                        <div class="col-6 col-12-xsmall">
                        번호<span style="color:blue">(수정 가능)</span>
                           <input type="text" value="${user.userphone}" name="userphone"/>
                        </div>
                       
                        
                
                           <div class="col-3.5"><h4><b>배송 주소 <span style="color:blue">(수정 가능)</span></b></h4></div>
                           <div class="col-6">
                              <a class="button primary small" onclick="sample6_execDaumPostcode()">주소변경하기</a>
                           </div>
                           <div class="col-4 col-12-small" style="display: block">
                              <input type="text" name="zipcode" id="sample6_postcode" size="7" value="${user.zipcode}"
                              placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly >
                           </div>
                           <div class="col-4 col-12-small">
                              <input type="text" id="sample6_address" value="${user.useraddr}" size="25" name="useraddr" readonly>
                           </div>
                           <div class="col-4 col-12-small">
                              <input type="text" id="sample6_detailAddress" size="17" value="${user.useraddrdetail}" name="useraddrdetail">
                           </div>
                           <div class="col-4 col-12-small">
                              <input type="text" id="sample6_extraAddress" size="8" value="${user.useraddretc}" name="useraddretc">
                           </div>
                           <br>
                           <div class="col-12">
                              <ul class="actions fit" align="middle">
                                 <li><input type="reset" value="초기화" /></li>
                                 <li>
                                 <a href="javascript:sendit()" class="button">수정 완료</a>
                                 </li>
                                 <li><a href="javascript:deleted()" class="button" >탈퇴하기</a></li>
                              </ul>
                           </div>
                     </div>
                  </form>
                  <form action="${pageContext.request.contextPath}/user/MyprofileDelete.us" name="deleteForm">
                  	<input type="hidden" value="${user.userid}" name="userid">
                  </form>                           
                        </section>
                        </div></section></div>
   <script   src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script   src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<script>
function deleted() {
	let deleteForm = document.deleteForm;
	deleteForm.submit();
}


function sendit() {
   let userForm = document.userForm;
   
   let nameTag = userForm.username;
   let phoneTag = userForm.userphone;
   let nickTag = userForm.usernick;
   let ageTag = userForm.userage;
   let addrTag = userForm.useraddr;
   let addrdeTag = userForm.useraddrdetail;
   let addretcTag = userForm.useraddretc;

   if (nameTag.value == "" || nameTag.value == null) {
      alert("이름을 입력하세요.");
      nameTag.focus();
      return false;
   }
   if (phoneTag.value == "" || phoneTag.value == null) {
      alert("전화번호를 입력하세요.");
      phoneTag.focus();
      return false;
   }
   if (nickTag.value == "" || nickTag.value == null) {
      alert("닉네임을 입력하세요.");
      addrTag.focus();
      return false;
   }
   if (ageTag.value == "" || ageTag.value == null) {
      alert("나이를 입력하세요.");
      addrTag.focus();
      return false;
   }
   if (addrTag.value == "" || addrTag.value == null) {
      alert("주소를 입력하세요.");
      addrTag.focus();
      return false;
   }
   if (addrdeTag.value == "" || addrdeTag.value == null) {
      alert("상세주소를 입력하세요.");
      addrTag.focus();
      return false;
   }
   if (addretcTag.value == "" || addretcTag.value == null) {
      alert("동주소를 입력하세요.");
      addrTag.focus();
      return false;
   }
   // 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
   userForm.submit();
}
</script>
      <script type="text/javascript">
      window.history.forward();
      function noBack() {
         window.history.forward();
      }
         </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
   new daum.Postcode(
         {
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
                                             // 경우
                  addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraAddr += (extraAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraAddr !== '') {
                     extraAddr = ' (' + extraAddr + ')';
                  }
                  // 조합된 참고항목을 해당 필드에 넣는다.
                  document.getElementById("sample6_extraAddress").value = extraAddr;

               } else {
                  document.getElementById("sample6_extraAddress").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("sample6_address").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("sample6_detailAddress").value = "";
               document.getElementById("sample6_detailAddress").focus();
            }
         }).open();
}
</script>
</html>