<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원가입</title>
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
<!-- 유효성검사 메세지 css -->
	<link rel="stylesheet" type="text/css" href="css/message.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<form action="register.do" method="post">
		<div class="container">
			<div class="image"></div>
			<!-- 약관 동의 -->
			<div class="agreeform">
				<h3>이용약관 동의</h3>
				<div id="terms">
					<input type="checkbox" id="allAgree"> <label for="allAgree">전체 동의하기</label><br>
					<input type="checkbox" id="required1" class="agree"> <label for="required1">[필수] 북스테이션 서비스 이용약관</label><br>
					<input type="checkbox" id="required2" class="agree"> <label for="required2">[필수] 개인정보 수집 및 이용 동의</label><br>
					<input type="checkbox" id="required3" class="agree"> <label for="required3">[필수] 커뮤니티 이용약관</label><br>
					<input type="checkbox" id="optional" class="agree"> <label for="optional">[선택] 마케팅 목적 개인정보 수집이용 동의</label><br>
				</div>
				<button id="nextbutton" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer" disabled>다음</button> 
			</div>
			<!-- 기본 정보 입력 -->
			<div class="basicform">
				<h3>기본 정보 입력</h3>
				<div>
					<input type="text" id="userId" class="form-control" name="member_id" placeholder="아이디">
					<div class="valid-message1">사용할 수 있는 아이디입니다.</div>
                	<div class="invalid-message1">아이디는 영문 소문자와 숫자를 포함한 5~20자입니다.</div>
                	<div class="invalid-message2">이미 사용중인 아이디입니다.</div>
					<input type="password" id="userPwd" class="form-control" name="member_password" placeholder="비밀번호">
					<div class="valid-message2">올바른 비밀번호 형식입니다.</div>
               		<div class="invalid-message3">비밀번호는 영문과 숫자를 포함한 8~16자입니다.</div>
					<input type="password" id="rePwd" class="form-control" name="" placeholder="비밀번호 확인">
					<div class="valid-message3">비밀번호가 일치합니다</div>
                	<div class="invalid-message4">비밀번호가 일치하지 않습니다.</div>
					<input type="text" id="userName" class="form-control" name="member_name" placeholder="이름">
					<div class="buttondiv">
						<input type="text" id="birth" class="form-control" name="member_birthday" placeholder="생년월일 8자리" oninput="formatDate(this)">
						<input type="radio" name="member_gender" id="man" class="radio-button" value="남" checked><label for="man">남자</label>
         				<input type="radio" name="member_gender" id="woman" class="radio-button" value="여"><label for="woman">여자</label>
					</div>
					<div class="buttondiv">
						<input type="text" id="userEmail" class="form-control" name="member_email" placeholder="이메일">
						<button id="sendemailbutton" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">인증번호 발송</button>
					</div>
					<div class="buttondiv">
						<input type="text" id="emailNum" class="form-control" name="" placeholder="인증번호 6자리" disabled>
						<button id="emailnumcheck" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">인증번호 확인</button>
					</div>	
				</div>
				<button id="nextbutton2" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer" disabled>다음</button>
			</div>
			<!-- 배송 정보 입력 -->
			<div class="shippingform">
				<h3>배송 정보 입력</h3>
				<div>
					<div class="buttondiv">
						<input type="text" id="addr" class="form-control" name="member_zipcode" placeholder="우편번호" required>
						<input type="button" value="우편번호 검색" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer" onclick="sample6_execDaumPostcode()">
					</div>					
					<input type="text" id="addr2" class="form-control" name="member_address1" placeholder="도로명 주소" required>
					<input type="text" id="addr3" class="form-control" name="member_address2" placeholder="상세 주소" required>
					<input type="text" id="phone" class="form-control" name="member_phone" placeholder="전화번호" required oninput="numberphone(this)">
				</div>
				<button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer">회원가입</button>
			</div>
		</div>
	</form>
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
	<script>
		//전체 동의하기
		$(document).ready(function() {
			$('#allAgree').change(function() {
				if ($(this).is(':checked')) {
					$('.agree').prop('checked', true);
				} else {
					$('.agree').prop('checked', false);
				}
			});
		});
		//다음 버튼 클릭 시 약관동의, 기본정보입력, 배송정보입력 순서대로 보이기
		$(document).ready(function() {
			$('.basicform').hide(); 
			$('.shippingform').hide();

			$('#nextbutton').on('click', function() {
				$('.agreeform').hide(); // 첫 번째 컨테이너 숨기기
				$('.basicform').show(); // 두 번째 컨테이너 표시
			});

			$('#nextbutton2').on('click', function() {
				$('.basicform').hide(); // 두 번째 컨테이너 숨기기
				$('.shippingform').show(); // 세 번째 컨테이너 표시
			});
		});
	      /*
	      //이메일 인증
	      var code = "";  // 이메일 전송 인증번호 저장 위한 코드
	      var isVerified = false;  // 인증번호가 일치하는지 확인하는 상태

	   	  // 기본 정보를 모두 입력시에만 다음 버튼 활성화
	      $('#userId, #userPwd, #rePwd, #userName, #birth, #userEmail, #emailNum').on('input', function() {
	          updateNextButtonState2();
	      });

	      // 인증번호 이메일 전송 
	      $("#sendemailbutton").click(function() {
	          var email = $("#userEmail").val();  // 입력한 이메일
	          var checkBox = $("#emailNum");  // 인증번호 입력란

	          $.ajax({
	              type: "GET",
	              url: "mailCheck.do?email=" + email,
	              success: function(data) {
	                  checkBox.attr("disabled", false);
	                  code = data;
	                  isVerified = false;  // 새로운 인증번호가 발송되면 인증 상태를 초기화
	                  alert("인증번호가 발송되었습니다.");  // 인증번호 발송 알림 메시지
	              },
	              error: function(xhr, status, error) {
	                  if (xhr.status === 400) {
	                      alert("유효하지 않은 이메일 주소입니다. 다시 시도해주세요.");  // 이메일 주소 유효하지 않음
	                  }
	              }
	          });
	      });

	      // 인증번호 비교
	      $("#emailnumcheck").click(function() {
	          var inputCode = $("#emailNum").val();  // 입력코드

	          if (inputCode === code) {  // 일치할 경우
	              alert("인증이 완료되었습니다.");
	              isVerified = true;
	          } else {  // 일치하지 않을 경우
	              alert("인증번호를 다시 확인해주세요.");
	              isVerified = false;
	          }
	          updateNextButtonState2();  // 인증 상태 변경 시에도 버튼 상태 업데이트
	      });

	      function updateNextButtonState2() {
	          var allFilled = true;

	          if ($('#userId').val() === '' || $('#userPwd').val() === '' || $('#rePwd').val() === '' || $('#userName').val() === '' || $('#birth').val() === '' || $('#userEmail').val() === '' || $('#emailNum').val() === '') {
	              allFilled = false;
	          }

	          if (allFilled && isVerified) {  // 두 조건이 모두 충족될 때
	              $('#nextbutton2').prop('disabled', false);
	          } else {
	              $('#nextbutton2').prop('disabled', true);
	          }
	      }
	      */
	    //우편번호 검색
		function sample6_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수
		
		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('addr').value = data.zonecode;
		            document.getElementById('addr2').value = addr;
		            // 상세주소 입력란에 포커스 설정
		            document.getElementById('addr3').focus();
		        }
		    }).open();
		}
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!-- 유효성검사를 위한 js -->
	<script src="js/validation.js"></script>
<!-- 우편번호 검색 API -->	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--===============================================================================================-->
</body>
</html>