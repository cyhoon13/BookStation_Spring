<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.domain.*, java.util.List, java.util.ArrayList" %>
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
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<title>BookStation</title> 
	<style type="text/css">
		.btn {
		    background-color: white; /* 배경색을 흰색으로 설정 */
		    color: #285a35; /* 글자색을 초록색으로 설정 */
		    border: 1px solid #285a35; /* 테두리를 초록색으로 설정 */
		    padding: 5px 20px; /* 안쪽 여백 설정 */
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
		
		.detail-title{
			margin-top:10px;
			border-radius: 10px;
			border: 1px solid #e9ecef;
			background:#F0F0F0;
		}
		.orderlist th, .orderlist td {
	  		border: 1px solid #ddd;
	  		text-align: center;
		}
	</style>
</head>
<body class="animsition">
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			
			<a href="mypage.do" class="stext-109 cl8 hov-cl1 trans-04">
				마이페이지
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			
			<a href="AllOrderList.do" class="stext-109 cl8 hov-cl1 trans-04">
				주문/배송 조회
			</a>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-16 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 p-t-55 order-md-2" style="padding-left: 15px; padding-fight: 15px">
					<h4><b>상세 주문내역</b></h4>
					<hr style="border: 1px solid black;">
					<div class="p-tb-10 p-lr-10 detail-title">
					주문일 : <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /> | 
					주문 번호 : ${order_id}</div>
					<!-- 상품 정보 -->
					<div class="table-responsive orderlist">
						<h5 class="green-text p-tb-10 p-l-5">상품 정보</h5>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th colspan="2">상품명</th>
									<th>수량</th>
									<th>가격</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ordersPrintList}" var="oplist">
									<tr>
										<td style="border-right:1px solid #ffffff">
											<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${oplist.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'" style="max-height:80px">
										</td>
										<td class="p-l-10" style="text-align:left;vertical-align:middle">
											${oplist.book_name}
										</td>
										<td style="vertical-align:middle">${oplist.ordersPrint_count} 권</td>
										<td style="vertical-align:middle"><fmt:formatNumber value="${oplist.ordersPrint_price * (100-oplist.book_discount)/100 * oplist.ordersPrint_count}" pattern="###,###원"/></td>
										<td style="vertical-align:middle">${oplist.ordersPrint_state}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 결제 정보 -->
					<div class="table-responsive orderlist">
						<h5 class="green-text p-tb-10 p-l-5">결제 정보</h5>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>주문금액</th>
									<th>사용 포인트</th>
									<th>적립 포인트</th>
									<th>총 결제 금액</th>
									<th>결제수단/은행</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><fmt:formatNumber value="${allCost}" pattern="###,###원"/></td>
									<td><fmt:formatNumber value="${order.usePoint}" pattern="###,###pt"/></td>
									<td><fmt:formatNumber value="${order.savePoint}" pattern="###,###pt"/></td>
									<td><fmt:formatNumber value="${order.totalPrice}" pattern="###,###원"/></td>
									<td>${order.payOption1}/
										<c:if test='${order.payOption1 eq "무통장입금"}'>
											${order.payOption3}
										</c:if>
										<c:if test='${order.payOption1 eq "카드결제"}'>
											${order.payOption2}
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- 배송 정보 -->
					<div class="table-responsive orderlist">
						<h5 class="green-text p-tb-10 p-l-5">배송 정보</h5>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="background:#F0F0F0">수령인</th>
									<td>${shipping.shipping_name}</td>
									<th style="background:#F0F0F0">연락처</th>
									<td>${shipping.shipping_phone}</td>
									<th style="background:#F0F0F0">택배방법</th>
									<td>${shipping.shippingOption1}</td>
								</tr>
								<tr>
									<th style="background:#F0F0F0">주소</th>
									<td colspan="5" style="text-align:left">(${shipping.shippingAddr1}) ${shipping.shippingAddr2} ${shipping.shippingAddr3}</td>
								</tr>
								<tr>
									<th style="background:#F0F0F0">요청사항</th>
									<td colspan="5" style="text-align:left">${shipping.shippingOption2}</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div style="text-align:center">
						<a href="AllOrderList.do" class="btn type01">확인</a>
					
					</div>
				</div>
				<!-- 본문 수정 -->
			
				<!-- 사이드바 수정 -->
				<jsp:include page="sidebar.jsp" flush="false" />
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