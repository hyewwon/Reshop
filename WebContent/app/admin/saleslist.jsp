<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>reshop 주문 관리</title>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>

<body class="is-preload">
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
	
   <c:if test="${param.db==false}">
         <script>alert("DB 오류!")</script>
   </c:if>
   <c:choose>
      <c:when test="${param.deliver==true}">
         <script>alert("배송 확정 성공!")</script>
      </c:when>
      <c:when test="${param.deliver==false}">
         <script>alert("배송 확정 실패!")</script>
      </c:when>
   </c:choose>

<%--    <c:if test="${login_id == null}">
      <script>
         alert("관리자 로그인 필요");
         location.replace("${pageContext.request.contextPath}/app/admin/home.jsp");
      </script>
   </c:if>
   <c:if test="${login_id != admin}">
      <script>
         alert("관리자만 이용할 수 있습니다!");
         location.replace("${pageContext.request.contextPath}/app/admin/home.jsp");
      </script>
   </c:if> --%>

   <!-- BoardListAction.java 에서 보내주는 데이터들로 변수 만들기 -->
   <c:set var="orderList" value="${requestScope.OrderList}" />
   <c:set var="page" value="${requestScope.page }" />
   <c:set var="startPage" value="${requestScope.startPage }" />
   <c:set var="endPage" value="${requestScope.endPage }" />
   <c:set var="totalCnt" value="${requestScope.totalCnt }" />
   <c:set var="totalPage" value="${requestScope.totalPage }"/>
   <c:set var="totalSales" value="${requestScope.totalSales }"/>

   <div id="wrapper">
      <section id="main" class="wrapper style1">
         <div class="inner">
            <header class="major">
               <h1>
                  <b>매출 관리</b>
               </h1>
               <p></p>
            </header>
            
           		 <h2 style="text-align:center; color:blue;">누적 매출 </h2>	
            			<h1 style="text-align:center">
            			<script>
							function addComma(num) {
									var regexp = /\B(?=(\d{3})+(?!\d))/g;
									return num.toString().replace(regexp, ',');
									}
								var price = '<c:out value="${totalSales}"/>';
								document.write(addComma(price)+'원');
						</script>
            			</h1>  		
         </div>
         <div style="margin:5%">
         
        <form name="DateForm" method="post" action="${pageContext.request.contextPath}/admin/DateSearch.ad">	
         <div class="table-wrapper">
            <table class="alt" style="text-align: center;">
               <thead>
          			<tr align="center" valign="middle" >
						<td><input type="text" placeholder="년(4자 )"
							aria-label="년(4자)" maxlength="4" name="startyear"></td>
						<td><select label="월" name="startmonth">
								<option>월</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select></td>
						<td><input type="text" placeholder="일" aria-label="일"
							maxlength="2" name="startday"></td>

						<td><input type="text" placeholder="년(4자 )"
							aria-label="년(4자)" maxlength="4" name="finishyear"></td>
						<td><select label="월" name="finishmonth">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select></td>
						<td>
							<input type="text" placeholder="일" aria-label="일" maxlength="2" name="finishday">
						</td>
						<td><input type="submit" value="선택"></td>
					</tr>  			
         	</form>
          		
                  <tr>
                     <th style="text-align: center" colspan="2">주문일자</th>
                     <th style="text-align: center">주문번호</th>
                     <th style="text-align: center">상품이름</th>
                     <th style="text-align: center">유저 아이디</th>
                     <th style="text-align: center" colspan="2">매출</th>
                 </tr>
               </thead>
               <tbody>
                  <c:choose>
                     <c:when test="${orderList != null and fn:length(orderList)>0 }">
                        <!-- 보여줄 게시글 목록이 있음 -->
                        <!-- for(BoardDTO board : boardList) -->
                        <c:forEach items="${orderList}" var="order">
                           <tr onmouseover="this.style.background='#ffebee'"
                              onmouseout="this.style.background=''" >
                              <td colspan="2">${order.orderdate}</td>
                              <td>${order.ordernum}</td>
                              <td>${order.prodname}</td>
                              <td>${order.userid}</td>
                              <td colspan="2">
                              	<script>
								function addComma(num) {
									var regexp = /\B(?=(\d{3})+(?!\d))/g;
									return num.toString().replace(regexp, ',');
									}
								var price = '<c:out value="${order.price}"/>';
								document.write(addComma(price)+'원');
								</script>
							</td>
                           </tr>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <!-- 보여줄 게시글 목록이 없음 -->
                        <tr><td colspan="8">주문 목록이 없습니다.</td></tr>
                     </c:otherwise>
                  </c:choose>
               </tbody>
               <!-- <tfoot>
                  <tr>
                     <td colspan="6"></td>
                     <td>100.00</td>
                  </tr>
               </tfoot> -->
            </table>
            <br>
            <!-- 페이징 처리하는 테이블 -->
            <table style="border: 10%; width: 100%">
               <tr align="center" valign="middle">
                  <td><c:if test="${page>1}">
                        <a
                           href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${page-1}">[ &lt; ]</a>
                     </c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
                        var="i">
                        <c:choose>
                           <c:when test="${page == i}"><b style="color:blue;">[ ${i} ]</b></c:when>
                           <c:otherwise>
                              <a
                                 href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${i}">[ ${i} ]</a>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach> <c:if test="${page<totalPage}">
                        <a
                           href="${pageContext.request.contextPath}/admin/ManageOrder.ad?page=${page+1}">[ &gt; ]</a>
                     </c:if></td>
               </tr>
            </table>
         </div>
      </div>
      </section>
   </div>
         <script type="text/javascript">
      window.history.forward();
      function noBack() {
         window.history.forward();
      }
         </script>

   <script   src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script   src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>