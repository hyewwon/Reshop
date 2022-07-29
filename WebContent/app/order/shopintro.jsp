<!-- 화면 분할 + 버튼 구현-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>reshop 쇼핑하기 intro</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>

<style>


    
    
    </style>
</head>
 
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>
<c:if test="${not empty param.prodcntcheck}">
		<script>
			alert("해당 상품은 품절되었습니다!");
		</script>
	</c:if>
	<c:if test="${true == param.result}">
		<script>
			alert("장바구니 추가성공");
		</script>
	</c:if>
	<c:if test="${false == param.result}">
		<script>
			alert("장바구니 추가실패");
		</script>
	</c:if>
    <div>

        <div class="left">
				                   
			   
			    
               <section class="wrapper style2 special">
                  <div class="inner">
                  
                     <header>
                        <h2>Vintage product</h2>

                     </header>

                     
                     <footer>
                        <ul class="actions special">
                           <li><a href="${pageContext.request.contextPath}/admin/ProductListForUser.pd" class="button">Shop</a></li>
                        </ul>
                     </footer>
                  </div>
               </section>
    
        
        
        </div>
        
        
        <div class="right">
        
			<section class="wrapper style2 special">
                  <div class="inner">
                  
                     <header>
                        <h2>Upcycling product</h2>

                     </header>

                     
                     <footer>
                        <ul class="actions special">
                           <li><a href="${pageContext.request.contextPath}/admin/ProductListForUser2.pd" class="button">Shop</a></li>
                        </ul>
                     </footer>
                  </div>
               </section>        
        
        
        </div>

    </div>
    

    
</body>


</html>