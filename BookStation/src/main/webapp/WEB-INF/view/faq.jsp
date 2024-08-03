<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" type="text/css" href="css/faq.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/faq.js"></script>
<title>자주묻는질문</title>
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
			<a href="cs.do" class="stext-109 cl8 hov-cl1 trans-04">
				Customer Service
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				FAQ
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
						<!-- 자주묻는 질문 -->
						<div class="con">
							<div class="title">
								<h3>Customer Service</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h3>FAQ</h3>
							</div>
							<!-- 질문유형(고정) -->
							<p>고객님들이 자주 문의하시는 질문 유형입니다.</p>
							<div class="flex-w m-r--5" style="justify-content: space-evenly;">
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab1')">
									BEST 7</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab2')">
									회원정보</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab3')">
									반품/교환</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab4')">
									주문/결제</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab5')">
									배송</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab6')">
									도서/상품정보</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab7')">
									불편사항</button>
								<button class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5 tablinks" onclick="openTab(event, 'Tab8')">
									기타</button>
							</div>
							<!-- /질문유형(고정) -->
							<!-- BEST 7 -->
							<div id="Tab1" class="col-md-9 col-sm-9 tabcontent">
								<h2>BEST 7</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_1">
												1. 기업이나 단체 명의로도 회원가입이 가능한가요?
												</a>
											</h4>
										</div>
										<div id="accordion1_1" class="panel-collapse collapse">
											<div class="panel-body">
												일반 기업이나 비영리법인 모두 법인회원으로 가입이 가능합니다.<br>
												회원 가입시 법인회원을 클릭하시고, 법인회원에 대한 혜택 안내는 고객센터 회원등급 안내를 참고하여 주시기 바랍니다.
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_2">
												2. 회원탈퇴는 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion1_2" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 로그인 후 [마이페이지]에서 [회원탈퇴]를 클릭하시면 탈퇴가 가능합니다.<br>
												회원 탈퇴시 온/오프라인 정보와 함께 구매내역, 적립금이 삭제됩니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_3">
												3. 외국인 회원가입은 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion1_3" class="panel-collapse collapse">
											<div class="panel-body">
												외국인 회원가입은 국내거주와 해외거주로 나뉘어 가입을 할 수 있으며,<br>
												홈페이지 상단 [회원가입] 선택 후 안내되는 내용에 따라 진행하시면 회원가입이 가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_4">
												4. 실명인증이 되지 않습니다. 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion1_4" class="panel-collapse collapse">
											<div class="panel-body">
												BookStaion에서는 회원 가입시 본인 실명확인을 하기 위해 신용정보의 이용 및 보호에 관한 법률에 따라<br>
												신용조회업 허가를 받은 한국신용정보(주)의 신용정보를 참조하고 있습니다.<br><br>
												
												이 자료들은 신용거래가 발생한 경우 수집되는 것으로,<br>
												수집 과정 중 잘못 기재된 것을 수집하여 자료화 되어 있어 실명확인이 되지 않을 수 있습니다.<br>
												(예를 들어 주민등록번호에 대한 이름이 자녀의 이름 또는 철자가 틀렸거나 닉네임으로 기재한 경우의 자료)<br><br>
												
												또한, 실명과 주민등록번호를 정확히 입력하셨는데도 불구하고 정보가 없는 경우,<br>
												한국신용정보(주) 자료에 고객님의 자료가 등록되어 있지 않은 경우입니다.<br>
												보통 위와 같은 경우 실명인증이 제대로 되지 않으므로,<br>
												한국신용정보(주)(www. idcheck.co.kr)로 문의하시면 확인 후 바로 정보를 수정해 드립니다.<br><br>
												
												- 18세 미만 미성년자나 외국인은, 한국신용정보(주) idcheck가 지정한 절차에 따라 팩스로 실명 등록신청을 해주셔야 합니다.<br>
												(한국신용정보(주) Tel.02-2122-4615/4616 Fax.02-2122-4579)
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_5">
												5. ID를 변경할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion1_5" class="panel-collapse collapse">
											<div class="panel-body">
												아이디는 변경할 수 없습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_6">
												6. 회원가입은 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion1_6" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 상단 [회원가입] 선택 후 안내되는 내용에 따라 진행하시면 회원가입이 가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_7">
												7. ID/비밀번호를 잊어버렸습니다.
												</a>
											</h4>
										</div>
										<div id="accordion1_7" class="panel-collapse collapse">
											<div class="panel-body">
												아이디(ID)는 회원으로 가입한 분의 이름과 생년월일로 확인이 가능합니다.<br>
												비밀번호는 따로 확인이 불가능하며, 아이디와 이메일 인증을 하시면 비밀번호 재설정을 할 수 있습니다.
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /BEST 7 -->
							<!-- 회원정보 -->
							<div id="Tab2" class="col-md-9 col-sm-9 tabcontent">
								<h2>회원정보</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_1">
												1. 회원가입은 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_1" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 상단 [회원가입] 선택 후 안내되는 내용에 따라 진행하시면 회원가입이 가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_2">
												2. ID/비밀번호를 잊어버렸습니다.
												</a>
											</h4>
										</div>
										<div id="accordion2_2" class="panel-collapse collapse">
											<div class="panel-body">
												아이디(ID)는 회원으로 가입한 분의 이름과 생년월일로 확인이 가능합니다.<br>
												비밀번호는 따로 확인이 불가능하며, 아이디와 이메일 인증을 하시면 비밀번호 재설정을 할 수 있습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_3">
												3. ID를 변경할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_3" class="panel-collapse collapse">
											<div class="panel-body">
												아이디는 변경할 수 없습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_4">
												4. 회원정보 변경은 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_4" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 로그인 후 상단 [마이페이지] 선택하시면 왼쪽 [개인정보 수정]에서 변경이 가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_5">
												5. 회원탈퇴는 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_5" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 로그인 후 [마이페이지]에서 [회원탈퇴]를 클릭하시면 탈퇴가 가능합니다.<br>
												회원 탈퇴시 온/오프라인 정보와 함께 구매내역, 적립금이 삭제됩니다.
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_6">
												6. 회원탈퇴가 되지 않습니다. 어떻게 해야 되나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_6" class="panel-collapse collapse">
											<div class="panel-body">
												진행 중인 거래(구매) 내역이 있는 경우, 회원탈퇴가 정상적으로 진행되지 않을 수 있습니다
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#accordion2_7">
												7. 개명으로 인한 이름 변경은 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion2_7" class="panel-collapse collapse">
											<div class="panel-body">
												회원가입 시 등록하신 이름이 개명절차를 통해 변경된 경우 아래의 절차를 통해 회원명 변경이 가능합니다.<br>
												1. 로그인<br>
												2. [마이페이지 > 개인정보 수정] 클릭<br>
												3. 이름 영역을 변경 후 [수정완료] 버튼 클릭<br>
												4. 변경 완료<br>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /회원정보 -->
							<!-- 반품/교환 -->
							<div id="Tab3" class="col-md-9 col-sm-9 tabcontent">
								<h2>반품/교환</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_1">
												1. 주문한 도서가 품절,절판이라는 안내를 받았습니다. 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_1" class="panel-collapse collapse">
											<div class="panel-body">
												1. 도서가 품절, 절판으로 확인되면 고객센터에서 품절, 절판 안내를 드립니다.<br>
												2. 두 차례의 안내 이후, 7일 이내 고객문의 미접수 시 직권으로 취소진행이 됩니다.<br>
												(기관 결제취소 및 부분취소와 관련하여 문의사항이 있으신 경우, 고객센터(1544-9020)로 문의바랍니다.)<br><br>
												
												신용카드를 이용한 취소건은 승인취소를 해드리며, 현금 입금 취소건은 계좌정보를 알려주시면 환불이 가능합니다.<br>
												직불형 카드는 취소 후 1~3 일내 카드사에서 입금을 해 드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_2">
												2. 적립금으로 결제한 도서가 취소 되었는데 환불 되나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_2" class="panel-collapse collapse">
											<div class="panel-body">
												적립금은 취소시 현금 환불이 불가능 하며, 적립금으로 재 적립해 드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_3">
												3. 반품/교환이 불가능한 도서도 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_3" class="panel-collapse collapse">
											<div class="panel-body">
												도서는 속에 담겨있는 정보에 가치가 있기 때문에, 단기간에 필독이 가능한 도서는 교환 혹은 환불이 불가능합니다.<br>
												(환불 불가능 도서 : 문제지, 수험서, 만화, 시집, 요리책, 지도, 잡지, 사진집, 여행관련 도서 등)
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_4">
												4. 주문도서 취소 후 환불절차가 어떻게 되나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_4" class="panel-collapse collapse">
											<div class="panel-body">
												신용카드를 이용한 취소건은 승인취소를 해드리며, 현금 입금 취소건은 계좌정보를 알려주시면 환불이 가능합니다.<br> 
												직불형 카드는 취소 후 1~3 일내 카드사에서 입금을 해 드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_5">
												5. 구입한 도서를 다른 도서와 교환하고 싶습니다.
												</a>
											</h4>
										</div>
										<div id="accordion3_5" class="panel-collapse collapse">
											<div class="panel-body">
											주문접수 후 다른도서로 교환이 불가능하니 주문취소 후 재 주문을 해 주셔야 합니다.<br>
											물류센터에서 [출고] 이후에는 취소가 불가능하니 위의 반품/교환 방법을 참조해 주십시오.
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_6">
												6. 파본/훼손된 도서는 어떻게 해야 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_6" class="panel-collapse collapse">
											<div class="panel-body">
												온라인 주문도서 파본/훼손은 고객센터(1577-1577) 또는 1:1 메일상담을 통해 접수 가능합니다.<br>
												파본/훼손 내용 확인 후 회수 진행되며, 배송비용은 BookStation에서 부담합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#accordion3_7">
												7. 주문수정 할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion3_7" class="panel-collapse collapse">
											<div class="panel-body">
												이미 결제된 주문은 중간에 수정할 수 없습니다.
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /반품/교환 -->
							<!-- 주문/결제 -->
							<div id="Tab4" class="col-md-9 col-sm-9 tabcontent">
								<h2>주문/결제</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_1">
												1. 세트 도서를 구매하고 싶어요, 어떻게 구매할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion4_1" class="panel-collapse collapse">
											<div class="panel-body">
												오프라인 매장 또는 홈페이지를 통해 구매하시고자 하시는 상품을 찾아보실 수가 있습니다.<br> 
												찾으시는 세트 도서가 확인이 안되시는 경우 가까운 매장에 문의하시거나<br>
												고객센터 (1577-1577)로 연락주시면 세트 도서의 구매 여부를 확인해드리도록 하겠습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_2">
												2. 주문 후 입금을 하지 않았어요. 지금 입금해도 되나요?
												</a>
											</h4>
										</div>
										<div id="accordion4_2" class="panel-collapse collapse">
											<div class="panel-body">
											온라인 주문후 바로 입금을 하지 않을 경우, 품절등으로 발송이 불가능 할 수 있습니다.<br>
											또한 14일이내 입금을 하지 않을 경우 주문이 취소됩니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_3">
												3. 홈페이지에 없는 외서도 주문이 가능한가요?
												</a>
											</h4>
										</div>
										<div id="accordion4_3" class="panel-collapse collapse">
											<div class="panel-body">
												BookStation 인터넷 해외주문 대행 서비스는 내부사정으로 중단되어 주문이 불가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_4">
												4. 결제방법을 변경할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion4_4" class="panel-collapse collapse">
											<div class="panel-body">
												주문완료 후에는 인터넷 상에서 결제방법을 변경하실 수 없습니다.<br>
												이 경우에는 기존 주문을 취소한 후 재주문하시거나, 고객센터(1577-1577)로 취소 요청해 주셔야 합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_5">
												5. 무통장 입금 가능한 은행 알려주세요.
												</a>
											</h4>
										</div>
										<div id="accordion4_5" class="panel-collapse collapse">
											<div class="panel-body">
												무통장 입금가능한 은행은 아래와 같습니다.<br><br>

												국민은행 : 006-01-0783-341	(예금주 : BookStation)<br>
												신한은행 : 100-008-207624		(예금주 : BookStation)<br>
												하나은행 : 271-810001-18204	(예금주 : BookStation)<br>
												우리은행 : 092-191589-13-201	(예금주 : BookStation)<br>
												기업은행 : 061-108300-04-014	(예금주 : BookStation)<br>
												농   협 : 301-0276-0184-81	(예금주 : BookStation)<br>
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_6">
												6. 주문내역은 어디서 확인하나요?
												</a>
											</h4>
										</div>
										<div id="accordion4_6" class="panel-collapse collapse">
											<div class="panel-body">
												홈페이지 로그인 후 [마이페이지] 내 [주문/배송조회]에서 확인하실 수 있습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion4" href="#accordion4_7">
												7. 비회원도 주문이 가능한가요?
												</a>
											</h4>
										</div>
										<div id="accordion4_7" class="panel-collapse collapse">
											<div class="panel-body">
												비회원은 주문 할 수 없습니다.
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /주문/결제 -->
							<!-- 배송 -->
							<div id="Tab5" class="col-md-9 col-sm-9 tabcontent">
								<h2>배송</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_1">
												1. 직장이나 학교에서는 당일배송을 받을 수 없나요?
												</a>
											</h4>
										</div>
										<div id="accordion5_1" class="panel-collapse collapse">
											<div class="panel-body">
												원칙적으로 당일 배송이 가능한 지역이라면 어떤 곳이든 당일 배송 수령은 가능합니다.<br>
												하지만 당일배송 대부분의 물량이 18시 이후에 집중되어 배송되므로,<br>
												직장이나 기관 등을 수령지로 선택하시면 부재시 수령이 불가능한 상황이 발생할 수 있으며,<br>
												학교 수령지에 대해서는 당일 배송이 불가합니다.<br>
												따라서 가급적이면 안전하게 수령이 가능하신 자택 등으로 주문해주시기 바랍니다.<br>
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_2">
												2. 주소 미확인, 수취인 불명으로 반송되었을 경우 어떻게 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion5_2" class="panel-collapse collapse">
											<div class="panel-body">
												주문하신 고객님께서 받으실 주소, 연락처를 잘못 입력 하거나<br>
												상품 인수자가 없어 영풍문고로 반송이 되었을 경우 왕복 택배비를 지불하신 후 재발송 가능합니다.<br> 
												환불을 요청하실 경우 왕복택배비 5,000원을 제외한 상품대금을 환불해 드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_3">
												3. 배송 주소지를 변경할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion5_3" class="panel-collapse collapse">
											<div class="panel-body">
												주문완료 후 직접 변경은 불가능하므로 고객센터(1577-1577) 또는 1:1 상담접수로 요청하셔야 합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_4">
												4. 주문도서 중 품절 도서의 처리는 어떻게 되나요?
												</a>
											</h4>
										</div>
										<div id="accordion5_4" class="panel-collapse collapse">
											<div class="panel-body">
												출판사 품절,절판일 경우 별도 연락(전화.문자.이메일)을 해 드립니다.<br>
												온라인, 신용카드 주문 모두 부분 품절/절판일 경우, 현금으로 환불을 해 드리고<br>
												카드결제건 중 전체 품절, 절판일 경우는 카드승인 취소를 해 드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_5">
												5. 주문도서 중 일부가 배송되지 않았습니다
												</a>
											</h4>
										</div>
										<div id="accordion5_5" class="panel-collapse collapse">
											<div class="panel-body">
												주문도서 중 후배송으로 된 도서는 출판사에서 입고되는 즉시 발송해 드리며<br>
												추가 택배비는 BookStation에서 부담해드립니다.
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_6">
												6. 택배 배송확인은 어디서 하나요?
												</a>
											</h4>
										</div>
										<div id="accordion5_6" class="panel-collapse collapse">
											<div class="panel-body">
												배송확인은 [마이페이지] 내 [주문/배송조회]에서 가능합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#accordion5_7">
												7. 배송료는 얼마인가요?
												</a>
											</h4>
										</div>
										<div id="accordion5_7" class="panel-collapse collapse">
											<div class="panel-body">
												국내배송료는 1만원 미만 주문시 2,500원, 1만원 이상 주문시 배송비는 무료입니다.<br>
												(제주 지역이실 경우 타지역에 비해 1~2일 정도 배송기간이 지연될수 있음을 양해해 주시기 바랍니다.)
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /배송 -->
							<!-- 도서/상품정보 -->
							<div id="Tab6" class="col-md-9 col-sm-9 tabcontent">
								<h2>도서/상품정보</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_1">
												1. 검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?
												</a>
											</h4>
										</div>
										<div id="accordion6_1" class="panel-collapse collapse">
											<div class="panel-body">
												검색이 되지 않는 도서는 품절/절판일 경우가 대부분입니다<br>
												품절이나 절판으로 표시된 도서는 출판사에서도 더 이상 발간하지 않고 재고가 없는 경우가 대부분이라 구하기 어려운 도서입니다.<br> 
												이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다.<br>
												이러한 도서의 구입가능 여부를 확인하시려면 고객센터의 1:1 문의 접수 이용하여 주시면, 최대한 확인하여 답변드리겠습니다.<br>
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_2">
												2. 외국도서의 중고책도 구입할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion6_2" class="panel-collapse collapse">
											<div class="panel-body">
												중고도서는 도서의 상태를 보장할 수 없기 때문에 현재 취급하고 있지 않습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_3">
												3. 아마존에 있는 책이 왜 BookStation에는 없나요?
												</a>
											</h4>
										</div>
										<div id="accordion6_3" class="panel-collapse collapse">
											<div class="panel-body">
												BookStation은 아마존과 직접 거래를 하고 있지 않기 때문에 아마존과 도서 DB와 다를 수 있습니다.<br>
												또한 미국 현지 서점이기 때문에 출판사로 부터 공급받아 재고로 남아 있는 도서가 있을 수 있습니다.<br>
												아마존에만 재고를 보유하고 있는 도서는 주문 대행이 어려우며 직접 주문 진행해주셔야 합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_4">
												4. 표지에 붙어있는 [19세미만 구독불가]스티커가 없는 상품으로 배송해주세요.
												</a>
											</h4>
										</div>
										<div id="accordion6_4" class="panel-collapse collapse">
											<div class="panel-body">
												도서 중 19세미만 구독불가 상품의 경우,<br>
												청소년 보호법 14조 및 유해표시방법에 따라 [19세미만 구독불가] 스티커가 부착되어 출고됩니다.<br>
												스티커가 부착되지 않은 경우 국내 유통이 불가합니다.
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_5">
												5. 다른 나라에서 출판된 도서도 주문할 수 있나요?
												</a>
											</h4>
										</div>
										<div id="accordion6_5" class="panel-collapse collapse">
											<div class="panel-body">
												BookStation은 현재 내부사정에 따라 국내도서만 주문할 수 있습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_6">
												6. 검색을 쉽게 하는 방법은 없나요?
												</a>
											</h4>
										</div>
										<div id="accordion6_6" class="panel-collapse collapse">
											<div class="panel-body">
												[제목, 저자] 로 검색할 시 가장 정확하게 검색할 수 있습니다.
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion6" href="#accordion6_7">
												7. 인터넷에서 교과서 주문이 가능한가요?
												</a>
											</h4>
										</div>
										<div id="accordion6_7" class="panel-collapse collapse">
											<div class="panel-body">
												교과서는 온라인 구입이 불가능합니다.
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /도서/상품정보 -->
							<!-- 불편사항 -->
							<div id="Tab7" class="col-md-9 col-sm-9 tabcontent">
								<h2>불편사항</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_1">
												1. 1반적으로 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_1" class="panel-collapse collapse">
											<div class="panel-body">
												......
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_2">
												2. 2런것도 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_2" class="panel-collapse collapse">
											<div class="panel-body">
												......예예
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_3">
												3. 3수생이라 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_3" class="panel-collapse collapse">
											<div class="panel-body">
												......예에에에에에에
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_4">
												4. 숫자4가 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_4" class="panel-collapse collapse">
											<div class="panel-body">
												......????
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_5">
												5. 5지게 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_5" class="panel-collapse collapse">
											<div class="panel-body">
												......진심이세요?
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_6">
												6. 6체가 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_6" class="panel-collapse collapse">
											<div class="panel-body">
												......저두요
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion7" href="#accordion7_7">
												7. 7전팔기가 불편해요
												</a>
											</h4>
										</div>
										<div id="accordion7_7" class="panel-collapse collapse">
											<div class="panel-body">
												......또 Lie 인가
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /불편사항 -->
							<!-- 기타 -->
							<div id="Tab8" class="col-md-9 col-sm-9 tabcontent">
								<h2>기타</h2>
								<div class="faq-page" style="width: 134%;">
									<div class="panel panel-danger" style="margin-top: 15px;">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_1">
												1. 기타입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_1" class="panel-collapse collapse">
											<div class="panel-body">
												좌우지 장지지지
											</div>
										</div>
									</div>
									<div class="panel panel-caution">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_2">
												2. 베이스입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_2" class="panel-collapse collapse">
											<div class="panel-body">
												주와 주와아아아아아앙
											</div>
										</div>
									</div>
									<div class="panel panel-warning">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_3">
												3. 드럼입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_3" class="panel-collapse collapse">
											<div class="panel-body">
												두둥두둥 두두두두둥
											</div>
										</div>
									</div>
									<div class="panel panel-success">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_4">
												4. 피아노입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_4" class="panel-collapse collapse">
											<div class="panel-body">
												니나니나 니고릴라다
											</div>
										</div>
									</div>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_5">
												5. 트라이앵글입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_5" class="panel-collapse collapse">
											<div class="panel-body">
												별명은 버뮤다입니다
											</div>
										</div>
									</div>
									<div class="panel panel-pause">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_6">
												6. 캐스터네츠입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_6" class="panel-collapse collapse">
											<div class="panel-body">
												캣츠아니고 캐스터네츠요!!!!
											</div>
										</div>
									</div>
									<div class="panel panel-cancel">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion8" href="#accordion8_7">
												7. 꽹과리입니다
												</a>
											</h4>
										</div>
										<div id="accordion8_7" class="panel-collapse collapse">
											<div class="panel-body">
												형이 거기서 왜나와...?
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /불편사항 -->
						</div>
						<!-- /자주묻는 질문 -->
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