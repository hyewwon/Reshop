<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 혜원 : 관리자에서 상품 수정하는 view-->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

			<c:set var="product" value="${requestScope.product}"/>
			<c:set var="files" value="${requestScope.files}"/>
	<div id="wrapper">
	
		<section id="main" class="wrapper style1">
			<div class="inner">
				<section>
					<h3>상품 수정</h3>
					<form name="productForm" method="post" action="${pageContext.request.contextPath}/admin/ProductModifyOk.pd" enctype="multipart/form-data">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prodnum" value="${product.prodnum}" readonly />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prodname" value="${product.prodname}" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="price" value="${product.price}"/>
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prod_color" value="${product.prod_color}" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prodcnt" value="${product.prodcnt}" />
							</div>
							<!-- 상품 크기 -->
						<div class="col-12">
								<h4>상품 크기</h4>
								<select name="prodsize">
									<option>- 상품 크기 -</option>
									<option>S</option>
									<option>M</option>
									<option>L</option>
									<option>XL</option>
								</select>
							</div>
						<div class="col-12">
								<h4>상품 분류1</h4>
								<select name="classify">
									<option>- 상품 분류 -</option>
									<option>일반 상품</option>
									<option>업사이클링 상품</option>
								</select>
								</div>
						<div class="col-12">
								<h4>상품 분류2</h4>
								<select name="classify_prod">
									<option>- 상품 분류 -</option>
									<option>의류</option>
									<option>가방</option>
									<option>악세서리</option>
									<option>신발</option>
								</select>
							</div>
							<!-- 브랜드  -->
								<div class="col-12">
								<h4>브랜드</h4>
								<select name="brand">
									<option>- 상품 브랜드 -</option>
									<option>vans</option>
									<option>nike</option>
									<option>adidas</option>
									<option>gucci</option>
									<option>prada</option>
									<option>Dr.Martin</option>
									<option>tommy hilfiger</option>
									<option>samsonite</option>
									<option>ralph lauren</option>
									<option>tory burch</option>
									<option>rag & bone</option>
									<option>그 외</option>
								</select>
							</div>
							<!-- 상품 상태 -->
						<div class="col-12">
								<h4>상품 상태</h4>
								<select name="prodstate">
									<option>- 상품 상태 -</option>
									<option>S</option>
									<option>A</option>
									<option>B</option>
								</select>
							</div>
							<!-- 추천 연령대 -->
						<div class="col-12">
								<h4>추천 연령대</h4>
								<select name="sug_age">
									<option>- 추천 연령대 -</option>
									<option>10대</option>
									<option>20대</option>
									<option>30대</option>
									<option>40대</option>
								</select>
							</div>
							<!--상품 설명  -->
							<div class="col-12">
								<textarea name="prodexplain" rows="6">${product.prodexplain}</textarea>
							</div>
							<div>
							<c:choose>
					<c:when test="${files != null and fn:length(files)>0}">
						<c:forEach var="i" begin="0" end="1">
							<tr>
								<th>첨부파일${i+1}</th>
								<td>
									<c:choose>
										<c:when test="${i<fn:length(files)}">
											<p class="filename" name="filename${i+1}" id="file${i+1}">${files[i].orgname}</p>
											<input type="hidden" name="filename" value="${files[i].orgname}">	
											<a class="primary" href="${pageContext.request.contextPath}/admin/FileDelete.pd?prodnum=${product.prodnum}">파일 삭제
											</a>
											
											
 										</c:when>
										<c:otherwise>
											<p class="filename" name="filename${i+1}" id="file${i+1}"></p>
											<input type="hidden" name="filename">								
										</c:otherwise>									
									</c:choose>		
									<label class="flabel" for="fileInput${i+1}">첨부하기</label>
									<input class="finput" name="file${i+1}" id="fileInput${i+1}" type="file">
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
				</div>
							<div class="col-12">
								<ul class="actions">
									<li>
									<a href="javascript:sendit()" class="button primary">
									상품 수정하기
										</a>
										</li>
										<li>
									<a href="${pageContext.request.contextPath}/admin/ProductList.pd" class="button">목록</a>
									</li>
								</ul>
							</div>
						</div>
					</form>
				</section>
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
	function sendit(){
		document.productForm.submit()
		alert("상품이 수정되었습니다");
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