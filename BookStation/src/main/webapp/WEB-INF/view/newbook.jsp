<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>신간도서</title>
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
	String category = request.getParameter("category");
	
	System.out.println(category);
%>
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

			<a href="newbook.do?sort=new" class="stext-109 cl8 hov-cl1 trans-04">
				신간도서
			</a>
		</div>
	</div>
	
	<!-- 본문 -->
	<section class="bg0 p-t-0 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 사이드바 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="p-t-20 p-lr-30">
							<h4 class="mtext-112 cl2 p-b-33"  style="font-weight: 800">
								신간도서
							</h4>
							<ul>
								<li style="border-top: 1px solid black;"><a href="newbook.do?sort=${sort}&category=" class="dis-block stext-115 cl6 trans-04 p-tb-5 p-lr-6 list-group-item-action">종합</a></li>
								<c:forEach var="ctgr" items="${mainCtgrList}">
									<li>
										<a href="newbook.do?sort=${sort}&category=${ctgr.category_mainID}" class="dis-block stext-115 cl6 trans-04 p-tb-5 p-lr-6 list-group-item-action">${ctgr.category_main}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!-- 사이드바 -->

			
				<!-- 본문  -->
				<div class="col-md-8 col-lg-9 p-b-24 order-md-2">
					<div class="p-r-45 p-r-0-lg">	
						<!-- 상단부 -->
						<div class="con">
							<form class="sel-date">
								<c:if test="${category eq ''}">
									<span class="cl2">종합</span>
								</c:if>
								<c:if test="${category ne ''}">
									<span class="cl2">${selectedMain.category_main}</span>
								</c:if>
							</form>
							<!-- 책 갯수 -->
							<div class="count-txt"> 
								<span>이 분야에 ${count}개의 상품이 있습니다.</span>
								<hr>
							</div>
							<!-- 정렬필터 -->
							<div class="filter-menu-desktop">
								<ul class="filter-menu">
									<!-- 메뉴 클릭시 active-menu 추가됨 -->
									<li class="sales"><a href="newbook.do?category=${mainID}&sort=sales">판매량순</a></li>
									<li class="new"><a href="newbook.do?category=${mainID}&sort=new">출간일순</a></li>
									<li class="abc"><a href="newbook.do?category=${mainID}&sort=abc">상품명순</a></li>
									<li class="rev"><a href="newbook.do?category=${mainID}&sort=rev">평점순</a></li>
									<li class="minv"><a href="newbook.do?category=${mainID}&sort=minv">저가격순</a></li>
									<li class="maxv"><a href="newbook.do?category=${mainID}&sort=maxv">고가격순</a></li>
								</ul>
							</div>
							<hr style="margin: 0px">
						</div>
					
						<!-- 책 목록 - 20개 -->
						<jsp:include page="bookbody.jsp" flush="false" />
					</div>
				</div>
				<!-- 본문 수정 -->
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