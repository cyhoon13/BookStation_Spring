<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>가입된 계정 확인</title>
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
	<link rel="stylesheet" type="text/css" href="css/LogService.css">
<!--===============================================================================================-->
</head>
    </head>
    <body class="animsition">
        <div class="container">
            <div class="image"></div>
            <div class="form">
                <h3>가입된 계정 확인</h3>
                <h5>${member.member_name}님의 북스테이션 아이디입니다.</h5><br>
                <h6>아이디 : ${member.member_id}</h6><br>
                <h6>가입일 : ${member.reg_date}</h6><br>
                <button id="loginGo" class="flex-c-m stext-101 cl0 size-116 bg3 bor13 hov-btn3 p-lr-15 trans-04 pointer" onclick="location.href='login.do'">로그인하기</button>
                <button id="pwChange" class="flex-c-m stext-101 cl0 size-116 bg5 bor13 hov-btn3 p-lr-15 trans-04 pointer" onclick="location.href='pwChange.do?member_id=${member.member_id}'">비밀번호 재설정</button>
            </div>
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
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>