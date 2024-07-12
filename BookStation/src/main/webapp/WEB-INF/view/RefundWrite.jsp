<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 신청완료 버튼을 누르면 뒤로가기 -->
<script>
    function goBack() {
        window.history.back();
    }
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- ======================================== -->
<link rel="stylesheet" type="text/css" href="css/RefundWrite.css">
<title></title> 
<style>
	.btn {
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
	.btn:hover {
	    background-color: #45a049; /* 호버 시 배경색 변경 */
	    color: white; /* 호버 시 글자색 변경 */
	    border: 1px solid #285a35; /* 호버 시 테두리 색 변경 */
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
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				8 Inspiring Ways to Wear Dresses in the Winter
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-16 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2">
					<div class="p-r-0-lg">
						<!-- title -->
						<div class="con">
							<div class="title">
								<h3>주문/배송 취소 조회 상세</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h4>주문/배송 취소 안내</h4>
							</div>
						</div>
						<!-- 반품 교환 취소 규정설명 -->
						<div id="goodsSearch" style="font-size: 14px;">
							<div class="goodsSearch_top">
								북스테이션에서 구입한 상품에 이상이 있거나, <br> 
								잘못 배달된 경우 어떠한 상황에도 책임을 지고 교환 및 환불이 가능합니다.<br>
								<span>( 단 휴일에는 모든 교환 및 환불처리가 되지 않습니다. )</span>
							</div>

							<h3 class="basket"><strong>취소안내</strong></h3>
							<div class="des">
								주문 후 입금대기, 주문완료 상태에서는 직접 취소가 가능합니다.<br>
								(배송조회 -&gt; 주문번호 선택 -&gt; 상품정보 확인 후 취소할 수 있습니다.)<br><br>
								직접 취소가 불가능한 경우 고객센터로 연락해 주시기 바랍니다.<br>
								(고객센터 근무시간 - 평일 09:00 ~ 18:00)<br><br>
								상품의 재고유무에 따라 주문 후 바로 출고가 되는 경우 취소가 불가능 할 수 있습니다.<br>
								상품 출고 이후에는 반품으로 처리가 진행되며, 반송에 따른 배송비 부담이 있을 수 있습니다.<br><br>
								
								<strong>도서의 품/절판이 확인되는 경우,</strong> 아래의 절차에 따라 주문 취소가 진행됩니다.<br>
								1. 주문상품 품/절판 확인일: 주문도서 품/절판에 따른 취소 안내<br>			
								2. 2차 안내: 취소 지연건 대상으로 일주일 이내 취소요청 미접수 시 직권취소 재차 안내<br>			
								3. 고객센터 직권취소: 2차 안내 후 7일 이내 취소진행 예정					
							</div>

							<h3 class="basket">파본이거나 잘못 배달된 국내서적의 교환</h3>
							<div class="des">파본, 낙장, 인쇄불량 등의 상품에 문제가 있거나, 잘못 배달된 상품의 경우 고객센터로 연락을 주시면 회수진행됩니다.<br> 회수비용은 당사에서 부담합니다.<br></div>
							<h3 class="basket">하자없는 상품의 반송</h3>
							<div class="des"> 원칙적으로 반송이 가능합니다.<br>
								다만, <strong>반송에 따른 택배료는 고객님께서 부담</strong>해 주셔야 합니다.<br>
								주문하신 <strong>모든 도서를 반송하실 경우, <span class="blue">왕복 택배료&nbsp; 5,000원</span>을, <br>
								부분 반품을 하실 경우에는 <span class="blue">편도 택배료 2,500원</span>을 부담</strong>해 주셔야 합니다. <br>
								(단, 부분 반품이라도 반품 제외 잔여 주문 도서금액이 &nbsp;10,000원 미만일 경우엔&nbsp;5,000원 입니다)<br>
								<strong><span class="blue">* 지정 택배사가 아닌 다른 택배사를 통해 전체 반품시,<br>
									선불로 보내는 경우라도 저희쪽에서 발송해 드렸던 비용 2,500원은 주문하신 분의 부담입니다.</span></strong>
								<br>
								<br>
								또한 다른 상품과는 달리 도서는 그 속에 담겨있는 정보에 가치가 있기 때문에 단기간에 필독이 가능한 도서는 교환 혹은 환불이 불가능합니다.<br>
								<span>☞ 환불 불가능 도서 : 문제지, 수험서, 만화, 시집, 요리책, 지도, 잡지, 사진집, 여행관련 도서 등<br>
								 ☞ 특히, 자격증관련 수험서,특정 업체를 위한 문제집, 인적성검사 관련 수험서류는 반품, 교환이 절대 불가능합니다-</span>
								<br>
								<br>
								<span class="blue" style="font-weight:bold;">1. 도서를 수령 후 반품요청 -&gt;고객센터나 이메일로 반품접수</span> <br>
								2. 잡지, 소프트웨어 등 비닐포장이 된 도서는 미개봉된 상태로 반품하셔야 환불을 받으실 수 있습니다.<br>
								3. 도서 수령일 기준 7일 이내에 접수<br>
								4. 도서의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 도서를 공급받은 날부터 3개월 이내, <br>
								그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다. <br>
								5. 반품접수건은 회수기사님이 방문 하십니다. <br>
								6. 해외에서  주문하신 도서는 반품이 불가하기 때문에, 파본도서를 제외하고 반품, 교환 등이 되지 않습니다.<br>
								<br>
								<strong>☞  온라인물류센터 : <span class="blue">(99999) 서울시 강남구 어딘가 </span></strong>
							</div><br>
							<h3 class="basket">고객님의 과실로 상품을 전달 받지 못하고 북스테이션으로 반송후 재발송 요구시</h3>
							<div class="des">고객님께서 <strong><span class="blue">수령 주소, 전화번호를 잘못 표기 하거나 3일간 상품 인수자가
								없어</span></strong> 북스테이션으로 반송이 된 경우 택배료는 구매금액과 관계없이 주문하신&nbsp;고객님께서 부담해 주셔야 합니다. 
								만약 재출고를&nbsp;요청하실 경우 왕복 택배료 5,000원을&nbsp;별도 입금해 주셔야 하고, 환불을&nbsp; 원하실 경우 5,000원을 제외한 상품대금을 환불해 드립니다. 
							</div>
							<br>
							<dl class="first">
								<dt>1.교환</dt>
								<dd>수령하신 도서가 파본일 경우 동일도서로의 교환은 가능하나 타도서로의 교환은 불가합니다.(반품 접수 후 재주문)</dd>
							</dl>
							<dl>
								<dt>2.반품</dt>
								<dd>먼저, 수령하신 매장에서 도서를 반품해 주시면 확인후 결제건을 취소해드립니다.
								<br>
								<strong>(단, 잡지/만화/수험서/문제집 등의 교환, 반품이 불가한 도서가 있음을 양해해주시기 바랍니다.)</strong></dd>
							</dl>
							<h3 class="basket">해외도서의 취소/교환/환불</h3>
							<div class="des">
							해외도서는 해외거래처의 상황에 따라 품절/지연될 수 있으며, 이 경우 주문진행 여부에 대하여 안내해드립니다.<br><strong><span class="blue">(주문진행 여부 안내 시 진행 요청하시면 요청 후 취소 및 단순변심에 의한 교환/환불 불가)</span></strong><br>
							해외도서는 고객님의 요청에 의해 주문이 진행되기 때문에 도서수급 중 취소 및 단순변심에 의한 교환/반품은 불가합니다.<br>
							(파본 및 오배송에 의한 교환/반품은 가능)<br>
							<strong><span class="blue">도서수급 중 취소 및 단순변심에 의한 교환/반품 시 도서판매가의 20%에 해당하는 수수료가 부과되오니 주문 시 유의해 주시기 바랍니다.</span></strong><br>
							(수수료 제외 후 환불)
							</div>
							<h3 class="basket">결제대금 환불방법</h3>
							<dl class="first">
								<dt>신용카드나 휴대폰 소액 결제</dt>
								<dd>전체 취소나 전체 반품일 경우 승인 금액이 청구되지 않도록 승인 취소를 요청해 드립니다.
								 <br>부분 취소나 부분 반품일 경우 예치금으로 전환 또는 <strong>*은행계좌</strong>로 환불해 드립니다 <br>휴대폰 결제건 중 이미 청구가 된 경우에는 예치금으로 전환 또는 환불해 드립니다. </dd>
							</dl>
							<dl>
								<dt>무통장 입금 결제 </dt>
								<dd>무통장 입금으로 결제하신 경우 예치금으로 전환 또는 <strong>*은행계좌</strong>로 환불해 드립니다. </dd>
								<strong style="display: block; margin-bottom: 20px;">* 은행계좌로 환불시 유선이나 메일로 계좌정보를 알려주셔야 환불 등록이 됩니다.</strong>
							</dl>
						</div>
						<hr>

						<div class="container" style="padding:0px">
							<!-- 안내문 -->
							<div class="box">
							  <h3>주문/배송 안내</h3>
							  <br>
							  <p>- 입금 대기 상태나 주문완료(결제완료) 상태에서는 직접 주문을 <strong>취소</strong>하실 수 있습니다.</p>
							  <p style="color: #fe0000; font-weight: bold;">- 이미 발송된 상태라면 배송지를 변경하실 수 없습니다.</p>
							</div>

							<!-- 기간 필터 -->
							<div class="table-responsive">
								<div class="box gray-box title" style="margin:30px 0">
									<div class="form-container p-b-10 p-lr-10" style="display:table-row;float:left;width:100%">
										<h4 class="p-tb-10" style="display:block">기간별 조회</h4>
										<a href="RefundWrite.do?interval=1" class="btn type01" style="float:left">하루</a>
										<a href="RefundWrite.do?interval=7" class="btn type01" style="float:left">일주일</a>
										<a href="RefundWrite.do?interval=30" class="btn type01" style="float:left">1개월</a>
										<a href="RefundWrite.do?interval=90" class="btn type01" style="float:left">3개월</a>
									</div>
									<!-- 주문별 일자 조회 -->
									<div class="form-container p-t-10 p-lr-10" style="display:table-row;float:left">
										<h4 class="p-tb-10" style="display:block">주문일자별 조회</h4>
										<div>
											<form name="orderDateForm" action="RefundWrite.do" method="get">
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
											<th>주문일</th>
											<th>주문번호</th>
											<th>상품명</th>
											<th>주문금액</th>
											<th>주문상태</th>
											<th>신청사유</th>
											<th>신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${allRefundableList}" var="order">
											<tr>
												<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
												<td>
													<form name="detail${order.order_id}" action="ExchangeDetail.do" method="post">
														<input type="hidden" name="order_id" value="${order.order_id}">
														<a href="javascript:void(0);" onclick="document.forms['detail${order.order_id}'].submit();">${order.order_id}</a>
													</form>
												</td>
												<!-- 구매한 책이 1권인 경우 1권의 제목만 노출. 25자가 넘을 경우 뒷부분 생략 -->
												<c:if test="${order.cnt == 1}">
													<c:if test="${order.book_name.length() > 20}">
														<td> ${order.book_name.substring(0, 21)}...</td>
													</c:if>
													<c:if test="${order.book_name.length() <= 20}">
														<td> ${order.book_name}</td>
													</c:if>
												</c:if>
												<!-- 구매한 책이 2권 이상일 경우 대표 1권의 제목만 올리고 나머지는 '외 n권'으로 표시. 20자 넘으면 생략 -->
												<c:if test="${order.cnt >= 2}">
													<c:if test="${order.book_name.length() > 15}">
														<td> ${order.book_name.substring(0, 16)}... 외 ${order.cnt}권</td>
													</c:if>
													<c:if test="${order.book_name.length() <= 15}">
														<td> ${order.book_name} 외 ${order.cnt-1}권</td>
													</c:if>
												</c:if>
												<td><fmt:formatNumber value="${order.totalPrice}" pattern="###,###원"/></td>
												<td>${order.orderState}</td>
												<form name="refund${order.order_id}" action="refund.do" method="post">
													<td>
														<select name="cancel_reason">
															<option value="단순 변심">단순 변심</option>
															<option value="잘못된 수량">잘못된 수량</option>
															<option value="상품 파손">상품 파손</option>
															<option value="기타">기타</option>
														</select>
													</td>
													<td>
														<input type="hidden" name="order_id" value="${order.order_id}">
														<a href="javascript:void(0);" class="btn" style="margin:0 10px" onclick="document.forms['refund${order.order_id}'].submit();">신청</a>
													</td>
												</form>
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
						<script>
							function showMessage() {
								alert("신청 완료 되었습니다.");
							}
						</script>	
						</div>
						<!-- 반품/교환/취소 -->
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

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    <script src="js/AllOrderList_Button.js"></script> 

</body>
</html>