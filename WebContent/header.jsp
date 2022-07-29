<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>헤더영역</title>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mainfont.css" />
		<style>
			a{
				border-bottom: none; 
			}
			
			li{
				list-style: none;
			}
			#top1{
				border-top: solid 2px black;
			    background: var(--color-white);
			    top:0;
			    width: 100%;
			    display: flex;
			    flex-direction: column;
			    align-items: center;
			}
			#menu1{
				width: 100%;
				height: 50px;
				background: #f6f5ef;
				overflow: static;
			}
			#menu1 ul{
				margin: 0 auto;
				overflow: static;
			
				
			}
			#menu1>ul>li{
				float: right; /*왼쪽부터 가로 정렬 */
				width: 10%; /*li항목 개수만큼 등분 */
				heigth: 50px;
				line-height: 50px;
				text-align: center;
				position:relative;
			}
			/* #menu1 #ul2 li{
				float: right; 왼쪽부터 가로 정렬 
				width: 10%; li항목 개수만큼 등분 
				heigth: 50px;
				line-height: 50px;
				text-align: center;
			} */
			#menu1 ul li a {
				display: block;
			}
			#menu1 ul li a:hover{
				backgorund: #138535;
				color: #fff;
			}
			#menu1 .sub li a{
				background: #7A297B;
			}
			
			#menu1 img{
		    position: absolute;
		    top:-20px;
		    width:150px;
		    height:150px;
		}
		#menu1 .main1 .main2{
			z-index:100 !important; 	
				top: 50px;
				width: 100%;
				left: -9999px;
    			display: none;
		}
		#menu1 .main1 li:hover .main2 {
			display: block;
		}
		#menu1 .main1 li:hover {
			background-color: #B6B08C;
		}
		#menu1 .main1>li>div{
			background-color: #B6B08C;
			opacity: 1;
		    z-index: 10000;
 		   position: inherit;
 		   
		}
		.main2>li{
			text-align: left;
			text-decoration:none;
		}
		
		/*
		#menu1 .main1>a:hover .main2{
			display: block;
		}*/
		
		</style>	



</head>
<body>

<header id="top1">
						<div id="menu1">
							<ul class="main1">
							<li><a href="#">My page</a>
									<div>
										<ul class="main2">
											<li><a href="${pageContext.request.contextPath}/user/MyProfile.us?userid=${login_id}">내 프로필</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/SalesInfoList.ad?userid=${login_id}">나의 판매 내역</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ShoppingInfoList.ad?userid=${login_id}">나의 쇼핑 내역</a></li>
										</ul>
									</div>
									
									<li><a href="#">Board</a>
									<div>
										<ul class="main2">
											<li><a href="${pageContext.request.contextPath}/board/NoticeList.bo">공지사항</a></li>
											<li><a href="${pageContext.request.contextPath}/board/QuestList.qu">고객문의</a></li>
										</ul>
									</div>
								</li>
									
									<li><a href="${pageContext.request.contextPath}/admin/ProductCart.pd">Shopping cart</a></li>
							
								<c:choose>
									<c:when test="${login_id==null}">
										<li><a href="${pageContext.request.contextPath}/app/user/loginview.jsp">Login</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/user/UserLogoutOk.us">Logout</a></li>
									</c:otherwise>
								</c:choose>
										
										
										
										
										
										
										
							</ul>
						</div>
						<div id="menu1">
						<a href="${pageContext.request.contextPath}/index.jsp"><img class="head-logo" src="${pageContext.request.contextPath}/images/logo3.png"></a>
							<ul class="main1">

							
								</li>
								<c:if test="${login_id == 'admin'}">
								<li><a href="#">Administrator</a>
									<div><!-- 여기부터 -->
										<ul class="main2">
											<li><a href="${pageContext.request.contextPath}/user/ManageUser.us">고객정보관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ProductList.pd">상품관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/SalesOrder.ad">매출관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ManageOrder.ad">주문관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ManageDeliver.ad">배송관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ManageRefund.ad">환불관리</a></li>
											<li><a href="${pageContext.request.contextPath}/admin/ManageDonaSell.ad">매입/기부관리</a></li>
										</ul>
									</div><!-- 여기까지  드롭다운 리스트단입니다. -->
									</li>
									</c:if>
								<li><a href="#">Application</a>
									<div>
										<ul class="main2">
											<li><a href="${pageContext.request.contextPath}/app/user/sellordonateview.jsp">기부 신청</a></li>
											<li><a href="${pageContext.request.contextPath}/app/user/sellordonateview.jsp">판매 신청</a></li>
											
										</ul>
									</div>
								</li>									
													
								<li><a href="${pageContext.request.contextPath}/app/order/shopintro.jsp">Shop</a></li>
								</li>
									
								</li>
								<%-- </c:if> --%>
							</ul>
						</div>
					</header>
					
					
					
					
					

</body>
</html>