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
	<title>회원관리</title> 
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
 	
 	function confirmDelete(member_Id) {
        if (confirm("정말로 이 회원을 삭제하시겠습니까?")) {
            document.forms['del' + member_Id].submit();
        }
    }
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
					<h4><b>회원관리</b></h4>
					<hr style="border: 1px solid black;">
						<div class="bestseller-tab">
							<div class="flex-w h-full">
								<a href="adminMember.do?sort=all" class="flex-c-m trans-04 all">전체 회원 목록</a>
								<a href="adminMember.do?sort=active" class="flex-c-m trans-04 active">활동 회원 목록</a>
								<a href="adminMember.do?sort=inactive" class="flex-c-m trans-04 inactive">탈퇴 회원 목록</a>
							</div>
						</div>
					<!-- 내역 테이블 -->
					<div class="orderlist">
						<table>
							<thead>
								<tr>
									<th style="width:20%">아이디</th>
									<th style="width:10%">이름</th>
									<th style="width:15%">가입일</th>
									<th style="width:20%">보유 포인트</th>
									<th style="width:10%">등급</th>
									<th style="width:10%">상태</th>
									<th style="width:15%">조회/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allMemList}" var="mem">
									<form action="adminDetail.do" name="udt${mem.member_id}" method="post">
										<input type="hidden" name="member_id" value="${mem.member_id}">
									</form>
									<form action="deleteMember.do" name="del${mem.member_id}" method="post">
	                                    <input type="hidden" name="member_id" value="${mem.member_id}">
	                                 </form>
									<tr>
										<td>${mem.member_id}</td>
										<td>${mem.member_name}</td>
										<td>${mem.reg_date}</td>
										<td><fmt:formatNumber value="${mem.member_point}" pattern="###,###포인트" /></td>
										<c:if test="${mem.grade_name eq 'Inactive'}">
											<td style="color:red;font-weight:bold">${mem.grade_name}</td>
											<td style="color:red;font-weight:bold">${mem.state}</td>
										</c:if>
										<c:if test="${mem.grade_name ne 'Inactive'}">
											<td>${mem.grade_name}</td>
											<td>${mem.state}</td>
										</c:if>
										<td style="display:flex;justify-content: space-around;">
											<a class="btn" href="javascript:void(0);" onclick="document.forms['udt${mem.member_id}'].submit();">조회</a>
											<a class="btn" href="javascript:void(0);" onclick="confirmDelete('${mem.member_id}')">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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