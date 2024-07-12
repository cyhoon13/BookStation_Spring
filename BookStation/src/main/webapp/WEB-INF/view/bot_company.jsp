<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>BookStation</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/icon.png"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/main_custom.css">
	<style>
		@font-face {
			font-family: 'SUITE-Regular';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
			font-weight: 400;
			font-style: normal;
		}
		.com-rule {
			width: 1100px;
		}
		.com-rule * {
			font-family: 'SUITE-Regular';
			padding: 10px 0px;
		}
		.com-rule h1 {
			font-size: 40px;
			font-weight: bolder;
			margin-bottom: 20px;
			color: black;
		}
	</style>
</head>
<body class="animsition">
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>

	<div class="container p-lr-50 p-tb-50 com-rule">

    <h1>북스테이션 이용약관</h1>
    
    <h2>제 1 장 총칙</h2>
    <p>
        제 1 조 (목적)<br>
        본 약관은 북스테이션(이하 "회사"라 합니다)이 운영하는 북스테이션 인터넷 서점(이하 "서비스"라 합니다)에서 제공하는 서비스의 이용조건 및 절차, 이용자와 회사의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
    </p>
    
    <h2>제 2 장 회원가입</h2>
    <p>
        제 2 조 (회원가입 신청)<br>
        회원가입은 이용자가 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 이루어집니다.
    </p>
    
    <h2>제 3 장 서비스 이용계약</h2>
    <p>
        제 3 조 (이용계약의 성립)<br>
        회사와 이용자 사이의 서비스 이용계약은 이용자의 이용신청에 대한 회사의 이용허가로 성립됩니다.
    </p>
    
    <!-- 이하 생략 -->
    
    <h2>제 4 장 서비스 이용</h2>
    <p>
        제 10 조 (정보의 제공 및 광고의 게재)<br>
        ① 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 게시하거나 제공할 수 있습니다.<br>
        ② 회사는 서비스의 운영과 관련하여 서비스 화면, 홈페이지 등에 광고를 게재할 수 있습니다.
    </p>
    
    <h2>제 5 장 이용자의 의무</h2>
    <p>
        제 15 조 (이용자의 아이디 및 비밀번호 관리)<br>
        ① 아이디(ID)와 비밀번호에 관한 관리책임은 이용자에게 있습니다.<br>
        ② 회원은 자신의 아이디 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.<br>
        ③ 회사는 이용자가 자신의 아이디 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 회원의 요청에 따라 해당 비밀번호를 변경할 수 있습니다.
    </p>
    
    <h2>제 6 장 회사의 의무</h2>
    <p>
        제 20 조 (개별 서비스 이용약관 및 이용조건 등의 준수)<br>
        회사는 제공하는 개별 서비스에 대한 이용약관 및 이용조건을 별도로 둘 수 있으며, 해당 내용이 본 약관과 상충할 경우에는 개별 서비스 이용약관을 우선하여 적용합니다.
    </p>
    
    <!-- 이하 생략 -->
    
    <h2>부칙</h2>
    <p>본 약관은 2024년 5월 9일부터 시행됩니다.</p>

	</div>

	<!-- bottom -->
	<jsp:include page="bottom.jsp" flush="false" />

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
<!--===============================================================================================-->	
	<!-- 검색창 누르면 배경 흰색으로 변하게 하고 싶은데 어떡하지. -->

	<script src="https://jquery.com/"></script>

	<script>
		$(".searchbar input").focus(function(){
			$("div.searchbar").addClass("active-input");
		});
		
		$(".searchbar input").blur(function(){
			$("div.searchbar").removeClass("active-input");
		});
	</script>
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
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
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