<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>검색결과</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
	<link rel="stylesheet" type="text/css" href="css/bookList.css">
</head>
<%
	String sort = request.getParameter("sort");
%>
<!-- <body class="animsition"> -->
<body>
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	
	<!-- 경로 -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				홈
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				'${searchWord}' - ${selectedMain}
			</a>
		</div>
	</div>

	<!-- 본문 -->
	<section class="bg0 p-t-0 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 사이드바 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<jsp:include page="submenu-search.jsp" flush="false" />
				</div>
				<!-- 본문 -->
				<div class="col-md-8 col-lg-9 p-b-24 order-md-2">
					<div class="p-r-45 p-r-0-lg">	
						<!-- 상단부 -->
						<div class="con">
							<!-- 책 갯수 -->
							<div class="count-txt"> 
								<span>이 분야에 ${count}개의 상품이 있습니다.</span>
								<hr>
							</div>
							<!-- 정렬필터 -->
							<div class="filter-menu-desktop">
								<ul class="filter-menu">
									<!-- 메뉴 클릭시 active-menu 추가됨 -->
									<li class="sales"><a href="searchbook.do?sort=sales&searchField=${searchField}&searchWord=${searchWord}&category=${category}">판매량순</a></li>
									<li class="new"><a href="searchbook.do?sort=new&searchField=${searchField}&searchWord=${searchWord}&category=${category}">출간일순</a></li>
									<li class="abc"><a href="searchbook.do?sort=abc&searchField=${searchField}&searchWord=${searchWord}&category=${category}">상품명순</a></li>
									<li class="rev"><a href="searchbook.do?sort=rev&searchField=${searchField}&searchWord=${searchWord}&category=${category}">평점순</a></li>
									<li class="minv"><a href="searchbook.do?sort=minv&searchField=${searchField}&searchWord=${searchWord}&category=${category}">저가격순</a></li>
									<li class="maxv"><a href="searchbook.do?sort=maxv&searchField=${searchField}&searchWord=${searchWord}&category=${category}">고가격순</a></li>
								</ul>
							</div>
							<hr style="margin: 0px">
						</div>
						
						<!-- 책 목록 - 20개 -->
						<jsp:include page="bookbody.jsp" flush="false" />
					</div>
				</div>
				<!-- 본문 -->
			</div>
		</div>
	</section>	
	
	<jsp:include page="bottom.jsp" flush="false" />

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

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
			/* 			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html(); */
			var nameProduct = "test";
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
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
	<script>
 	$(function(){
 		$('li.<%=sort%>').addClass('active-menu')
 	});
	</script>
</body>
</html>