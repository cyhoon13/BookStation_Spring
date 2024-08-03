<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.File, java.io.FileReader, java.io.BufferedReader, java.io.IOException" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>책 상세</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
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
	<link rel="stylesheet" type="text/css" href="css/cart.css">
<!--===============================================================================================-->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		$(function() {
			const infoImg = $("#bookInfoImage");
			const infoTxt = $("#bookContents");
			var wid = infoImg.width();

			if (wid < 400){
				infoImg.removeAttr("src");
				if (infoTxt.text() == "	"){
					infoTxt.text("이 책은 출판사로부터 제공되는 소개가 없습니다.");
				}
			} else {
				infoTxt.empty();
			}
		})	
	</script>
</head>
<body class="animsition">

	<!-- top -->
    <div style="height:124px">
    	<jsp:include page="top.jsp" flush="false" />
    </div>
      
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				${category_main} 
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				${category_sub}
			</span>
		</div>
	</div>
		
	<!-- Alert 메시지 표시 -->
    <c:if test="${not empty param.message}">
        <script>
            alert("${param.message}");
        </script>
    </c:if>

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<form action="addcart.do" method="post">
			<%-- 	<input type="hidden" name="member_id" value="${member_id}"> --%>
				<input type="hidden" name="isbn" value="${onebook.isbn}">
				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
								<div class="slick3 gallery-lb">
									<div class="item-slick3">
										<div class="wrap-pic-w pos-relative">
											<img id="bookImage" src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${onebook.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'" style="max-width:400px;margin:auto">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 id="book_name" class="mtext-105 cl2 js-name-detail p-b-14">
								${onebook.book_name}
							</h4>
							<span id="book_price" class="mtext-106 cl2">
								<fmt:formatNumber value="${onebook.book_price * (100 - onebook.book_discount) / 100}" pattern="###,###원" />
							</span>
							<div class="flex-w flex-m m-l-140 p-t-25">
								<c:set var="score" value="${onebook.book_score / 10}" />
								<c:set var="intPart" value="${score - (score % 1)}" />
								<c:set var="fractionPart" value="${score % 1}" />
								<span class="fs-18 cl11 input-group">
									<p style="color: Black">별점 :</p> 
									<c:forEach var="i" begin="1" end="5" step="1">
										<c:choose>
											<c:when test="${i <= intPart}">
												<i class="zmdi zmdi-star"></i>
											</c:when>
											<c:when test="${i == intPart + 1 && fractionPart > 0}">
												<i class="zmdi zmdi-star-half"></i>
											</c:when>
											<c:otherwise>
												<i class="zmdi zmdi-star-outline"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</span>
							</div>
							<hr>
							<div class="p-t-20">
								<div class="p-l-90">
									<div class="flex-w flex-r-m p-b-12">
										<div class="size-203 flex-c-m respon6">정가</div>
										<div id="bookPrice" value="10000" class="size-204 respon6-next">
											<fmt:formatNumber value="${onebook.book_price}" pattern="###,###원"/>
										</div>
									</div>
									<div class="flex-w flex-r-m p-b-12">
										<div class="size-203 flex-c-m respon6">판매가</div>
										<div id="bookSale_price2" class="size-204 respon6-next">
											<fmt:formatNumber value="${onebook.book_price * (100 - onebook.book_discount) / 100}" pattern="###,###원"/>
										</div>
									</div>
									<div class="flex-w flex-r-m p-b-12">
										<div class="size-203 flex-c-m respon6">적립금</div>
										<div class="size-204 respon6-next m-b-10">
											<fmt:formatNumber value="${onebook.book_price * 0.05}" pattern="###,###원"/>
											(5%)
										</div>
									</div>
								</div>
								<hr>
								<div class="wrap-num-product flex-w m-t-30 m-l-160">
									<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>
									<input class="mtext-104 cl3 txt-center num-product" type="number" name="bookCount" value="1">
									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>
								<button type="submit" class="flex-c-m stext-101 cl0 size-121 bg1 bor1 hov-btn1 p-lr-15 trans-04 m-t-30 btn_cart">
									장바구니 담기
								</button>
			</form>
								<form action="addToCartAndRedirect.do" method="post">
					                <input type="hidden" name="isbn" value="${onebook.isbn}">
					                <input type="hidden" id="buyNowBookCount" name="bookCount" value="1">
					                <button type="submit" class="flex-c-m stext-101 cl0 size-121 bg1 bor1 hov-btn1 p-lr-15 trans-04 m-t-20 btn_buy">
					                    바로구매
					                </button>
					            </form>
							</div>
						</div>
					</div>
				</div>
		</div>
		
		<!-- 도서 정보 -->
		<div class="bor10 m-t-50 p-t-43 p-b-40">
		
			<!-- Tab01 -->
			<div class="tab01">
			
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10">
						<a class="nav-link active" data-toggle="tab" href="#bookinfo1" role="tab">책소개</a>
					</li>
					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#bookinfo2" role="tab">목차</a>
					</li>
					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#bookinfo3" role="tab">도서정보</a>
					</li>
					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#bookinfo4" role="tab">리뷰</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">

						<!-- 책 내용 -->
						<div class="tab-pane fade show active" id="bookinfo1" role="tabpanel">
							<div class="how-pos2 p-lr-15-md" style="text-align:center">
								<p id="bookContents" class="stext-102 cl6" style="text-align:left">${info}	</p>
								<img id="bookInfoImage" src="https://contents.kyobobook.co.kr/sih/fit-in/814x0/dtl/illustrate/${onebook.isbn.substring(onebook.isbn.length()-3, onebook.isbn.length())}/i${onebook.isbn}.jpg" style="max-width:100%;margin:auto" alt="">
							</div>
						</div>
						
						<!-- 목차 -->
						<div class="tab-pane fade" id="bookinfo2" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									${content}
								</p>
							</div>
						</div>
						
						<!-- 도서 정보 -->
						<div class="tab-pane fade" id="bookinfo3" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
									
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												ISBN
											</span>
											<span id="isbn" class="stext-102 cl6 size-206">
												${onebook.isbn}
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												작가
											</span>
											<span id="book_author" class="stext-102 cl6 size-206">
												${onebook.book_author}
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												출판사
											</span>
											<span id="bookPublisher" class="stext-102 cl6 size-206">
												${onebook.book_publisher}
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												발행일
											</span>
											<span id="book_pubdate" class="stext-102 cl6 size-206">
												${onebook.book_pubdate}
											</span>
										</li>
										
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												재고
											</span>
											<span id="book_quantity" class="stext-102 cl6 size-206">
												${onebook.book_quantity}
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!-- 리뷰 -->
						
						<div class="tab-pane fade" id="bookinfo4" role="tabpanel">
							<!-- <div class="row"> -->
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<c:forEach var="review" items="${reviews}">
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="images/bookreview.png" alt="AVATAR">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														${review.review_id}
													</span>

													<span class="fs-18 cl11">
												    <c:set var="score" value="${review.review_score / 10}" />
												    <c:set var="intPart" value="${score - (score % 1)}" />
												    <c:set var="fractionPart" value="${score % 1}" />
												    <c:forEach var="i" begin="1" end="5" step="1">
												        <c:choose>
												            <c:when test="${i <= intPart}">
												                <i class="zmdi zmdi-star"></i>
												            </c:when>
												            <c:when test="${i == intPart + 1 && fractionPart > 0}">
												                <i class="zmdi zmdi-star-half"></i>
												            </c:when>
												            <c:otherwise>
												                <i class="zmdi zmdi-star-outline"></i>
												            </c:otherwise>
												        </c:choose>
												    </c:forEach>
													</span>
												</div>

												<p class="stext-102 cl6">
													${review.review_content}
												</p>
											</div>
										</div>
										</c:forEach>
										
										<!-- 리뷰작성 -->
										<!-- <form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												리뷰 쓰기
											</h5>
											<p class="stext-102 cl6">
												로그인을 하시면 리뷰를 작성하실 수 있습니다.
											</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													도서 평점
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">내용</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div> -->
												

												<!-- <div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">닉네임</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div> 
											</div>

											<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												등록하기
											</button>-->
									
										
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Related Products -->
<section class="sec-relate-product bg0 p-t-45 p-b-105">
	<div class="container">
		<div class="p-b-45">
			<h3 class="ltext-106 cl5 txt-center">
				함께 구매한 상품
			</h3>
		</div>

		<!-- Slide2 -->
		
		<div class="wrap-slick2">
			<div class="slick2">
				<c:forEach var="book" items="${detailBookList}">
				<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img id="imageSource" src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" alt="IMG-PRODUCT">
							<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								자세히 보기
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="detail.do?isbn=${book.isbn}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${book.book_name}
								</a>
								<span class="stext-105 cl3">
									${book.book_author} · ${book.book_publisher}
								</span>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
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
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
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
	<script src="js/script.js"></script>
</body>
</html>