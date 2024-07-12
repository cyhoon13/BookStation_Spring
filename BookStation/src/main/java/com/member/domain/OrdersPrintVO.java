package com.member.domain;

import java.util.Date;

public class OrdersPrintVO {
	
    private long ordersPrint_id;
    private long order_id;
    private String member_id;
    private String isbn;
    private int ordersPrint_price;
    private int ordersPrint_count;
    private Date ordersPrint_date;
    private String ordersPrint_state;
    
    @Override
    public String toString() {
    	String txt = "ordersPrint_id: " + ordersPrint_id + "\n"
    			+ "order_id: " + order_id + "\n"
    			+ "member_id: " + member_id + "\n"
    			+ "isbn: " + isbn + "\n"
    			+ "ordersPrint_price: " + ordersPrint_price + "\n"
    			+ "ordersPrint_count: " + ordersPrint_count + "\n"
    			+ "ordersPrint_date: " + ordersPrint_date + "\n"
    			+ "ordersPrint_state: " + ordersPrint_state;
        return txt;
    }
    
    public long getOrdersPrint_id() {
        System.out.println("getOrdersPrint_id() => " + ordersPrint_id);
        return ordersPrint_id;
    }
    public void setOrdersPrint_id(long ordersPrint_id) {
        System.out.println("setOrdersPrint_id => " + ordersPrint_id);
        this.ordersPrint_id = ordersPrint_id;
    }
    public long getOrder_id() {
        System.out.println("getOrder_id() => " + order_id);
        return order_id;
    }
    public void setOrder_id(long order_id) {
        System.out.println("setOrder_id => " + order_id);
        this.order_id = order_id;
    }
    public String getMember_id() {
        System.out.println("getMember_id() => " + member_id);
        return member_id;
    }
    public void setMember_id(String member_id) {
        System.out.println("setMember_id => " + member_id);
        this.member_id = member_id;
    }
    public String getIsbn() {
        System.out.println("getIsbn() => " + isbn);
        return isbn;
    }
    public void setIsbn(String isbn) {
        System.out.println("setIsbn => " + isbn);
        this.isbn = isbn;
    }
    public int getOrdersPrint_price() {
        System.out.println("getOrdersPrint_price() => " + ordersPrint_price);
        return ordersPrint_price;
    }
    public void setOrdersPrint_price(int ordersPrint_price) {
        System.out.println("setOrdersPrint_price => " + ordersPrint_price);
        this.ordersPrint_price = ordersPrint_price;
    }
    public int getOrdersPrint_count() {
        System.out.println("getOrdersPrint_count() => " + ordersPrint_count);
        return ordersPrint_count;
    }
    public void setOrdersPrint_count(int ordersPrint_count) {
        System.out.println("setOrdersPrint_count => " + ordersPrint_count);
        this.ordersPrint_count = ordersPrint_count;
    }
    public Date getOrdersPrint_date() {
        System.out.println("getOrdersPrint_date() => " + ordersPrint_date);
        return ordersPrint_date;
    }
    public void setOrdersPrint_date(Date ordersPrint_date) {
        System.out.println("setOrdersPrint_date => " + ordersPrint_date);
        this.ordersPrint_date = ordersPrint_date;
    }
    public String getOrdersPrint_state() {
        System.out.println("getOrdersPrint_state() => " + ordersPrint_state);
        return ordersPrint_state;
    }
    public void setOrdersPrint_state(String ordersPrint_state) {
        System.out.println("setOrdersPrint_state => " + ordersPrint_state);
        this.ordersPrint_state = ordersPrint_state;
    }
}
