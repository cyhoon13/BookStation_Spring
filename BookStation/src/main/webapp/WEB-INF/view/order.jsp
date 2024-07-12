<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>주문</title>
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
   <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
   <link rel="stylesheet" type="text/css" href="css/util.css">
   <link rel="stylesheet" type="text/css" href="css/main.css">
   <link rel="stylesheet" type="text/css" href="css/cart.css">
<!--===============================================================================================-->
</head>
<body>
	 <!-- top -->
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
				Order
			</span>
		</div>
	</div>
	
	<!-- 에러 메시지 표시 -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            ${errorMessage}
        </div>
    </c:if>

	<!-- 상품확인 -->
	<form action="completed.do" method="POST">
    <div class="bg0 p-t-45">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b--20">
                    <div class="m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1">상품확인</th>
                                    <th class="column-2" style="padding-left:90px;">상품명</th>
                                    <th class="column-3" style="padding-left:45px;">가격</th>
                                    <th class="column-4">수량</th>
                                    <th class="column-5">총 상품금액</th> 
                                </tr>
                                
                                <c:forEach var="item" items="${cartList}">
                                    <tr class="table_cart">
                                        <td class="column-1">
                                            <div class="how-itemcart1">
                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${item.isbn}.jpg" alt="IMG">
                                            </div>
                                        </td>
                                        <td class="column-2">${item.book_name}</td>
                                        <td class="column-3"><fmt:formatNumber value="${item.book_price * (100 - item.book_discount) / 100}" pattern="###,###원" /></td>
                                        <td class="column-4">${item.bookCount}권</td>
                                        <td class="column-5" ><fmt:formatNumber value="${(item.book_price * (100 - item.book_discount) / 100) * item.bookCount}" pattern="###,###원"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <!-- 장바구니 돌아가기 -->
                        <div class="flex-w flex-sb-m bor15 p-t-7 p-b-4 p-lr-15-sm">
                            <div class="flex-w flex-m m-tb-5 input-group">
                            <!-- <input type="hidden" name="totalPrice" value="50000"> -->
                               <span class="m-l-40">총 결제 예상 금액 : <fmt:formatNumber value="${param.totalPrice}" pattern="###,### 원"/></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 배송지 입력 -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
			<div class="flex-w flex-tr">
				
				<input type="hidden" name="orderState" value="주문">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">					
						<h4 class="mtext-105 cl2 txt-center p-b-30 p-t-0">배송지 정보</h4>
						<div>
							<!-- 배송방법 -->
							<h6 class="m-b-6">배송 방법</h6>
							<div class="input-group">
								<input type="radio" name="shippingOption1" value="일반택배" id="standard-shipping" checked>
								<label for="standard-shipping" class="m-t-8">일반택배</label>
								<input type="radio" name="shippingOption1" value="우체국 택배" id="postal-shipping">
								<label for="postal-shipping" class="m-t-8">우체국 택배</label>
							</div>
							
							<!-- 배송지 선택 -->
							<h6 class="m-b-10 m-t-10">배송지 선택</h6>
							<div class="input-group">
								<input type="radio" name="delivery" value="새주소입력" checked>
								<label class="m-t-8">새주소입력</label>
								<input type="radio" name="delivery" value="최근배송지">
								<label class="m-t-8">최근배송지</label>
								<input type="radio" name="delivery" value="회원정보동일">
								<label class="m-t-8">회원정보동일</label>		
							</div>

							<!-- 주문자 정보 -->
							
							<h6 class="m-b-10 m-t-10">수령인 이름</h6>
							<div class="m-b-10 how-pos4-parent input-group">
								<input class="stext-111 cl2 plh3 smaller-size1" name="shipping_name" type="text" id="order_name">
							</div>

							<!-- 연락처 -->
							<h6 class="m-b-10 m-t-10">휴대 전화번호</h6>
							<div class="input-group">
								<div class="how-pos4-parent">
									<input class="stext-111 cl2 plh3 smaller-size2" name="shipping_phone" type="text" id="phone_num">
								</div>
								
							</div>

							<!-- 주소 -->
							<h6 class="m-b-10 m-t-10">주소</h6>
							<div class="m-b-10 how-pos4-parent input-group">
								<input name="shippingAddr1" class="stext-111 cl2 plh3 smaller-size2" type="text" id="memberAddr1" placeholder="우편번호">
								<div class="cl2 hov-cl1 trans-04 p-r-11 ">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="flex-c-m stext-101 cl2 size-112 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
								</div>
							</div>
							<div class="m-b-10 how-pos4-parent">
								<input name="shippingAddr2" class="stext-111 cl2 plh3 smaller-size3" type="text" id="memberAddr2" placeholder="도로명주소">
							</div>
							<div class="m-b-10 how-pos4-parent">
								<input name="shippingAddr3" class="stext-111 cl2 plh3 smaller-size3" type="text" id="memberAddr3" placeholder="상세주소">
							</div>
							 
							<!-- 배송 상세 정보 -->
							<div class="m-b--40">
								
								<div class="input-group m-t-15">
									<h6>요청사항</h6>
									<input type="text" name="shippingOption2" class="addr-line smaller-size3 m-t-7">
								</div>
							</div>
						</div>
				    </div>

				<!-- 결제 -->
				<div class="size-210 bor10 flex-w p-lr-73 p-lr-15-lg w-full-md">
					<div class="container">
						<h4 class="mtext-105 cl2 txt-center p-b-30 p-t-55">
							결제 정보
						</h4>
						
						<!-- 결제 정보 입력 -->
						<input type="hidden" name="totalPrice" value="${param.totalPrice}">
						<input type="hidden" name="usePoint" value="${param.usePoint}">
						<input type="hidden" name="savePoint" value="${param.savePoint}">

						<!-- 결제 방법 선택 -->
						<h6 class="m-b-6">결제 방법</h6>
						<div class="input-group">
						    <input type="radio" name="payOption1" id="card-payment" value="카드결제" checked>
						    <label for="card-payment" class="m-t-8">카드결제</label>
						    <input type="radio" name="payOption1" id="bank-transfer" value="무통장입금">
						    <label for="bank-transfer" class="m-t-8">무통장 입금</label>
						</div>

						<!-- 카드사 선택 -->
						<div id="payment-method">
							<div class="input-group">
								<h6 class="m-b-10">카드사 선택</h6>
								<div class="p-b-11">
									<select name="payOption2">
										<option value="">카드사 선택</option>
										<option value="국민카드">국민카드</option>
										<option value="롯데카드">롯데카드</option>
										<option value="신한카드">신한카드</option>
										<option value="우리카드">우리카드</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="현대카드">현대카드</option>
										<option value="NH카드">NH카드</option>									
									</select>
								</div>
							</div>
					
							<!-- 생년월일 입력 -->
							<h6 class="m-b-8">생년월일</h6>
							<div class="input-group">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="birth-year">
								<span class="p-b-11">년</span>
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="birth-month">
								<span class="p-b-11">월</span>
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="birth-day">
								<span class="p-b-11">일</span>
							</div>

							<!-- 카드번호 입력 -->
							<h6 class="m-b-8">카드번호</h6>
							<div class="input-group">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="card1">
								<span class="p-b-11">-</span>
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="card2">
								<span class="p-b-11">-</span>
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="card3">
								<span class="p-b-11">-</span>
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="card4">
							</div>

							<!-- 카드 CVC -->
							<h6 class="m-b-8">CVC 번호</h6>
							<div class="input-group">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="cvc">
								<span class="p-b-11">뒷면 서명란 끝 3자리 숫자</span>
							</div>

							<!-- 유효기간 -->
							<h6 class="m-b-8">유효기간</h6>
							<div class="input-group">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="exp-month">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="exp-year">
								<span class="p-b-11">월/년</span>
							</div>

							<!-- 비밀번호 -->
							<h6 class="m-b-8">비밀번호</h6>
							<div class="input-group">
								<input class="stext-111 cl2 plh3 smaller-size" type="text" id="password-2-digits">
								<span class="p-b-11">** (비밀번호 앞 두자리)</span>
							</div>
						</div>

					<!-- 무통장 입금 -->
					<div class="bank-transfer-info">
						<div class="input-group">
							<h6 class="m-b-10">입금은행</h6>
							<div class="p-b-10">
								<select name="payOption3">
									<option value="">입금은행 선택</option>
									<option value="NH농협">NH농협</option>
									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="신한은행">신한은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="우리은행">우리은행</option>	
								</select>
							</div>
						</div>
							
                        <!-- 입금안내 -->
						<div class="m-b-10 how-pos4-parent input-group">
							<h6 class="m-b-10">입금자</h6>
							<input class="stext-111 cl2 plh3 smaller-size1" id="order_name2" type="text">
						</div>
						<div class="m-b-10">
							<span class="p-b-10">입금하실 계좌 : kic은행 1234-567-891011</span><br>
						</div>
						<div class="m-b-10">
							<span class="p-b-10">예금주 : 북스테이션</span>
						</div>
						<div style="border: 1px solid #ccc; padding: 10px;">
							<h6 class="m-b-8">무통장 입금 안내</h6>
							<ul style="font-size:10pt">
								<li>- 정확한 주문 금액(원 단위까지) 입금 요망</li>
								<li>- 주문 완료 후 7일(일반 7일, 직배송중고상품, 잡지만 주문 시 5일, 공동구매 시 2일, 클래스24 1일) 이내에 미입금시 주문 자동 취소</li>
								<li>- 입금 완료 시점 기준 배송 일정이 최종 확정되며, 재고 상황에 따라 품절 및 지연될 수 있음</li>
								<li>- 증권사 현금카드, 제휴카드 이체 불가</li>
								<li>- 은행업무 시간이 아닌 경우 입금 확인이 지연될 수 있음(토요일, 공휴일 등)</li>
								<li>- 은행 수수료가 부과 및 예약이체 주의</li>
							</ul>
						</div>
					</div>

					<!-- 결제 체크 -->
					<div class="input-group">
						<input type="checkbox"id="paymentinfo">
						<label class="m-t-12 m-b-12" for="orderselect">지금 선택한 결제 수단을 다음에도 사용</label>
					</div>

					<!-- 모달 배경 -->
					<div class="modal-backdrop"></div>

					<!-- 결제하기 모달 창 -->
					<div class="modal-order">
						<h4>결제 확인</h4>
						<p class="m-t-5">결제를 진행하시겠습니까?</p>
						<div class="input-group m-t-5" style="justify-content:center;">
							<button class="js-hide-modal flex-c-m stext-101 cl0 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">취소</button> 
							<button type="submit" class="flex-c-m stext-101 cl0 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">결제</button>
						</div>
					</div>
                    
					<!-- 결제하기 버튼 -->
					<button id="order_button" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">결제하기</button>					
				</div>
			</div>
		</div>
		</div>
	</section>
	</form>
 <jsp:include page="bottom.jsp" flush="false" /> 
<!--===============================================================================================-->
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
<!—===============================================================================================—>
   <script src="js/main.js"></script>
   <script src="js/script.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>