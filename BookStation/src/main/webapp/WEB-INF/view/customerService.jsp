<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" type="text/css" href="css/cs.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>고객센터</title>
<script>
	$(function(){

	})
</script>
</head>
<body class="animsition">
	
	<!-- header -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				Customer Service
			</span>
		</div>
	</div>

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2">
					<div class="p-r-45 p-r-0-lg">
						<div class="wrap-pic-w how-pos5-parent"></div>
						<!-- 질문유형 -->
						<div class="con">
							<div class="title">
								<h3>Customer Service</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h3>FAQ</h3>
							</div>
							<p>고객님들이 자주 문의하시는 질문 유형입니다.</p>
							<div class="flex-w m-r--5" style="justify-content: space-evenly;">
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									BEST 7</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									회원정보</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									반품/교환</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									주문/결제</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									배송</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									도서/상품정보</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									불편사항</a>
								<a href="faq.do" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									기타</a>
							</div>
							<div id="faqBox">
								<div class="top"></div>
								<div class="cont">
									<div id="faqSearch">
										<p id="faq_title" style="font-size: 40px;">FAQ</p>
										<input type="text" name="FaqQuery" id="FaqQuery" value="" onkeypress="if(event.keyCode ==13){fQuerySearch();}">
										<a href="javascript:fQuerySearch();"><img src="https://img.ypbooks.co.kr/ypbooks/images/btnSearch_.gif" alt="검색"></a>
									</div>
								</div>
							</div>
						</div>
						<!-- /질문유형 -->
						<!-- 1:1상담 -->
						<div class="con">
							<div class="title">
								<h3>1:1 Customer Service</h3>
							</div>
							<p>
								질문 유형에 따라 문의하시면, 신속하게 답변해드립니다.<br>
								근무시간(월~금 09:00 ~ 18:00) 이후의 문의사항은 근무시간 중에 답변되오니 양해 부탁드립니다.
							</p>
							<div class="container-fluid feature" style="padding-top: 15px;">
								<div class="container">
									<div class="row g-4">
										<div class="col-md-6 col-lg-6 col-xl-6 wow fadeInUp" data-wow-delay="0.5s">
											<a href="qnaWrite.do" style="color: inherit;">
												<div class="row-cols-1 feature-item p-4">
													<div class="col-12">
														<div class="feature-icon" style="margin-left: -20px;">
															<div class="p-3 d-inline-flex bg-white rounded">
																<i class="fas fa-headset fa-4x" style="color: #45a049;"></i>
															</div>
														</div>
														<div class="feature-content d-flex flex-column" style="align-self: center; margin-left: 20px;">
															<h2 style="text-align: center;">1:1 문의접수</h2>
														</div>
													</div>
												</div>
											</a>
										</div>
										<div class="col-md-6 col-lg-6 col-xl-6 wow fadeInUp" data-wow-delay="0.5s">
											<a href="qna.do" style="color: inherit;">
												<div class="row-cols-1 feature-item p-4">
													<div class="col-12">
														<div class="feature-icon" style="margin-left: -20px;">
															<div class="p-3 d-inline-flex bg-white rounded">
																<i class="fas fa-comments fa-4x" style="color: #45a049;"></i>
															</div>
														</div>
														<div class="feature-content d-flex flex-column" style="align-self: center; margin-left: 20px;">
															<h2 style="text-align: center;">1:1 문의내역</h2>
														</div>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /1:1상담 -->
						<!-- 공지사항 -->
						<div class="con">
							<div class="title">
								<h3>Notification</h3>
								<a href="notice.do" class="btn type01">더보기 〉</a>
							</div>
							<table class="mp_table type01">
								<colgroup>
									<col width="150">
									<col width="500">
									<col width="200">
									<col width="150">
								</colgroup>
								<tbody>
									<tr>
										<th class="line">공지번호</th>
										<th class="line">공지내용</th>
										<th class="line">고객센터</th>
										<th class="line">등록일</th>
									</tr>
									<tr>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine">난 공zlㅅr항oㅣ 좋cㅏ... OㅏLㅣ 공zlㅅr항을 쓰는 ㄴHㄱr 좋Cㅏ</td>
										<td class="center bLine">명언 레전드</td>
										<td class="center bLine">2024.04.04</td>
									</tr>
									<tr>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine">난 공zlㅅr항oㅣ 좋cㅏ... OㅏLㅣ 공zlㅅr항을 쓰는 ㄴHㄱr 좋Cㅏ</td>
										<td class="center bLine">명언 레전드</td>
										<td class="center bLine">2024.04.04</td>
									</tr>
									<tr>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine">난 공zlㅅr항oㅣ 좋cㅏ... OㅏLㅣ 공zlㅅr항을 쓰는 ㄴHㄱr 좋Cㅏ</td>
										<td class="center bLine">명언 레전드</td>
										<td class="center bLine">2024.04.04</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /공지사항 -->
					</div>
				</div>
				<!-- /본문 -->
				
				<!-- 사이드바 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- /사이드바 -->
				
			</div>
		</div>
	</section>	

	<!-- Footer -->
	<jsp:include page="bottom.jsp"></jsp:include>
	<!-- /Footer -->

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

</body>
</html>