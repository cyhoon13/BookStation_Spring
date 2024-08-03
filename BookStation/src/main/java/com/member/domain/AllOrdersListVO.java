package com.member.domain;

import java.util.Date;

public class AllOrdersListVO {
	// 총 주문 내역 조회 페이지 - AllOrdersList 페이지 전용 VO
    private Date orderDate; // 주문일
    private String orderState; // 주문상태
    private int totalPrice; // 총 주문금액
    private long order_id; // 주문번호
    // 상품명 담을 변수
	private String book_name; // 상품명
	// 거래별 구매 책 권수
	private int cnt;
	// 반품 사유
	private String cancel_reason;
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public long getOrder_id() {
		return order_id;
	}
	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	
}
