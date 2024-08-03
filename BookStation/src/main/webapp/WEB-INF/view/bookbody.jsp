<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/bookList.css">
<div class="con">
	<form>
		<!-- 정렬 필터 기준 상위 3위 -->
		<table class="top3books">
			<tr>
			<c:forEach var="book" items="${bookList}">
				<c:if test="${book.rnum <= 3}">
					<td>
						<span class="t3-number">
							${book.rnum}.
						</span>
						
						<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" style="cursor:pointer;" onerror="this.onerror=null; this.src='images/books/blank.jpg'" onclick="location.href='detail.do?isbn=${book.isbn}'">
						<br>
						<span class="book-title" style="cursor:pointer;" onclick="location.href='detail.do?isbn=${book.isbn}'">${book.book_name}</span><br>
						<span>${book.book_author}</span> | 
						<span>${book.book_publisher}</span> | 
						<span>${book.book_pubdate}</span> <br>
						<span><fmt:formatNumber value="${book.book_price}" pattern="###,###원"/></span>
						<span>→</span>
						<span class="book-price"><fmt:formatNumber value="${book.book_price * (100 - book.book_discount) / 100}" pattern="###,###원" /></span>
						<span>(<b class="highlight">${book.book_discount}%</b> 할인)</span> <br>
						<span>마일리지 <fmt:formatNumber value="${book.book_price * 5 / 100}" pattern="###,###원" /></span>
						<span>(<b class="highlight">5%</b> 적립)</span>
						<br>
						<div class="btn-group-t3">
							<a href="cart.jsp" class="btn">장바구니</a>
							<a href="order.jsp" class="btn">바로결제</a>
						</div>
					</td>
				</c:if>
			</c:forEach>
			</tr>
		</table>
		
		<!-- 나머지 -->
		<table class="booklist-table">
			<c:forEach var="book" items="${bookList}">
				<c:if test="${book.rnum >= 4}">
					<tr>
						<!-- 번호와 체크박스 -->
						<td> ${book.rnum}.</td>
						
						<!-- 책 이미지 -->
						
						<td>
							<img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${book.isbn}.jpg" style="cursor:pointer;" onerror="this.onerror=null; this.src='images/books/blank.jpg'"  onclick="location.href='detail.do?isbn=${book.isbn}'">
						</td>
						
						<!-- 제목, 작가 등등 책 정보 -->
						<td class="book-info-cell">
							<span class="book-title" style="cursor:pointer;" onclick="location.href='detail.do?isbn=${book.isbn}'">${book.book_name}</span> <br>
							<span>${book.book_author}</span> | 
							<span>${book.book_publisher}</span> | 
							<span>${book.book_pubdate}</span> <br>
							<span><fmt:formatNumber value="${book.book_price}" pattern="###,###원"/></span>
							<span>→</span>
							<span class="book-price"><fmt:formatNumber value="${book.book_price * (100 - book.book_discount) / 100}" pattern="###,###원" /></span>
							<span>(<b class="highlight">${book.book_discount}%</b> 할인)</span> | 
							<span>마일리지 380원</span>
							<span>(<b class="highlight">5%</b> 적립)</span>
						</td>
						
						<!-- 장바구니, 바로결제 버튼 -->
						<td class="btn-grp">
							<a href="cart.jsp" class="btn">장바구니</a>
							<br>
							<a href="order.jsp" class="btn">바로결제</a>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

		<!-- Pagination -->
		<div class="flex-c-m flex-w w-full p-t-38">
			${pagingHtml}
		</div>
		</div>
	</form>

</div>

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
	<script src="../../js/booklist.js"></script>