<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
	<c:set var="product" value="${requestScope.product}" />
	<div id="wrapper">
		<section id="main" class="wrapper style1">
			<div class="inner">
				<section>
					<h3>${product.prodnum}</h3>
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="prodname" value="${product.prodname}"
								readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="price" value="${product.price}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="prod_color"
								value="${product.prod_color}" readonly />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="prodcnt" value="${product.prodcnt}"
								readonly />
						</div>
						<!-- 상품 크기 -->
						<div class="col-12">
							<h4>상품 크기</h4>
							<select name="prodsize">
								<option>${product.prodsize}</option>
							</select>
						</div>
						<div class="col-12">
							<h4>상품 분류1</h4>
							<select name="classify">
								<option>${product.classify}</option>
							</select>
						</div>
						<div class="col-12">
							<h4>상품 분류2</h4>
							<select name="classify_prod">
								<option>${product.classify_prod}</option>
							</select>
						</div>
						<!-- 브랜드  -->
						<div class="col-12">
							<h4>브랜드</h4>
							<select name="brand">
								<option>${product.brand}</option>
							</select>
						</div>
						<!-- 상품 상태 -->
						<div class="col-12">
							<h4>상품 상태</h4>
							<select name="prodstate">
								<option>${product.prodstate}</option>
							</select>
						</div>
						<div class="col-12">
							<h4>추천 연령대</h4>
							<select name="sug_age">
								<option>${product.sug_age}</option>
							</select>
						</div>
						<!--상품 설명  -->
						<div class="col-12">
							<textarea name="prodexplain" rows="6" readonly>${product.prodexplain}</textarea>
						</div>
						<p></p>

						<c:choose>
							<c:when test="${files != null and fn:length(files)!=0}">
								<!-- for(int i=0;i<=0;i++) -->
								<c:forEach var="i" begin="0" end="${fn:length(files)-1}">
									<tr>
										<th>첨부파일${i+1}</th>
										<td>&nbsp;&nbsp; <a
											href="${pageContext.request.contextPath}/admin/FileDownload.pd?
								filename=${files[i].systemname}&orgname=${files[i].orgname}">
												${files[i].orgname} </a>
										</td>
									</tr>
									<img alt="XX"
										src="<c:url value='/app/file/${files[i].systemname}'/>"/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="2">첨부 파일이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>



						<div class="col-12">
							<ul class="actions">
								<li><a
									href="${pageContext.request.contextPath}/admin/ProductModify.pd?prodnum=${product.prodnum}">
										<input type="submit" value="상품 수정하기" class="primary" />
								</a></li>

								<li><a
									href="${pageContext.request.contextPath}/admin/ProductDeleteOk.pd?prodnum=${product.prodnum}">
										<input type="submit" value="상품 삭제하기" class="primary" />

								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/admin/ProductList.pd">
										<input type="reset" value="목록" />
								</a></li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</section>
	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>