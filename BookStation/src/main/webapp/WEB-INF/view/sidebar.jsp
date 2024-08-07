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
</head>
<body class="animsition">
	<!-- 사이드바 -->
	<div class="col-md-4 col-lg-3 p-b-80">
		<div class="side-menu">
			<!-- 마이페이지 -->
			<div class="p-t-55">
				<h4 class="mtext-112 cl2 p-b-33">
					<a href="mypage.do" style="color: inherit;">My Page</a>
				</h4>
				<ul>
					<!-- 회원정보 -->
					<c:choose>
					<c:when test="${empty sessionScope.loginMember }">
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							로그인이 필요한 서비스입니다
						</span>
					</li>
					</c:when>
					<c:otherwise>
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							${sessionScope.loginMember.member_id }회원님
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="grade.do" class="list-group-item list-group-item-action"> 등급
									<span class="Rtxt">[ ${sessionScope.loginMember.grade_name } &nbsp;<img src="images/icons/${sessionScope.loginMember.grade_name }.png" alt="ICON-PAY" style="width: 20px;">&nbsp;]</span>
								</a>
								<span class="list-group-item list-group-item-action"> 보유포인트
									<span class="Rtxt"><strong class="orange" style="font-size:12px;"><fmt:formatNumber value="${sessionScope.loginMember.member_point }" pattern="#,##0"/> </strong>point</span>
								</span>
							</div>
						</div>
					</li>
					</c:otherwise>
					</c:choose>
					<!-- /회원정보 -->
					<!-- 나의 정보 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							My Info
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="userInfoChange.do" class="list-group-item list-group-item-action"> 개인정보 수정</a>
								<a href="leave.do" class="list-group-item list-group-item-action"> 회원탈퇴</a>
							</div>
						</div>
					</li>
					<!-- /나의 정보 -->
					<!-- 나의 주문 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							My Order
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="AllOrderList.do" class="list-group-item list-group-item-action"> 주문/배송 조회</a>
								<a href="orderReturn.do" class="list-group-item list-group-item-action"> 반품/교환/취소 조회</a>
								<a href="RefundWrite.do" class="list-group-item list-group-item-action"> 반품/교환/취소 신청</a>
							</div>
						</div>
					</li>
					<!-- /나의 주문 -->
					<!-- 나의 리뷰 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							My Review
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="review.do?isReview=0" class="list-group-item list-group-item-action"> 리뷰 내역보기</a>
							</div>
						</div>
					</li>
					<!-- /나의 리뷰 -->
					<!-- 나의 질문 -->
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							My QnA
						</span>
						<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
							<div class="list-group-collapse sub-men">
								<a href="qnaWrite.do" class="list-group-item list-group-item-action"> 1:1 상담접수</a>
								<a href="qna.do" class="list-group-item list-group-item-action"> 1:1 상담내역</a>
							</div>
						</div>
					</li>
					<!-- /나의질문 -->
				</ul>
			</div>
			<!-- /마이페이지 -->
			<!-- 고객센터 -->
			<div class="p-t-55">
				<h4 class="mtext-112 cl2 p-b-33">
					Service
				</h4>
				<ul>
					<li class="bor18">
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							고객상담전화
						</span>
						<a href="customerService.do" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4" style="font-size: 40px;">
							1577-1577
						</a>
						<span class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
							월 ~ 금 09:00 ~ 18:00
						</span>
					</li>
				</ul>
			</div>
			<!-- /고객센터 -->
		</div>
	</div>
	<!-- /사이드바 -->
</body>
</html>