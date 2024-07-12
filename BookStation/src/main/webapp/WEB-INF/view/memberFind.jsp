<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>계정 정보 찾기</title>
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
<style>
	/* LogService.css에 거의 다 있지만 이 페이지에서만 다른 부분 */
    /* text박스와 옆에 버튼오게하기 */
	.buttondiv input[type="text"],
	.buttondiv button {
		margin-bottom: 15px; 
	}
    .form h3 {
		margin-bottom: 10px;
	}
</style>
</head>
<body class="animsition">
    <div class="container">
        <div class="image"></div>
        <div class="form">
            <h3>계정 정보 찾기</h3>
            <form action="idSearch.do" method="post">
                <div>
                    <input type="text" id="username" class="form-control" name="member_name" placeholder="이름" required>
                    <div class="buttondiv">
                        <input type="text" id="email" class="form-control" name="member_email" placeholder="이메일" required>
                        <button type="button" id="sendemailbutton2" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">인증번호 발송</button>
                    </div>
                    <div class="buttondiv">
                        <input type="text" id="emailnum" class="form-control" name="" placeholder="인증번호 6자리" required disabled>
                        <button type="button" id="emailnumcheck2" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">인증번호 확인</button>
                    </div>	
                </div>
                <button id="findButton" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer" type="submit" disabled>다음</button>
            </form>
            <!-- 에러메시지를 JavaScript alert로 출력 -->
		    <c:if test="${not empty message}">
		        <script type="text/javascript">
		            alert("${message}");
		        </script>
		    </c:if>    
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
<!-- 유효성검사를 위한 js -->
	<script src="js/validation.js"></script>
</body>
</html>