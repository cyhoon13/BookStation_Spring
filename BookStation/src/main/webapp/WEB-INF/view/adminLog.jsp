<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
	<link rel="stylesheet" type="text/css" href="css/AllOrderList.css">
	<link rel="stylesheet" type="text/css" href="css/bookList.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<title>BookStation</title> 
	<style type="text/css">
		.btn {
		    float: left;
		    background-color: white; /* 배경색을 흰색으로 설정 */
		    color: #285a35; /* 글자색을 초록색으로 설정 */
		    border: 1px solid #285a35; /* 테두리를 초록색으로 설정 */
		    padding: 5px 15px; /* 안쪽 여백 설정 */
		    text-align: center; /* 가운데 정렬 */
		    text-decoration: none; /* 밑줄 없음 */
		    font-size: 12px; /* 글꼴 크기 */
		    margin: 4px 2px; /* 바깥쪽 여백 설정 */
		    cursor: pointer; /* 커서 포인터로 변경 */
		    border-radius: 5px; /* 모서리 둥글게 */
		}
		.btn:hover {
		    background-color: #45a049; /* 호버 시 배경색 변경 */
		    color: white; /* 호버 시 글자색 변경 */
		    border: 1px solid #285a35; /* 호버 시 테두리 색 변경 */
		}
		a.active-menu{
			font-weight:800;
			color: #6c7ae0;
			background-color: #eeeeee;
			border-radius:10px 10px 0px 0px;
			border-bottom:none;
		}
		.bestseller-tab a:hover {
			background-color: #eeeeee;
			border-radius: 10px;
		}
		.admin-con {
			max-width:1500px;
			margin:0 auto;
			padding: 0 15px;
		}
		
	</style>
	<%String sort = request.getParameter("sort");%>
	<script>
 	$(function(){
 		$('a.<%=sort%>').addClass('active-menu')
 	});
	</script>
</head>
<body class="animsition">
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	
	<!-- breadcrumb -->
	<div class="admin-con">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			
			<a href="adminMember.do?sort=all" class="stext-109 cl8 hov-cl1 trans-04">
				관리자 페이지
			</a>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-16 p-b-20">
		<div class="admin-con">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-9 col-lg-10 p-b-80 p-t-55 order-md-3" style="padding-left: 15px; padding-fight: 15px">
					<h4><b>로그관리</b></h4>
					<hr style="border: 1px solid black;">
						<div class="bestseller-tab">
							<div class="flex-w h-full">
								<a href="adminLog.do?sort=access" class="flex-c-m trans-04 access">회원 접속 로그</a>
								<a href="adminLog.do?sort=pageMove" class="flex-c-m trans-04 pageMove">화면 이동 로그</a>
								<a href="adminLog.do?sort=dataChange" class="flex-c-m trans-04 dataChange">데이터 변경 로그</a>
							</div>
						</div>
					<!-- 내역 테이블 - 회원 접속, 이동, 변경에 따라 테이블 형태 다름 -->
					<div class="orderlist">
						<c:if test="${sort eq 'access'}">
							<table style="width:100%">
								<thead>
									<tr>
										<th style="width:5%">순번</th>
										<th style="width:27%">로그ID</th>
										<th style="width:10%">일자</th>
										<th style="width:10%">시간</th>
										<th style="width:8%">구분</th>
										<th style="width:10%">사용자ID</th>
										<th style="width:10%">성공여부</th>
										<th style="width:20%">실패원인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${logTryList}" var="log">
										<tr>
											<td>${log.rnum}</td>
											<td>${log.logID}</td>
											<td><fmt:formatDate value="${log.logTime}" pattern="yy-MM-dd" /></td>
											<td><fmt:formatDate value="${log.logTime}" pattern="HH:mm:ss" /></td>
											<td>${log.logTry}</td>
											<td>${log.member_id}</td>
											<td>${log.logSeccess}</td>
											<td>${log.logFail}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<c:if test="${sort eq 'pageMove'}">
							<table>
								<thead>
									<tr>
										<th style="width:5%">순번</th>
										<th style="width:30%">로그ID</th>
										<th style="width:10%">일자</th>
										<th style="width:10%">시간</th>
										<th style="width:15%">사용자ID</th>
										<th style="width:15%">화면ID</th>
										<th style="width:15%">화면이름</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageMoveList}" var="log">
										<tr>
											<td>${log.rnum}</td>
											<td>${log.logID}</td>
											<td><fmt:formatDate value="${log.logTime}" pattern="yy-MM-dd" /></td>
											<td><fmt:formatDate value="${log.logTime}" pattern="HH:mm:ss" /></td>
											<td>${log.member_id}</td>
											<td>${log.pageJsp}</td>
											<td>${log.pageName}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
						<!--  style="width:100%;overflow:auto;" -->
						<c:if test="${sort eq 'dataChange'}">
							<table>
								<thead>
									<tr>
										<th style="width:5%">순번</th>
										<th style="width:15%">로그ID</th>
										<th style="width:10%">일자</th>
										<th style="width:8%">시간</th>
										<th style="width:10%">변경자ID</th>
										<th style="width:13%">테이블/속성</th>
										<th style="width:10%">화면ID</th>
										<th style="width:7%">변경구분</th>
										<th style="width:22%">변경내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dataChangeList}" var="log">
										<tr>
											<td>${log.rnum}</td>
											<td>${log.logID}</td>
											<td><fmt:formatDate value="${log.logTime}" pattern="yy-MM-dd" /></td>
											<td><fmt:formatDate value="${log.logTime}" pattern="HH:mm:ss" /></td>
											<td>${log.member_id}</td>
											<td>${log.targetTable}<br>${log.targetColumn}</td>
											<td>${log.pageJsp}</td>
											<td>${log.chngCode}</td>
											<td>${log.chngValue}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>

					<!-- 페이징처리 -->
					<div class="flex-c-m flex-w w-full p-t-38">
						${pagingHtml}
					</div>
				</div>
				<!-- 본문 수정 -->
			
				<!-- 사이드바 수정 -->
				<jsp:include page="adminSidebar.jsp" flush="false" />
				<!-- 사이드바 -->
			</div>
		</div>
	</section>
	
	<jsp:include page="bottom.jsp" flush="false"/>
	
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>