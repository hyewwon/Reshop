<!-- 윤건 : 게시글 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
table {
	margin: 0 auto !important;
	width: 900px !important;
	}

th {
	background-color: #d7ebc2 !important;
	}
	a{
		border-bottom:none !important;
	}
	a:visited {
		text-decoration: none !important;
	}
	a:link {
		text-decoration: none !important;
	}
	a:hover {
		font-weight:bold !important;
	}
</style>
</head>
<body>
<c:import url="../../header.jsp" charEncoding="UTF-8"></c:import>

 	<c:if test="${login_id == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:choose>
		<c:when test="${not empty param.update}">
			<script>alert("댓글 수정 실패!")</script>
		</c:when>
		<c:when test="${not empty param.delete }">
			<script>alert("댓글 삭제 실패!")</script>
		</c:when>
	</c:choose>
		<div>
		<table style="border: 0px; width: 900px;">
			<tr>
				<td align="right">
					<a style="font-weight: bold; color: blue;"> ${login_id}</a> <a>님 환영합니다.</a>&nbsp;&nbsp;
				<!-- 	<a class="button primary small" href="${pageContext.request.contextPath}/user/UserLogoutOk.us">로그아웃</a> -->
				</td>
			</tr>
		</table>
		<br> <br>
		<table style="width: 900px; border: 0px;">
			<tr align="center" valign="middle">
				<td><h3 style="font-size:30px;  font-weight: bold;">공지 사항</h3></td>
			</tr>
		</table>
		<c:set var="notice" value="${requestScope.notice}"/>
		<c:set var="files" value="${requestScope.files}"/>
		<!-- 게시글 보여주는 인풋들 배치 테이블 -->
		<table border="1" style="border-collapse: collapse;">
			<tr height="30px">
				<th width="150px" style="text-align: center; font-weight: bold;">제 목</th>
				<td><input name="notice_title" value="${notice.notice_title}" size="50" maxlength="100" readonly>
				</td>
			</tr>
			<tr height="30px">
				<th width="150px" style="text-align: center; font-weight: bold;">글쓴이</th>
				<td><input name="userid" size="10" maxlength="20" value="${notice.userid}"
					readonly></td>
			</tr>
			<tr height="300px">
				<th width="150px" style="text-align: center; font-weight: bold;">내 용</th>
				<td><textarea name="notice_contents"
						style="width: 700px; height: 250px; resize: none;" readonly>${notice.notice_contents} </textarea>
				</td>
			</tr>

			<c:choose>
				<c:when test="${files != null and fn:length(files)!=0}">
					<!-- for(int i=0;i<=0;i++) -->
					<c:forEach var="i" begin="0" end="${fn:length(files)-1}">
						<tr>
							<th width="150px" style="text-align: center; font-weight: bold;">첨부파일${i+1}</th>
							<td>
								&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/board/FileDownload.bo?
								filename=${files[i].systemname}&orgname=${files[i].orgname}">
									${files[i].orgname}
								</a>
						<img alt="XX" src="<c:url value='/app/file/${files[i].systemname}'/>"/>				
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
		</table>
		<form name="deleteForm" action="${pageContext.request.contextPath}/board/NoticeDeleteOk.bo">
			<input type="hidden" value="${notice.notice_num}" name="notice_num">
		</form>
		<table style="border: 0px;">
			<tr align="right" valign="middle">
				<td>
					<c:if test="${notice.userid == sessionScope.login_id}">
						<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeModify.bo?notice_num=${notice.notice_num}">수정</a>
						&nbsp;&nbsp;<a class="button primary small" href="javascript:document.deleteForm.submit()">삭제</a>
					</c:if>
					<a class="button primary small" href="${pageContext.request.contextPath}/board/NoticeList.bo">목록</a>
				</td>
			</tr>
		</table>
		<form name="replyForm" method="post" action="${pageContext.request.contextPath}/board/ReplyWriteOk.bo">
			<input type="hidden" value="${notice.notice_num}" name="notice_num">
			<table>
				<tr height="200px">
					<td width="80px" style="text-align: center; font-weight: bold;">댓 글</td>
					<td>
						<textarea name="re_contents" style="width:700px;height:50px;resize:none;"></textarea>
						</td>
					<td align="right">
						<a class="button primary small" href="javascript:document.replyForm.submit();">등록</a>
					</td>
				</tr>
			</table>
		</form>
		<form name="updateForm" action="${pageContext.request.contextPath }/board/ReplyModifyOk.bo" method="post">
			<input type="hidden" name="notice_num" value="${notice.notice_num}">
			<table>
				<c:choose>
					<c:when test="${replys != null and fn:length(replys)>0}">
						<c:set var="i" value="0"/>
						<c:forEach items="${replys}" var="reply">
							<c:set var="i" value="${i+1}"/>
							<tr style="width:900px;">
								<td align="center" width="80px" style="font-weight: bold;">${reply.userid}</td>
								<td valign="top" align="center" >
									<textarea name="reply${i}" id="reply${i}" rows="3" style="resize:none; width:650px;" readonly>${reply.re_contents}</textarea>
								</td>
								<td>
									<c:if test="${reply.userid == sessionScope.login_id }">
										<a class="button primary small" id="ready${i}" href="javascript:updateReply(${i});">수정</a>
										<a class="button primary small" id="ok${i}" style="display:none;" href="javascript:updateOk(${reply.replynum},${i})">수정완료</a>&nbsp;&nbsp;
										<a class="button primary small" href="${pageContext.request.contextPath}/board/ReplyDeleteOk.bo?replynum=${reply.replynum}&notice_num=${notice.notice_num}">삭제</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center">댓글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
	</div>
		<!--  -->
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
<script>
	function updateReply(num){
		let udBtn = document.getElementById("ready"+num);
		let okBtn = document.getElementById("ok"+num);
		let replyTag = document.getElementById("reply"+num);
		
		udBtn.style.display="none";
		okBtn.style.display="";
		replyTag.removeAttribute("readonly");
	}
	function updateOk(replynum, num){
		let udBtn = document.getElementById("ready"+num);
		let okBtn = document.getElementById("ok"+num);
		let replyTag = document.getElementById("reply"+num);
		
		udBtn.style.display="";
		okBtn.style.display="none";
		replyTag.setAttribute("readonly","readonly");
		
		//localhost:9090/board/ReplyModifyOk.bo?replynum=101&num=3&boardnum=100012
		document.updateForm.setAttribute("action","${pageContext.request.contextPath}"
						+"/board/ReplyModifyOk.bo?replynum="+replynum+"&num="+num);
		document.updateForm.submit();
	}
</script>
</html>











