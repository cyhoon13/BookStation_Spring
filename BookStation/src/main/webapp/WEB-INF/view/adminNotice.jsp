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
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<title>BookStation</title> 
	<style type="text/css">
		.title .btn {
		    float: left;
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
			
			<a href="adminPage.do" class="stext-109 cl8 hov-cl1 trans-04">
				관리자 페이지
			</a>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-16 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 p-t-55 order-md-2" style="padding-left: 15px; padding-fight: 15px">
					<h4><b>전체 주문내역</b></h4>
					<hr style="border: 1px solid black;">
					<!-- 기간 필터 -->
					<div class="table-responsive">
						<div class="box gray-box title" style="margin:30px 0">
							<div class="form-container p-b-10 p-lr-10" style="display:table-row;float:left;width:100%">
								<h4 class="p-tb-10" style="display:block">기간별 조회</h4>
								<a href="AllOrderList.do?interval=1" class="btn type01" style="float:left">하루</a>
								<a href="AllOrderList.do?interval=7" class="btn type01" style="float:left">일주일</a>
								<a href="AllOrderList.do?interval=30" class="btn type01" style="float:left">1개월</a>
								<a href="AllOrderList.do?interval=90" class="btn type01" style="float:left">3개월</a>
							</div>
							<!-- 주문별 일자 조회 -->
							<div class="form-container p-t-10 p-lr-10" style="display:table-row;float:left">
								<h4 class="p-tb-10" style="display:block">주문일자별 조회</h4>
								<div>
									<form name="orderDateForm" action="AllOrderList.do" method="get">
										<label for="fromDate" style="display:inline">From:</label>
										<input type="date" name="fromDate" id="fromDate" style="display:inline">
										&nbsp;&nbsp;&nbsp;
										<label for="toDate" style="display:inline">To:</label>
										<input type="date" name="toDate" id="toDate" style="display:inline">
										<a href="javascript:void(0);" class="btn" onclick="document.forms['orderDateForm'].submit();" style="margin:0 10px">검색</a>
									</form>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 내역 테이블 -->
					<div class="orderlist">
						<table>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문일</th>
									<th>상품명</th>
									<th>주문금액</th>
									<th>주문상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allOrdersList}" var="order">
									<tr>
										<td>
											<form name="detail${order.order_id}" action="ExchangeDetail.do" method="post">
												<input type="hidden" name="order_id" value="${order.order_id}">
												<a href="javascript:void(0);" onclick="document.forms['detail${order.order_id}'].submit();">${order.order_id}</a>
											</form>
										</td>
										<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
										<!-- 구매한 책이 1권인 경우 1권의 제목만 노출. 25자가 넘을 경우 뒷부분 생략 -->
										<c:if test="${order.cnt == 1}">
											<c:if test="${order.book_name.length() > 25}">
												<td> ${order.book_name.substring(0, 26)}...</td>
											</c:if>
											<c:if test="${order.book_name.length() <= 25}">
												<td> ${order.book_name}</td>
											</c:if>
										</c:if>
										<!-- 구매한 책이 2권 이상일 경우 대표 1권의 제목만 올리고 나머지는 '외 n권'으로 표시. 20자 넘으면 생략 -->
										<c:if test="${order.cnt >= 2}">
											<c:if test="${order.book_name.length() > 20}">
												<td> ${order.book_name.substring(0, 21)}... 외 ${order.cnt}권</td>
											</c:if>
											<c:if test="${order.book_name.length() <= 20}">
												<td> ${order.book_name} 외 ${order.cnt-1}권</td>
											</c:if>
										</c:if>
										<td><fmt:formatNumber value="${order.totalPrice}" pattern="###,###원"/></td>
										<td>${order.orderState}</td>
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