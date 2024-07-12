<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원탈퇴</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 템플릿과 bootstrap 사용을 위한 코드 -->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/mp_myinfo.css">
<!--===============================================================================================-->	

<!-- 사이드바 css -->
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
<!--===============================================================================================-->

</head>
<body class="animsition">
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="myPage.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				MyPage
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				회원탈퇴
			</span>
		</div>
	</div>

	<section class="bg0 p-t-16 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2">
					<div class="p-r-45 p-r-0-lg">
						<!-- 회원정보 -->
						<form action="leave.do" method="post">
							<div class="con">
								<div class="title">
									<h3>회원탈퇴</h3>
									<hr style="border: 1px solid black;">
								</div>
								<div class="title">
									<h3>다음 사항을 꼭 확인해 주세요.</h3>
								</div>
								<ul class="checkList">
									<li>
										- 회원 탈퇴 시 북스테이션 이용이 불가합니다.
									</li>
									<li>
										- 회원 탈퇴 시 포인트는 즉시 소멸되며 환불 받을 수 없습니다.
									</li>
									<li>
										- 마이 리뷰와 및 서재 이용 데이터는 즉시 삭제되며, 재가입 시 복구되지 않습니다.
									</li>
									<li>
										- 고객님의 거래내역은 관계법령 전자상거래 등에서의 소비자 보호에 관한 법률 제6조(거래기록의 보존 등)에 따라 회원탈퇴 후 5년간 보존됩니다.
									</li>
									<li>
										- 출고 이전 주문이 있거나, 교환 및 환불이 진행 중일 경우 상품 배송 및 정산 처리 문제로 탈퇴가 불가합니다.
									</li>
									<li>
										- 회원탈퇴 시 1년 이내 재가입/회원구매에 제약이 있으며 이메일은 탈퇴 후 30일이 경과하면 다시 사용할 수 있습니다.
									</li>
								</ul>
							</div>
							
							<!-- 기본 배송정보 -->
							<div class="con">
								<div class="title">
									<h3>북스테이션을 탈퇴하시려는 이유를 알려주세요. 보다 좋은 서비스 제공을 위해 노력하겠습니다.</h3>
								</div>
								<table>
									<colgroup>
										<col width="300">
										<col width="300">
										<col width="300">
										<col width="300">
									</colgroup>
									<tr>
										<td><input type="checkbox" id="checkbox1"><label for="checkbox1">&nbsp;중복 가입 계정 정리</label></td>
										<td><input type="checkbox" id="checkbox2"><label for="checkbox2">&nbsp;상품 가격 불만</label></td>
										<td><input type="checkbox" id="checkbox3"><label for="checkbox3">&nbsp;상품 품질 불만</label></td>
										<td><input type="checkbox" id="checkbox4"><label for="checkbox4">&nbsp;상품 정보 부족</label></td>
									</tr>
									<tr>
										<td><input type="checkbox" id="checkbox5"><label for="checkbox5">&nbsp;배송 불만</label></td>
										<td><input type="checkbox" id="checkbox6"><label for="checkbox6">&nbsp;사이트 이용 불편</label></td>
										<td><input type="checkbox" id="checkbox7"><label for="checkbox7">&nbsp;결제 불편</label></td>
										<td><input type="checkbox" id="checkbox8"><label for="checkbox8">&nbsp;반품/교환/취소 불편</label></td>
									</tr>
									<tr>
										<td><input type="checkbox" id="checkbox9"><label for="checkbox9">&nbsp;회원혜택 부족</label></td>
										<td><input type="checkbox" id="checkbox10"><label for="checkbox10">&nbsp;상품검색 불편</label></td>
										<td><input type="checkbox" id="checkbox11"><label for="checkbox11">&nbsp;시스템 안정성</label></td>
										<td><input type="checkbox" id="checkbox12"><label for="checkbox12">&nbsp;개인 정보 삭제</label></td>
									</tr>
								</table>
							</div>
							
							<div class="con">
								<div class="title">
									<h3>본인 확인을 위해 비밀번호를 입력해주세요.</h3>
								</div>
								<input type="password" name="member_password" placeholder="비밀번호 입력" style="border: 1px solid #000; border-radius: 4px;">
								<div class="button-container">
									<input type="checkbox" id="checkbox13"><label for="checkbox13">&nbsp;위 내용을 이해했으며, 모두 동의합니다.</label>
								</div>
								<div class="button-container">
									<button type="submit" class="button" id="leaveButton" onclick="return validateForm()">회원탈퇴</button>
									<!-- <button class="opposite-button" id="cancelButton">취소하기</button> -->
								</div>
								 <c:if test="${not empty leaveError}">
							        <script type="text/javascript">
							            alert("${leaveError}");
							        </script>
		    					</c:if>    
							</div>
						</form>
					</div>
				</div>
				<!-- 본문 수정 -->

				<!-- 사이드바 수정 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- 사이드바 -->
			</div>
		</div>
	</section>	
	
	<!-- bottom -->
    <jsp:include page="bottom.jsp" flush="false" /> 

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!-- 템플릿과 bootstrap, jQuery 사용을 위한 코드 -->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	
	<!-- 회원탈퇴 시 동의란 체크 유무 확인 -->
	<script>
	 function validateForm() {
         var checkbox = document.getElementById('checkbox13');
         if (!checkbox.checked) {
             alert("위 내용을 이해했으면, 동의란에 체크해주세요.");
             return false;
         }
         
         // 회원탈퇴 확인 메시지
         var confirmDeletion = confirm("정말 탈퇴하시겠습니까?");
         if (!confirmDeletion) {
             return false;
         }
         return true;
     }
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>