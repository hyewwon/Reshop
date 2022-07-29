<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--
	Reflex by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			.prodinfo{
				display: table-cell !important; 
				 vertical-align: middle !important;;
				 text-align: left !important;;
			}
		</style>
	</head>
	<body class="is-preload">
	<%-- 	<c:if test="${login_id == null}">
		<script>
			alert("관리자 로그인 필요");
			location.replace("${pageContext.request.contextPath}/index.jsp");
		</script>
	</c:if>--%>
		<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
		
		

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main" class="wrapper style1">
						<div class="inner">
							<header class="major">
								<h1>    </h1>
								
								<div class="shopping-cart">
														
<c:set var="productInfoList" value="${sessionScope.productInfoList}" />
<c:set var="totalAmount" value="${requestScope.totalAmount}" />
<c:set var="fileList" value="${requestScope.fileList}" />
<c:set var="cartList" value="${requestScope.cartList}" />
	  <h2>주문/결제하기</h2>
	  	<c:choose>	
	  		<c:when test="${productInfoList != null and fn:length(productInfoList)>0}"> 	
				<table>
					<caption>결제</caption>
				    	<tr>
				     		<th>주문번호</th>
				     		<th>상품이름</th>
				      		<th>상품</th>
				     		<th>가격(원)</th>
				   		  	<th>수량</th>
				    	</tr>
				   		<c:set var="count" value="-1" />
				   		<c:forEach items="${productInfoList}" var="productInfo">
				  			<c:set var="count" value="${count + 1}" />
					    	<tr v-for="mycart" :key="cart.id">
					      		<td class="prodinfo"> ${rownumList[count]} </td>
					     		<td class="prodinfo"> ${productInfo.prodname}  </td>
					     		<td class="prodinfo"> 
					     			<img alt="X" src="${pageContext.request.contextPath}/app/file/${fileList[count].systemname}" 
					      			style="width: 150px !important;height: 150px !important;object-fit: cover !important;">  
					      		</td>
					      		<td class="prodinfo"> ${productInfo.price} </td>
					      		<c:choose>
					      			<c:when test="${not empty cartList}">
					      				<td class="prodinfo"> ${cartList[count].prodcnt}</td>
					      			</c:when>
					      			<c:otherwise>
					      				<td class="prodinfo"> 1</td>
					      			</c:otherwise>
					      		</c:choose>
					    	</tr>
						</c:forEach>
				   		<tr>
				     		<td colspan="6" style="text-align: right;"> <strong>총계 : ${totalAmount}원</strong> </td>
				    	</tr>
				  </table>
				  
			 	</c:when>
			  	<c:otherwise>
					<p style="text-align: center;">결제할 상품이 없습니다!</p>
				</c:otherwise>
	 	 </c:choose>
	 	 	
		</div>
		<div class="inner">
					<section>
					<c:set var="userInfo" value="${requestScope.userInfo}"/>
						<h2 align="center" valign="middle">배송정보확인</h2>
						<form method="post" name="orderForm" action="${pageContext.request.contextPath}/admin/ProductOrderOk.pd">
							<div class="row gtr-uniform">
								<div class="col-4 col-12-small">
								<b>유저아이디</b>
									<input type="text" value="${userInfo.userid}" name="userid" readonly/>
								</div>
								<div class="col-4 col-12-small">
								<b>수령인 </b>
									<input type="text" value="${userInfo.username}" name="username"/>
								</div>
								<div class="col-4 col-12-small">
								<b>수령인 전화번호 </b>
									<input type="text" value="${userInfo.userphone}" name="userphone" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
								</div>
								<div class="col-12">
										<input type="text" value="${userInfo.zipcode}" name="zipcode" id="sample6_postcode" size="7"
										placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly >
										<a class="button" onclick="sample6_execDaumPostcode()" style="margin-top: 10px">우편번호 찾기</a>
									</div >
									<div class="col-4 col-12-small">
										<input type="text" value="${userInfo.useraddr}" id="sample6_address" placeholder="주소" size="25" name="useraddr" readonly>
									</div>
									<div class="col-4 col-12-small">
										
										<input type="text" value="${userInfo.useraddrdetail}" id="sample6_detailAddress" size="17"  placeholder="상세주소" name="useraddrdetail">
									</div>
									<div class="col-4 col-12-small">
										<input type="text" value="${userInfo.useraddretc}" id="sample6_extraAddress" size="8" placeholder="참고사항" readonly name="useraddretc" readonly>
									</div><br>
									<div class="col-12">
										<ul class="actions fit" align="middle">
											<li><input type="reset" value="초기화" /></li>
											<li><input onclick="sendit()" type="button" value="주문 완료" class="primary" /></li>
											<li><a href="${pageContext.request.contextPath}/admin/ProductCart.pd" class="button">장바구니 목록으로 돌아가기</a></li>
										</ul>
									</div>									
							</div>
						</form>
								</section>
								</div>
	</header>					
	</div>
	
</section>

				<!-- Footer -->
					<section id="footer" class="wrapper split style2">
						<div class="inner">
							<section>
								<header>
									<h3>Magna lorem ipsum</h3>
								</header>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos magna fames ac turpis egestas amet non lorem amet.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
								</ul>
							</section>
							<section>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half"><input type="text" name="name" id="name" placeholder="Name" /></div>
										<div class="field half"><input type="email" name="email" id="email" placeholder="Email" /></div>
										<div class="field"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send Message" /></li>
									</ul>
								</form>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; Untitled. All rights reserved. Lorem ipsum dolor sit amet nullam.</p>
						</div>
					</section>
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
	<script>
function sendit() {
	let orderForm = document.orderForm;
	let nameTag = orderForm.username;
	let phoneTag = orderForm.userphone;
	let addrTag = orderForm.useraddrdetail;

	if (nameTag.value == "" || nameTag.value == null) {
		alert("수령인을 입력하세요!");
		nameTag.focus();
		return false;
	}
	if (phoneTag.value == "" || phoneTag.value == null) {
		alert("수령인 전화번호를 입력하세요!");
		phoneTag.focus();
		return false;
	}
	if (addrTag.value == "" || addrTag.value == null) {
		alert("상세 주소를 입력하세요!");
		addrTag.focus();
		return false;
	}
	// 여기까지 왔다면 위의 유효성 검사를 다 통과했다는 뜻이므로 폼 제출
	orderForm.submit();
}
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
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>

