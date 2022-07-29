<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<div id="wrapper">
	
		<section id="main" class="wrapper style1">
			<div class="inner">
				<section>
					<h3>상품 등록</h3>
					<form name="productForm" method="post" action="${pageContext.request.contextPath}/admin/ProductUpdateOk.pd" enctype="multipart/form-data">
						<div class="row gtr-uniform">
							
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prodname" placeholder="상품 이름" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="price" placeholder="상품 가격" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prod_color" placeholder="상품 색깔" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="prodcnt" placeholder="상품 수량"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
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
								<textarea name="prodexplain"placeholder="상품 설명란" rows="6"></textarea>
							</div>
							<div class="col-12">
								<input type="file" name="file1">
								<input type="button" value="첨부삭제" onclick="cancelFile('file1')">
							</div>
							<div class="col-12">
								<input type="file" name="file2">
								<input type="button" value="첨부삭제" onclick="cancelFile('file2')">
							</div>
							<div class="col-12">
								<ul class="actions">
									<li>
									<a  class = "button primary"
										href ="javascript:sendit()">상품 등록하기</a><!-- onclick ="sendit()" -->
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
	<script src="${pageContext.request.contextPath}/app/product/product.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>

</body>
<script>
	
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