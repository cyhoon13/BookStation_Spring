package com.member.domain;

public class DetailOrderVO {
	private String book_name;
	private int ordersPrint_count;
	private int ordersPrint_price;
	private int book_discount;
	private String ordersPrint_state;
	private String isbn;
	
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getOrdersPrint_count() {
		return ordersPrint_count;
	}
	public void setOrdersPrint_count(int ordersPrint_count) {
		this.ordersPrint_count = ordersPrint_count;
	}
	public int getOrdersPrint_price() {
		return ordersPrint_price;
	}
	public void setOrdersPrint_price(int ordersPrint_price) {
		this.ordersPrint_price = ordersPrint_price;
	}
	public int getBook_discount() {
		return book_discount;
	}
	public void setBook_discount(int book_discount) {
		this.book_discount = book_discount;
	}
	public String getOrdersPrint_state() {
		return ordersPrint_state;
	}
	public void setOrdersPrint_state(String ordersPrint_state) {
		this.ordersPrint_state = ordersPrint_state;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
}
