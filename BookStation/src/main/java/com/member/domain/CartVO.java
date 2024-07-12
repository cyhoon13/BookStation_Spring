package com.member.domain;

public class CartVO {
    
    // 장바구니
    private long cart_id; // 카트번호
    private String member_id; // 회원 아이디
    private String isbn; // 책 id 
    private int bookCount; // 책 수량
    private String book_name;
    private int book_price;
    private int book_discount;
    
    @Override
    public String toString() {
    	String txt = "cart_id: " + cart_id + "\n"
    			+ "member_id: " + member_id + "\n"
    			+ "isbn: " + isbn + "\n"
    			+ "bookCount: " + bookCount;
        return txt;
    }
    
    public long getCart_id() {
        return cart_id;
    }
    public void setCart_id(long cart_id) {
        this.cart_id = cart_id;
    }
    public String getMember_id() {
        return member_id;
    }
    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }
    public String getIsbn() {
        return isbn;
    }
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    public int getBookCount() {
        return bookCount;
    }
    public void setBookCount(int bookCount) {
        this.bookCount = bookCount;
    }
    public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_discount() {
		return book_discount;
	}
	public void setBook_discount(int book_discount) {
		this.book_discount = book_discount;
	}
}
