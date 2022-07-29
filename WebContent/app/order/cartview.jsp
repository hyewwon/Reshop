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
		<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
		<c:set var="soldOutList" value="${requestScope.soldOutList}" />
		<c:set var="outStockList" value="${requestScope.outStockList}" />
		<c:if test="${not empty soldOutList}">
			<c:set var="notice"/>
			<c:forEach items="${soldOutList}" var="soldOut">
				<c:set var="notice" value="${soldOut.prodname}"/>
				<script>
					alert("'${notice}' 상품이 품절되었습니다.");
				</script>
			</c:forEach>
			<script>
				alert("상품 취소를 실패하였습니다.");
			</script>
		</c:if>
		<c:if test="${not empty outStockList}">
			<c:set var="notice2"/>
			<c:forEach items="${outStockList}" var="outStock">
				<c:set var="notice2" value="${outStock.prodname}"/>
				<script>
					alert("'${notice2}' 상품 재고가 부족합니다.");
				</script>
			</c:forEach>
		</c:if>
		<c:if test="${not empty cartDelete}">
			<script>
				alert("상품 취소를 실패하였습니다.");
			</script>
		</c:if>

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
	  <h2>장바구니</h2>
	  	<c:choose>	
	  		<c:when test="${productInfoList != null and fn:length(productInfoList)>0}"> 	
				<table>
					<caption>장바구니에 담긴 제품</caption>
				    	<tr>
				     		<th >주문번호</th>
				     		<th>상품이름</th>
				      		<th>상품</th>
				     		<th>가격(원)</th>
				   		  	<th>수량</th>
				     		<th>취소</th>
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
					      		<td class="prodinfo"> ${cartList[count].prodcnt}</td>
					      		<td class="prodinfo"> 
					      			<a href="${pageContext.request.contextPath}/admin/ProductCartDeleteOk.pd?ordernum=${cartList[count].ordernum}"
					      			 class="button primary">취소</a>
					      		</td>
					    	</tr>
						</c:forEach>
				   		<tr>
				     		<td colspan="7" style="text-align: right;"> <strong>총계 : ${totalAmount}원</strong> </td>
				    	</tr>
				  </table>
				  <a href="${pageContext.request.contextPath}/admin/ProductOrder.pd" class="button fit">주문하기</a>	
			 	</c:when>
			  	<c:otherwise>
					<p style="text-align: center;">장바구니가 비어있습니다!</p>
				</c:otherwise>
	 	 </c:choose>
	 	 	
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
</html>






</body>
</html>
