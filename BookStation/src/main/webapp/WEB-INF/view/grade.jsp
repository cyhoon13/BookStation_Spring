<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>등급확인</title>
<script>
	$(function(){

	})
</script>
</head>
<body class="animsition">
	
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
         <span class="stext-109 cl4">
            grade
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
                  <div class="wrap-pic-w how-pos5-parent">
                  </div>
                  <!-- 등급 -->
                  <div class="con">
                     <div class="title">
                        <h3>Grade</h3>
                        <hr style="border: 1px solid black;">
                     </div>
                     <div class="title">
                        <h3>Grade Venefit</h3>
                     </div>
                     <table class="mp_table type01" height="50">
                        <colgroup>
                           <col width="200">
                           <col width="250">
                           <col width="550">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th class="normal">등급</th>
                              <th class="p10">선정기준</th>
                              <th class="p10">혜택</th>
                           </tr>
                           <c:forEach var="grade" items="${gradeList }" varStatus="gradeStatus">
                              <c:set var="totalPrice" value="${grade.grade_totalPrice }" />
                               <c:set var="totalPriceDivide" value="${totalPrice/10000 }" />
                              <tr>
                                 <td class="normal" style="text-align: center; padding: 30px 0;"><img src="images/icons/${grade.grade_name }.png" alt="ICON-PAY" style="width: 100px;"></td>
                                 <c:choose>
                                    <c:when test="${gradeStatus.index<2 }">
                                       <td class="p10">최근 6개월내 순수구매총액<br><b><fmt:formatNumber value="${totalPriceDivide}" pattern="#,##0"/>만원</b> 이상인 고객님</td>
                                    </c:when>
                                    <c:otherwise>
                                       <td class="p10">이제 막 가입한 새싹 고객님</td>
                                    </c:otherwise>
                                 </c:choose>
                                 <td class="p10">
                                    • 매월 1일에 <fmt:formatNumber value="${grade.grade_plusPoint}" pattern="#,##0"/> 포인트 적립 (1천원 이상 포함 2만원 이상 주문시 사용 가능)<br>
                                    • 주문금액의 ${grade.grade_ratePoint }% 포인트 적립 (실결제금액 기준)
                                    <c:if test="${grade.grade_name=='Bronze' }">
                                       <br>• 신규가입시 <fmt:formatNumber value="${grade.grade_plusPoint}" pattern="#,##0"/> 포인트 즉시 적립
                                    </c:if>
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
                  <!-- /등급 -->
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