<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
<title>sidebar.jsp</title>
<script>
	$(function(){

	})
</script>
<style>
	.list-group-item{
		font-size:14px;
	}
</style>
</head>
<body class="animsition">
	<!-- 사이드바 -->
	<div class="col-md-3 col-lg-2 p-b-80">
		<div class="side-menu">
			<!-- 관리자 페이지 -->
			<div class="p-t-55">
				<h4 class="mtext-112 cl2 p-b-33">
					<span style="color: inherit;">관리자 페이지</span>
				</h4>
				<ul>
					<!-- 관리 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							관리
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="adminMember.do?sort=all" class="list-group-item list-group-item-action">회원 관리</a>
								<a href="adminLog.do?sort=access" class="list-group-item list-group-item-action">로그 관리</a>
							</div>
						</div>
					</li>
					<!-- /관리 -->
					
					<!-- 거래 관리 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							상품 및 거래
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="#" class="list-group-item list-group-item-action">상품 관리</a>
								<a href="adminOrders.do" class="list-group-item list-group-item-action">거래 내역</a>
							</div>
						</div>
					</li>
					<!-- /거래 관리 -->
					
					<!-- 게시판 관리 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							게시판
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="#" class="list-group-item list-group-item-action">공지사항</a>
								<a href="#" class="list-group-item list-group-item-action">문의내역</a>
							</div>
						</div>
					</li>
					<!-- /게시판 관리 -->
				</ul>
			</div>
			<!-- /관리자 페이지 -->
		</div>
	</div>
	<!-- /사이드바 -->
</body>
</html>