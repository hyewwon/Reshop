<!-- 도현: 사용자가 판매/기부 요청하는 view -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
    
    
<!DOCTYPE html>

<html>
	<head>
<title>SellorDonate</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />

<style>
	input[type='text']{
		width:70% !important;
	}
	.color{
		backgroud-color:#FFFFFF;
		color:#000000;
	}
	@media (max-width:2000px){
		.frm{
			margin-left:5%;
		}
	}


</style>


	</head>
	<body class="is-preload">
	
	
	
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

	<c:if test="${login_id == null}">
         <script>
            alert("로그인 후 이용하세요!");
            location.replace("${pageContext.request.contextPath}/index.jsp");
         </script>
      </c:if>

		<!-- Menu -->
			<nav id="menu">
				<h2>Menu</h2>
				<ul class="links">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="sellordonate.jsp">판매 기부 신청</a></li>
					<li><a href="generic.html">Tempus etiam</a></li>
					<li><a href="generic.html">Consequat dolor</a></li>
					<li><a href="elements.html">Elements</a></li>
				</ul>
				<ul class="actions stacked">
					<li><a href="#" class="button fit primary">Get Started</a></li>
					<li><a href="#" class="button fit">Log In</a></li>
				</ul>
			</nav>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main" class="wrapper style1">
						<div class="inner">
							<header class="major">
							
								
								
								
								
	
			<img src="${pageContext.request.contextPath}/app/user/img/reshop.png" width="100" height="100"
				align="top">


		<table>
			<tr>
				<td>
					<h3 style="text-align: center; margin-left: 5px;">
						간편하게 옷장을 정리하고 <br> 환경을 보호하는데 동참해주세요 🌎
					</h3>
				</td>
			</tr>
		</table>
			
			
				<img src="${pageContext.request.contextPath}/app/user/img/closet.png" width="200" height="200"">
			
					<h4>1.키트 채우기</h4>
					<p>더이상 입지 않거나 필요하지 않은 옷으로 키트를 채워 옷장의 공간을 확보하세요.</p>
			
	
		
						<img src="${pageContext.request.contextPath}/app/user/img/package.png" width="200" height="200">
			
					<h4>2.키트를 문 밖에 놓아주세요</h4>
					<p>문밖에 놓아주신 키트를 저희가 직접 수거해갑니다!</p>
	
				<p>
					<img src="${pageContext.request.contextPath}/app/user/img/relax.jpg" width="200" height="200"> 
				</p>
	
		<h4>3.나머지는 저희에게 맡겨주세요!</h4>
		<p>검수를 거친 뒤 본인의 계좌로 돈을 적립받거나 스토어 마일리지를 받으세요.</p>
	


		<strong>
			<h5 style="text-align: center;">
				<span style="font-size: 25px;"> 옷 수거 신청 </span>
			</h5>
		</strong>
	</div>


	<form class="frm" action="${pageContext.request.contextPath}/user/UserOption.us"
	 name="sellordonate" method="post">


		<h5>
			판매 혹은 기부 선택해주세요			
		</h5>
		<div class="col-4 col-12-small">	
			<input type="radio" id="demo-priority-low" name="dosdivision" value="매입요청" checked>
			<label for="demo-priority-low">판매</label>
			<input type="radio" id="demo-priority-normal" name="dosdivision" value="기부요청">
			<label for="demo-priority-normal">기부</label>
		</div>
				
		<br>
	

		<h5>수거할 의류가 몇 벌인가요?</h5>
		<h6>(5벌 이하는 수거 불가능합니다.)</h6>
		<div class="col-6 col-12-xsmall">
			<input id="clothingcnt" name ="clothingcnt" style="width:30% !important;display:inline;" type="text" placeholder="직접 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="2"> 벌
			
		</div>


	<!-- 	<select name="category" multiple>
			<option value="none">항목을 선택해주세요</option>
			<option value="lessthan10">5벌 이하 수거 불가</option>
			<option value="morethan10">5벌 이상</option>
			<option value="morethan10">10벌 이상</option>
			<option value="morethan20">20벌 이상</option>
			<option value="morethan30">30벌 이상</option>
		</select>
		
	-->	
		
	<br>
		<h5>보내주시는 의류 카테고리를 선택해주세요.</h5>



				<div class="col-6 col-12-small">
					<input type="checkbox" id ="top" name="item" value="상의" > 
					<label for="top">상의</label>
				</div>
				<div class="col-6 col-12-small">
					<input type="checkbox"  id = "outer" name="item" value="아우터">
					<label for="outer">아우터</label>
				</div>
				<div class="col-6 col-12-small">
					<input type="checkbox"   id = "bottom" name="item" value="하의"> <label
						for="bottom">하의</label>
				</div>
				<div class="col-6 col-12-small">
					<input type="checkbox"   id = "shoes" name="item" value="신발">
					<label for="shoes">신발</label>
				</div>
				<div class="col-6 col-12-small">
					<input type="checkbox"  id = "accessory"  name="item" value="악세서리"> <label
						for="accessory">악세사리</label>
				</div>
				<div class="col-6 col-12-small">
					<input type="checkbox"  id = "bag"  name="item" value="가방">
					<label for="bag">가방</label>
				</div>


		<br>
		
		<h5>보내주시는 의류 브랜드를 입력해주세요.</h5>
		<input type="text" placeholder="직접 입력" name="brand">
	
		<br>
		
		
		<h5>수거할 주소를 입력해주세요.</h5>

		<p>		
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" size="7">
			<br><br>
			<input type="text" name="zipcode" id="sample6_postcode" 
			placeholder="우편번호" onclick="sample6_execDaumPostcode()" readonly>
			
		</p>
		<p>
			<input type="text" name="useraddr" id="sample6_address" placeholder="주소" size="25" readonly>
		</p>
		<p>
			<input type="text" name="useraddrdetail" id="sample6_detailAddress" size="17" placeholder="상세주소">
			<br>
			<input type="text" name="useraddretc" id="sample6_extraAddress" size="8" placeholder="참고항목" readonly>
		</p>
		
		
		

		
		<h5>연락처를 입력해주세요.</h5>
		<input name="userphone" type="text" placeholder="-없이 전화번호 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11"> <br> <br>
		
		<h5>현관 비밀번호를 남겨주세요.</h5>	
			<div class="col-4 col-12-small">	
			<input type="radio" id="door1" name="doorpw" value="none"  checked>
			<label for="door1">없음</label> <br>
		</div>	
			
			<tr>
			<td>
			
			<input type="radio" id="door" name="doorpw" value="doorpw">
			<label for="door">입력</label>
		<input type="text" placeholder="직접입력"
		 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
		</td>
		</tr>
		

		
		
		<br>

		
        <a class = "button primary" href ="javascript:submitted()">수거 신청하기</a>



		<!-- 
		 <div id="button" style="text:align:center;">
			<input id="formconfirm" type="button" value="수거 신청하기"
				onclick="submitted();">
		</div>
		 -->



	</form>					
								
						</div>
					</section>


			</div>

		<!-- Scripts -->
			
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/multiselect.min.js"></script>
			

</body>
<script src="${pageContext.request.contextPath}/app/user/user.js"></script>
<script>let contextPath = "${pageContext.request.contextPath}";</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	
	
	
</html>