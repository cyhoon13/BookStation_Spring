<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	.tab01 .nav-tabs {
		    display: -webkit-box;
		    display: -webkit-flex;
		    display: -moz-box;
		    display: -ms-flexbox;
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: space-around;
		    align-items: center;
		    border: none;
		}
		.tab01 .nav-tabs li:hover{
		   	background-color: #eeeeee;
			border-radius: 10px;
		}
		.bestseller-tab a:hover {
			background-color: none;
			border-radius: 0px;
			border:none;
		}
		.tab01 .nav-tabs a.active{
			background-color: none;
		    border:none;
		    font-weight:800;
		}
		.nav-link.active{
			background-color: transparent;
		}
		.tab01 .nav-tabs .nav-item {
		    margin: 0px;
		}
    </style>
	<div class="con">
		<!-- 주간, 월간, 역대, 어제, 신간, 스테디 -->
		<div class="bestseller-tab">
			<div class="flex-w h-full">
				<a href="bestseller.do?sort=weekly" class="flex-c-m trans-04 weekly" id="weekly">주간 베스트</a>
				<a href="bestseller.do?sort=monthly" class="flex-c-m trans-04 monthly" id="monthly">월간 베스트</a>
				<a href="bestseller.do?sort=yearly" class="flex-c-m trans-04 yearly" id="year">역대 베스트</a>
				<a href="bestseller.do?sort=yesterday" class="flex-c-m trans-04 yesterday" id="yesterday">어제 베스트</a>
				<a href="bestseller.do?sort=new" class="flex-c-m trans-04 new" id="new">신간 베스트</a>
				<a href="bestseller.do?sort=steady" class="flex-c-m trans-04 steady" id="steady">스테디셀러</a>
			</div>
		</div>
	</div>

    