<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>베스트셀러</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<style>
		a.active-menu{
			font-weight:800;
			color: #6c7ae0;
			background-color: #eeeeee;
			border-radius:10px 10px 0px 0px;
			border-bottom:none;
		}
		.bestseller-tab a:hover {
			background-color: #eeeeee;
			border-radius: 10px;
		}
	</style>
</head>
<%
	String sort = request.getParameter("sort");
	String category = request.getParameter("category");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String weeks = request.getParameter("weeks");
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

			<a href="bestseller.do?sort=weekly&category=&year=2024&month=05&weeks=4" class="stext-109 cl8 hov-cl1 trans-04">
				베스트셀러
				<!-- <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i> -->
			</a>
		</div>
	</div>
	
	<!-- 본문 -->
	<section class="bg0 p-t-0 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 사이드바 수정 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="p-t-20 p-lr-30">
							<h4 class="mtext-112 cl2 p-b-33"  style="font-weight: 800">
							베스트셀러
							</h4>
							<ul>
								<li style="border-top: 1px solid black;"><a href="bestseller.do?sort=<%=sort%>&category=&year=<%=year %>&month=<%=month %>&weeks=<%=weeks %>" class="dis-block stext-115 cl6 trans-04 p-tb-5 p-lr-6 list-group-item-action">종합</a></li>
								<c:forEach var="ctgr" items="${mainCtgrList}">
									<li>
										<a href="bestseller.do?sort=<%=sort%>&category=${ctgr.category_mainID}&year=<%=year %>&month=<%=month %>&weeks=<%=weeks %>"
											 class="dis-block stext-115 cl6 trans-04 p-tb-5 p-lr-6 list-group-item-action">${ctgr.category_main}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!-- 사이드바 수정 -->
			
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-24 order-md-2">
					<div class="p-r-45 p-r-0-lg">	
						<!-- 상단부 -->
						<div class="con">
							<!-- 주간, 월간, 역대, 어제, 신간, 스테디 -->
							<div class="bestseller-tab">
								<div class="flex-w h-full">
									<a href="bestseller.do?sort=weekly&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 weekly" id="weekly">주간 베스트</a>
									<a href="bestseller.do?sort=monthly&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 monthly" id="monthly">월간 베스트</a>
									<a href="bestseller.do?sort=yearly&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 yearly" id="year">역대 베스트</a>
									<a href="bestseller.do?sort=yesterday&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 yesterday" id="yesterday">어제 베스트</a>
									<a href="bestseller.do?sort=new&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 new" id="new">신간 베스트</a>
									<a href="bestseller.do?sort=steady&category=&year=2024&month=05&weeks=4" class="flex-c-m trans-04 steady" id="steady">스테디셀러</a>
								</div>
							</div>
							<!-- 책 갯수 -->
							<div class="count-txt"> 
								<span>총 ${count}개의 상품이 있습니다.</span>
							</div>
							<c:if test="${sort eq 'weekly'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
									<select id="year-sel" onchange="yearSelection()">
										<option value="2024">2024년</option>
										<option value="2023">2023년</option>
										<option value="2022">2022년</option>
										<option value="2021">2021년</option>
										<option value="2020">2020년</option>
									</select>
									<select id="month-sel" onchange="monthSelection()">
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<c:if test="${year ne '2024'}">
											<option value="06">6월</option>
											<option value="07">7월</option>
											<option value="08">8월</option>
											<option value="09">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</c:if>
									</select>
									<select id="week-sel" onchange="weekSelection()">
										<c:forEach var="weeks" items="${allWeeksOfMonth}">
											<option value="${weeks.week_of_month}">${weeks.week_of_month}주</option>
										</c:forEach>
									</select>
								</form>
								<div class="count-txt"> 
									<span>${year}년 ${month}월 ${weeks}주 동안 가장 많은 고객들이 구매한 국내도서 순위입니다.</span>
								</div>
							</c:if>
							<c:if test="${sort eq 'monthly'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
									<select id="year-sel" onchange="yearSelection()">
										<option value="2024">2024년</option>
										<option value="2023">2023년</option>
										<option value="2022">2022년</option>
										<option value="2021">2021년</option>
										<option value="2020">2020년</option>
									</select>
									<select id="month-sel" onchange="monthSelection()">
										<option value="01">1월</option>
										<option value="02">2월</option>
										<option value="03">3월</option>
										<option value="04">4월</option>
										<option value="05">5월</option>
										<c:if test="${year ne '2024'}">
											<option value="06">6월</option>
											<option value="07">7월</option>
											<option value="08">8월</option>
											<option value="09">9월</option>
											<option value="10">10월</option>
											<option value="11">11월</option>
											<option value="12">12월</option>
										</c:if>
									</select>
								</form>
								<div class="count-txt"> 
									<span>${year}년 ${month}월 동안 가장 많은 고객들이 구매한 국내도서 순위입니다.</span>
								</div>
							</c:if>
							<c:if test="${sort eq 'yearly'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
									<select id="year-sel" onchange="yearSelection()">
										<option value="2024">2024년</option>
										<option value="2023">2023년</option>
										<option value="2022">2022년</option>
										<option value="2021">2021년</option>
										<option value="2020">2020년</option>
									</select>
								</form>
								<div class="count-txt"> 
									<span>${year}년 동안 가장 많은 고객들이 구매한 국내도서 순위입니다.</span>
								</div>
							</c:if>
							<c:if test="${sort eq 'yesterday'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
								</form>
								<div class="count-txt"> 
									<span>어제 동안 가장 많은 고객들이 구매한 국내도서 순위입니다.</span>
								</div>
							</c:if>
							<c:if test="${sort eq 'new'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
								</form>
								<div class="count-txt"> 
									<span>최근 한 달 동안 발행된 책 중 일주일 동안 가장 많이 판매된 순위입니다.</span>
								</div>
							</c:if>	
							<c:if test="${sort eq 'steady'}">
								<form class="sel-date">
									<c:if test="${category eq ''}">
										<span class="cl2">종합</span>
									</c:if>
									<c:if test="${category ne ''}">
										<span class="cl2">${ctgrMain.category_main}</span>
									</c:if>
								</form>
								<div class="count-txt"> 
									<span>발행한지 2년이 넘는 책들 중 일주일 동안 가장 많이 판매된 순위입니다.</span>
								</div>
							</c:if>		
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
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="../../js/booklist.js"></script>
	<script>
 	$(function(){
 		$('a.<%=sort%>').addClass('active-menu')
 	});
	</script>
	<script>
	function yearSelection(){
		const selectedYear = $('select#year-sel').val();
		
		location.href=
			"bestseller.do?sort=<%=sort%>&category=<%=category%>&year=" + selectedYear + "&month=01&weeks=1"
	}
	function monthSelection(){
		const selectedMonth = $('select#month-sel').val();
		
		location.href=
			"bestseller.do?sort=<%=sort%>&category=<%=category%>&year=<%=year%>&month=" + selectedMonth + "&weeks=1"
	}
	function weekSelection(){
		const selectedWeek = $('select#week-sel').val();
		
		location.href=
			"bestseller.do?sort=<%=sort%>&category=<%=category%>&year=<%=year%>&month=<%=month%>&weeks=" + selectedWeek
	}	
	</script>
	<script>
	$(function(){
		$("select[id=year-sel] option[value=<%=year%>]").prop("selected", true);
		$("select[id=month-sel] option[value=<%=month%>]").prop("selected", true);
		$("select[id=week-sel] option[value=<%=weeks%>]").prop("selected", true);
	})
	</script>
</body>
</html>