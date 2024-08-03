<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body class="animsition">

	<jsp:include page="top.jsp" flush="false" />
	
	<!-- Slider -->
	<!-- 슬라이더 data-apear 속성은 animate.css에서 더 많이 찾아볼 수 있음 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<!-- 첫번째 슬라이더 -->
				<div class="item-slick1" style="background-image: url(images/slide-1.png);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="font-family: 'MapoDacapo';font-size:28px">
									나는 직감적으로 알았다<br>이 사람의 음악은 영원할 것이란 걸
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="500">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="font-family: 'MapoDacapo';font-weight:800">
									얼음나무숲
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1000">
								<a href="detail.do?isbn=9791158886356" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" style="font-family: 'S-CoreDream-3Light';">
									상세보기
								</a>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 두번째 슬라이더 -->
				<div class="item-slick1" style="background-image: url(images/slide-2.png);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="font-family: 'Diphylleia-Regular';">
									"너의 기억을 깨워줄게."<br>2057년 서울, 잠든 과거를 찾아 떠나는 여정
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="500">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="font-family: 'Diphylleia-Regular';font-weight:800">
									다이브
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1000">
								<a href="detail.do?isbn=9788936457112" class="flex-c-m stext-101 cl0 size-101 bg10 bor1 hov-btn1 p-lr-15 trans-04" style="font-family: 'S-CoreDream-3Light';">
									상세보기
								</a>
							</div>
						</div>
					</div>
				</div>

				<!-- 세번째 슬라이더
				<div class="item-slick1" style="background-image: url(images/slide-3.png);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2" style="font-family: 'OG_Renaissance_Secret-Rg';font-size:30px">
									눈 뜨면 없어지는 모든 것들이<br>럭키데이스노우볼 펑 바스러지는 꿈에서
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="500">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="font-family: 'OG_Renaissance_Secret-Rg';font-weight:800;font-size:65px">
									럭키데이스노우볼
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1000">
								<a href="detail.do?isbn=9791198741201" class="flex-c-m stext-101 cl0 size-101 bg11 bor1 hov-btn1 p-lr-15 trans-04" style="font-family: 'S-CoreDream-3Light';">
									상세보기
								</a>
							</div>
						</div>
					</div>
				</div> -->

				<!-- 네번째 슬라이더 -->
				<div class="item-slick1" style="background-image: url(images/slide-4.png);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl13 respon2" style="font-family: 'ChosunCentennial';">
									"자살하기 직전,<br>테이프에 메세지를 남기는 사람들이 있어."
								</span>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="500">
								<h2 class="ltext-201 cl13 p-t-19 p-b-43 respon1" style="font-family: 'ChosunCentennial';font-weight:800;font-size:60px">
									죽은 자의 녹취록
								</h2>
							</div>
								
							<div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1000">
								<a href="detail.do?isbn=9791158792145" class="flex-c-m stext-101 cl0 size-101 bg14 bor1 hov-btn1 p-lr-15 trans-04" style="font-family: 'S-CoreDream-3Light';">
									상세보기
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- 베스트셀러 -->
	<section class="sec-product bg0 p-t-32 p-b-32">
		<div class="container">
			<div class="p-b-32">
				<h3 class="ltext-105 cl5 txt-left respon1">
					베스트셀러
				</h3>
			</div>
			
			<!-- Tab01 -->
			<div class="tab01">
				<!-- 필터 탭 -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10">
						<a class="nav-link active" data-toggle="tab" href="#weekly" role="tab">주간 베스트</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#yesterday" role="tab">어제 베스트</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#monthly" role="tab">월간 베스트</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#steady" role="tab">스테디셀러</a>
					</li>
				</ul>
				<hr class="m-t-16">
				<!-- 상품 패널 -->
				<div class="tab-content p-t-24">
				
					<!-- 주간 베스트 -->
					<div class="tab-pane fade show active" id="weekly" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${weekly}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
													<div class="block2-txt-child2 flex-r p-t-3">
														<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
	                                          				<i class="zmdi zmdi-shopping-cart"></i>
	                                       				</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 어제 베스트 -->
					<div class="tab-pane fade show" id="yesterday" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${yesterday}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-weight: 600">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
													<div class="block2-txt-child2 flex-r p-t-3">
														<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
															<i class="zmdi zmdi-shopping-cart"></i>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 월간 베스트 -->
					<div class="tab-pane fade show" id="monthly" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${monthly}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-weight: 600">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 스테디셀러  -->
					<div class="tab-pane fade show" id="steady" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${steady}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-weight: 600">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
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

	<!-- 회원님을 위한 추천 -->
	<section class="sec-product bg0 p-t-32 p-b-32" style="display: flow-root;">
		<div class="bg13 p-t-32 recom-con">
			<div class="container">
				<div class="p-b-24">
					<h3 class="ltext-104 cl5 txt-left respon1">
						회원님을 위한 추천
					</h3>
				</div>
	
				<!-- Tab01 -->
				<div class="tab01">
				
					<!-- 상품 패널 -->
					<div class="tab-content p-t-24">
						<!-- 할인 베스트 -->
						<div class="tab-pane fade show active" id="bigsale" role="tabpanel">
							<!-- Slide2 -->
							<div class="wrap-slick2">
								<div class="slick2">
									<c:forEach var="book" items="${discountBest}">
										<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
											<!-- Block2 main.css 2,040 라인 -->
											<div class="block2">
												<div class="block2-pic hov-img0">
													<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
		
													<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
														자세히 보기
													</a>
												</div>
		
												<div class="block2-txt flex-w flex-t p-t-14">
													<div class="block2-txt-child1 flex-col-l ">
														<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
															${book.book_name}
														</a>
														<span class="stext-104 cl3">
															${book.book_author} · ${book.book_publisher}
														</span>
													</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
													<div class="block2-txt-child2 flex-r p-t-3">
														<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
															<i class="zmdi zmdi-shopping-cart"></i>
														</div>
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
		</div>
	</section>

	<!-- 신간도서 -->
	<section class="sec-product bg0 p-t-32 p-b-50">
		<div class="container">
			<div class="p-b-32">
				<h3 class="ltext-105 cl5 txt-left respon1">
					화제의 신상
				</h3>
			</div>

			<!-- Tab01 -->
			<div class="tab01">
				<!-- 필터 탭 -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10">
						<a class="nav-link active" data-toggle="tab" href="#novel" role="tab">소설</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#essay" role="tab">시/에세이</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#economy" role="tab">경제/경영</a>
					</li>

					<li class="nav-item p-b-10">
						<a class="nav-link" data-toggle="tab" href="#comics" role="tab">만화</a>
					</li>
				</ul>
				<hr class="m-t-16">
				<!-- Tab panes -->
				<div class="tab-content p-t-24">
					<!-- 소설 -->
					<div class="tab-pane fade show active" id="novel" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${newNovel}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 시/에세이 -->
					<div class="tab-pane fade" id="essay" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${newEssay}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 경제/경영 -->
					<div class="tab-pane fade" id="economy" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${newEconomy}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 만화 -->
					<div class="tab-pane fade" id="comics" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
								<c:forEach var="book" items="${newComics}">
									<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
										<!-- Block2 main.css 2,040 라인 -->
										<div class="block2">
											<div class="block2-pic hov-img0">
												<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" onerror="this.onerror=null; this.src='images/books/blank.jpg'">
	
												<a href="detail.do?isbn=${book.isbn}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
													자세히 보기
												</a>
											</div>
	
											<div class="block2-txt flex-w flex-t p-t-14">
												<div class="block2-txt-child1 flex-col-l ">
													<a href="detail.do?isbn=${book.isbn}" class="mtext-108 cl10 hov-cl1 trans-04 js-name-b2 p-b-6 book-title">
														${book.book_name}
													</a>
													<span class="stext-104 cl3">
														${book.book_author} · ${book.book_publisher}
													</span>
												</div>
												<form name="addcart${book.isbn}" action="addcart.do" method="POST">
													<input type="hidden" name="isbn" value="${book.isbn}">
													<input type="hidden" name="bookCount" value="1">
												</form>
												<div class="block2-txt-child2 flex-r p-t-3">
													<div class="icon-header-item cl7 hov-cl1 trans-04 p-l-22 p-r-11" onclick="document.forms['addcart${book.isbn}'].submit();">
														<i class="zmdi zmdi-shopping-cart"></i>
													</div>
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


	<!-- bottom -->
	<jsp:include page="bottom.jsp" flush="false" />

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
<!--===============================================================================================-->	
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