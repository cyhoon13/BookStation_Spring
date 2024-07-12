<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   --%>
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
	<link rel="stylesheet" type="text/css" href="css/qnaWrite.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/qnaUpdate.js"></script>
<title>질문작성하기</title>
<style>
	.error {
	    color: red;
	}
</style>
</head>
<body>

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
			<a href="mypage.do" class="stext-109 cl8 hov-cl1 trans-04">
				My Page
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				QnA Update
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
						<!-- 문의작성 -->
						<div class="con">
							<div class="title">
								<h3>My Page</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h3>My QnA</h3>
								<a href="qna.do" class="btn type01">문의 내역보기 〉</a>
							</div>
							<form action="qnaUpdate.do" method="post" onsubmit="return validateForm()">
								<table class="mp_table type01">
									<colgroup>
										<col width="200">
										<col width="800">
									</colgroup>
									<tbody>
										<c:forEach var="update" items="${updateList }">
											<tr>
												<th class="normal">아이디</th>
												<td colspan="3" class="p10">
													<input type="hidden" name="member_id" value="${update.member_id }">${update.member_id }
													<input type="hidden" name="qna_id" value="${update.qna_id }">
												</td>
											</tr>
											<tr>
												<th class="normal">* 질문 유형</th>
												<td colspan="3" class="p10">
													<select name="qna_type">
														<option value="1">회원정보</option>
														<option value="2">반품/교환</option>
														<option value="3">주문/결제</option>
														<option value="4">배송</option>
														<option value="5">도서/상품정보</option>
														<option value="6">불편사항</option>
														<option value="7">기타</option>
													</select>
												</td>
											</tr>
											<tr>
												<th class="normal">* 제목</th>
												<td colspan="3" class="p10">
													<input class="input-field" type="text" id="qna_title" name="qna_title" value="${update.qna_title }" placeholder="제목을 입력해주세요">
													<span id="titleError" class="error"></span>
												</td>
											</tr>
											<tr height="300px">
												<th class="normal">* 내용</th>
												<td colspan="3" class="p10">
													<textarea class="textarea-field" id="qna_content" name="qna_content" cols="80" rows="10" placeholder="내용을 입력해주세요" oninput="countCharacters()">${update.qna_content }</textarea>
													<span id="contentError" class="error"></span>
													<span style="float: right; margin-right: 20px;">현재 <span id="charCount">0</span> / 총 1500자</span>
													<span class="orange">* 표시된 항목은 필수입력입니다</span>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="button-container">
									<button class="button" type="submit">수정하기</button>
									<button class="opposite-button" type="button" onclick="history.back()">취소</button>
								</div>
							</form>
						</div>
						<!-- /문의작성 -->
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