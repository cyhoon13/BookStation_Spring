<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sort = request.getParameter("sort");
%>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		const urlParam = new URL(location.href).searchParams;
		const except_chkBox = urlParam.get('except-chk');
		const except_chk = document.getElementById('except-chk');
		
		if (except_chkBox == '' ||  except_chkBox== null) {
			except_chk.checked = false;
		} else {
			except_chk.checked = true;
		}
		
		const re_searchWord = urlParam.get('re-searchWord');
		const re_searchBar = document.getElementById('re-searchBar');
		
		if (re_searchWord == null) {
			re_searchBar.value = '';
			except_chk.checked = false;
		} else {
			re_searchBar.value = re_searchWord;
		}
		
		const searchField = urlParam.get('searchField');
		
		if (searchField == 'all') {
			$("#all-chk").prop("checked", true);
		} else if (searchField == 'bookName') {
			$("#title-chk").prop("checked", true);
		} else if (searchField == 'bookAuthor') {
			$("#author-chk").prop("checked", true);
		} else {
			$("#publ-chk").prop("checked", true);
		}
		
		const category = urlParam.get('category');
		
		if (category == '') {
			$("#allCategory").prop("checked", true);
		} else {
			$("#"+category).prop("checked", true);
		}
	})
	
	function reSearchApply(){
		const except_chk = document.getElementById('except-chk');
		const re_searchBar = document.getElementById('re-searchBar');
		
		if (re_searchBar.value == '') {
			except_chk.checked = false;
		}
		
		// 검색어 제외 체크 됐을 경우
		if (except_chk.checked){
			except_chk.value = 'not ';
		} else {
			except_chk.checked = true;
			except_chk.value = '';
		}

		document.forms['re-searchForm'].submit();
	}
</script> 
<div class="side-menu-search">
	<!-- 사이드바 수정 -->
	<div class="p-t-20 p-lr-30">
		<h4 class="mtext-112 cl2 p-b-33">
			'${searchWord}' - ${selectedMain}
		</h4>
			<ul>
				<!-- 결과 내 검색  -->
				<li class="bor18">
					<span class="dis-block mtext-106 cl6 trans-04 p-tb-10 p-lr-6">
						결과 내 검색
					</span>
					<div class="p-l-10">
						<form name="re-searchForm" action="searchbook.do" method="get">
							<input name="re-searchWord" id="re-searchBar" type="text" class="p-lr-5">
							<input name="except-chk" id="except-chk" type="checkbox" value=''>
							<label for="except-chk" style="margin: 0px">검색어 제외</label>
							<input name="sort" type="hidden" value="<%=sort %>">
							<input name="searchField" type="hidden" value="${searchField}">
							<input name="searchWord" type="hidden" value="${searchWord}">
							<input name="category" value="" type="hidden">
							<a href="javascript:void(0);" class="btn" onclick="reSearchApply();">적용</a>
						</form>
					</div>
					
				</li>
				<!-- 검색조건 -->
				<li class="bor18">
					<span class="dis-block mtext-106 cl6 trans-04 p-tb-10 p-lr-6">
						검색조건
					</span>
					
					<form name="re-setSeachFeild" action="searchbook.do" method="get">
						<ul class="sm-inner-ul">
							<li>
								<input type="radio" id="all-chk" name="searchField" style="display: inline;" value="all">
								<label for="all-chk">전체</label>
							</li>
							<li>
								<input type="radio" id="title-chk" name="searchField" style="display: inline;" value="bookName">
								<label for="title-chk">제목</label>
							</li>
							<li>
								<input type="radio" id="author-chk" name="searchField" style="display: inline;" value="bookAuthor">
								<label for="author-chk">작가</label>
							</li>
							<li>
								<input type="radio" id="publ-chk" name="searchField" style="display: inline;" value="bookPublisher">
								<label for="publ-chk">출판사</label>
							</li>
						</ul>
						<input name="sort" type="hidden" value="<%=sort %>">
						<input name="searchWord" type="hidden" value="${searchWord}">
						<input name="category" value="" type="hidden">
						<input name="re-searchWord" id="re-searchBar" type="hidden" value="${reSearchWord}">
						<input name="except-chk" id="except-chk" type="hidden" value="${exceptChk}">
						<div style="display: flex; flex-direction: row-reverse;">
							<a href="javascript:void(0);" class="btn" onclick="document.forms['re-setSeachFeild'].submit();">적용</a>
						</div>
					</form>
				</li>
				<!-- 분야별보기 -->
				<li class="bor18">
					<span class="dis-block mtext-106 cl6 trans-04 p-tb-10 p-lr-6">
						분야별보기
					</span>
					<form name="re-setCategory" action="searchbook.do" method="get">
						<ul class="sm-inner-ul">
							<li>
								<input name="category" type="radio" id="allCategory" style="display: inline;"  value="">
								<label for="all">종합</label>
							</li>
							<c:forEach var="main" items="${allMainCtgr}">
								<li>
									<input name="category" type="radio" id="${main.category_mainID}" style="display: inline;" value="${main.category_mainID}">
									<label for="${main.category_mainID}">${main.category_main}</label>
								</li>
							</c:forEach>
							<input name="sort" type="hidden" value="<%=sort %>">
							<input name="searchField" type="hidden" value="${searchField}">
							<input name="searchWord" type="hidden" value="${searchWord}">
							<input name="re-searchWord" id="re-searchBar" type="hidden" value="${reSearchWord}">
							<input name="except-chk" id="except-chk" type="hidden" value="${exceptChk}">
						<div style="display: flex; flex-direction: row-reverse;">
							<a href="javascript:void(0);" class="btn" onclick="document.forms['re-setCategory'].submit();">적용</a>
						</div>
					</form>
				</li>
			</ul>

	</div>
</div>
