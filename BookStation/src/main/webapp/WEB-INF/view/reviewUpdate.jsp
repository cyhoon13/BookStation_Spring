<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MyPage.html</title>
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
	<link rel="stylesheet" type="text/css" href="css/board.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
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
	<section class="bg0  p-t-16 p-b-20">
		<div class="container" style="magin-right:auto; magin-left:auto;" >
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2" style="margin-top:16px;">
					<div class="p-r-45 p-r-0-lg">
						<div class="wrap-pic-w how-pos5-parent">
							<!-- <img src="images/blog-04.jpg" alt="IMG-BLOG">
								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center">
										22
									</span>
									<span class="stext-109 cl3 txt-center">
										Jan 2018
									</span>
								</div> -->
						</div>
							
						<!-- 내정보 -->
						<div class="con">
							<div class="title" style="font-size:20px; font-weight:bold;">
								리뷰 작성하기
								<hr style="border: 1px solid black;">
							</div>			
						</div>
						
						<!-- 별점 -->
<!-- 						<div class="bookimg"> -->
<!-- 						  <div class="star_rating"> -->
<!-- 							<img src="images/review-book.jpg" > -->
<!-- 							<div class="booktitle">벌거벗은 한국사</div> -->
<!-- 							<span class="star on" value="1"> </span> -->
<!-- 							<span class="star" value="2"> </span> -->
<!-- 							<span class="star" value="3"> </span> -->
<!-- 							<span class="star" value="4"> </span> -->
<!-- 							<span class="star" value="5"> </span> -->
<!-- 						  </div> -->
<!-- 						</div> -->
 						  <form id="reviewForm" action="updateSubmit.do" method="post">
 						  		<div class="bookimg">
								  <div class="star_rating">
									<img src="images/books/${book.isbn}.jpg" style="cursor:pointer;width:300px" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
									<div class="booktitle">${book.book_name}</div>
								  </div>
								</div>
						  		 <input type="hidden" name="review_id" value="${review_id}">
							     <input type="hidden" name="review_date" value="${review_date}">
							    <textarea class="star_box" name="review_content" >${review_content }</textarea>
							     <div class="star_rating">
				                 	<span class="star" value="10"></span>
				                    <span class="star" value="20"></span>
				                    <span class="star" value="30"></span>
				                    <span class="star" value="40"></span>
				                    <span class="star" value="50"></span>
				                 </div>
	                        	<input type="hidden" name="review_score" value="0">
							     <input type="hidden" name="isReview" value="${isReview}">
							     
						  	 	 <input type="submit" class="btn02" style="top:-45px; cursor: pointer;" value="리뷰 수정"/>
    					 		 <input type="button" class="btn03" style="top:-77px; cursor: pointer;" value="취소" onclick="history.back();"/>
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
	
		

	<!-- Footer -->
	<div style="height:124px">
		<jsp:include page="bottom.jsp" flush="false" />
	</div>


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
	<script>
         // 별점 선택 기능을 구현하는 기존 JS 코드
         $('.star_rating > .star').click(function() {
         $(this).parent().children('span').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');
                            
         // 별점 값을 hidden input에 설정
         var rating = $(this).attr('value');
            document.querySelector('input[name="review_score"]').value = rating; // 수정: 별점 값을 설정하는 부분 추가
         });
    </script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="js/tab.js"></script>

</body>
</html>